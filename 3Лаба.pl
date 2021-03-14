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
