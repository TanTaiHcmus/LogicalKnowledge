%male(Person)

male(dat).
male(luan).
male(dong).
male(lam).
male(duc).
male(ut).
male(bay).
male(chau).
male(tu).
male(khai).
male(hiep).
male(tam).
male(nam).
male(ty).

%female(Person)
female(huong).
female(du).
female(lan).
female(dLan).
female(tram).
female(tLan).
female(sua).
female(hue).
female(ngan).
female(bich).
female(chat).
female(thuy).
female(thu).
female(danh).
female(linh).
female(baoThy).
female(lep).

%married(Person, Person)

married(huong, luan).
married(luan, huong).
married(dong, lan).
married(lan, dong).
married(duc, sua).
married(sua, duc).
married(lam, sua).
married(sua, lam).
married(tLan, ut).
married(ut, tLan).
married(tram, bay).
married(bay, tram).
married(hue, chau).
married(chau, hue).
married(ngan, tu).
married(tu, ngan).
married(khai, chat).
married(chat, khai).
married(thuy, hiep).
married(hiep, thuy).
married(thu, tam).
married(tam, thu).

%parent(Parent, Child)

parent(huong, dong).
parent(luan, dong).

parent(huong, dat).
parent(luan, dat).

parent(huong, du).
parent(luan, du).

parent(dong, sua).
parent(lan, sua).

parent(dong, ut).
parent(lan, ut).

parent(dong, dLan).
parent(lan, dLan).

parent(dong, bay).
parent(lan, bay).

parent(sua, chau).
parent(duc, chau).

parent(sua, tu).
parent(duc, tu).

parent(sua, bich).
parent(duc, bich).

parent(sua, chat).
parent(duc, chat).

parent(tLan, hiep).
parent(ut, hiep).

parent(tLan, tam).
parent(ut, tam).

parent(tram, danh).
parent(bay, danh).

parent(hue, nam).
parent(chau, nam).

parent(hue, linh).
parent(chau, linh).

parent(ngan, ty).
parent(tu, ty).

parent(ngan, baoThy).
parent(tu, baoThy).

parent(khai, lep).
parent(chat, lep).



%divorced(Person, Person)
divorced(lam, sua).
divorced(sua, lam).

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
granddaughter(GD, GP) :- parent(GP, Parent), parent(Parent, GD), female(GD).






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

%yearBirthday(Person, Year)
yearBirthday(huong, 1880).
yearBirthday(luan, 1970).
yearBirthday(dat, 1935).
yearBirthday(du, 1940).
yearBirthday(dong, 1930).
yearBirthday(lan, 1932).
yearBirthday(lam, 1950).
yearBirthday(duc, 1948).
yearBirthday(sua, 1952).
yearBirthday(tLan, 1957).
yearBirthday(ut, 1955).
yearBirthday(tram, 1960).
yearBirthday(bay, 1957).
yearBirthday(dLan, 1963).
yearBirthday(hue, 1973).
yearBirthday(chau, 1971).
yearBirthday(ngan, 1980).
yearBirthday(tu, 1975).
yearBirthday(bich, 1991).
yearBirthday(khai, 1978).
yearBirthday(chat, 1980).
yearBirthday(thuy, 1985).
yearBirthday(hiep, 1978).
yearBirthday(thu, 1983).
yearBirthday(tam, 1980).
yearBirthday(danh, 1982).
yearBirthday(nam, 1999).
yearBirthday(linh, 1994).
yearBirthday(ty, 2001).
yearBirthday(baoThy, 2008).
yearBirthday(lep, 2006).

%older18(Person)
older18(Person) :-yearBirthday(Person, Year), (2019-Year)>17.

%unmarried(Person)
unmarried(Person):-married(Person1, Person2), forall(married(Person1, Person2), (Person \= Person1, Person \= Person2)).



%greatGrandparent(Person, GreatGrandChild)
greatGrandparent(Person, GreatGrandChild) :- parent(Parent, GreatGrandChild), grandparent(Person, Parent).

