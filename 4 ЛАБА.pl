%Вывод списка
writeList([]):-!.
writeList([H|T]):-write(H),writeList(T).
%Чтение списка
readList(0,[]):-!.
readList(N,[H|T]):-read(H),N1 is N-1,readList(N1,T).

%Сумма элементов списка
sum_list_down(List,Sum):-sum_list_down(List,0,Sum).
sum_list_down([],Sum,Sum):-!.
sum_list_down([H|T],S,Sum):-S1 is H + S,sum_list_down(T,S1,Sum).
sum_list:-write("Введите количество элементов"),nl,read(N),write("Введите элементы списка:"),nl,readList(N,List),sum_list_down(List,Sum),write("Сумма = "),write(Sum).

sum_list_up([],0):-!.
sum_list_up([H|T],S):-sum_list_up(T,S1),S is S1+H.
%выводит номер элемента
list_el_numb([H|T],Elem,Number):-list_el_numb([H|T],Elem,Number,0).
list_el_numb([H|T],Elem,Number,Count):-Count1 is Count+1,(H = Elem,Number = Count1 -> !;list_el_numb(T,Elem,Number,Count1)).
