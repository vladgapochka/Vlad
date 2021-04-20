write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

write_list_str([]):-!.
write_list_str([H|Tail]):-write_str(H),write(" "),write_list_str(Tail).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

append1([],List,List):-!.
append1([H1|T1],List,[H1|T3]):-append(T1,List,T3).

reverse(A,Z):-reverse(A,Z,[]).
reverse([],Z,Z).
reverse([H|T],Z,Acc):- reverse(T,Z,[H|Acc]).

reverse_list(List,ListR):-reverse_list(List,[],ListR).
reverse_list([],Buffer,Buffer):-!.
reverse_list([H|T],Buffer,ListR):-reverse_list(T,[H|Buffer],ListR).


wr_str:-read_str(A,Length),write_str(A),write(","),write_str(A),write(","),write_str(A),write(","),write(Length).

kol_w:-read_str(A,_),append1([32],A,A1),kol_words(A1,0,Kol),write(Kol).
kol_words([_|[]],Kol,Kol):-!.
kol_words([H1|[H2|T]],K,Kol):-(H1=32,H2\=32 -> K1 is K+1,kol_words([H2|T],K1,Kol);kol_words([H2|T],K,Kol)).


list_words:-read_str(A,_),append1([32],A,A1),reverse(A1,AR),list_words(AR,[],_,[]).
list_words([],LW,LW,_):-!.
list_words([H|T],LW,LWN,W):-(H=32 -> append([W],LW,LW1),list_words(T,LW1,LWN,[]);append1([H],W,W1),list_words(T,LW,LWN,W1)).

kol_repeat_in_list([H|T],X,K):-kol_repeat_in_list([H|T],X,0,K).
kol_repeat_in_list([],_,Kol,Kol):-!.
kol_repeat_in_list([H|T],X,K,Kol):-(H=X -> K1 is K+1,kol_repeat_in_list(T,X,K1,Kol);kol_repeat_in_list(T,X,K,Kol)).

chsv:-read_str(A,_),append1([32],A,A1),reverse(A1,AR),list_words(AR,[],LW,[]),chsv(LW,_,Word,0,_),write_str(Word).
chsv([],Word,Word,Kol,Kol):-!.
chsv([H|T],W,Word,K,Kol):-kol_repeat_in_list([H|T],H,K1),(K1>K -> Kol1 = K1,W1=H,chsv(T,W1,Word,K1,Kol1);chsv(T,W,Word,K,Kol)).

prover:-read_str(A,Length),(Length>5 -> prover(A),reverse(A,AR),prover(AR);prover(A,Length)).
prover([H1|[H2|[H3|_]]]):-put(H1),put(H2),put(H3),!.
prover([_|_],0):-!.
prover([H|T],Length):-put(H),L1 is Length-1,prover([H|T],L1).
provLen([H1|[H2|[H3|_]]]):-put(H3),put(H2),put(H1),!.

length_list([],0):-!.
length_list([_|T],L):-length_list(T,L1),L is L1+1.

index_end_all:-read_str(Sr,_),reverse(Sr,[H|_],_),EndS = H,list_entry_el(Sr,EndS,_).

list_entry_el([H|T],El,Num):-list_entry_el([H|T],El,Num,0).
list_entry_el([],_,_,_):-!.
list_entry_el([H|T],El,Num,Chet):-Chet1 is Chet+1,(H = El,Num1 = Chet1 -> write(Chet1),write(" "),list_entry_el(T,El,Num1,Chet1);list_entry_el(T,El,Num,Chet1)).

index_3:-read_str(St,_),index_3(St,0).
index_3([],_):-!.
index_3([H|T],Counter):-Counter1 is Counter+1,(0 is Counter1 mod 3 -> put(H),index_3(T,Counter1);index_3(T,Counter1)).


k_c_s([_|[]],KZ,KZ):-!.
k_c_s([H1|[H2|T3]],KZero,KolZero):-((H1=43;H1=45),H2=48 -> KZero1 is KZero+1,k_c_s([H2|T3],KZero1,KolZero);k_c_s([H2|T3],KZero,KolZero)).
kol_p_m:-read_str(St,_),kol_p_m(St,0,KP,0,KM),k_c_s(St,0,KZ),write("Plus = "),write(KP),nl,write("Minus = "),write(KM),nl,write("Zero = "),write(KZ),!.
kol_p_m([],KP,KP,KM,KM):-!.
kol_p_m([43|T],KP,KolP,KM,KolM):-KP1 is KP+1,kol_p_m(T,KP1,KolP,KM,KolM).
kol_p_m([45|T],KP,KolP,KM,KolM):-KM1 is KM+1,kol_p_m(T,KP,KolP,KM1,KolM).
kol_p_m([_|T],KP,KolP,KM,KolM):-kol_p_m(T,KP,KolP,KM,KolM).


ranshe:-read_str(A,_),pr_w(A,0,Indw),pr_x(A,0,Indx),(Indw<Indx->write("w ����������� ������");write("x ����������� ������")).
pr_w([],_,_):-write("�� ���������� w"),!,fail.
pr_w([Head|Tail],I,Ind):-(Head =:=119 -> Ind is I;I1 is I+1,pr_w(Tail,I1,Ind)).

pr_x([],_,_):-write("�� ���������� x"),!,fail.
pr_x([Head|Tail],I,Ind):-(Head =:=120 -> Ind is I;I1 is I+1,pr_x(Tail,I1,Ind)).

big:-read_str(St1,N1),read_str(St2,N2),(N1>N2-> N is N1-N2,big_str(St1,N);N is N2-N1,big_str(St2,N)).
big_str(_,0):-!.
big_str(Str,Num):-name(St,Str),write(St),nl,Num1 is Num-1,big_str(Str,Num1).

