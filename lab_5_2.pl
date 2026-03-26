% В списке натуральных чисел подсчитать их количество, оканчивающихся заданной цифрой.
:- initialization(main).


create_list(end, L, L) :- !.
create_list(Val, Acc, Result) :-
    append(Acc, [Val], NewAcc),
    write('Введите элемент(end - конец) '), read(Next),
    create_list(Next, NewAcc, Result).

count_ending_with([], _, 0).
count_ending_with([H|T], Dig, Count) :-
    abs(H) mod 10 =:= Dig, !,
    count_ending_with(T, Dig, RestCount),
    Count is RestCount + 1.
count_ending_with([_|T], Dig, Count) :-
    count_ending_with(T, Dig, Count).

main :-
    write('Введите элемент(end - конец) |: '),
    read(El),
    create_list(El, [], ResList),
    write('Список: '),
    write(ResList), nl,
    write('Введите цифру для поиска '), 
    read(Target),
    count_ending_with(ResList, Target, FinalCount),
    write('Результат: '), 
    write(FinalCount).