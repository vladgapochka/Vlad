read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

% 1 ���� ��� ��������� �����, ��� ������� ����������� ����������������
% ������. ��������� �����������, ����������� � ����� �� ������ ��� ����
% ������.
ob_per_sum:-write("1 ����"),nl,get_Ver(V1),nl,get_edges(V1,E1),write("2 ����"),nl,get_Ver(V2),nl,get_edges(V2,E2),write("1 ����: "),write(V1),write(E1),nl,write("2 ����: "),write(V2),write(E2),nl,nl,write("�����������:"),nl,union(V1,V2,E1,E2),nl,write("�����������:"),nl,intersection(V1,V2,E1,E2),nl,write("����� �� ������ 2:"),nl,sum(V1,V2,E1,E2).

get_Ver(V):-nl,write("���������� ������ = "),read(N),nl,write("�������: "),nl,N1 is N+1,get_Ver([_|V],N1).
get_Ver([],0):-!.
get_Ver([H|T],N):-read_str(X,_),name(H,X),N1 is N-1,get_Ver(T,N1).

get_edges(V,E):-nl,write("���������� ����� = "),read(M),nl,write("������ �����: "),nl,get0(X),get_edges(V,E,[],M,0).
get_edges(_,E,E,M,M):-!.
get_edges(V,E,Edges,M,Count):-get_edge(V,Edge),append(Edges,[Edge],E1),Count1 is Count+1,get_edges(V,E,E1,M,Count1).

get_edge(V,[V1,V2]):-write("����� �����:"),nl,read_str(X,_),name(V1,X),check_ver(V,V1),read_str(Y,_),name(V2,Y),check_ver(V,V2).

check_ver([V1|_],V1):-!.
check_ver([_|T],V1):-check_ver(T,V1).

in_list([El|_],El):-!.
in_list([_|L],El):-in_list(L,El),!.

union(V1,V2,E1,E2):-u_vertexes(V1,V2,V3),u_edges(E1,E2,E3),write("�������:"),write(V3),nl,write("�����:"),nl,write(E3),nl.

u_vertexes(V,[],V):-!.
u_vertexes(V1,[H|V2],V3):-not(in_list(V1,H))->append(V1,[H],V),u_vertexes(V,V2,V3),!.
u_vertexes(V1,[_|V2],V3):-u_vertexes(V1,V2,V3),!.

u_edges(E,[],E):-!.
u_edges(E1,[H|E2],E3):-not(in_list(E1,H))->append(E1,[H],E),u_edges(E,E2,E3),!.
u_edges(E1,[_|E2],E3):-u_edges(E1,E2,E3),!.

intersection(V1,V2,E1,E2):-i_vertexes(V1,V2,V3),i_edges(E1,E2,E3),write("�������:"),write(V3),nl,write("�����:"),nl,write(E3),nl.

i_vertexes(_,[],[]):-!.
i_vertexes(V1,[H|V2],[H|V3]):-in_list(V1,H)->i_vertexes(V1,V2,V3),!.
i_vertexes(V1,[_|V2],V3):-i_vertexes(V1,V2,V3),!.

i_edges(_,[],[]):-!.
i_edges(E1,[H|E2],[H|E3]):-in_list(E1,H)->i_edges(E1,E2,E3),!.
i_edges(E1,[_|E2],E3):-i_edges(E1,E2,E3),!.

sum(V1,V2,E1,E2):-s_vertexes(V1,V2,V3),s_edges(E1,E2,E3),write("�������:"),write(V3),nl,write("�����:"),nl,write(E3).

s_vertexes(V1,V2,V3):-s_vertexes1(V1,V2,V31),s_vertexes1(V2,V1,V32),append(V31,V32,V3).
s_vertexes1(_,[],[]):-!.
s_vertexes1(V1,[H|V2],[H|V3]):-not(in_list(V1,H))->s_vertexes1(V1,V2,V3),!.
s_vertexes1(V1,[_|V2],V3):-s_vertexes1(V1,V2,V3),!.

