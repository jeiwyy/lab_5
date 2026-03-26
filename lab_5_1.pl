% Составить программу вычисления наибольшего общего делителя двух натуральных чисел.
:- initialization(start).
gcd(X, 0, X) :- X > 0, !.
gcd(X, Y, D) :-
    Y > 0,
    R is X mod Y,
    gcd(Y, R, D).

start :-
    write('Введите первое число: '),
    read(A),
    write('Введите второе число'),
    read(B),
    gcd(A, B, Result),
    nl,
    write('Наибольший общий делитель: '),
    write(Result),
    nl.