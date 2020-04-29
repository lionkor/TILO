% linListe(Xs): Xs ist eine gueltige Liste.
linListe(nil).
linListe(list(X, Rests)) :- linListe(Rests), not(linListe(X)).

% append(Xs, Ys, Rs): Rs ist Xs verlaengert um Ys.
append(nil, Ys, Ys).
append(list(X, Xs), Ys, list(X, Rs)) :- append(Xs, Ys, Rs).

% member(X, Lists): Lists enthaelt Element X
member(X, list(X, Rests)).
member(X, list(Y, Rests)) :- member(X, Rests).

% infix(Xs, Ys): Ys enthaelt Xs.
infix(Xs, Xs) :- linListe(Xs).
    % Xs am Anfang
infix(Xs, Ys) :- append(Xs, _, Ys), linListe(Xs), linListe(Ys).
    % Xs am Ende
infix(Xs, Ys) :- append(_, Xs, Ys), linListe(Xs), linListe(Ys).
    % Xs in der Mitte
infix(Xs, list(Y, Ys)) :- infix(Xs, Ys).

% attach(Xs, X, Ys): Ys is Xs verlaengert um X
attach(Xs, nil, Xs).
attach(Xs, X, Ys) :- append(Xs, list(X, nil), Ys), linListe(Ys), linListe(Xs).

% rev(Xs, Ys): Ys ist gespiegeltes Xs.
rev(nil, nil).
rev(list(X, nil), list(X, nil)).
rev(list(X, Xs), Ys) :- rev(Xs, Rests), attach(Rests, X, Ys), linListe(Xs), linListe(Ys).

% node(eintrag, lb, rb): Ein node mit root=eintrag und lb und rb als linker bzw rechter Baum
node(eintrag, lb, rb).

% binbaum(X): X ist ein binaerer Baum.
binbaum(empty).
binbaum(node(_, Lb, Rb)) :- binbaum(Lb), binbaum(Rb).

% construct(Root,Lb,Rb,Xneub): Xneub ist der Baum mit Wurzelbeschriftung Root, linkem Teilbaum Lb und rechtem Teilbaum Rb.
construct(Root, Lb, Rb, node(Root, Lb, Rb)) :- binbaum(Lb), binbaum(Rb).

% nat(X): X ist eine natuerliche Zahl.
nat(o).
nat(s(X)) :- nat(X).

% add(X, Y, Z): Z = X + Y
add(o, X, X) :- nat(X).
add(s(N1), N2, s(N3)) :- nat(N1), nat(N2), nat(N3), add(N1, N2, N3).

% knotenanz(Xb,N): N (nat. Zahl in symbolischer Darstellung) ist die Anzahl der Knoten des Baumes Xb.
knotenanz(empty, o).
knotenanz(node(_, Lb, Rb), s(N3)) :- knotenanz(Lb, N1), knotenanz(Rb, N2), add(N1, N2, N3), nat(N1), nat(N2), nat(N3), binbaum(Lb), binbaum(Rb).
