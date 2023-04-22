module ejercicios.ej7;

import ejercicios.iejercicio;
import tdas.colaenlazada;

public static class Ejercicio7 : IEjercicio
{
    private static T[] multiPrimeros(T)(ColaEnlazada!T colaEnlazada, int k) nothrow @safe
    {
        auto lim = k > colaEnlazada.largo ? colaEnlazada.largo : k;
        T[] arr;
        auto it = colaEnlazada.elementos.primero;
        auto cnt = 0;
        while (cnt != lim)
        {
            arr ~= it.get.dato;
            it = it.get.prox;
            cnt++;
        }
        return arr;
    }

    public static void resolver() @safe
    {
        import std.stdio : writeln, writefln;
        auto cola = new ColaEnlazada!int();
        foreach (i; 1..11)
            cola.encolar(i);
        cola.info.writeln;

        auto k = 5;
        auto res = multiPrimeros(cola, k);
        writefln("%d primeros: %s", k, res);
    }
}
