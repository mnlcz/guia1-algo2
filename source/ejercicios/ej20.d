module ejercicios.ej20;

import ejercicios.iejercicio;

public static class Ejercicio20 : IEjercicio
{
    public static void resolver() @safe
    {
        import std.stdio : write;
        string rta = "La primitiva esta hecha para ser utilizada por Barbara, por lo que esta, como cliente, asume que
        la misma funciona tal y como la firma lo especifica. Cualquier mal funcionamiento o error de implementacion
        es responsabilidad del programador encargado de la misma, no del cliente.";
        write("Respuesta: ", rta);
    }
}
