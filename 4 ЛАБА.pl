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
