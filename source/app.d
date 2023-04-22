module main;

void main()
{
    import std.range : iota;
    import std.algorithm.iteration : each;

    21.iota.each!(x => x.ejecutarEjercicio);
}

void ejecutarEjercicio(int nro)
{
    import ejercicios;
    import std.stdio : writeln, writefln;

    writeln("----------------------");
    writefln("Ejercicio %d:", nro);
    void function() ejercicio;
    switch (nro)
    {
        case 0:
            ejercicio = &Ejercicio0.resolver;
            break;
        case 1:
            ejercicio = &Ejercicio1.resolver;
            break;
        case 2:
            ejercicio = &Ejercicio2.resolver;
            break;
        case 3:
            ejercicio = &Ejercicio3.resolver;
            break;
        case 4:
            ejercicio = &Ejercicio4.resolver;
            break;
        case 5:
            ejercicio = &Ejercicio5.resolver;
            break;
        case 6:
            ejercicio = &Ejercicio6.resolver;
            break;
        case 7:
            ejercicio = &Ejercicio7.resolver;
            break;
        case 8:
            ejercicio = &Ejercicio8.resolver;
            break;
        case 9:
            ejercicio = &Ejercicio9.resolver;
            break;
        case 10:
            ejercicio = &Ejercicio10.resolver;
            break;
        case 11:
            ejercicio = &Ejercicio11.resolver;
            break;
        case 12:
            ejercicio = &Ejercicio12.resolver;
            break;
        case 13:
            ejercicio = &Ejercicio13.resolver;
            break;
        case 14:
            ejercicio = &Ejercicio14.resolver;
            break;
        case 15:
            ejercicio = &Ejercicio15.resolver;
            break;
        case 16:
            ejercicio = &Ejercicio16.resolver;
            break;
        case 17:
            ejercicio = &Ejercicio17.resolver;
            break;
        case 18:
            ejercicio = &Ejercicio18.resolver;
            break;
        case 19:
            ejercicio = &Ejercicio19.resolver;
            break;
        case 20:
            ejercicio = &Ejercicio20.resolver;
            break;
        default:
            writeln("Ejercicio invalido");
    }
    try
    {
        ejercicio();
    }
    catch (Exception e)
    {
        writeln(e.msg);
    }
}
