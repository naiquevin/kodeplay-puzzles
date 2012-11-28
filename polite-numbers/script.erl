#!/usr/bin/env escript

-import(polite, [politeness/1, politeways/1]).


find_polites(From, To) ->
    lists:filter(fun({_, P}) ->
                         P > 0
                 end,
                 lists:map(fun(X) ->
                                   {X, politeness(X)}
                           end,
                           lists:seq(From, To))).


highest_politeness(Polites) ->
    [H|_] = lists:sort(fun({N1, P1}, {N2, P2}) ->
                               P1 > P2
                       end,
                       Polites),
    H.


main(_) ->
    Polites = find_polites(2, 100),
    io:format("All polites between 2 and 10: ~p~n", [lists:map(fun({N, _}) -> N end, Polites)]),
    {N, Max} = highest_politeness(Polites),
    io:format("Highest politeness: Number ~w with politeness of ~w ~n", [N, Max]).

