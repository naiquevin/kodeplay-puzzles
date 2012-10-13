#!/usr/bin/env escript

-import(titanic, [lastman/1]).

readlines(Filename) ->
    {ok, Device} = file:open(Filename, [read]),
    try get_all_lines(Device)
    after file:close(Device)
    end.


get_all_lines(Device) ->
    case io:get_line(Device, "") of 
        eof -> [];
        Line -> [Line|get_all_lines(Device)]
    end.


get_input() ->
    Lines = readlines("/home/vineet/kodeplay_puzzles/titanic/input.txt"),
    LinesInt = [string:to_integer(X) || X <- Lines],
    [Total|Input] = [X || {X, _} <- LinesInt],
    {Total, Input}.


main(_) ->
    {Total, Input} = get_input(),
    io:format("Total: ~w~nInput: ~p~n", [Total, Input]),
    Output = lists:map(fun titanic:lastman/1, Input),
    io:format("Output: ~p~n", [Output]).
    
