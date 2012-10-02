#!/usr/bin/env python

import pprint

pp = pprint.PrettyPrinter(indent=4)

"""

Finding combinations recursively

([9, 7, 11], 2, [])
([7, 11], 1, [9]) + ([7, 11], 2, [])
([11], 0, [9, 7]) + ([11], 1, [9]) + [7, 11]
[9, 7] + [9, 11] + [7, 11]

"""

def combinations(li, r):
    return _combinations(li, r, [])


def _combinations(li, r, c):
    n = len(li)
    if r == 0:
        return [c]
    if n == r:
        return [c + li]
    head, tail = li[0], li[1:]
    rest = li[:]
    rest.remove(head)
    return _combinations(tail, r-1, [head]+c) + _combinations(tail, r, c)


def players_to_include(scores, num_players, required_score):
    players = ['p%d' % i for i in range(1, len(scores)+1)]
    score_table = dict(zip(players, scores))
    all_combinations = combinations(players, num_players)

    def combination_score(c):
        return sum([score_table[x] for x in c if x in score_table])
    
    return [c for c in all_combinations if combination_score(c) == required_score]


def required_score(scores, num_players):
    scores = sorted(scores, reverse=True)
    return sum(scores[:num_players])


if __name__ == '__main__':
    c1 = ([2, 5, 1, 2, 4, 1, 6, 5, 2, 2, 1], 6)
    rs1 = required_score(*c1)
    pprint.pprint(players_to_include(c1[0], c1[1], rs1))    

    c2 = (range(1, 12), 3)
    rs2 = required_score(*c2)
    pprint.pprint(players_to_include(c2[0], c2[1], rs2))
    
