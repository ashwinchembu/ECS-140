shuffle([], [], []).

shuffle([H1|T1], [H2|T2], [H1,H2|T3]) :-
    shuffle(T1, T2, T3).

double([], []).

double([H1|T1],[H1,H1|T2]) :- 
    double(T1, T2).

no_duplicates([],[]).

%occurs in tail
no_duplicates([H1|T1], L2) :-
    member(H1, T1),
    no_duplicates(T1, L2).

%does not occur in tail
no_duplicates([H1|T1], [H1|L2]) :-
    \+ member(H1, T1),
    no_duplicates(T1, L2).

% Base case: An empty list has the same elements as another empty list.
same_elements([], []).

% Recursive case: Select an element from L1 and match it with an element in L2.
same_elements([H1|T1], L2) :-
    same_elements(T1,L3),
    append(A,B,L3), 
    append(A, [H1|B], L2).









