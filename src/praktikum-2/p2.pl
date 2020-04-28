% linListe(Xs): Xs ist eine gueltige Liste.
linListe(nil).
linListe(list(X, Rests)) :- linListe(Rests), not(linListe(X)).

% append(Xs, Ys, Rs): Haengt Ys an Xs und gibt Rs zurueck.
append(nil, Ys, Ys).
append(list(X, Xs), Ys, list(X, Rs)) :- append(Xs, Ys, Rs).

% member(X, Lists): Lists enthaelt Element X
member(X, list(X, Rests)).
member(X, list(Y, Rests)) :- member(X, Rests).

% infix(Xs, Ys): Ys enthaelt Xs.
infix(Xs, Xs) :- linListe(Xs).
infix(Xs, list(Y, Ys)) :- infix(Xs, Ys).


