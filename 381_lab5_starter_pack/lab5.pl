/***************************************/
%     CS 381 - Programming Lab #5       %
%                                       %
%  < Caleb Knight >                     %
%  < knightca@oregonstate.edu >         %
%                                       %
/***************************************/

% load family tree
:- consult('royal.pl').

% enables piping in tests
portray(Term) :- atom(Term), format("~s", Term).

% your code here
mother(M,C):- parent(M,C), female(M). % Checks if parent and female %
father(F,C):- parent(F,C), male(F). % Checks if parent and male %

spouse(M,F):- married(M,F); married(F,M). % Checks two are married to each other and vice versa %

child(C,P):- parent(P,C). % Checks for a child of a parent %
son(S,P):- child(S,P), male(S). % Checks for a son %
daughter(D,P):- child(D,P), female(D). % Checks for a daughter %

sibling(S1,S2):- father(F,S1), father(F,S2), mother(M,S1), mother(M,S2), S1 \= S2. % Checks if both parents and if they arent the same person % 
brother(B,S):- sibling(B,S), male(B). % Checks for a brother %
sister(S,SB):- sibling(S,SB), female(S). % Checks for a sister %


uncle(U, M) :- brother(U, P), parent(P, M). % By blood %
uncle(U, M) :- parent(P, M), sister(S, P), spouse(S, U), male(U). % By marriage %
aunt(A, M) :- sister(A, P), parent(P, M). % By blood %
aunt(A, M) :- parent(P, M), brother(B, P), spouse(B, A), female(A). % By marriage %

cousin(C,M):- grandparent(G,C), grandparent(G,M), \+sibling(C,M), C\=M. % Anyone who shares the same grandparent as I %


grandparent(G,M):- parent(G,P), parent(P,M). % Checks for parent of a parent %
grandfather(GF,M):- grandparent(GF,M), male(GF). % Checks for a male grandparent %
grandmother(GM,M):- grandparent(GM,M), female(GM). % Checks for a femal grandparent %
grandchild(GC,M):- child(GC,C), child(C,M). % Checks for a grandchild (inverse of grandparent) %


ancestor(A,M):- parent(A,M).
ancestor(A,M):- parent(A,P), ancestor(P,M). % Continually checking parent of current relative %

descendant(D,M) :- child(D,M). 
descendant(D,M) :- child(D,P), descendant(P,M).  % Continually checking child of current relative %


older(O,Y) :-  born(O,O1), born(Y,Y1), O1<Y1. % Compares years of birth (older) %
younger(Y,O) :-  born(Y,Y1), born(O,O1), Y1>O1. % Same as older, operater just reversed %
regentWhenBorn(X,Y) :- reigned(X,S,E), born(Y,Y1), Y1>S, Y1<E. % Finds when someone was born, and who was in reign at that time %
