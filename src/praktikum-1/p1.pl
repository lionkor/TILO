parent(anton, moritz).
parent(anton, emil).
parent(anton, lea).
parent(jakob, anton).
parent(jakob, paul).
parent(oskar, sofia).
parent(oskar, emma).
parent(herbert, birgit).
parent(sofia, moritz).
parent(sofia, emil).
parent(sofia, lea).
parent(marie, anton).
parent(marie, paul).
parent(klara, sofia).
parent(klara, emma).
parent(emma, birgit).

female(marie).
female(lea).
female(sofia).
female(klara).
female(emma).
female(birgit).

male(jakob).
male(paul).
male(anton).
male(moritz).
male(emil).
male(oskar).
male(herbert).

% ungleich(X, Y): X ist nicht gleich Y.
ungleich(X, Y) :- \+ (X == Y).

% vater(X, Y): X ist Vater von Y.
vater(X, Y) :- male(X) , parent(X, Y).

% mutter(X, Y): X ist Mutter von Y.
mutter(X, Y) :- female(X) , parent(X, Y).

% grossvater(X, Y): X ist Grossvater von Y.
grossvater(X, Y) :- vater(X, H), vater(H, Y).

% sohn(X, Y): X ist Sohn von Y.
sohn(X, Y) :- parent(Y, X) , male(X).

% tochter(X, Y): X ist Tochter von Y.
tochter(X, Y) :- parent(Y, X) , female(X).

% bruder(X, Y): X ist Bruder von Y und X ist nicht gleich Y.
bruder(X, Y) :- 
    male(Vater), parent(Vater, X), parent(Vater, Y),        % gleicher Vater
    female(Mutter), parent(Mutter, X), parent(Mutter, Y),   % gleiche Mutter
    male(X),                                                % maennlich
    ungleich(X, Y).                                         % nicht die gleiche Person

% schwester(X, Y): X ist Schwester von Y und X ist nicht gleich Y.
schwester(X, Y) :- 
    male(Vater), parent(Vater, X), parent(Vater, Y),        % gleicher Vater
    female(Mutter), parent(Mutter, X), parent(Mutter, Y),   % gleiche Mutter
    female(X),                                              % weiblich
    ungleich(X, Y).                                         % nicht die gleiche Person

% onkel(X, Y): X ist Onkel von Y.
onkel(X, Y) :- parent(Elternteil, Y), bruder(X, Elternteil).

% tante(X, Y): X ist Tante von Y.
tante(X, Y) :- parent(Elternteil, Y), schwester(X, Elternteil).

% cousine(X, Y): X ist Cousine von Y.
cousine(X, Y) :- 
    female(X),                      % X ist weiblich
    (onkel(R, Y) ; tante(R, Y)),    % es gibt einen Onkel oder eine Tante R von Y
    parent(R, X).                   % wobei R Elternteil von X ist
