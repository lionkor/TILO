zustand(z0).
zustand(z1).

sigma(0).
sigma(1).

gamma(#).
gamma(0).
gamma(1).

start(z0).

boden(#).

%Relationen für Transitionsrelation (Delta)
%1. Hälfte
delta(z0,0,#,z0,[0,#]).
delta(z0,0,0,z0,[0,0]).
delta(z0,0,1,z0,[0,1]).
delta(z0,1,#,z0,[1,#]).
delta(z0,1,0,z0,[1,0]).
delta(z0,1,1,z0,[1,1]).
%gerade Übergang
delta(z0,nix,#,z1,[#]).
delta(z0,nix,0,z1,[0]).
delta(z0,nix,1,z1,[1]).
%2. Hälfte
delta(z1,0,0,z1,[]).
delta(z1,1,1,z1,[]).
delta(z1,nix,#,z1,[]).

sigma_stern([]).
sigma_stern([W|Ws]) :- sigma(W), sigma_stern(Ws).

es(Z, [W|Ws], [Top|Stack], Zneu, Ws, StackNeu) 
    :- delta(Z, W, Top, Zneu, StackAdd)
    , append(StackAdd, Stack, StackNeu).

es(Z, Ws, [Top|Stack], Zneu, Ws, StackNeu) 
    :- delta(Z, nix, Top, Zneu, StackAdd)
    , append(StackAdd, Stack, StackNeu).

es_plus(Z, Ws, Stack, Z_n, Ws_n, Stack_n) :- es(Z, Ws, Stack, Z_n, Ws_n, Stack_n).
es_plus(Z, Ws, Stack, Z_n, Ws_n, Stack_n) 
    :- es(Z, Ws, Stack, Z_1, Ws_1, Stack_1)
    ,  es_plus(Z_1, Ws_1, Stack_1, Z_n, Ws_n, Stack_n).

lvonM(Ws) :- sigma_stern(Ws), es_plus(z0, Ws, [#], _, [], [#]).
