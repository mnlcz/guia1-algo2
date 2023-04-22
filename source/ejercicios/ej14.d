module ejercicios.ej14;

import ejercicios.iejercicio;
import tdas.pilaconmaximo;

public static class Ejercicio14 : IEjercicio
{
    private static PilaConMaximo!int setup() @safe
    {
        auto pila = new PilaConMaximo!int(1);
        pila.apilar(5);
        pila.apilar(2);
        pila.apilar(8);
        pila.apilar(8);
        return pila;
    }

    public static void resolver() @safe
    {
        import std.stdio : writeln;
        auto pilaConMaximo = setup;
        pilaConMaximo.toString.writeln;

        pilaConMaximo.desapilar;
        pilaConMaximo.desapilar;
        pilaConMaximo.toString.writeln;
    }
}
