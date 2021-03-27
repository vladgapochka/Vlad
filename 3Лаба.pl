max(X,Y,Z):-X>Y,Z is X.
max(X,Y,Z):-Y>=X,Z is Y.
max(X,Y,Z,U):-X>Y,X>Z,U is X.
max(X,Y,Z,U):-Y>X,Y>Z,U is Y.
max(X,Y,Z,U):-Z>X,Z>Y,U is Z.
fact(1,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1),X is X1*N.
fact(N,X):-factorial(N,X,1).
factorial(1,X,X):-!.
factorial(N,X,X1):-N1 is N-1,X2 is X1*N,factorial(N1,X,X2).
fib(1,1):-!.
fib(2,1):-!.
fib(N,X):-N1 is N-1,N2 is N-2,fib(N1,X1),fib(N2,X2),X is X1+X2 .
fib_down(1,CurX2,_,CurX2):-!.
fib_down(N,CurX1,CurX2,X):-N1 is N-1,CurX3 is CurX1 + CurX2,fib_down(N1,CurX2,CurX3,X).
fib_down(N,X):-fib_down(N,1,1,X).
sum_up(0,0):-!.
sum_up(N,X):-N1 is  N div 10,sum_up(N1,X1),X is X1 + N mod 10.
sum_down(X,S):-sum_down(X,S,0).
sum_down(0,St,St):-!.
sum_down(X,S,St):-St1 is (X mod 10)+St,X1 is X div 10,sum_down(X1,S,St1).
max_up(0,0):-!.
max_up(N,X):-N1 is N div 10, max_up(N1,X2), CurX1 is N mod 10, max(CurX1,X2,X).
max_down(N,X):-max_down(N,0,X).
max_down(0,X,X):-!. %когда нет цифр, остановка
max_down(CurX,Max,X):-CurX1 is CurX mod 10,CurY is CurX div 10,
CurY1 is CurY mod 10,max(CurX1,CurY1,C),max(C,Max,U),max_down(CurY,U,X).

sum_up_del3(0,0):-!.
sum_up_del3(N,X):-N1 is N div 10,sum_up(N1,X1),del3(N,Y),X is X1 + Y.
del3(X,Y):- X mod 10 mod 3 =:= 0 , Y is X mod 10,!.
del3(_,Y):-Y is 0,!.

sum_down_del3(N,X):-sum_down_del3(N,0,X).
sum_down_del3(0,X,X):-!.
sum_down_del3(A,Sum,X):- A1 is A div 10,del3(A,Y),Sum1 is Sum+Y,
sum_down_del3(A1,Sum1,X).

%Проверить число на простоту
prime(N,X):- N mod X =:= 0,!. % делится без остатка, выходим
prime(N,X):- X*X=<N,X1 is X+1,prime(N,X1).

prime(1):-!.
prime(N):-not(prime(N,2)).

%Найти количество делителей числа
kol_del(_,0,0):-!.
kol_del(N,CurX,X):-N mod CurX =:= 0,CurX1 is CurX-1,kol_del(N,CurX1,X1), X is X1+1;
N mod CurX=\= 0, CurX1 is CurX-1, kol_del(N,CurX1,X1), X is X1.
kol_del(N,X):-kol_del(N,N,X),!.