s_edges(E1,E2,E3):-s_edges1(E1,E2,E31),s_edges1(E2,E1,E32),append(E31,E32,E3).
s_edges1(_,[],[]):-!.
s_edges1(E1,[H|E2],[H|E3]):-not(in_list(E1,H))->s_edges1(E1,E2,E3),!.
s_edges1(E1,[_|E2],E3):-s_edges1(E1,E2,E3),!.

%2 ��� ��� �������, ��������� ������� ��������� ������ ������.
kod_pr:-write("��� �������: "),read_str(Code,Len),N is Len+2,b_e_list(Code,N,E),build_matr(E,N,M),write_matr(M).

make_ar(0,[]):-!.
make_ar(K,[K|Tail]):-K1 is K-1,make_ar(K1,Tail).

in_list_ex([El|T],El,T):-!.
in_list_ex([H|T],El,[H|Tail]):-in_list_ex(T,El,Tail),!.

b_e_list(C,N,E):-make_ar(N,V),to_int(C,C1),build_edges(C1,[],E,V).

to_int([],[]):-!.
to_int([H|V],[H1|V1]):-H1 is H-48,to_int(V,V1),!.

build_edges([],E1,E,V):-append(E1,[V1],E2),reverse(V,V1),append(E2,[V1],E),!.
build_edges([N|C],E1,E,V):-min(V,[N|C],Min),in_list_ex(V,Min,V1),append(E1,[[N,Min]],E2),append(E2,[[Min,N]],E3),build_edges(C,E3,E,V1),!.

min([H|L],C,M):-(not(in_list(C,H))->min(L,C,H,M);min(L,C,M)),!.
min([],_,M,M):-!.
min([H|L],C,M1,M):-(not(in_list(C,H)),M1>H->min(L,C,H,M);min(L,C,M1,M)),!.

build_matr(E,N,M1):-i_st([],1,E,M1,N).

i_st(M,N,_,M,LenN):-N>LenN,!.
i_st(M,N,E,M1,LenN):-in_str(E,N,S,E1),j_st(L,S,LenN),N1 is N+1,append(M,[L],M2),i_st(M2,N1,E1,M1,LenN),!.

in_str(E,N,S,E1):-in_str(E,N,S,E,E1),!.
in_str([],_,[],E1,E1):-!.
in_str([[N,H2]|E],N,[H2|S],E2,E1):-in_list_ex(E2,[N,H2],E3),in_str(E,N,S,E3,E1),!.
in_str([_|E],N,S,E2,E1):-in_str(E,N,S,E2,E1),!.

j_st(L,S,LenN):-j_st(L,1,S,LenN).
j_st([],N1,_,N):-N1>N,!.
j_st([1|L],N,S,Len):-in_list(S,N),N1 is N+1,j_st(L,N1,S,Len),!.
j_st([0|L],N,S,Len):-N1 is N+1,j_st(L,N1,S,Len),!.

write_matr([]):-!.
write_matr([H|T]):-write(H),nl,write_matr(T),!.


%3 ��� ����������������� ����������� ����. ����� ������� ����.
aler_gr:-get_Ver(V),nl,get_edges(V,E),aler_N(E).

in_list_ex([El|T],El,T).
in_list_ex([H|T],El,[H|Tail]):-in_list_ex(T,El,Tail).

b_a_r([],[]):-!.
b_a_r(A,[El|Perm]):-in_list_ex(A,El,A1),b_a_r(A1,Perm).

aler_N(E):-b_a_r(E,Way),length(E,L),p(L,Way),write(Way).
p(L,T):-p_1(L1,T),L1==L.
p_1(1,[_]):-!.
p_1(K,[[_,X]|[[X,Y]|T]]):-p_1(K1,[[X,Y]|T]),K is K1+1.
p_1(K,[[_,X]|[[Y,X]|T]]):-p_1(K1,[[X,Y]|T]),K is K1+1.
