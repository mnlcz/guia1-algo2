module ejercicios.ej0;

import ejercicios.iejercicio;
import tdas.pila;

public static class Ejercicio0 : IEjercicio
{
    private static T[] miltitop(T)(Pila!T pila, int n) nothrow @safe
    {
        auto tamanio = n > pila.tamanio ? pila.tamanio : n;
        auto topes = new T[tamanio];
        for (auto i = 0; i < tamanio; i++)
            topes[i] = pila.elementos[$ - (i + 1)];
        return topes;
    }

    public static void resolver() @safe
    {
        import std.stdio : writeln;
        auto p = new Pila!int(1, 2, 3, 4, 5, 6);
        auto topes = miltitop(p, 3);
        writeln(topes);
    }
}
