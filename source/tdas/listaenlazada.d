module tdas.listaenlazada;

import std.typecons : Nullable;

private final class Nodo(T)
{
    public Nullable!(Nodo!T) prox;
    public T dato;

    public this(T x) @safe
    {
        dato = x;
        prox.nullify;
    }
}

public final class ListaEnlazada(T)
{
    public Nullable!(Nodo!T) primero;
    public @property int largo() nothrow @safe { return _largo; }

    public this() nothrow @safe
    {
        _largo = 0;
        primero.nullify;
    }

    public this(T[] args ...) nothrow @safe
    {
        foreach (e; args)
            agregarAlFinal(e);
    }

    public void agregarAlFinal(T dato) nothrow @safe
    {
        _largo++;
        auto nodo = new Nodo!T(dato);
        if (primero.isNull)
            primero = nodo;
        else
        {
            auto ultimoElemento = ultimo;
            ultimoElemento.get.prox = nodo;
        }
    }

    public void eliminarUltimo() nothrow @safe
    {
        if (primero.isNull)
            return;
        auto it = primero;
        while (!it.get.prox.get.prox.isNull)
            it = it.get.prox;
        it.get.prox.nullify;
        _largo--;
    }

    public Nullable!(Nodo!T) ultimo() nothrow @safe
    {
        auto it = primero;
        while (!it.get.prox.isNull)
            it = it.get.prox;
        return it;
    }

    public void invertir() nothrow @safe
    {
        Nullable!(Nodo!T) prev;
        auto actual = primero;
        while (!actual.isNull)
        {
            auto siguiente = actual.get.prox;
            actual.get.prox = prev;
            prev = actual;
            actual = siguiente;
        }
        primero = prev;
    }

    public void iterar(void delegate(T) @safe visitar) @safe
    {
        auto it = primero;
        while (!it.isNull)
        {
            visitar(it.get.dato);
            it = it.get.prox;
        }
    }

    public string info() @safe
    {
        if (primero.isNull) return "Lista vacia.";
        import std.array : appender;
        import std.format : format;
        auto builder = appender!string;
        auto it = primero;
        while (!it.isNull)
        {
            builder.put(format("%s, ", it.get.dato));
            it = it.get.prox;
        }
        return "[" ~ builder.data[0..($ - 2)] ~ "]";
    }

    private int _largo;
}
