% LPN 5.6 Practical Session 

% Define the predicate accMin, which returns the minimum value from a list of integers.

% accMin/3: returns the minimum value of a list.
accMin([X], X).  % Base case: the minimum of a one-element list is the element itself.
accMin([Head|Tail], Min) :-
    accMin(Tail, TailMin),  % Find the minimum in the tail.
    Min is min(Head, TailMin).  % Compare and find the minimum of Head and TailMin.

% Example Query: Find the minimum value in a list.
?- accMin([5, 7, 2, 9, 3], Min).
% Output: Min = 2.


% Exercise 5.6: Scalar multiplication for vectors

% scalarMult/3: performs scalar multiplication on a list of integers.
scalarMult(_, [], []).  % Base case: multiplying an empty list by any scalar yields an empty list.
scalarMult(N, [Head|Tail], [NewHead|NewTail]) :-
    NewHead is N * Head,  % Multiply the head by the scalar N.
    scalarMult(N, Tail, NewTail).  % Recursively multiply the tail.

% Example Query: Scalar multiply the vector [2, 7, 4] by 3.
?- scalarMult(3, [2, 7, 4], Result).
% Output: Result = [6, 21, 12].


% Exercise 5.6: Dot product of two vectors

% dot/3: calculates the dot product of two lists of integers.
dot([], [], 0).  % Base case: the dot product of two empty lists is 0.
dot([Head1|Tail1], [Head2|Tail2], Result) :-
    dot(Tail1, Tail2, TailResult),  % Find the dot product of the tails.
    Result is Head1 * Head2 + TailResult.  % Calculate the dot product.

% Example Query: Calculate the dot product of [2, 5, 6] and [3, 4, 1].
?- dot([2, 5, 6], [3, 4, 1], Result).
% Output: Result = 32.