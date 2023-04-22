module ejercicios.ej5;

import ejercicios.iejercicio;
import tdas;

public static class Ejercicio5 : IEjercicio
{
    private static T anteKUltimo(T)(ListaEnlazada!T ll, byte k) nothrow @safe
    {
        auto i = 0;
        auto movs = ll.largo - k;
        auto it = ll.primero;
        while (i != movs)
        {
            it = it.get.prox;
            i++;
        }
        return it.get.dato;
    }

    public static void resolver() @trusted
    {
        import std.stdio : writefln;
        auto ll = new ListaEnlazada!int(1, 5, 10, 3, 6, 8);
        byte k = 4;
        auto r = anteKUltimo(ll, k);
        writefln("Lista enlazada: %s", ll.info);
        writefln("Ante (%d) ultimo: %d", k, r);
    }
}
