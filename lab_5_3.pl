:- initialization(main).

create_list(end, L, L) :- !.
create_list(Val, Acc, Result) :-
    append(Acc, [Val], NewAcc), 
    write('Введите элемент(end - конец) '), read(Next),
    create_list(Next, NewAcc, Result).

set_diff([], _, []).
set_diff([H|T], B, Result) :-
    member(H, B),
    !,           
    set_diff(T, B, Result).

set_diff([H|T], B, [H|Result]) :-
    set_diff(T, B, Result).

main :-
    write('Создание первого множества: '), nl,
    write('Введите элемент(end - конец) |: '), read(El1),
    create_list(El1, [], SetA),
    
    write('Создание второго множества: '), nl,
    write('Введите элемент(end - конец) '), read(El2),
    create_list(El2, [], SetB),
    
    set_diff(SetA, SetB, FinalDiff),
    
    nl, write('Множество 1: '), write(SetA), nl,
    write('Множество 2: '), write(SetB), nl,
    write('Разность 1 и 2: '), write(FinalDiff), nl.