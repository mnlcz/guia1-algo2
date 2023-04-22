module ejercicios.ej3;

import ejercicios.iejercicio;
import tdas;

public static class Ejercicio3 : IEjercicio
{
    private static T[] invertir(T)(const T[] arr) @safe
    {
        import std.stdio : writeln;
        auto pila = new Pila!T();
        foreach (i; arr)
            pila.apilar(i);
        T[] newArr;
        for (auto i = 0; i < arr.length; i++)
            newArr ~= pila.desapilar[1];
        return newArr;
    }

    public static void resolver() @safe
    {
        import std.stdio : writefln;
        auto arr = [1, 2, 3, 4, 5];
        writefln("Arr: %s", arr);
        auto inv = invertir!int(arr);
        writefln("Inv: %s", inv);
    }
}
