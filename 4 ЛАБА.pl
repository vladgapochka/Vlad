%����� ������
writeList([]):-!.
writeList([H|T]):-write(H),writeList(T).
%������ ������
readList(0,[]):-!.
readList(N,[H|T]):-read(H),N1 is N-1,readList(N1,T).

%����� ��������� ������
sum_list_down(List,Sum):-sum_list_down(List,0,Sum).
sum_list_down([],Sum,Sum):-!.
sum_list_down([H|T],S,Sum):-S1 is H + S,sum_list_down(T,S1,Sum).
sum_list:-write("������� ���������� ���������"),nl,read(N),write("������� �������� ������:"),nl,readList(N,List),sum_list_down(List,Sum),write("����� = "),write(Sum).

sum_list_up([],0):-!.
sum_list_up([H|T],S):-sum_list_up(T,S1),S is S1+H.
%������� ����� ��������
list_el_numb([H|T],Elem,Number):-list_el_numb([H|T],Elem,Number,0).
list_el_numb([H|T],Elem,Number,Count):-Count1 is Count+1,(H = Elem,Number = Count1 -> !;list_el_numb(T,Elem,Number,Count1)).

%��������� ���� �� ������� � ������ � ���� �� ���� ������� ��� �����
proverka:-write("���������� ��������� � ������: "),read(N),nl,write("������� �������� ������"),readList(N,[H|T]),nl,write("������� �������: "),read(Elem),nl,list_el_numb([H|T],Elem,Number),write(Number),!.
proverka:-write("��� ��������").
%������� ����� �������� � ������� ���
proverka_elem:-write("���������� ��������� � ������: "),nl,read(N),write("������� �������� ������"),nl,readList(N,List),write("������� ����� ��������: "),nl,read(Number),list_el_numb(List,Elem,Number),write(Elem),!.
proverka_elem:-write("��� �������� � ����� �������").
%����� ��� ��������� �� ����������� �������
min_list_up([H],H):-!.
min_list_up([H|T], Min):-min_list_up(T,Min1),(H<Min1 -> Min is H;Min is Min1).

min_list_down([],Min,Min):-!.
min_list_down([H|T],M,Min):-(H<M -> M1 is H;M1 is M),min_list_down(T,M1,Min).
min_list_down([H|T],Min):- min_list_down(T,H,Min).

proverka_min:-write("���������� ��������� � ������: "),nl,read(N),write("������� �������� ������"),nl,readList(N,List),min_list_down(List,Min),write("����������� ������� ������: "),write(Min),!.
%���������� true, ���� ������� ���� � ������.
prov_el([El|_],El):-!.
prov_el([_|T], El):-prov_el(T, El).

