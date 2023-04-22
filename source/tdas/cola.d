module tdas.cola;

import tdas.icola;
import std.typecons : Tuple, tuple;

public final class Cola(T) : ICola
{
    public @property T[] elementos() nothrow @safe { return _elementos; }
    public @property int tamanio() nothrow @safe { return _tamanio; }

    public this(T[] args ...) @safe
    {
        import std.conv : to;
        _elementos = args.dup;
        _tamanio = args.length.to!int;
    }

    public void encolar(T elemento) nothrow @safe
    {
       _elementos ~= elemento;
       _tamanio++;
    }

    public auto desencolar() nothrow @safe
    {
        T primero;
        if (_tamanio > 0)
        {
            primero = _elementos[0];
            _elementos = _elementos[1..$];
            _tamanio--;
            return tuple!("ok", "val")(true, primero);
        }
        return tuple!("ok", "val")(false, primero);
    }

    public auto mirar() nothrow @safe
    {
        return _tamanio == 0 ? tuple!("ok", "val")(false, T.init) : tuple!("ok", "val")(true, _elementos[0]);
    }

    public override string toString() const @safe
    {
        import std.format : format;
        return format("%s\t\tSize: %d", _elementos, _tamanio);
    }

    private T[] _elementos;
    private int _tamanio;
}
