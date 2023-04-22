module ejercicios.ej9;

import ejercicios.iejercicio;
import tdas.listaenlazada;

public static class Ejercicio9 : IEjercicio
{
    public static void resolver() @safe
    {
        import std.stdio : writefln;
        auto ll = new ListaEnlazada!int();
        foreach (i; 1..6)
            ll.agregarAlFinal(i);
        writefln("Lista original: %s", ll.info);
        ll.invertir;
        writefln("Lista invertida: %s", ll.info);
    }
}
