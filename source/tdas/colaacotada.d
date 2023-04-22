module tdas.colaacotada;

import tdas.icola;
import std.typecons : Tuple, tuple;

public final class ColaAcotada(T) : ICola
{
    public @property T[] elementos() nothrow @safe { return _elementos; }
    public @property int tamanio() nothrow @safe { return _tamanio; }
    public @property int tope() nothrow @safe { return _tope; }

    @disable public this();

    public this(immutable int largo) nothrow @safe
    {
        _elementos = new T[largo];
        _tamanio = largo;
        _tope = 0;
    }

    public void encolar(T elemento) nothrow @safe
    {
        if (_tope == _tamanio) return;
        _elementos[_tope] = elemento;
        _tope++;
    }

    public auto desencolar() nothrow @safe
    {
        if (_tope == 0) return tuple!("ok", "val")(false, T.init);
        auto primero = _elementos[_tope - 1];
        _elementos[_tope - 1] = T.init;
        _tope--;
        return tuple!("ok", "val")(true, primero);
    }

    public auto mirar() nothrow @safe
    {
        return _tope == 0 ? tuple!("ok", "val")(false, T.init) : tuple!("ok", "val")(true, _elementos[_tope - 1]);
    }

    public override string toString() const @safe
    {
        import std.format : format;
        return "%s\t\tLargo: %d\t\tTope: %d".format(_elementos, _tamanio, _tope);
    }

    private T[] _elementos;
    private int _tamanio;
    private int _tope;
}
