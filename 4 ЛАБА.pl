%����� ������
writeList([]):-!.
writeList([H|T]):-write(H),writeList(T).
%������ ������
readList(0,[]):-!.
readList(N,[H|T]):-read(H),N1 is N-1,readList(N1,T).
