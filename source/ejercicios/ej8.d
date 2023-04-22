module ejercicios.ej8;

import ejercicios.iejercicio;
import tdas.cola;

public static class Ejercicio8 : IEjercicio
{
    private static T[] multiPrimeros(T)(Cola!T cola, int k) nothrow @safe
    {
        import std.range : take;
        auto lim = k > cola.tamanio ? cola.tamanio : k;
        return cola.elementos.take(lim);
    }

    public static void resolver() @safe
    {
        import std.stdio : writefln;
        auto c1 = new Cola!int(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        writefln("%s", c1.toString);

        auto k = 5;
        auto r1 = multiPrimeros(c1, k);
        writefln("%d primeros: %s", k, r1);
    }
}
