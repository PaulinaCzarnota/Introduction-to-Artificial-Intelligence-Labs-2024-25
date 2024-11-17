% Exercise 1: Double Each Value in a List

% double/2: Doubles each number in a list
double([], []).  % Base case: empty list
double([Head|Tail], [DoubledHead|DoubledTail]) :-
    DoubledHead is Head * 2,
    double(Tail, DoubledTail).

% Query for doubling values:
% ?- double([1, 2, 3, 4], Result).
% Expected Output: Result = [2, 4, 6, 8]


% Exercise 2: Sum All Numbers in a List

% sum_list/2: Sums all numbers in a list
sum_list([], 0).  % Base case: empty list has sum 0
sum_list([Head|Tail], Sum) :-
    sum_list(Tail, TailSum),
    Sum is Head + TailSum.

% Query for summing values:
% ?- sum_list([1, 2, 3, 4], Sum).
% Expected Output: Sum = 10


% Exercise 3: Zip Two Lists Together
% zip/3: Zips two lists into pairs
zip([], [], []).  % Base case: both lists empty
zip([Head1|Tail1], [Head2|Tail2], [(Head1, Head2)|ZippedTail]) :-
    zip(Tail1, Tail2, ZippedTail).

% Query for zipping two lists:
% ?- zip([1, 2], [a, b], Result).
% Expected Output: Result = [(1, a), (2, b)]

% Additional Queries for testing the solutions
% 1. Double the list [5, 10, 15]
% ?- double([5, 10, 15], Result).
% Expected Output: Result = [10, 20, 30]

% 2. Sum all numbers in the list [1, 5, 10]
% ?- sum_list([1, 5, 10], Sum).
% Expected Output: Sum = 16

% 3. Zip two lists [x, y, z] and [1, 2, 3]
% ?- zip([x, y, z], [1, 2, 3], Result).
% Expected Output: Result = [(x, 1), (y, 2), (z, 3)]