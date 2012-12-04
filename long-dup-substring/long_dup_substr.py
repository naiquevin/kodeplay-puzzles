#!/usr/bin/env python

from collections import defaultdict


PROBLEM_WORD = 'isthebananaofthegreatfruitlikepapayabutfruitofbraziliansoftheworldisineastwestnorthsouththegreatindiasealikn'


def main(word):
    n = len(word)
    substrings = [word[i:j] for i in range(n) for j in range(i+1, n+1)]
    d = defaultdict(int)
    for substring in substrings:
        d[substring] += 1
    items = d.items()
    dup_items = filter(lambda x: x[1] > 1, items)
    return max(dup_items, key=lambda x: len(x[0]))


if __name__ == '__main__':
    longest, times = main(PROBLEM_WORD)
    print '%r is longest substring. It\'s repeated %d times' % (longest, times)

