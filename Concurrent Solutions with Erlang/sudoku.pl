/* Ashwin Chembu 91970115 */
/* This runs all the simple tests. If it
works correctly, you should see three identical
and completed sudoku tables, and finally the
word false (as test0c will fail.) */
test :-
test0, nl,
test0a, nl,
test0b, nl,
test0c.
/* This is a completely solved solution. */
test0 :-
L = [
[9,6,3,1,7,4,2,5,8],
[1,7,8,3,2,5,6,4,9],
[2,5,4,6,8,9,7,3,1],
[8,2,1,4,3,7,5,9,6],
[4,9,6,8,5,2,3,1,7],
[7,3,5,9,6,1,8,2,4],
[5,8,9,7,1,3,4,6,2],
[3,1,7,2,4,6,9,8,5],
[6,4,2,5,9,8,1,7,3]],
sudoku(L),
printsudoku(L).
/* This has a solution (the one in test0) which
should be found very quickly. */
test0a :-
L = [
[9,_,3,1,7,4,2,5,8],
[_,7,_,3,2,5,6,4,9],
[2,5,4,6,8,9,7,3,1],
[8,2,1,4,3,7,5,_,6],
[4,9,6,8,5,2,3,1,7],
[7,3,_,9,6,1,8,2,4],
[5,8,9,7,1,3,4,6,2],
[3,1,7,2,4,6,9,8,5],
[6,4,2,5,9,8,1,7,3]],
sudoku(L),
printsudoku(L).
/* This has a solution (the one in test0) and
may take a few seconds to find. */
test0b :-
L = [
[9,_,3,1,7,4,2,5,_],
[_,7,_,3,2,5,6,4,9],
[2,5,4,6,_,9,_,3,1],
[_,2,1,4,3,_,5,_,6],
[4,9,_,8,_,2,3,1,_],
[_,3,_,9,6,_,8,2,_],
[5,8,9,7,1,3,4,6,2],
[_,1,7,2,_,6,_,8,5],
[6,4,2,5,9,8,1,7,3]],
sudoku(L),
printsudoku(L).
/* This one obviously has no solution (column 2 has
two nines in it.) and it may take a few seconds
to deduce this. */
test0c :-
L = [
[_,9,3,1,7,4,2,5,8],
[_,7,_,3,2,5,6,4,9],
[2,5,4,6,8,9,7,3,1],
[8,2,1,4,3,7,5,_,6],
[4,9,6,8,5,2,3,1,7],
[7,3,_,9,6,1,8,2,4],
[5,8,9,7,1,3,4,6,2],
[3,1,7,2,4,6,9,8,5],
[6,4,2,5,9,8,1,7,3]],
sudoku(L),
printsudoku(L).
% print sudoku table
printsudoku([]).
printsudoku([H|T]) :-
	write(H),nl,
	printsudoku(T).


sudoku3([X1,X2,X3]) :- 
	worthy(X1),
    worthy(X2),
    worthy(X3).

worthy(L) :- 
    valid(L),
    diff(L).

sudoku(L) :-
    rows(L),       
    cols(L),      
    boxes(L).      


rows(L) :- maplist(worthy, L).
cols(L) :- mytranspose(L, T), rows(T).
boxes(L) :- extract(L, B), rows(B).

mytranspose([], []).
mytranspose([[]|_], []).
mytranspose(R, [Col|RCol]) :-
    maplist(head_tail, R, Col, RR),
    mytranspose(RR, RCol).

head_tail([H|T], H, T).




extract([], []).
extract([R1, R2, R3|RR], [B1, B2, B3|RB]) :-
    split_row(R1, B1A, B2A, B3A),
    split_row(R2, B1B, B2B, B3B),
    split_row(R3, B1C, B2C, B3C),
    append(B1A, B1B, T1), append(T1, B1C, B1),
    append(B2A, B2B, T2), append(T2, B2C, B2),
    append(B3A, B3B, T3), append(T3, B3C, B3),
    extract(RR, RB).

split_row(R, B1, B2, B3) :-
    R = [A, B, C, D, E, F, G, H, I],
    B1 = [A, B, C],
    B2 = [D, E, F],
    B3 = [G, H, I].



valid([H]) :- validval(H).
valid([H|T]) :- validval(H),valid(T).
validval(1).
validval(2).
validval(3).
validval(4).
validval(5).
validval(6).
validval(7).
validval(8).
validval(9).

diff([_]).
diff([H|T]) :- 
    \+ member(H,T),
    diff(T).

    
