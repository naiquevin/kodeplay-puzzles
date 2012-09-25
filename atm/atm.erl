-module(atm).
-export([withdraw/2, atm_test/0]).


withdraw(Amount, Initial) ->
    case balance(Amount, Initial) of 
        {ok, Balance} ->
            io:format("Status: Amount withdrawn successfully.~nBalance left: ~.2f~n", [Balance]);
        {failed, Balance, Reason} ->
            io:format("Status: Transaction failed.~nReason: ~s~nBalance: ~.2f~n", [Reason, Balance])
    end.


balance(Amount, Initial) ->
    balance(Amount, Initial, 0.50).

balance(Amount, Initial, Charges) when Initial < (Amount + Charges) -> 
    {failed, Initial, "In sufficient funds"};
balance(Amount, Initial, _) when Amount rem 5 > 0 -> 
    {failed, Initial, "Amount not multiple of 5"};
balance(Amount, Initial, Charges) -> 
    {ok, Initial - (Amount + Charges)}.


atm_test() ->
    {ok, 99.50} = balance(20, 120.00),
    {ok, 0.00} = balance(5, 5.50),
    {failed, 150.0, _} = balance(12, 150.00),
    {failed, 150.0, _} = balance(200, 150.00),
    {failed, 5.00, _} = balance(5, 5.00),
    ok.

    
