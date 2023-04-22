module tdas.pila;

import tdas.ipila;
import std.typecons : Tuple, tuple;

public final class Pila(T) : IPila
{
    public @property T[] elementos() nothrow @safe { return _elementos; }
    public @property int tamanio() nothrow @safe { return _tamanio; }

    public this(T[] args ...) @safe
    {
        import std.conv : to;
        _elementos = args.dup;
        _tamanio = args.length.to!int;
    }

    public void apilar(T elemento) nothrow @safe
    {
        _elementos ~= elemento;
        _tamanio++;
    }

    public auto desapilar() nothrow @safe
    {
        T ultimo;
        if (_tamanio > 0)
        {
             ultimo = _elementos[$ - 1];
             _elementos = _elementos[0..$ - 1];
             _tamanio--;
             return tuple!("ok", "val")(true, ultimo);
        }
        return tuple!("ok", "val")(false, ultimo);
    }

    public auto mirar() nothrow @safe
    {
        return _tamanio == 0 ? tuple!("ok", "val")(false, T.init) : tuple!("ok", "val")(true, _elementos[$ - 1]);
    }

    public Pila!T transformar(T delegate(T valor) nothrow @safe aplicar) const @safe
    {
        auto nuevoElementos = _elementos.dup;
        foreach (ref i; nuevoElementos)
            i = aplicar(i);
        return new Pila!T(nuevoElementos);
    }

    public override string toString() const @safe
    {
        import std.format : format;
        return format("%s\t\tSize: %d", _elementos, _tamanio);
    }

    private T[] _elementos;
    private int _tamanio;
}
