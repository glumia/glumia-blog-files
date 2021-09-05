+++
date = "2020-06-21"
tags = ["python", "clojure", "c", "math", "programming"]
title = "Clojure, Python, C: three programming languages, one algorithm"
+++

![image](/blog/clojure-python-c-three-programming-languages-one-algorithm/comparison.png)


Too lazy to write something long and well thought now `¯\_(ツ)_/¯`

Just a bit disappointed by how bad Clojure's performance are (*but hey, 
immutability is not free!*) and by how damn difficult it is to improve them. 

#### Update 23/06/20
I found out that the timing of the C version goes down to ~2ms if I just
declare the variables as *int* and not *unsigned int*. That's amazing!

#### Update 09/01/21
Half I year later I finally know why the version with signed integers actually
takes less than the version with unsigned ints. 

It's caused by C compiler's
optimizations: for signed integers it doesn't need to generate assembly code
to handle overflows (because it's declared undefined behaviour in the standard)
while it has to do it for unsigned integers (that are defined to wrap).  

Check [The Value of Undefined
Behavior](https://nullprogram.com/blog/2018/07/20/) for more info about this topic.


Source:
[Clojure](/blog/clojure-python-c-three-programming-languages-one-algorithm/naive_compute_primes.clj),
[Python](/blog/clojure-python-c-three-programming-languages-one-algorithm/naive_compute_primes.py),
[C](/blog/clojure-python-c-three-programming-languages-one-algorithm/naive_compute_primes.c)
