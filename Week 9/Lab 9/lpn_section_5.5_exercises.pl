% LPN 5.5 Exercises 

% Exercise 5.1: How does Prolog respond to the following queries?

% Query 1: X = 3*4.
?- X = 3*4.
% Output: X = 3*4.
% Prolog does not evaluate the multiplication because it is an unevaluated term.

% Query 2: X is 3*4.
?- X is 3*4.
% Output: X = 12.
% Prolog evaluates the multiplication and assigns X the value 12.

% Query 3: 4 is X.
?- 4 is X.
% Output: X = 4.
% Prolog unifies X with 4.

% Query 4: X = Y.
?- X = Y.
% Output: X = Y.
% Prolog unifies X with Y.

% Query 5: 3 is 1+2.
?- 3 is 1+2.
% Output: true.
% Prolog evaluates the addition and confirms it equals 3.

% Query 6: 3 is +(1,2).
?- 3 is +(1,2).
% Output: true.
% Prolog recognizes +(1,2) as equivalent to 1+2 and evaluates it to 3.

% Query 7: 3 is X+2.
?- 3 is X+2.
% Output: X = 1.
% Prolog solves for X by subtracting 2 from 3.

% Query 8: X is 1+2.
?- X is 1+2.
% Output: X = 3.
% Prolog evaluates the sum and assigns X the result.

% Query 9: 1+2 is 1+2.
?- 1+2 is 1+2.
% Output: true.
% Prolog confirms both sides are equal.

% Query 10: is(X, +(1,2)).
?- is(X, +(1,2)).
% Output: X = 3.
% Prolog evaluates +(1,2) to 3 and assigns that value to X.

% Query 11: 3+2 = +(3,2).
?- 3+2 = +(3,2).
% Output: true.
% Prolog recognizes that 3+2 is the same as +(3,2).

% Query 12: *(7,5) = 7*5.
?- *(7,5) = 7*5.
% Output: true.
% Prolog sees *(7,5) as equivalent to 7*5.

% Query 13: *(7,+(3,2)) = 7*(3+2).
?- *(7,+(3,2)) = 7*(3+2).
% Output: true.
% Prolog evaluates both sides as the same.

% Query 14: *(7,(3+2)) = 7*(3+2).
?- *(7,(3+2)) = 7*(3+2).
% Output: true.
% Prolog evaluates both sides and confirms they are equal.

% Query 15: 7*3+2 = *(7,+(3,2)).
?- 7*3+2 = *(7,+(3,2)).
% Output: true.
% Prolog evaluates both sides and confirms they are equivalent.

% Query 16: *(7,(3+2)) = 7*(+(3,2)).
?- *(7,(3+2)) = 7*(+(3,2)).
% Output: true.
% Prolog evaluates both sides and confirms they're the same.


% Exercise 5.2: Define predicates increment and sum.

% Predicate increment/2: holds when the second argument is one more than the first argument.
increment(X, Y) :- Y is X + 1.

% Example Query 1:
?- increment(4, 5).
% Output: true.
% Y is 5, which is one more than X (4).

% Example Query 2:
?- increment(4, 6).
% Output: false.
% 6 is not one more than 4.

% Predicate sum/3: holds when the third argument is the sum of the first two arguments.
sum(X, Y, Z) :- Z is X + Y.

% Example Query 3:
?- sum(4, 5, 9).
% Output: true.
% 4 + 5 = 9.

% Example Query 4:
?- sum(4, 6, 12).
% Output: false.
% 4 + 6 ≠ 12.


% Exercise 5.3: Write the predicate addone/2.

% Predicate addone/2: adds 1 to each integer in the list.
addone([], []).  % Base case: the empty list remains empty.
addone([Head|Tail], [NewHead|NewTail]) :-
    NewHead is Head + 1,  % Add 1 to the head of the list.
    addone(Tail, NewTail). % Recursively process the tail.

% Example Query:
?- addone([1,2,7,2], X).
% Output: X = [2, 3, 8, 3].
% Each element of the list is incremented by 1.