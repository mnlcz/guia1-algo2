module ejercicios.ej6;

import ejercicios.iejercicio;
import tdas.pila;

public static class Ejercicio6 : IEjercicio
{
    private static bool ordenarAscendente(Pila!int pila) nothrow @safe
    {
        auto i = 0, d = pila.tamanio - 1;
        auto prevIzq = int.max, prevDer = int.min;
        while (i != d)
        {
            auto currIzq = pila.elementos[i], currDer = pila.elementos[d];
            if (currIzq > prevIzq || currDer < prevDer)
                return false;
            i++;
            d--;
            prevIzq = currIzq;
            prevDer = currDer;
        }
        return true;
    }

    public static void resolver() @safe
    {
        import std.stdio : writeln, writefln;
        auto p1 = new Pila!int(5, 4, 3, 2, 1);
        auto p2 = new Pila!int(1, 2, 3, 4, 5);
        writeln(p1.toString);
        writeln(p2.toString ~ "\n");

        auto r1 = ordenarAscendente(p1);
        auto r2 = ordenarAscendente(p2);
        writefln("Pila 1 ordenada ascendentemente desde tope; %s", r1);
        writefln("Pila 2 ordenada ascendentemente desde tope; %s", r2);
    }
}
