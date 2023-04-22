module ejercicios.ej11;

import ejercicios.iejercicio;
import tdas.pila;

public static class Ejercicio11 : IEjercicio
{
    private static void ordenar(Pila!int pil) @safe
    {
        auto aux = new Pila!int();
        while (pil.tamanio > 0)
        {
            auto elemento = pil.desapilar[1];
            while (aux.tamanio > 0 && aux.mirar[1] < elemento)
                pil.apilar(aux.desapilar[1]);
            aux.apilar(elemento);
        }
        while (aux.tamanio > 0)
            pil.apilar(aux.desapilar[1]);
    }

    public static void resolver() @safe
    {
        import std.stdio : writeln;
        auto p1 = new Pila!int(4, 1, 5, 2, 3);
        p1.toString.writeln;
        ordenar(p1);
        p1.toString.writeln; writeln;

        auto p2 = new Pila!int(4, 3, 2, 7);
        p2.toString.writeln;
        ordenar(p2);
        p2.toString.writeln;
    }
}
