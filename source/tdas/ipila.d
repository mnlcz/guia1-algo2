module tdas.ipila;

import std.typecons : Tuple;

interface IPila
{
    void apilar(T)(T elemento) nothrow @safe;
    auto desapilar(T)() nothrow @safe;
    auto mirar(T)() nothrow @safe;
}
