% Mercury Data Types and Binding Examples

:- module mercury_data_types_or_binding.
:- interface.

:- import_module io, string, int.

{-| Main entry point for the Data Types and Binding examples. -}
:- pred main(io::di, io::uo) is det.

:- implementation.

main(!IO) :-
    io.write_string("=== Mercury Data Types and Binding Examples ===\n\n", !IO),
    
    % --- Basic Type & Value Demonstration (Int/String/Float) ---
    Name = "Alice",
    Age = 25,
    io.write_string(Name, !IO),
    io.write_string(" is ", !IO),
    io.write_int(Age, !IO),
    io.write_string(" years old\n", !IO),

    % --- Algebraic Data Types (ADTs) Demonstration ---
    io.write_string("\n--- ADT Demo ---\n", !IO),
    print_shape_info(Circle(5.0), !IO). % Example using a function that matches on constructors


:- pred shape_info(float::in, io::uo) is det.
shape_info(Area, IO) :-
    io.write_string("Circle area: ", !IO),
    io.write_float(Area, !IO).

% --- Type Synonyms and Records (Using ':- type') ---
:- type shape_type ---> circle(float) ; rectangle(float, float) ; square(float).

:- pred print_shape_info(shape_type::in, io::uo) is det.
print_shape_info(Circle(r), IO) :- !, 
    io.write_string("Shape: Circle with radius ", !IO),
    io.write_float(r, !IO).

print_shape_info(Rectangle(w, h), IO) :-
    io.write_string("Shape: Rectangle ", !IO),
    io.write_float(w, !IO),
    io.write_string("x", !IO),
    io.write_float(h, !IO).

print_shape_info(Square(s), IO) :-
    io.write_string("Shape: Square of side ", !IO),
    io.write_float(s, !IO).


% --- Number Classification using Guards (No 'cut' needed) ---
:- pred classify_number(int::in, string::out) is det.
classify_number(N, Result) :-
    ( N < 0 -> 
        Result = "negative" !IO ;
    N = 0 ->
        Result = "zero" !IO ;
    N mod 2 = 0 ->
        Result = "positive even" !IO ;
    Result = "positive odd"!IO).

% --- Function Definitions for ADTs and Types ---
:- func circle_area(float) = float.
circle_area(Radius) = Radius * Radius * 3.

:- func rectangle_area(float, float) = float.
rectangle_area(Width, Height) = Width * Height.

:- func square_area(float) = float.
square_area(Side) = Side * Side.