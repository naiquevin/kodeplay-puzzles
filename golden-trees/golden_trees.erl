-module(golden_trees).
-compile(export_all).


calculate(InitTax, Slot1, Slot2, K, N) ->
    [Final|_] = calculate(InitTax, Slot1, Slot2, K, N, 1, []),
    Final rem 100000007.


calculate(_, _, _, _, N, Year, TaxPaid) when Year > N ->
    TaxPaid;
calculate(InitTax, Slot1, Slot2, K, N, Year, TaxPaid) when Year == 1 ->
    calculate(InitTax, Slot1, Slot2, K, N, Year+1, [InitTax|TaxPaid]);
calculate(InitTax, Slot1, Slot2, K, N, Year, TaxPaid) when Year > 1, Year =< (1+Slot1) ->
    calculate(InitTax, Slot1, Slot2, K, N, Year+1, [hd(TaxPaid)+1|TaxPaid]);
calculate(InitTax, Slot1, Slot2, K, N, Year, TaxPaid) when Year > (1+Slot1), Year =< (1+Slot1+Slot2) ->
    calculate(InitTax, Slot1, Slot2, K, N, Year+1, [hd(TaxPaid)*2|TaxPaid]);
calculate(InitTax, Slot1, Slot2, K, N, Year, TaxPaid) when Year > (1+Slot1+Slot2), Year =< N ->
    LastK = lists:sublist(TaxPaid, K),
    ProdLastK = lists:foldl(fun (X, Prod) -> X * Prod end, 1, LastK),
    calculate(InitTax, Slot1, Slot2, K, N, Year+1, [ProdLastK|TaxPaid]).


test() ->
    4 = calculate(1, 3, 2, 4, 4),
    1536 = calculate(1, 3, 2, 4, 7),
    18811834 = calculate(1, 3, 2, 4, 9),
    io:format("All tests pass~n"),
    ok.






    


