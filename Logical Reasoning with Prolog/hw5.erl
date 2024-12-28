-module(hw5).
-export([myremoveduplicates/1, myintersection/2, mylast/1, myreversehelper/2, myreverse/1, myreplaceall/3]).

myremoveduplicates([]) -> [];
myremoveduplicates([X | Xs]) ->
    case lists:member(X, Xs) of 
        true -> myremoveduplicates(Xs);
        false -> [X | myremoveduplicates(Xs)]
    end.

myintersection([], _) -> [];
myintersection([H1 | T1], List2) ->
    case lists:member(H1, List2) of
        true -> [H1 | myintersection(T1, List2)];
        false -> myintersection(T1, List2)
    end.
    
mylast([]) -> [];
mylast([X]) -> [X];
mylast([_ | Xs]) -> mylast(Xs).

myreversehelper([], Acc) -> Acc;
myreversehelper([H1 | T1], Acc) -> myreversehelper(T1, [H1 | Acc]).

myreverse([]) -> [];
myreverse(List) -> myreversehelper(List, []).

myreplaceall(_,_,[]) -> [];
myreplaceall(A,B, [H1 | T1]) ->
  case H1 =:= B of 
    true -> [A | myreplaceall(A,B,T1)];
    false -> [H1 | myreplaceall(A,B,T1)]
  end.



