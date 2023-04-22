module tdas.icola;

import std.typecons : Tuple;

interface ICola
{
    void encolar(T)(T elemento) nothrow @safe;
    auto desencolar(T)() nothrow @safe;
    auto mirar(T)() nothrow @safe;
}
