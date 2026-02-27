% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A sudoku (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

#const dim = 4.

x(1..dim).
y(1..dim).
v(1..dim).

sudoku(X,Y,V) :- initial(X,Y,V).

% assign a value V for every combo of X and Y
1 { sudoku(X,Y,V) : v(V) } 1 :- x(X), y(Y).
% this works the same as
% 1 { sudoku(1,1,1); sudoku(1,1,2); sudoku(1,1,3); sudoku(1,1,4) } 1.
% but for every combination of coordinates in x and y

% no row can have the same value twice
:- sudoku(X1,Y,V), sudoku(X2,Y,V), X1 != X2.

% no column can have the same value twice
:- sudoku(X,Y1,V), sudoku(X,Y2,V), Y1 != Y2.

#show sudoku/3.
