% Mercury Subprograms Examples

:- module mercury_subprograms.
:- interface.

:- import_module io, int, string.

:- pred add(int::in, int::in, int::out) is det.
:- pred multiply(int::in, int::in, int::out) is det.
:- pred factorial(int::in, int::out) is det.
:- pred even_or_odd(int::in, string::out) is det.
:- pred greet(string::in, string::in, io::di, io::uo) is det.
:- pred max_of_three(int::in, int::in, int::in, int::out) is det.
:- pred main(io::di, io::uo) is det.

:- implementation.

add(X, Y, Result) :- Result = X + Y.
multiply(X, Y, Result) :- Result = X * Y.

factorial(N, Result) :-
    if N = 0 then
        Result = 1
    else
        N1 = N - 1,
        factorial(N1, Rest),
        Result = N * Rest.

even_or_odd(X, Result) :-
    ( X mod 2 = 0 -> Result = "even" ; Result = "odd" ).

greet(Name, Greeting, !IO) :-
    io.write_string(Greeting, !IO),
    io.write_string(", ", !IO),
    io.write_string(Name, !IO),
    io.write_string("!\n", !IO).

max_of_three(X, Y, Z, Max) :-
    ( X >= Y, X >= Z -> Max = X
    ; Y >= Z -> Max = Y
    ; Max = Z
    ).

main(!IO) :-
    io.write_string("=== Mercury Subprograms Examples ===\n\n", !IO),
    
    add(5, 3, Result1),
    io.write_string("add(5, 3) = ", !IO),
    io.write_int(Result1, !IO),
    io.write_string("\n", !IO),
    
    multiply(4, 7, Result2),
    io.write_string("multiply(4, 7) = ", !IO),
    io.write_int(Result2, !IO),
    io.write_string("\n", !IO),
    
    factorial(5, Fact5),
    io.write_string("factorial(5) = ", !IO),
    io.write_int(Fact5, !IO),
    io.write_string("\n", !IO),
    
    even_or_odd(4, Result3),
    io.write_string(Result3, !IO),
    io.write_string("\n", !IO),
    
    greet("Alice", "Hello", !IO),
    greet("Bob", "Hi there", !IO),
    
    max_of_three(3, 7, 5, Max),
    io.write_string("max_of_three(3, 7, 5) = ", !IO),
    io.write_int(Max, !IO),
    io.write_string("\n", !IO).
