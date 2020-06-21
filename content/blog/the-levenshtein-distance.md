+++
date = "2020-01-03"
tags = ["Algorithms","Python"]
title = "The Levenshtein Distance"
+++

It's fascinating how everything you can think of in computer science 9 times out of 10 was already thought and probably studied by someone else. Today I was thinking about a way to suggest corrections for addresses inserted by our customers when I started to imagine an algorithm that used the mathematical notion of 'distance' (check 'Metric (mathematics)' on Wikipedia [^1] ) to give them some suggestions based on a set of valid addresses present on our DB. Well, now I find out that it's a well-known problem in computer science, that a wide range of algorithms[^2] has already been designed to solve it and that what I was starting to think on was a variation of the Levenshtein distance!




#### A code snippet in Python that implements those ideas

```
from itertools import zip_longest


def strings_distance(x, y):
    """Compute a distance between strings x and y."""
    return sum((0 if m == n else 1 for m, n in zip_longest(x, y)))


def suggestions(s, dictionary, distance=strings_distance, tol=4):
    """Use the distance function to search similar words inside the dictionary.

    :param s: the string to get suggestions for.
    :param dictionary: a set/list of strings.
    :param distance: the function to use to compute the strings distance.
    :param int tol: max distance allowed between the input string and the 
    suggestions.

    """
    return {word for word in dictionary if distance(s, word) <= tol}
```



[^1]: [https://en.wikipedia.org/wiki/Metric_(mathematics)](https://en.wikipedia.org/wiki/Metric_(mathematics))
[^2]: [https://en.wikipedia.org/wiki/String_metric](https://en.wikipedia.org/wiki/String_metric)
