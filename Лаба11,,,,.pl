:- dynamic  heroes/2.
:- dynamic faculty/2.
:- dynamic purity_of_blood/2.
:- dynamic patronus/2.
:- dynamic gender_of_the_hero/2.
:- dynamic age/2.
read_str(A) :-
  get0(X),
  r_str(X, A, []).
r_str(10, A, A) :- !.
r_str(X, A, B) :-
  append(B, [X], B1),
  get0(X1),
  r_str(X1, A, B1).

heroes_r(X, Y) :-
  repeat,
  ( heroes(X, Y) ->
  (nl, write(X),
  nl, write(Y),
  write("."),
  retract( heroes(X, Y)));
  X = nil, Y = nil).

faculty_r(X, Y) :-
  repeat,
  (faculty(X, Y) ->
  (nl, write(X),
  nl, write(Y),
  write("."),
  retract(faculty(X, Y)));
  X = nil, Y = nil).

purity_of_blood_r(X, Y) :-
  repeat,
  (purity_of_blood(X, Y) ->
  (nl, write(X),
  nl, write(Y),
  write("."),
  retract(purity_of_blood(X, Y)));
  X = nil, Y = nil).

patronus_r(X, Y) :-
  repeat,
  (patronus(X, Y) ->
  (nl, write(X),
  nl, write(Y),
  write("."),
  retract(patronus(X, Y)));
  X = nil, Y = nil).

gender_of_the_hero_r(X, Y) :-
  repeat,
  (gender_of_the_hero(X, Y) ->
  (nl, write(X),
  nl, write(Y),
  write("."),
  retract(gender_of_the_hero(X, Y)));
  X = nil, Y = nil).

age_r(X, Y) :-
  repeat,
  (age(X, Y) ->
  (nl, write(X),
  nl, write(Y),
  write("."),
  retract(age(X, Y)));
  X = nil, Y = nil).

prTell :-
  tell('C:/Users/Владосик/Desktop/Пролог/1.txt'), heroes_r(X1, _), X1 = nil, told,
  tell('C:/Users/Владосик/Desktop/Пролог/2.txt'),  faculty_r(X2, _),  X2 = nil, told,
  tell('C:/Users/Владосик/Desktop/Пролог/3.txt'),  purity_of_blood_r(X3, _),  X3 = nil, told,
  tell('C:/Users/Владосик/Desktop/Пролог/4.txt'),  patronus_r(X4, _),  X4 = nil, told,
  tell('C:/Users/Владосик/Desktop/Пролог/5.txt'), gender_of_the_hero_r(X5, _), X5 = nil, told,
  tell('C:/Users/Владосик/Desktop/Пролог/6.txt'), age_r(X6, _), X6 = nil, told.

prSee :-
  see('C:/Users/Владосик/Desktop/Пролог/1.txt'), get0(Sym1), read_data(Sym1, 1), seen,
  see('C:/Users/Владосик/Desktop/Пролог/2.txt'),  get0(Sym2), read_data(Sym2, 2), seen,
  see('C:/Users/Владосик/Desktop/Пролог/3.txt'),  get0(Sym3), read_data(Sym3, 3), seen,
  see('C:/Users/Владосик/Desktop/Пролог/4.txt'),  get0(Sym4), read_data(Sym4, 4), seen,
  see('C:/Users/Владосик/Desktop/Пролог/5.txt'), get0(Sym5), read_data(Sym5, 5), seen,
  see('C:/Users/Владосик/Desktop/Пролог/6.txt'), get0(Sym6), read_data(Sym6, 6), seen.

read_data(-1, _) :- !.
read_data(_, Flag) :-
  read_str(Lang),
  name(X, Lang),
  read(Y),
  (
    Flag = 1 ->
    asserta( heroes(X, Y));
    (
      Flag = 2 ->
      asserta(faculty(X, Y));
      (
        Flag = 3 ->
        asserta(purity_of_blood(X, Y));
        (
          Flag = 4 ->
          asserta(patronus(X, Y));
            (
              Flag = 5->
          asserta(gender_of_the_hero(X, Y));
          asserta(age(X,Y)))
        )
      )
    )
  ),
  get0(Sym),
  read_data(Sym, Flag).

question1(X1):-	write("Is the character the main character ?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X1).

question2(X2):-	write("what is the hero's department?"),nl,
                                write("4.Hufflepuff"),nl,
                                write("3.Ravenclaw"),nl,
                                write("2.Slytherin"),nl,
				write("1.Gryffindor"),nl,
				write("0. NO"),nl,
				read(X2).

question3(X3):-	write("what is the purity of the hero's blood?"),nl,
				write("2. half-breed"),nl,
				write("1. muggle-born"),nl,
				write("0. pureblood"),nl,
				read(X3).

question4(X4):-	write(" Has the patronus been studied ?"),nl,
				write("1.Yes"),nl,
				write("0.No"),nl,
				read(X4).

question5(X5):-	write("what gender is the hero ?"),nl,
				write("1. man"),nl,
				write("0. woman"),nl,
				read(X5).

question6(X6):-	write("the age of the hero ?"),nl,
                                write("6. 71-1000"),nl,
                                write("5. 41-70"),nl,
                                write("4. 31-40"),nl,
                                write("3. 21-30"),nl,
				write("1. 11-20"),nl,
				write("0. 0-10"),nl,
				read(X6).
addBlogger(Blogger, X1, X2, X3, X4, X5,X6) :-
  append('C:/Users/Владосик/Desktop/Пролог/1.txt'),
  nl, write(Blogger), nl, write(X1), write("."), told,

  append('C:/Users/Владосик/Desktop/Пролог/2.txt'),
  nl, write(Blogger), nl, write(X2), write("."), told,

  append('C:/Users/Владосик/Desktop/Пролог/3.txt'),
  nl, write(Blogger), nl, write(X3), write("."), told,

  append('C:/Users/Владосик/Desktop/Пролог/4.txt'),
  nl, write(Blogger), nl, write(X4), write("."), told,

  append('C:/Users/Владосик/Desktop/Пролог/5.txt'),
  nl, write(Blogger), nl, write(X5), write("."), told,

  append('C:/Users/Владосик/Desktop/Пролог/6.txt'),
  nl, write(Blogger), nl, write(X6), write("."), told.

pr :-
  prSee,
  question1(X1),
  question2(X2),
  question3(X3),
  question4(X4),
  question5(X5),
  question6(X6),
  ( heroes(X, X1),
  faculty(X, X2),
  purity_of_blood(X, X3),
  patronus(X, X4),
  gender_of_the_hero(X, X5),
    age(X,X6),
  write(X);
  (write("Blogger -> "),
  read(Blogger),
  asserta(heroes(Blogger, X1)),
  asserta(faculty(Blogger, X2)),
  asserta(purity_of_blood(Blogger, X3)),
  asserta(patronus(Blogger, X4)),
  asserta(gender_of_the_hero(Blogger, X5)),
   asserta(age(Blogger, X6)),
  prTell, nl,
  write("Blogger was added!")
  )).
