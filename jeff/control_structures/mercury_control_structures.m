% Mercury Control Structures Examples
% Demonstrating if-then-else, loops, predicate composition, and error handling

:- module mercury_control_structures.
:- interface.

:- import_module io.

:- main(io::di, io::uo) is det.

:- implementation.

:- import_module string, list, int.

% If-then-else (Mercury doesn't have if-expressions, only if-statements)
:- pred max_of_two(int, int, int).
max_of_two(A, B, Max) :-
    ( if A > B then
        Max = A
    else
        Max = B
    ).

% Recursive approach for min (since Mercury prefers recursion over loops)
:- func min_of_two(int, int) = int.
min_of_two(A, B) = (if A < B then A else B).

% While loop using recursion
:- pred print_range(int, int).
print_range(Current, Max) :-
    ( if Current =< Max then
        io.write_string(string.int_to_string(Current)), 
        io.write_string(" "),
        print_range(Current + 1, Max)
    ).

% For-loop equivalent using list comprehension
:- pred even_numbers(int, list(int)).
even_numbers(Max, Evens) :-
    findall(X, (between(1, Max, X), X mod 2 = 0), Evens).

% Predicate with cut to prevent backtracking
:- pred factorial(int, int).
factorial(0, 1) :- !.
factorial(N, Result) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, Rest),
    Result is N * Rest.

% Case/switch equivalent using multiple clauses and guards
:- pred classify_number(int, string).
classify_number(0, "zero").
classify_number(N, Result) :-
    N < 0,
    Result = "negative".
classify_number(N, Result) :-
    N > 0,
    N mod 2 = 0,
    Result = "positive even".
classify_number(N, Result) :-
    N > 0,
    N mod 2 = 1,
    Result = "positive odd".

% Try-catch equivalent using error handling
:- pred safe_divide(int, int, float).
safe_divide(_, 0, nan) :- !.
safe_divide(A, B, Result) :-
    Result = float(A) / float(B).

% Pattern matching with multiple solutions (non-deterministic)
:- pred list_member(list(T), T) => list(T).
list_member([X | _], X).
list_member([_ | Xs], Y) :- list_member(Xs, Y).

% Exception handling using failure and error predicates
:- pred divide_with_default(int, int, int, int).
divide_with_default(A, B, Default, Result) :-
    ( if B = 0 then
        Result = Default
    else
        Result is A // B
    ).

% Higher-order predicate example
:- pred apply_to_list(pred(T), list(T)) => pred(T).
apply_to_list(_, []).
apply_to_list(Pred, [H | T]) :-
    Pred(H),
    apply_to_list(Pred, T).

main(!IO) :-
    io.write_string("=== Mercury Control Structures Examples ===\n\n"),
    
    % If-then-else
    max_of_two(5, 3, Max1),
    io.format("max_of_two(5, 3) = %d\n", [i(Max1)], !IO),
    
    min_of_two(5, 3) = Min1,
    io.format("min_of_two(5, 3) = %d\n", [i(Min1)], !IO),
    
    % While loop equivalent
    io.write_string("Range 1 to 5: "),
    print_range(1, 5),
    io.nl(!IO),
    
    % List comprehension for even numbers
    even_numbers(10, Evens),
    io.format("Even numbers 1-10: %s\n", [s(list.show(int.show, Evens))], !IO),
    
    % Factorial
    factorial(5, Fact5),
    io.format("factorial(5) = %d\n", [i(Fact5)], !IO),
    
    % Case/switch equivalent
    classify_number(0, Class1),
    io.write_string(Class1), io.nl(!IO),
    
    classify_number(-5, Class2),
    io.write_string(Class2), io.nl(!IO),
    
    classify_number(8, Class3),
    io.write_string(Class3), io.nl(!IO),
    
    classify_number(7, Class4),
    io.write_string(Class4), io.nl(!IO),
    
    % Safe division
    safe_divide(10, 2, Result1),
    io.format("safe_divide(10, 2) = %.2f\n", [f(Result1)], !IO),
    
    safe_divide(10, 0, Result2),
    io.write_string("safe_divide(10, 0) = nan\n"), io.nl(!IO),
    
    % Exception handling with default
    divide_with_default(10, 2, 0, Div1),
    io.format("divide_with_default(10, 2, 0) = %d\n", [i(Div1)], !IO),
    
    divide_with_default(10, 0, -1, Div2),
    io.format("divide_with_default(10, 0, -1) = %d\n", [i(Div2)], !IO).

% Helper predicate for list generation
:- pred between(int, int, int).
between(Min, Max, N) :-
    Min =< Max,
    N in_min_inclusive(Min, Max).

:- pred in_min_inclusive(int, int, int).
in_min_inclusive(N, N, N).
in_min_inclusive(Min, Max, N) :-
    Min < Max,
    Next is Min + 1,
    in_min_inclusive(Next, Max, N).
