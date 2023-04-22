module ejercicios.ej17;

import ejercicios.iejercicio;
import tdas.pila;
import std.stdio : writeln;

public static class Ejercicio17 : IEjercicio
{
    public static void resolver() @safe
    {
        import std.range : iota;
        import std.array : array;
        testear(iota(1, 11).array, x => x * 2);
        writeln;
        testear(iota(10, 15).array, x => x ^^ 2);
    }

    private static void testear(int[] args, int delegate(int) nothrow @safe fn) @safe
    {
        auto p = new Pila!int(args);
        auto r = p.transformar(fn);
        writeln("Pila original: ", p);
        writeln("Pila transformada: ", r);
    }
}
