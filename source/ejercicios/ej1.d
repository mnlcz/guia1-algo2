module ejercicios.ej1;

import ejercicios.iejercicio;
import tdas.fraccion;
import std.stdio : writeln, writefln;

public static class Ejercicio1 : IEjercicio
{
    public static void resolver() @safe
    {
        auto f1 = new Fraccion(4, 5);
        writeln("Fraccion original: " ~ f1.toString);

        auto r1 = f1.sumar(new Fraccion(2, 3));
        writeln("Suma: " ~ r1.toString);

        auto r2 = f1.multiplicar(new Fraccion(2, 2));
        writeln("Multiplicacion: ", r2.toString);

        auto f2 = new Fraccion(7, 2);
        writeln("\nNueva fraccion: " ~ f2.toString);

        auto r3 = f2.parteEntera;
        writefln("Parte entera: %d", r3);

        auto f3 = new Fraccion(10, 8);
        writeln("\nNueva fraccion: " ~ f3.toString);

        auto r4 = f3.representacion;
        writeln("Representacion: " ~ r4);
    }
}
