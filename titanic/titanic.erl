-module(titanic).
-export([lastman/1, test/0]).


len(L) ->
    len(L, 0).

len([], R) ->
    R;
len([_|T], R) ->
    len(T, R + 1).


sailors(N) ->    
    [{X, X} || X <- lists:seq(1, N)].

choose([{_, P}]) ->
    P;
choose(Sailors) ->
    Selected = [{I, P} || {I, P} <- Sailors, I rem 2 =:= 0],
    SelectedPos = [P || {_, P} <- Selected],
    Indexes = lists:seq(1, len(SelectedPos)),
    choose(lists:zip(Indexes, SelectedPos)).


lastman(N) ->
    choose(sailors(N)).


test() ->
    T1 = lastman(5),
    T1 = 4,
    T2 = lastman(12),
    T2 = 8,
    ok.

