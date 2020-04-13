% elternteil(X, Y): X ist Elternteil (Vater oder Mutter) von Y.
elternteil(anton, moritz).
elternteil(anton, emil).
elternteil(anton, lea).
elternteil(jakob, anton).
elternteil(jakob, paul).
elternteil(oskar, sofia).
elternteil(oskar, emma).
elternteil(herbert, birgit).
elternteil(sofia, moritz).
elternteil(sofia, emil).
elternteil(sofia, lea).
elternteil(marie, anton).
elternteil(marie, paul).
elternteil(klara, sofia).
elternteil(klara, emma).
elternteil(emma, birgit).

% weiblich(X): X ist weiblich.
weiblich(marie).
weiblich(lea).
weiblich(sofia).
weiblich(klara).
weiblich(emma).
weiblich(birgit).

% maennlich(X): X ist maennlich.
maennlich(jakob).
maennlich(paul).
maennlich(anton).
maennlich(moritz).
maennlich(emil).
maennlich(oskar).
maennlich(herbert).

% ungleich(X, Y): X ist nicht gleich Y.
ungleich(X, Y) :- \+ (X == Y).

% vater(X, Y): X ist Vater von Y.
vater(X, Y) :- maennlich(X) , elternteil(X, Y).

% mutter(X, Y): X ist Mutter von Y.
mutter(X, Y) :- weiblich(X) , elternteil(X, Y).

% grossvater(X, Y): X ist Grossvater von Y.
grossvater(X, Y) :- vater(X, H), elternteil(H, Y).

% sohn(X, Y): X ist Sohn von Y.
sohn(X, Y) :- elternteil(Y, X) , maennlich(X).

% tochter(X, Y): X ist Tochter von Y.
tochter(X, Y) :- elternteil(Y, X) , weiblich(X).

% bruder(X, Y): X ist Bruder von Y und X ist nicht gleich Y.
bruder(X, Y) :- 
    maennlich(Vater), elternteil(Vater, X), elternteil(Vater, Y),   % gleicher Vater
    weiblich(Mutter), elternteil(Mutter, X), elternteil(Mutter, Y), % gleiche Mutter
    maennlich(X),                                                   % maennlich
    ungleich(X, Y).                                                 % nicht die gleiche Person

% schwester(X, Y): X ist Schwester von Y und X ist nicht gleich Y.
schwester(X, Y) :- 
    maennlich(Vater), elternteil(Vater, X), elternteil(Vater, Y),   % gleicher Vater
    weiblich(Mutter), elternteil(Mutter, X), elternteil(Mutter, Y), % gleiche Mutter
    weiblich(X),                                                    % weiblich
    ungleich(X, Y).                                                 % nicht die gleiche Person

% onkel(X, Y): X ist Onkel von Y.
onkel(X, Y) :- elternteil(Elternteil, Y), bruder(X, Elternteil).

% tante(X, Y): X ist Tante von Y.
tante(X, Y) :- elternteil(Elternteil, Y), schwester(X, Elternteil).

% cousine(X, Y): X ist Cousine von Y.
cousine(X, Y) :- 
    weiblich(X),                    % X ist weiblich
    (onkel(R, Y) ; tante(R, Y)),    % es gibt einen Onkel oder eine Tante R von Y
    elternteil(R, X).               % wobei R Elternteil von X ist