%greatGrandfather(Person, GreatGrandChild)
greatGrandfather(Person, GreatGrandChild) :- male(Person), greatGrandparent(Person, GreatGrandChild).

%greatGrandmother(Person, GreatGrandChild)
greatGrandmother(Person, GreatGrandChild) :- female(Person), greatGrandparent(Person, GreatGrandChild).

%greatGrandchild(Person, GreatGrandParent)
greatGrandchild(Person, GreatGrandParent) :-greatGrandparent(GreatGrandParent, Person).

%greatGrandson(Person, GreatGrandParent)
greatGrandson(Person, GreatGrandParent) :- male(Person), greatGrandparent(GreatGrandParent, Person).

%greatGranddaughter(Person, GreatGrandParent)
greatGranddaughter(Person, GreatGrandParent) :- female(Person), greatGrandparent(GreatGrandParent, Person).

%grandAuntUncle(Person, GrandNieceNephew)
grandAuntUncle(Person, GrandNieceNephew) :- sibling(Person, GrandParent), grandparent(GrandParent, GrandNieceNephew).

%grandUncle(Person, GrandNieceNephew)
grandUncle(Person, GrandNieceNephew) :- male(Person), grandAuntUncle(Person, GrandNieceNephew).

%grandAunt(Person, GrandNieceNephew)
grandAunt(Person, GrandNieceNephew) :- female(Person), grandAuntUncle(Person, GrandNieceNephew).

%grandNephew(Person, GrandAuntUncle)
grandNephew(Person, GrandAuntUncle) :- male(Person), grandAuntUncle(GrandAuntUncle, Person).

%grandNiece(Person, GrandAuntUncle)
grandNiece(Person, GrandAuntUncle) :- female(Person), grandAuntUncle(GrandAuntUncle, Person).

%greatGrandAuntUncle(Person, GreatGrandNieceNephew)
greatGrandAuntUncle(Person, GreatGrandNieceNephew) :- sibling(Person, GreatGrandParent), greatGrandparent(GreatGrandParent, GreatGrandNieceNephew).

%greatGrandUncle(Person, GreatGrandNieceNephew)
greatGrandUncle(Person, GreatGrandNieceNephew) :- male(Person), greatGrandAuntUncle(Person, GreatGrandNieceNephew).

%greatGrandAunt(Person, GreatGrandNieceNephew)
greatGrandAunt(Person, GreatGrandNieceNephew) :- female(Person), greatGrandAuntUncle(Person, GreatGrandNieceNephew).

%greatGrandNephew(Person, GreatGrandAuntUncle)
greatGrandNephew(Person, GreatGrandAuntUncle) :- male(Person), greatGrandAuntUncle(GreatGrandAuntUncle, Person).

%greatGrandNiece(Person, GreatGrandAuntUncle)
greatGrandNiece(Person, GreatGrandAuntUncle) :- female(Person), greatGrandAuntUncle(GreatGrandAuntUncle, Person).

%ancestor(Person, Descendant)
ancestor(Person, Descendant) :- greatGrandparent(Person, Descendant).

%older(Person1, Person2)
older(Person1, Person2) :- yearBirthday(Person1, Year1), yearBirthday(Person2, Year2), Year1 < Year2.

%younger(Person1, Person2)
younger(Person1, Person2) :- yearBirthday(Person1, Year1), yearBirthday(Person2, Year2), Year1 > Year2.

%sameAge(Person1,Person2)
sameAge(Person1,Person2) :- yearBirthday(Person1, Year1), yearBirthday(Person2, Year2), Year1 = Year2.

%childOldest(Person, Parent)
childOldest(Person, Parent) :- parent(Parent, Person), forall( parent(Parent, Sibling), (older(Person, Sibling); sameAge(Person, Sibling))).
childOldest(Person) :- parent(Parent, Person), childOldest(Person, Parent).

%childYoungest
childYoungest(Person, Parent) :- parent(Parent, Person), forall( parent(Parent, Sibling), (younger(Person, Sibling); sameAge(Person, Sibling))).
childYoungest(Person) :- parent(Parent, Person), childYoungest(Person, Parent).


