% Prolog Exercises from LPN for Lab Test Practice

% Exercise 1: Magic and Wizards
house_elf(dobby).
witch(hermione).
witch('McGonagall').
witch(rita_skeeter).
wizard(harry).

magic(X) :- house_elf(X).
magic(X) :- wizard(X).
magic(X) :- witch(X).

% Queries and Outputs:
% ?- magic(house_elf).        
% --> false (house_elf is a fact, but 'house_elf' is not a valid individual)
% ?- wizard(harry).           
% --> true
% ?- magic(wizard).           
% --> false
% ?- magic('McGonagall').     
% --> true
% ?- magic(hermione).         
% --> true


% Exercise 2: Maze Path
connected(1,2).
connected(3,4).
connected(5,6).
connected(7,8).
connected(9,10).
connected(12,13).
connected(13,14).
connected(15,16).
connected(17,18).
connected(19,20).
connected(4,1).
connected(6,3).
connected(4,7).
connected(6,11).
connected(14,9).
connected(11,15).
connected(16,12).
connected(14,17).
connected(16,19).

path(X, Y) :- connected(X, Y).  
path(X, Y) :- connected(X, Z), path(Z, Y).  

% Queries and Outputs:
% ?- path(5, 10).   
% --> true (there is a path 5 -> 6 -> 10)
% ?- path(1, X).    
% --> X = 2 ; ...
% ?- path(13, X).   
% --> X = 14 ; X = 9 ; X = 17 ; ...


% Exercise 3: Travel Information
byCar(auckland, hamilton).
byCar(hamilton, raglan).
byCar(valmont, saarbruecken).
byCar(valmont, metz).
byTrain(metz, frankfurt).
byTrain(saarbruecken, frankfurt).
byTrain(metz, paris).
byTrain(saarbruecken, paris).
byPlane(frankfurt, bangkok).
byPlane(frankfurt, singapore).
byPlane(paris, losAngeles).
byPlane(bangkok, auckland).
byPlane(singapore, auckland).
byPlane(losAngeles, auckland).

travel(X, Y) :- byCar(X, Y).
travel(X, Y) :- byTrain(X, Y).
travel(X, Y) :- byPlane(X, Y).
travel(X, Y) :- byCar(X, Z), travel(Z, Y).
travel(X, Y) :- byTrain(X, Z), travel(Z, Y).
travel(X, Y) :- byPlane(X, Z), travel(Z, Y).

% Queries and Outputs:
% ?- travel(valmont, raglan). 
% --> true (Valmont -> Saarbruecken -> Metz -> Raglan)


% Exercise 4: Travel with Detailed Route
byCar(auckland, hamilton).
byCar(hamilton, raglan).
byCar(valmont, saarbruecken).
byCar(valmont, metz).
byTrain(metz, frankfurt).
byTrain(saarbruecken, frankfurt).
byTrain(metz, paris).
byTrain(saarbruecken, paris).
byPlane(frankfurt, bangkok).
byPlane(frankfurt, singapore).
byPlane(paris, losAngeles).
byPlane(bangkok, auckland).
byPlane(singapore, auckland).
byPlane(losAngeles, auckland).

travel(X, Y, go(X, Y, transport(car))) :- byCar(X, Y).
travel(X, Y, go(X, Y, transport(train))) :- byTrain(X, Y).
travel(X, Y, go(X, Y, transport(plane))) :- byPlane(X, Y).

travel(X, Y, go(X, Z, transport(car), Rest)) :- 
    byCar(X, Z), travel(Z, Y, Rest).
travel(X, Y, go(X, Z, transport(train), Rest)) :- 
    byTrain(X, Z), travel(Z, Y, Rest).
travel(X, Y, go(X, Z, transport(plane), Rest)) :- 
    byPlane(X, Z), travel(Z, Y, Rest).

% Now you can try the query:
% ?- travel(valmont, losAngeles, X).
% X = go(valmont, metz, transport(car), go(metz, paris, transport(train), go(paris, losAngeles, transport(plane)))).


% Exercise 5: List Translation
tran(eins, one).
tran(zwei, two).
tran(drei, three).
tran(vier, four).
tran(fuenf, five).
tran(sechs, six).
tran(sieben, seven).
tran(acht, eight).
tran(neun, nine).

listtran([], []).
listtran([G|T1], [E|T2]) :- tran(G, E), listtran(T1, T2).

