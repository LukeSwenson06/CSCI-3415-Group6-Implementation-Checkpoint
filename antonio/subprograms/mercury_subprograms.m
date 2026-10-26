 :- module fib.
 :- interface.
 :- import_module io.
 :- pred main(io::di, io::uo) is det.
 
 :- implementation.
 :- import_module int.

 :- func fib(int) = int.
 fib(N) = (if N =< 2 then 1 else fib(N - 1) + fib(N - 2)).

 func firstten([],!IO).
 func firstten([curr | rest], !IO) :-
        io.write_string("fib(",!IO),
        io.write_int([i(curr)]),
        io.write_string(") = ", !IO),
        io.write_int(fib([i(curr)]), !IO),
        io.write_string("\n"),
        firstten(rest,!IO).

 main(!IO) :-
        firstten([0,1,2,3,4,5,6,7,8,9,10])
        io.nl(!IO).
