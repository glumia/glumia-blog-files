---
title: "Codility - Part 1 (and probably last, until I'll get back to job hunting)"
date: 2021-04-03T13:17:05+02:00
mathjax: true
---

Lately I've been looking for materials to practice for code interviews and a
friend of mine pointed out [Codility's lessons](
https://app.codility.com/programmers/lessons/1-iterations/) to me.
Their web site and application are still a bit in the early stages (imho they
are not as mature as other sites like HackerRank or CodinGame) but one
really nice thing that the others lack is the reading material they provide
for each topic.

I plan to go through the lessons (at least 1 to 17) in the following
days/weeks and I'll write random thoughts that arise while working on them
here in the blog.

I want to do it mainly to keep myself engaged and force myself to
'distil' a bit of what I learn in the process. Also, I want to try to be less
perfectionist with my blog writing and see what happens: if I write so
seldom it's mainly because I know how long it requires and I end not
writing at all.

# Codility lessons
# 3. Time Complexity
The [reading](https://codility.com/media/train/1-TimeComplexity.pdf)
is interesting, particularly the part regarding estimates about the upper limit
of the time complexity a solution should have.

## Key takeaway
- An average computer can perform something like $10^8$ operations/s.
- The time limit for test cases is usually 1 to 10 seconds.

With both this information and those of the test (usually you are given the
size of input data) you should be able to estimate the upper limit of time
complexity that your solution should have.

# 4. Counting Elements
Ok, here I feel a bit like cheating by using Python's `Counter` from
the standard library's `collection` module.

## Exercise 4.1 of the reading material
Sometimes math allows you to literally kill algorithms' time complexity.

Let $S\_{A} = \sum\_{i=0}^{n-1} a\_i$ and $S\_{B} = \sum\_{i=0}^{n-1} b\_i$.

Denote as $a\_i$ and $b\_j$ the elements of A and B we need (eventually) to swap.

If such elements exist that solve the problem, then it is true that:
$$\displaylines{
S\_A - a\_i + b\_j = S\_B + a\_i - b\_j \\\\
\Rightarrow 2 a\_i - 2 b\_j = S\_A - S\_B \\\\
\Rightarrow a\_i = b\_j + (S\_A - S\_B) / 2
}$$

This means that our problem admits a solution if and only if $S\_A - S\_B$ is
divisible by 2 and if the above equality holds for some i and j.

This can be verified with an algorithm of complexity $O(n+m)$.


Solution in Python:
```python
def solution(A, B, m):
    Sa = sum(A)
    Sb = sum(B)
    if (Sa - Sb) % 2:
        return False
    values_A = set(A)
    for v in B:
        if (Sa - Sb) // 2 + v in values_A:
            return True
    return False
```

# 5. Prefix Sums
This is a totally new concept/technique to me. It looks really powerful to
avoid complexity $O(n^2)$ or $O(n \cdot m)$ and get $O(n)$ or $O(n+m)$
instead.

The idea is simple but I still need to acquire the skill to recognize problems
where this technique can be used.

## Question MinAvgTwoSlice
This one was hard. I wasn't able to solve it by myself with a complexity
less than $O(n^2)$ without reading *"There must be some slices, with length of
two or three, having the minimal average value among all the slices"* in
[this](https://codesays.com/2014/solution-to-min-avg-two-slice-by-codility/)
blog post. Pretty obvious in retrospect, but I was nowhere near to getting
there by myself.

Solution in Python:
```python
def solution(A):
    N = len(A)

    partial_sums = [0] * (N + 1)
    for i in range(0, N):
        partial_sums[i + 1] = partial_sums[i] + A[i]

    averages = []
    for l in [2, 3]:
        for p in range(N + 1 - l):
            q = p + l - 1
            averages.append([p, q, (partial_sums[q + 1] - partial_sums[p]) / l])

    return min(averages, key=lambda x: x[2])[0]
```

---

That's all for the first part of this series, I'll add other posts as I go
forward with the lessons.
