% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

#const dim = 4.

x(1..dim).
y(1..dim).
v(1..dim).

% assign a value V for every combo of X and Y
1 { cell(X,Y,V) : v(V) } 1 :- x(X), y(Y).
% this works the same as
% 1 { cell(1,1,1); cell(1,1,2); cell(1,1,3); cell(1,1,4) } 1.
% but for every combination of coordinates in x and y

% create the 2x2 boxes
boxRow(X,BX) :- x(X), BX = ((X-1) / 2) + 1. 
boxCol(Y,BY) :- y(Y), BY = ((Y-1) / 2) + 1.
% for X=1, 1. for X = 2, 1. for X=3, 2 ...

% no row can have the same value twice
:- cell(X1,Y,V), cell(X2,Y,V), X1 != X2.

% no column can have the same value twice
:- cell(X,Y1,V), cell(X,Y2,V), Y1 != Y2.

% no box can have the same number twice
% :- cell(X1,Y1,V), cell(X2,Y2,V),
%    boxRow(X1,BX), boxRow(X2,BX),
%    boxCol(Y1,BY), boxCol(Y2,BY),
%    (X1,Y1) != (X2,Y2).
% I worked too far ahead, i thought this part was required

#show cell/3.
