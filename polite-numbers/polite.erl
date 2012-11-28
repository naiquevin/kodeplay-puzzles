-module(polite).
-export([politeness/1, politeways/1]).

log2(X) ->
    math:log(X) / math:log(2).


is_power_2(N) ->
    math:pow(2, log2(N)) == N.


politeness(N) ->
    case is_power_2(N) of
        true -> 0;
        false -> erlang:length(politeways(N))
    end.


politeways(N) ->
    politeways(N, lists:reverse(lists:seq(1, (N div 2)+1)), 2, []).

politeways(_N, Seq, Take, Ways) when erlang:length(Seq) < Take ->
    Ways;
politeways(N, Seq, Take, Ways) ->
    {Nums, Rest} = lists:split(Take, Seq),
    Sum = lists:sum(Nums),
    Next = tl(Nums)++Rest,
    if Sum > N ->
            politeways(N, Next, Take, Ways);
       Sum < N ->
            politeways(N, Nums++Rest, Take+1, Ways);
       Sum == N ->
            politeways(N, Next, 1, [Nums|Ways])
    end.

