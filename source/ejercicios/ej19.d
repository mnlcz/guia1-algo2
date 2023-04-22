module ejercicios.ej19;

import ejercicios.iejercicio;
import tdas;

public static class Ejercicio19 : IEjercicio
{
    private static bool balanceado(const string texto) @safe
    {
        auto aperturas = new Pila!char();
        auto relaciones = ['{': '}', '[': ']', '(': ')'];
        foreach (c; texto)
        {
            if (c == '[' || c == '{' || c == '(')
                aperturas.apilar(c);
            else if (c == ']' || c == ')' || c == '}')
            {
                if (!aperturas.mirar.ok || relaciones[aperturas.mirar.val] != c)
                    return false;
                aperturas.desapilar;
            }
            else
                return false;
        }
        return aperturas.tamanio == 0;
    }

    public static void resolver() @safe
    {
        import std.stdio : writefln;
        auto s1 = "[{([])}]";
        auto s2 = "[{}";
        auto s3 = "[(])";
        auto s4 = "()[{}]";
        auto s5 = "()()(())";
        auto r1 = balanceado(s1);
        auto r2 = balanceado(s2);
        auto r3 = balanceado(s3);
        auto r4 = balanceado(s4);
        auto r5 = balanceado(s5);

        "String 1: %s\t\tBalanceado: %s".writefln(s1, r1);
        "String 2: %s\t\tBalanceado: %s".writefln(s2, r2);
        "String 3: %s\t\tBalanceado: %s".writefln(s3, r3);
        "String 4: %s\t\tBalanceado: %s".writefln(s4, r4);
        "String 5: %s\t\tBalanceado: %s".writefln(s5, r5);
    }
}
