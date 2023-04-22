module ejercicios.ej18;

import ejercicios.iejercicio;
import tdas.pila;

public static class Ejercicio18 : IEjercicio
{
    private static pure int funcRecursiva(T)(ref Pila!T p) @safe
    {
        if (p.tamanio == 0)
            return 0;
        auto valor = p.desapilar.val;
        auto largo = funcRecursiva(p) + 1;
        p.apilar(valor);
        return largo;
    }

    public static void resolver() @safe
    {
        import std.range : iota;
        import std.array;
        import std.stdio : writeln;

        auto pila = new Pila!int(iota(1, 9).array);
        writeln("Pila inicial: ", pila);
        auto largo = funcRecursiva(pila);
        writeln("Largo recursivo: ", largo);
        writeln("Pila final: ", pila);
    }
}
