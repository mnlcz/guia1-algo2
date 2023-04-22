module ejercicios.ej2;

import ejercicios.iejercicio;
import tdas;
import std.stdio : writeln, writefln;

public static class Ejercicio2 : IEjercicio
{
    public static void resolver() @safe
    {
        auto c1 = new Complejo(2, 3);
        auto c2 = new Complejo(5, 4);
        writefln("Complejo 1: %s", c1.toString);
        writefln("Complejo 2: %s", c2.toString);

        auto suma = c1.sumar(c2);
        writefln("Suma: %s", suma);

        auto mult = c1.multiplicar(c2);
        writefln("Multiplicacion: %s", mult);

        auto modulo = c1.modulo;
        writefln("Modulo: %s", modulo);

        auto angulo = c1.angulo;
        writefln("Angulo en rad: %s", angulo);
    }
}
