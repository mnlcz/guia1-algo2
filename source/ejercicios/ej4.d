module ejercicios.ej4;

import ejercicios.iejercicio;
import tdas;
import std.stdio : writefln;

public static class Ejercicio4 : IEjercicio
{
    public static void resolver() @trusted
    {
        auto comp = new Composicion();
        comp.agregar((float x) => x + 1f);
        comp.agregar((float x) => x + 2f);
        comp.agregar((float x) => x + 3f);

        auto res = comp.aplicar(10f);
        writefln("El resultado de aplicar la composicion es de: %s", res);
    }
 }
