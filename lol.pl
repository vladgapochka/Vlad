
man(artem).
man(alexander).
man(maksim).
man(daniel).
man(dmitry).
man(ivan).
man(kirill).

woman(sofia).
woman(nastya).
woman(daria).
woman(maria).
woman(anna).
woman(victoria).
woman(polina).

parent(artem,dmitry).
parent(artem,maria).

parent(sofia,dmitry).
parent(sofia,maria).

parent(alexander,ivan).
parent(nastya,ivan).

parent(maksim,anna).
parent(daria,anna).

parent(dmitry,victoria).
parent(anna,victoria).

parent(maria,kirill).
parent(ivan,kirill).

man:-man(X),write(X),nl,fail.
woman:-woman(X),write(X),nl,fail.
children(X):-parent(X,Y),write(Y),nl,fail.
mother(X,Y):-parent(X,Y),woman(X).
mother(X):-parent(Y,X),woman(Y),write(Y),nl,fail.
son(X,Y):-parent(Y,X).
son(X):-parent(X,Y),man(Y),write(Y),nl,fail.
brother(X,Y):-parent(Z,X),parent(Z,Y),man(X).
brothers(X):-parent(Y,X),parent(Y,Z),man(Z),dif(X,Z),write(Z),nl,fail.
sister(X,Y):-parent(Z,X),parent(Z,Y),woman(X).
sister(X):-parent(Y,X),parent(Y,Z),woman(Z),dif(X,Z),write(Z),nl,fail.
b_s(X,Y):-parent(Z,X),parent(Z,Y).
b_s(X):-parent(Z,X),parent(Z,Y),woman(Z),dif(X,Y),write(Y),nl,fail.
grand_pa(X,Y):-parent(Z,Y),parent(X,Z),man(X).
grand_pas(X):-parent(Z,X),parent(Y,Z),man(Y),write(Y),nl,fail.
grand_ma(X,Y):-parent(Z,Y),parent(X,Z),woman(X).
grand_mas(X):-parent(Z,X),parent(Y,Z),woman(Y),write(Y),nl,fail.
grand_pa_and_son(X,Y):-grand_pa(X,Y),man(Y);grand_pa(Y,X),man(X).
grand_pa_and_da(X,Y):-grand_pa(X,Y),woman(Y);grand_pa(Y,X),woman(X).
uncle(X,Y):-brother(X,Z),parent(Z,Y),dif(X,Z).
uncles(X):-parent(Y,X),brother(Z,Y),dif(Y,Z),write(Z),nl,fail.
aunt(X,Y):-sister(X,Z),parent(Z,Y),dif(X,Z).
aunts(X):-parent(Y,X),sister(Z,Y),dif(Y,Z),write(Z),nl,fail.
