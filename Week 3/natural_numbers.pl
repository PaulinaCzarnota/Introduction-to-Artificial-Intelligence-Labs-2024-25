% Not the best example of recursion

% 0    1          2               3                       4
% 0, succ(0), succ(succ(0)), succ(succ(succ(0))),  succ(succ(succ(succ(0))))  ...

% Base case for numeral definition
numeral(0).
numeral(succ(X)) :- numeral(X).

% Base case for addition
add(0, Y, Y).  % Adding 0 to Y yields Y
add(succ(X), Y, succ(Z)) :- add(X, Y, Z).  % Recursive case for addition

% Definition for greater than
greater_than(succ(X), 0).  % Any successor is greater than 0
greater_than(succ(X), succ(Y)) :- greater_than(X, Y).  % Compare successors

% To run this code, follow these steps:
% 1. Save the code in a file named `natural_numbers.pl`.
% 2. Open SWI-Prolog.
% 3. Change the directory to where the file is located using:
%    ?- cd('C:/Users/YourUsername/Desktop/').
% 4. Load the file with:
%    ?- [natural_numbers].
% 5. Run queries as follows:
%    - Check if a numeral is valid:
%      ?- numeral(succ(succ(0))).  % Should return true.
%    - Perform addition:
%      ?- add(succ(succ(0)), succ(0), Result).  % Should yield Result = succ(succ(succ(0))).
%    - Check if one numeral is greater than another:
%      ?- greater_than(succ(succ(0)), succ(0)).  % Should return true.