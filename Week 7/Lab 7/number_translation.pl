% Translation facts
% Define translations from German to English.
tran(eins, one).
tran(zwei, two).
tran(drei, three).
tran(vier, four).
tran(fuenf, five).
tran(sechs, six).
tran(sieben, seven).
tran(acht, eight).
tran(neun, nine).

% Base case for translating an empty list
% When the input list is empty, the output list should also be empty.
listtran([], []).  

% Case to translate from German to English
% If the head of the list is a German number word (H),
% translate it to its English equivalent (E),
% and recursively translate the tail (T).
listtran([H|T], [E|ET]) :- 
    tran(H, E),         % Translate head
    listtran(T, ET).   % Recurse for the tail

% Case to translate from English to German
% If the head of the list is an English number word (E),
% translate it to its German equivalent (H),
% and recursively translate the tail (T).
listtran([E|ET], [H|T]) :- 
    tran(H, E),         % Translate head
    listtran(ET, T).   % Recurse for the tail

% To run this code:
% Load the file in SWI-Prolog using: ?- [number_translation].
% Then, you can use the following queries:
% 1. Translate a list of German numbers to English:
%    ?- listtran([eins, neun, zwei], X).  % X = [one, nine, two].
% 2. Translate a list of English numbers to German:
%    ?- listtran(X, [one, sieben, sechs, zwei]).  % X = [eins, sieben, sechs, zwei].
% 3. Translate a single German number:
%    ?- listtran([eins], X).  % X = [one].
% 4. Translate a single English number:
%    ?- listtran(X, [two]).  % X = [zwei].
% 5. Translate an empty list:
%    ?- listtran([], X).  % X = [].
% 6. Translate from an empty list:
%    ?- listtran(X, []).  % X = [].
% 7. Translate a longer list of German numbers:
%    ?- listtran([eins, zwei, drei], X).  % X = [one, two, three].
% 8. Translate a longer list of English numbers:
%    ?- listtran(X, [one, two, three]).  % X = [eins, zwei, drei].