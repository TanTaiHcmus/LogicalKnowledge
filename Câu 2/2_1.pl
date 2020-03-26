
%male(Person)

male(princePhilip).
male(princeAndrew).
male(princeCharles).
male(princeHarry).
male(princeWilliam).
male(archieHarrison).
male(princeLouis).
male(princeGeorge).
male(princeEdward).
male(timothyLaurence).
male(markPhillips).
male(jamesSevern).
male(mikeTindall).
male(peterPhillips).



%female(Person)
female(queenElizabethII).
female(sarahFerguson).
female(camillaBowles).
female(princessDiana).
female(princessBeatrice).
female(princessEugenie).
female(meghanMarkle).
female(kateMiddleton).
female(princessCharlotte).
female(sophieRhys-Jones).
female(princessAnne).
female(ladyLoulse).
female(zaraTindall).
female(autumnPhillips).




%parent(Parent, Child)

parent(queenElizabethII, princeAndrew).
parent(queenElizabethII, princeCharles).
parent(queenElizabethII, princeEdward).
parent(queenElizabethII, princessAnne).

parent(princePhilip, princeAndrew).
parent(princePhilip, princeCharles).
parent(princePhilip, princeEdward).
parent(princePhilip, princessAnne).


parent(princeAndrew, princessEugenie).
parent(princeAndrew, princessBeatrice).

parent(sarahFerguson, princessEugenie).
parent(sarahFerguson, princessBeatrice).


parent(princeCharles, princeWilliam).
parent(princeCharles, princeHarry).

parent(princessDiana, princeWilliam).
parent(princessDiana, princeHarry).


parent(princeWilliam, princeGeorge).
parent(princeWilliam, princessCharlotte).
parent(princeWilliam, princeLouis).

parent(kateMiddleton, princeGeorge).
parent(kateMiddleton, princessCharlotte).
parent(kateMiddleton, princeLouis).


parent(princeHarry, archieHarrison).

parent(meghanMarkle, archieHarrison).


parent(markPhillips, peterPhillips).
parent(markPhillips, zaraTindall).

parent(princessAnne, peterPhillips).
parent(princessAnne, zaraTindall).


parent(princeEdward, ladyLoulse).
parent(princeEdward, jamesSevern).

parent(sophieRhys-jones, ladyLoulse).
parent(sophieRhys-jones, jamesSevern).


%married(Person, Person)
married(queenElizabethII, princePhilip).

married(princeAndrew, sarahFerguson).

married(princeCharles, camillaBowles).

married(princeHarry, meghanMarkle).

married(kateMiddleton, princeWilliam).

married(princessAnne, timothyLaurence).
married(peterPhillips, autumnPhillips).

married(zaraTindall, mikeTindall).
married(princeEdward, sophieRhys-jones).

married(princePhilip, queenElizabethII).
married(camillaBowles, princeCharles).
married(meghanMarkle, princeHarry).
married(princeWilliam, kateMiddleton).
married(sarahFerguson, princeAndrew).
married(autumnPhillips, peterPhillips).
married(timothyLaurence, princessAnne).
married(sophieRhys-jones, princeEdward).
married(mikeTindall, zaraTindall).



%divorced(Person, Person)

divorced(markPhillips, princessAnne).
divorced(princessDiana, princeCharles).

divorced(princessAnne, markPhillips).
divorced(princeCharles, princessDiana).



%husband(Person,Wife)
husband(Person, Wife) :- married(Person, Wife), male(Person).

%wife(Person,Husband)
wife(Person, Husband) :- married(Person, Husband), female(Person).

%father(Parent,Child)
father(Parent, Child) :- parent(Parent, Child), male(Parent).

%mother(Parent,Child)
mother(Parent, Child) :- parent(Parent, Child), female(Parent).

%child(Child,Parent)
child(Child, Parent) :- parent(Parent, Child).

%son(Child,Parent)
son(Child, Parent) :- parent(Parent, Child), male(Child).

%daughter(Child,Parent)
daughter(Child, Parent) :- parent(Parent, Child), female(Child).



%grandparent(GP,GC)
grandparent(GP, GC) :- parent(GP, Parent), parent(Parent, GC).

%grandmother(GM,GC)
grandmother(GM, GC) :- parent(GM, Parent), parent(Parent, GC), female(GM).

%grandfather(GF,GC)
grandfather(GF, GC) :- parent(GF, Parent), parent(Parent, GC), male(GF).

%grandchild(GC,GP)
grandchild(GC, GP) :- parent(GP, Parent), parent(Parent, GC).

%grandson(GS,GP)
grandson(GS, GP) :- parent(GP, Parent), parent(Parent, GS), male(GS).

%granddaughter(GD,GP)
granddaughter(GD, GP) :- grandchild(GD, GP), female(GD).






%sibling(Person1,Person2)
sibling(Person1, Person2) :- parent(Parent, Person1), parent(Parent, Person2), Person1\=Person2.

%brother(Person,Sibling)
brother(Person, Sibling) :- sibling(Person, Sibling), male(Person).

%sister(Person,Sibling)
sister(Person, Sibling) :- sibling(Person, Sibling), female(Person).

%aunt(Person,NieceNephew)
aunt(Person, NieceNephew) :- parent(Parent,NieceNephew),(sister(Person,Parent);(brother(Uncle,Parent),wife(Person,Uncle))).

%uncle(Person,NieceNephew)
uncle(Person, NieceNephew) :- parent(Parent,NieceNephew),(brother(Person,Parent);(sister(Aunt,Parent),husband(Person,Aunt))).

%niece(Person,AuntUncle)
niece(Person, AuntUncle) :- (aunt(AuntUncle,Person);uncle(AuntUncle,Person)),female(Person).

%nephew(Person,AuntUncle)
nephew(Person, AuntUncle) :- (aunt(AuntUncle,Person);uncle(AuntUncle,Person)),male(Person).