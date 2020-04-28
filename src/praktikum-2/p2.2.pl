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
