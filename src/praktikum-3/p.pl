% prefix(Xs, Ys): Liste Ys beginnt mit Liste Xs.
prefix([], Xs).
prefix([X|Xs], [X|Ys]) :- prefix(Xs, Ys).

% postfix1(Xs, Ys): Liste Ys endet mit Liste Xs.
postfix1(Xs, Ys) :- reverse(Xs, As), reverse(Ys, Bs), prefix(As, Bs).

% [a, b, c, d, e] -> [e, d, c, b, a]
%          [d, e] -> [e, d]

% postfix2(Xs, Ys): Liste Ys endet mit Liste Xs.
postfix2(Xs, Ys) :- append(_, Xs, Ys).

% binbaum(Xb): Xb ist ein Binaerbaum
binbaum(empty).
binbaum(node(_, Lb, Rb)) :- binbaum(Lb), binbaum(Rb).

% membertree(X, Xb): X ist ein Eintrag in Xb.
membertree(X, node(X, Lb, Rb)) :- binbaum(Lb), binbaum(Rb).
membertree(X, node(_, Lb, Rb)) :- membertree(X, Lb), binbaum(Lb), binbaum(Rb).
membertree(X, node(_, Lb, Rb)) :- membertree(X, Rb), binbaum(Lb), binbaum(Rb).

% preorder(Xb, Ys): Ys ist die Liste der Knotenbeschriftungen des Binaerbaumes Xb in Praeorder.
preorder(empty, []).
preorder(node(X, Lb, Rb), [X|Ys]) :- preorder(Lb, Ls), preorder(Rb, Rs), append(Ls, Rs, Ys).

% postorder(Xb, Ys): Ys ist die Liste der Knoten des Binaerbaumes Xb in Postorder.
postorder(empty, []).
postorder(node(X, Lb, Rb), Ys) :- postorder(Lb, Ls), postorder(Rb, Rs), append(Ls, Rs, Qs), append(Qs, [X], Ys).

% roots(Xbs, Ys) :- Xbs ist eine Liste von Binaerbaumen. Die Liste Ys ist die Liste der Wurzeln der Binaerbaume in Xbs in der richtigen Reihenfolge.
roots([], []).
roots([empty|Xbs], Ys) :- roots(Xbs, Ys).
roots([node(X, Lb, Rb)|Xbs], [X|Ys]) :- roots(Xbs, Ys), binbaum(Lb), binbaum(Rb).

?- postfix1([d, e], [a, b, c, d, e]).
?- postfix2([d, e], [a, b, c, d, e]).
?- postfix1([], []).
?- postfix2([], []).
?- postfix1([], [a, b, c]).
?- postfix2([], [a, b, c]).
?- membertree(a, node(a, empty, empty)).
?- membertree(a, node(b, node(a, empty, empty), empty)).
?- membertree(b, node(b, node(a, empty, empty), empty)).
?- preorder(node(a, node(b, node(c, empty, empty), empty), node(d, empty, empty)), [a, b, c, d]).
?- postorder(node(a, node(b, node(c, empty, empty), empty), node(d, empty, empty)), [c, b, d, a]).
?- roots([node(a, empty, empty), node(b, node(c, empty, empty), empty), node(d, empty, empty)], [a, b, d]).

