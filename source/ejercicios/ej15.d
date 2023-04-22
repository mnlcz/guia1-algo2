module ejercicios.ej15;

import ejercicios.iejercicio;
import tdas.mamushka;
import std.stdio : writefln, writeln;

public static class Ejercicio15 : IEjercicio
{
    public static void resolver()
    {
        alias rojo = Color.ROJO;
        alias amarillo = Color.AMARILLO;

        auto mb = new Mamushka(rojo, 10);
        auto m1 = new Mamushka(amarillo, 8);
        auto m2 = new Mamushka(rojo, 2);
        auto m3 = new Mamushka(amarillo, 1);

        "Guardo mamushka en mamushka base.".writeln;
        mb.guardar(&m1);
        "Guardo mamushka en mamushka base.".writeln;
        mb.guardar(&m2);
        "Guardo mamushka en mamushka base.".writeln;
        mb.guardar(&m3);
        "\nMamushka base: %s".writefln(mb);

        "\nMamushka guardada en mamushka base: %s".writefln(mb.obtenerGuardada);

        auto mg = new Mamushka(rojo, 99);
        "\nCreo mamushka gigante: %s".writefln(mg);
        "Intento guardarla en mamushka base. Puedo? %s".writefln(mb.guardar(&mg));
        "\nMamushka base: %s".writefln(mb);
    }
}
