module ejercicios.ej13;

import ejercicios.iejercicio;
import tdas.listaenlazada;

public static class Ejercicio13 : IEjercicio
{
    private static int sumaPares(ListaEnlazada!int ll) @safe
    {
        auto suma = 0;
        void op(int x) @safe { if (x % 2 == 0) suma += x; }
        ll.iterar(&op);
        return suma;
    }

    public static void resolver() @safe
    {
        import std.range : iota;
        import std.array : array;
        import std.stdio : writefln;
        auto ll = new ListaEnlazada!int(iota(1, 11).array);
        "%s".writefln(ll.info);

        auto sumaPares = sumaPares(ll);
        "Suma pares: %d".writefln(sumaPares);
    }
}
