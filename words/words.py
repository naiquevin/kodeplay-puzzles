#!/usr/bin/env python

import pprint

VOWELS = ['a', 'e', 'i', 'o', 'u']


def strip_nwl(w):
    return w.replace('\n', '').lower()


def strip_apos(w):
    return w.rstrip('\'s') if w.endswith('\'s') else w


def get_words(f):
    return (strip_nwl(w) for w in f.readlines())


def has_vowels_asc(word):
    vowels = []
    for letter in word:
        if letter in VOWELS:
            vowels.append(letter)
    return vowels == VOWELS


def solution1():
    with open('words') as f:
        words = get_words(f)
        words = (strip_apos(w) for w in words if len(w) >= 5)
        words = (w for w in words if has_vowels_asc(w))
        return list(set(words))


def has_alpha_asc(word):
    # workaround to compare words with apostophe eg. abel's
    if word.endswith('\'s'):
        cmpwith = ''.join(['\''] + word.replace('\'', '').split())
    else:
        cmpwith = word
    return ''.join(sorted(word)) == cmpwith


def solution2():
    with open('words') as f:
        words = get_words(f)
        words = (w for w in words if len(w) >= 6)
        words = (w for w in words if has_alpha_asc(w))
        return list(set(words))


if __name__ == '__main__':
    print 'Solution 1:'
    print '==========='
    pprint.pprint(solution1())
    print 'Solution 2:'
    print '==========='
    pprint.pprint(sorted(solution2()))

