% Base case for an empty list
% When the input list is empty, the output list should also be empty.
twice([], []).

% Recursive case
% If the head of the list is H, we add it twice to the output list,
% and then we recursively process the tail T.
twice([H|T], [H, H|Result]) :- 
    twice(T, Result).

% To run this code:
% Load the file in SWI-Prolog using: ?- [twice_list].
% Then, you can use the following queries:
% 1. Duplicate a list with mixed elements:
%    ?- twice([a, 4, buggle], X).  % X = [a, a, 4, 4, buggle, buggle].
% 2. Duplicate a list of numbers:
%    ?- twice([1, 2, 1, 1], X).  % X = [1, 1, 2, 2, 1, 1, 1, 1].
% 3. Duplicate an empty list:
%    ?- twice([], X).  % X = [].
% 4. Duplicate a list of characters:
%    ?- twice([x, y, z], X).  % X = [x, x, y, y, z, z].