#!/usr/bin/env escript

main(Input) ->
    [InitTax, Slot1, Slot2, K, N] = lists:map(fun erlang:list_to_integer/1, Input),
    Amount = golden_trees:calculate(InitTax, Slot1, Slot2, K, N),
    io:format("The amount of tax payed (mod 100000007) in the ~wth year is ~w.~n", [N, Amount]).
    
