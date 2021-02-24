max(X,Y,Z):-X>Y,Z is X.
max(X,Y,Z):-Y>=X,Z is Y.
max(X,Y,Z,U):-X>Y,X>Z,U is X.
max(X,Y,Z,U):-Y>X,Y>Z,U is Y.
max(X,Y,Z,U):-Z>X,Z>Y,U is Z.
fact(1,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1),X is X1*N.