% Queries and Outputs:
% ?- listtran([eins, neun, zwei], X). 
% --> X = [one, nine, two].
% ?- listtran(X, [one, seven, six]). 
% --> X = [eins, sieben, sechs].


% Exercise 6: Double List
twice([], []).
twice([H|T], [H, H|T2]) :- twice(T, T2).

% Queries and Outputs:
% ?- twice([a, 4, buggle], X). 
% --> X = [a, a, 4, 4, buggle, buggle].
% ?- twice([1, 2, 1, 1], X).   
% --> X = [1, 1, 2, 2, 1, 1, 1, 1].


% Exercise 7: Combine Lists
combine1([], [], []).
combine1([H1|T1], [H2|T2], [H1, H2|T]) :- combine1(T1, T2, T).

combine2([], [], []).
combine2([H1|T1], [H2|T2], [[H1, H2]|T]) :- combine2(T1, T2, T).

combine3([], [], []).
combine3([H1|T1], [H2|T2], [j(H1, H2)|T]) :- combine3(T1, T2, T).

% Queries and Outputs:
% ?- combine1([a, b, c], [1, 2, 3], X). 
% --> X = [a, 1, b, 2, c, 3].
% ?- combine2([a, b, c], [1, 2, 3], X). 
% --> X = [[a, 1], [b, 2], [c, 3]].
% ?- combine3([a, b, c], [1, 2, 3], X). 
% --> X = [j(a, 1), j(b, 2), j(c, 3)].


% Exercise 8: Scalar Multiplication and Dot Product
scalarMult(_, [], []).
scalarMult(Factor, [H|T], [H2|T2]) :- 
    H2 is H * Factor, 
    scalarMult(Factor, T, T2).

dot([], [], 0).
dot([H1|T1], [H2|T2], Result) :- 
    dot(T1, T2, Rest), 
    Result is H1 * H2 + Rest.

% Queries and Outputs:
% ?- scalarMult(3, [2, 7, 4], Result). 
% --> Result = [6, 21, 12].
% ?- dot([2, 5, 6], [3, 4, 1], Result). 
% --> Result = 32.


% Exercise 9: Palindrome
palindrome(List) :- reverse(List, List).

% Queries and Outputs:
% ?- palindrome([r, o, t, a, t, o, r]). 
% --> true
% ?- palindrome([n, u, r, s, e, s, r, u, n]). 
% --> true
% ?- palindrome([n, o, t, h, i, s]). 
% --> false


% Exercise 10: Top Tail

% Base case: If the list has only one element, the result is an empty list
toptail([_], []).

% Case for lists with exactly two elements (result is also an empty list)
toptail([_, _], []).

% Recursive case: Remove the first and last elements using append and recursion
toptail([_ | T], Result) :-
    append(Middle, [_], T),  % Split the list into Middle and last element
    toptail(Middle, Result).  % Recursively apply to the Middle part

% Queries and Outputs:
% ?- toptail([a], T).
% --> T = [].

% ?- toptail([a, b], T).
% --> T = [].

% ?- toptail([a, b, c], T).
% --> T = [b].


% Exercise 11: Last Element
% Using reverse
last(List, X) :- reverse(List, [X | _]).

% Using recursion
last([X], X).
last([_ | T], X) :- last(T, X).

% Queries and Outputs:
% ?- last([a, b, c], X). 
% --> X = c.


% Exercise 12: Swap First and Last Elements
swapfl([H | T], [X | T2]) :- append(Middle, [X], T), append([H], Middle, T2).

% Queries and Outputs:
% ?- swapfl([a, b, c], X). 
% --> X = [c, a, b].


% Exercise 13: Remove Nth Element
remove_nth(0, [_ | T], T).
remove_nth(N, [H | T], [H | T2]) :- N > 0, N1 is N - 1, remove_nth(N1, T, T2).

% Queries and Outputs:
% ?- remove_nth(0, [a, b, c], X). 
% --> X = [b, c].
% ?- remove_nth(1, [a, b, c], X). 
% --> X = [a, c].


% Exercise 14: Reverse List
reverse([], []).
reverse([H|T], R) :- reverse(T, RT), append(RT, [H], R).

% Queries and Outputs:
% ?- reverse([a, b, c], X). 
% --> X = [c, b, a].