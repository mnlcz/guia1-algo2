module ejercicios.ej12;

import ejercicios.iejercicio;
import tdas.cola;

public static class Ejercicio12 : IEjercicio
{
    private static void filtrarCola(T)(Cola!T cola, bool delegate(T) @safe predicate) @safe
    {
        auto colaAux = new Cola!T();
        while (cola.mirar[0])
            colaAux.encolar(cola.desencolar[1]);
        while (colaAux.mirar[0])
        {
            auto primero = colaAux.desencolar[1];
            if (!predicate(primero))
                cola.encolar(primero);
        }
    }

    public static void resolver() @safe
    {
        import std.stdio : writefln;
        auto cola = new Cola!int(1, 2, 3, 4, 5, 6);
        "Cola inicial: %s".writefln(cola.toString);

        filtrarCola(cola, (int x) => x > 3);
        "Cola filtrada (x > 3): %s".writefln(cola.toString);
    }
}
