% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

#const dim = 4.

x(1..dim).
y(1..dim).
v(1..dim).

% cell(1,2,2).
% cell(2,4,4).
% cell(3,1,2).
% cell(4,3,1).

% assign a value V for every combo of X and Y
1 { cell(X,Y,V) : v(V) } 1 :- x(X), y(Y).
% this works the same as
% 1 { cell(1,1,1); cell(1,1,2); cell(1,1,3); cell(1,1,4) } 1.
% but for every combination of coordinates in x and y

% no cell can have 2 different values
:- cell(X,Y,V1), cell(X,Y,V2), V1 != V2.

% no row can have the same value twice
:- cell(X1,Y,V), cell(X2,Y,V), X1 != X2.

% no column can have the same value twice
:- cell(X,Y1,V), cell(X,Y2,V), Y1 != Y2.



#show cell/3.
