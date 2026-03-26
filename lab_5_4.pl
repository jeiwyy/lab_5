% Решить логическую задачу ...
:- initialization(main).

bit(0).
bit(1).

task(A, N, V, G, D) :-
    bit(A), bit(N), bit(V), bit(G), bit(D),
    \+ (A == 1, D == 1, N == 0),
    (D == 0 -> (N == 1, V == 0) ; true),
    A \== V,
    (D == 1 -> G == 0 ; true),
    (N == 0, V == 0 -> D == 1 ; true),
    (V == 1, N == 0 -> (D == 0, G == 1) ; true).

find_all :-
    task(A, N, V, G, D),
    write('Подходящий состав: '),
    format('A:~w N:~w V:~w G:~w D:~w', [A, N, V, G, D]), nl,
    fail.
find_all. 

main :-
    write('Все возможные составы (1 - присут., 0 - отсут.)'), nl,
    find_all.