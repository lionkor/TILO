% sigma(X): X ist im Eingabealphabet.
sigma(0).
sigma(1).

% delta(Zustand, Eingabe, ZustandNeu): Uebergangsfunktion von Zustand+Eingabe zu ZustandNeu.
delta(s, 0, a).
delta(s, 0, s).
delta(s, 1, s).
delta(a, 1, end).

% zustand(X): X ist in der Zustandsmenge Z (endl.).
zustand(s).
zustand(a).
zustand(end).

% start(X): X ist in der Startzustandsmenge S.
start(s).

% ende(X): X ist in der Endzustandsmenge E.
ende(end).

% sigma_stern(X): X ist ein Wort gebildet aus dem Alphabet der Grammatik.
sigma_stern([]).
sigma_stern([X | Ws]) :- sigma(X), sigma_stern(Ws).

% lvonN(X): X ist in L(N).
lvonN(Ws) :- start(Zustand), sigma_stern(Ws), ende(NeuZ), delta_stern(Zustand,Ws,NeuZ).

% delta_stern(Zustand, Eingabe, ZustandNeu): Uebergangsfunktion von Zustand+Eingabe auf einen neuen Zustand ZustandNeu.
delta_stern(Zustand, [], Zustand).
delta_stern(Zustand, [Eingabe|Rest], ZustandNeu) :- delta(Zustand, Eingabe, TmpZustand), delta_stern(TmpZustand, Rest, ZustandNeu).
