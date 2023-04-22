module ejercicios.ej16;

import ejercicios.iejercicio;
import tdas.pila;

public static class Ejercicio16 : IEjercicio
{
    public static void resolver() @safe
    {
        import std.stdio : writeln;
        alias pil = Pila!int;
        auto p1 = new pil(1, 3, 5, 7, 9);
        auto p2 = new pil(2, 4, 6, 8, 10);
        auto p3 = new pil(2, 2, 3, 3, 8);
        auto p4 = new pil(1, 1, 1, 1, 3, 5, 6, 12);

        handleTest(p1, p2);
        writeln;
        handleTest(p3, p4);
    }

    private static int[] mergePilas(Pila!int p1, Pila!int p2) @safe
    {
        int[] res;
        auto pRes = new Pila!int;
        while (p1.tamanio > 0 && p2.tamanio > 0)
            handleComparison(p1, p2, pRes);
        handleComparison(p1, p2, pRes);
        while (pRes.tamanio != 0)
            res ~= pRes.desapilar.val;
        return res;
    }

    private static void handleComparison(Pila!int p1, Pila!int p2, Pila!int pRes) nothrow @safe
    {
        void quitar(Pila!int p)
        {
            auto v = p.desapilar.val;
            if (pRes.tamanio == 0 || v != pRes.mirar.val)
                pRes.apilar(v);
        }
        auto n1 = p1.mirar, n2 = p2.mirar;
        if (n1.ok && n1.val >= n2.val)
            quitar(p1);
        else if (n2.ok && n2.val > n1.val)
            quitar(p2);
    }

    private static void handleTest(Pila!int p1, Pila!int p2) @safe
    {
        import std.stdio : writeln;
        writeln("Pila 1: ", p1);
        writeln("Pila 2: ", p2);
        auto res = mergePilas(p1, p2);
        writeln("Resultante: ", res);
    }
}
