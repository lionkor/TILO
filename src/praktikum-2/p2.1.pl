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

