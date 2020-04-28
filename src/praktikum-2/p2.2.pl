node(eintrag, lb, rb).

binbaum(empty).
binbaum(node(_, Lb, Rb)) :- binbaum(Lb), binbaum(Rb).

root(node(X, Lb, Rb), X) :- binbaum(Lb), binbaum(Rb).
left(node(_, Lb, Rb), Lb) :- binbaum(Lb), binbaum(Rb).
right(node(_, Lb, Rb), Rb) :- binbaum(Rb).

construct(Root, Lb, Rb, node(Root, Lb, Rb)) :- binbaum(Lb), binbaum(Rb).

nat(o).
nat(s(X)) :- nat(X).
add(o, X, X) :- nat(X).
add(s(N1), N2, s(N3)) :- nat(N1), nat(N2), nat(N3), add(N1, N2, N3).

knotenanz(empty, o).
knotenanz(node(_, Lb, Rb), s(N3)) :- knotenanz(Lb, N1), knotenanz(Rb, N2), add(N1, N2, N3), nat(N1), nat(N2), nat(N3), binbaum(Lb), binbaum(Rb).
