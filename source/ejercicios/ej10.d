module ejercicios.ej10;

import ejercicios.iejercicio;
import tdas.colaacotada;

public static class Ejercicio10 : IEjercicio
{
    public static void resolver() @safe
    {
        import std.stdio : writefln;
        auto ca = new ColaAcotada!int(5);
        "%s".writefln(ca.toString);

        foreach (i; 1..5)
            ca.encolar(i);
        "\n%s".writefln(ca.toString);

        "\nSe agrega otro elemento mas: ".writefln;
        ca.encolar(5);
        "%s".writefln(ca.toString);

        "\nSe quitan 2 elementos: ".writefln;
        ca.desencolar;
        ca.desencolar;
        "%s".writefln(ca.toString);
    }
}
