% Facts
parent(john, mary).
parent(mary, susan).
parent(susan, jake).
parent(jake, tom).

% Rules
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

% Queries
% You can run queries like:
% ?- ancestor(john, tom).
% ?- ancestor(mary, tom).
% ?- ancestor(susan, jake).
