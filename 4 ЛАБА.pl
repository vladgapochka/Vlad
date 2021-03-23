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

%проверяет есть ли элемент в списке и если он есть выводит его номер
proverka:-write("Количество элементов в списке: "),read(N),nl,write("Введите элементы списка"),readList(N,[H|T]),nl,write("Введите элемент: "),read(Elem),nl,list_el_numb([H|T],Elem,Number),write(Number),!.
proverka:-write("Нет элемента").
%считает номер элемента и выводит его
proverka_elem:-write("Количество элементов в списке: "),nl,read(N),write("Введите элементы списка"),nl,readList(N,List),write("Введите номер элемента: "),nl,read(Number),list_el_numb(List,Elem,Number),write(Elem),!.
proverka_elem:-write("Нет элемента с таким номером").
%вывод или проверяет на минимальный элемент
min_list_up([H],H):-!.
min_list_up([H|T], Min):-min_list_up(T,Min1),(H<Min1 -> Min is H;Min is Min1).

min_list_down([],Min,Min):-!.
min_list_down([H|T],M,Min):-(H<M -> M1 is H;M1 is M),min_list_down(T,M1,Min).
min_list_down([H|T],Min):- min_list_down(T,H,Min).

proverka_min:-write("Количество элементов в списке: "),nl,read(N),write("Введите элементы списка"),nl,readList(N,List),min_list_down(List,Min),write("Минимальный элемент списка: "),write(Min),!.
%возвращает true, если элемент есть в списке.
prov_el([El|_],El):-!.
prov_el([_|T], El):-prov_el(T, El).

