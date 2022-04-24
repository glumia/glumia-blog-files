---
title: "Bite Size Linux"
date: 2022-04-24T17:32:09+02:00
---

Some notes about questions that came to my mind while reading Julia Evans' zine
*Bite Size Linux*.

[What are the setuid, setgid and sticky bits of a file?](#what-are-the-setuid-setgid-and-sticky-bits-of-a-file)  
[What's inside /proc/PID/stack?](#whats-inside-procpidstack)  
[Why would I want to use mkfifo? (named pipes)](#why-would-i-want-to-use-mkfifo-named-pipes)  
[What are Unix domain sockets and why would I want to use them?](#what-are-unix-domain-sockets-and-why-would-i-want-to-use-them)  
[Can I see a process' registered signal handlers from /proc/PID?](#can-i-see-a-process-registered-signal-handlers-from-procpid)  
[What is a memory allocator? Can I write one by myself?](#what-is-a-memory-allocator-can-i-write-one-by-myself)  
[What is ldd?](#what-is-ldd)  
[What is the difference between the fork and the clone system calls?](#what-is-the-difference-between-the-fork-and-the-clone-system-calls)  
[What is mmap? What happens if two different processes mmap the same file?](#what-is-mmap-what-happens-if-two-different-processes-mmap-the-same-file)  
[What is `man 6 sl`?](#what-is-man-6-sl)

### What are the setuid, setgid and sticky bits of a file?

**setuid**: if the file is an executable, allow users with execution permission to
run it with the privileges of the file's owner. If the file is a directory, no-op.

**setgid**: if the file is an executable, allow users with execution permission to
run it with the privileges of the file's group. If the target is a directory, new files
and subdirectories in it will inherit its group ID, rather than the primary group
ID of the user who'll create the file.

**sticky**: if the file is an executable, no-op. If the file is a directory, only the
owner of files/sub-directories can delete/rename them. Normally this would be possible
also for other users that belong to the group of the file/subdirectory. Beware that
other users can still edit files' content if they have enough privileges.


**Why would you want to use them?**

**setuid (or setuid) on executables**: to allow users with limited privileges to run
trusted programs that require higher ones. E.g. the `passwd` command needs root
privileges to edit the `/etc/shadow` and `/etc/passwd` files, but you can run it as a
normal user thanks to its `setuid` flag.

**setgid on directories**: to avoid messing with permissions of files and
subdirectories in a shared workspace - by default new ones created by a user wouldn't
be accessible to others.

**sticky on directories**: to avoid users deleting or renaming other users' files or
directories. It is used for example in Linux on the `/tmp` directory.


You can check a file's permissions bits with `stat -c %a` on Linux or `stat -f
%p` on BSDs.


More resources:
- [Setuid and Setgid (Wikipedia)](https://en.wikipedia.org/wiki/Setuid)
- [Sticky bit (Wikipedia)](https://en.wikipedia.org/wiki/Sticky_bit)
- `man 1 chmod`

### What's inside /proc/PID/stack?

There's the stack trace in case your program is executing a system call!

Watch out that you'll see it as an empty file unless you have the `CAP_SYS_PTRACE`
capability (check `man 5 proc` and `man 2 ptrace` for more info).

Try out the following:
1) Launch `sleep 600` in a shell.
2) Get its PID with `ps au | grep 'sleep 600' | grep -v grep | awk '{print $2}'`.
3) Do `cat /proc/PID/stack` (you should get an empty output).
4) Get root with `sudo su`.
5) Now try again `cat /proc/$PID/stack` :)

### Why would I want to use mkfifo? (named pipes)

They can be super useful if you want to plumb together two programs that don't
read from stdin or write to stdout but take files as arguments!

#### Stupid example

You have a program `genturtle` that takes a filename in input and
writes an ASCII art turtle into it.

```python
#!/usr/bin/env python
import sys

TURTLE = r"""                               ___-------___
                           _-~~             ~~-_
                        _-~                    /~-_
     /^\__/^\         /~  \                   /    \
   /|  O|| O|        /      \_______________/        \
  | |___||__|      /       /                \          \
  |          \    /      /                    \          \
  |   (_______) /______/                        \_________ \
  |         / /         \                      /            \
   \         \^\\         \                  /               \     /
     \         ||           \______________/      _-_       //\__//
       \       ||------_-~~-_ ------------- \ --/~   ~\    || __/
         ~-----||====/~     |==================|       |/~~~~~
          (_(__/  ./     /                    \_\      \.
                 (_(___/       -jurcy-           \_____)_)"""


def main():
    with open(sys.argv[1], "w") as fp:
        fp.write(TURTLE)

if __name__ == "__main__":
    main()
```

You have another program `marginate` that takes the name of a text file in input, reads
it and prints its contents, prepending some characters to each line.

```python
#!/usr/bin/env python
import sys


def main():
    with open(sys.argv[1], "r") as fp:
        lines = fp.readlines()

    print("".join([f"@@@{line}" for line in lines]))

if __name__ == "__main__":
    main()
```

You would like to run these programs to print a *marginated turtle* on standard
output but unfortunately neither `genturtle` prints to stdout nor `marginate`
reads from stdin.

`mkfifo` comes to the rescue!

1) Create a named pipe with mkfifo: `mkfifo turtle`.
2) Use it as argument for both `genturtle` and `marginate`:
   `(./genturtle turtle & ./marginate turtle)`

Pay attention to how you run `genturtle` and `marginate` - depending on their
execution order your shell could get stuck forever (e.g. `./genturtle turtle &&
./marginate turtle`). The reason is that `genturtle`'s attempt to write to `turtle`
will block until `marginate` will read from it.

In this case, it would have been straightforward to edit the source code of `genturtle`
and `marginate` to print to stdout and read from stdin, or you could have just used a
temporary file. But think how handy `mkfifo` would have been if they both were compiled
programs whose code you didn't have access to and if they had to process an
enormous quantity of data you couldn't store on your disk.

### What are Unix domain sockets and why would I want to use them?

Check `man 7 unix`.

They are special sockets for efficient interprocess communication.

Some key features:
- UDP unix domain sockets *are* reliable.
- You can pass references to file descriptors with them.

They are used for example by docker! :)

### Can I see a process' registered signal handlers from /proc/PID?

You can see which signals a process will block, ignore or catch by looking at `SigBlk`,
`SigIgn`, `SigCgt` in `/proc/PID/status`. These values are bitmasks expressed in
hexadecimal.

For example, `SigIgn: 000000000a200000` means:
```
000000000a200000 -> 1010001000000000000000000000 (count from right to left)
                    | |   |                    |
                    | |   |                    \ -->  1: SIGHUP
                    | |   \ -----------------------> 22: SIGTTOU               
                    | \ ---------------------------> 26: SIGVTALRM
                    \ -----------------------------> 28: SIGWINCH
                                                          
                                                        Our process will ignore
                                                        these four signals!
```

Unfortunately, you can't see what handlers are registered for each specific
signal. Well, at least not unless you can inject some code into the process. In
this case, you could use the `sigaction` system call and write this information
somewhere.

More resources:
- `man 5 proc`
- `man 7 signal`
- [How can I check what signals a process is listening to?](https://unix.stackexchange.com/questions/85364/how-can-i-check-what-signals-a-process-is-listening-to)
- [How to check the signal handler in Linux?](https://stackoverflow.com/questions/51549834/how-to-check-the-signal-handler-in-linux)

### What is a memory allocator? Can I write one by myself?

Usually, by *memory allocator* one refers to a library that takes care to manage
a program's heap. Processes can get more heap either by using the `sbrk`
system call or by creating an anonymous memory map with `mmap`. A memory
allocator builds on these system calls to provide a handy abstraction for the
programmer.

Of course you can! You could even inject it into existing programs if they make
use of dynamic linking and you implement the API of `malloc`. Take a look at how
malloc is implemented in musl libc or jemalloc for example.

More resources:
- `man 3 malloc`
- [musl libc](https://git.musl-libc.org/cgit/musl/)
- [jemalloc](https://github.com/jemalloc/jemalloc)

### What is ldd?

`ldd` allows you to see what shared libraries a dynamically linked program depends on
and where they are located on your system.

Where the dynamic linker looks:
1. DT_RPATH in executable.
2. LD_LIBRARY_PATH environment variable.
3. DT_RUNPATH in executable.
4. /etc/ld.so.cache
5. /lib and /usr/lib

This means you can sometimes inject custom libraries into executables with
LD_LIBRARY_PATH! :) (attack vector anyone?)

You may think that `setuid`/`setgid` and dynamic linking could be a fatal combo, and
indeed they would be, were it not that Linux ignores LD_LIBRARY_PATH in this case for
this very reason.

More resources:
- `man 1 ldd`
- `man 8 ld.so`
- `man 8 ldconfig`
- [Exploiting LD_LIBRARY_PATH](
  https://techblog.rosedu.org/exploiting-environment-variables-part-2.html)

### What is the difference between the fork and the clone system calls?

`clone` is a lower level system call that provides more granular control over what pieces
of execution context are shared between the calling process and the child process.

More resources:
- `man 2 fork`
- `man 2 clone`

### What is mmap? What happens if two different processes mmap the same file?

`mmap` is a system call that allows you to map files to your program's virtual
memory or to allocate new memory for your process (*anonymous maps*).

You can use it to process files that would be too big to fit in your RAM, to get
more memory for your program (see how allocators like `jemalloc` use it), or to
share memory between different processes.

Linux is smart! If two different processes mmap the same file, the kernel will
(eventually) load it into RAM only one time :)

Try out the following:
1. Create a huge file:
   ```sh
   head -c 16000000000 /dev/random | pv > bigfile.bin
   ```

2. Create a program `load` that *mmaps* a file it takes in input, iterates over its
content (to cause page faults and force the kernel to load it in memory), then waits
for input before exiting:
   ```python
   #!/usr/bin/env python
   import mmap
   import sys
   
   
   def main():
       with open(sys.argv[1], "r") as fp:
           mm = mmap.mmap(fp.fileno(), 0, prot=mmap.PROT_READ)
           for i in range(len(mm) // 2):
               mm[i]
           input("Press enter to close the program")
   
   
   if __name__ == "__main__":
       main()
   ```
4. Launch it to process the file you created in step 1:
   ```sh
   python3 launch bigfile.bin
   ```
5. In another shell, launch the same program again.
6. Now in a third shell, check their memory usage with top or any other similar
tool.

More resources:
- `man 2 mmap`
- `man 3 mmap`
- `man 2 mmap2`

### What is `man 6 sl`?

[Steam locomotive](https://github.com/mtoyoda/sl) :)

On Arch its man page is located in section 1.
