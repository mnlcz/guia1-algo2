module tdas.pilaconmaximo;

import tdas.ipila;
import std.typecons : Tuple, tuple;

public class PilaConMaximo(T : int) : IPila
{
    public @property T[] elementos() nothrow @safe { return _elementos; }
    public @property int tamanio() nothrow @safe { return _tamanio; }
    public @property int maximo() nothrow @safe { return _maximo; }

    @disable public this();

    public this(T primero) nothrow @safe
    {
        _elementos = [primero];
        _ordenados = [primero];
        _tamanio = 1;
        _maximo = primero;
    }

    public void apilar(T elemento) nothrow @safe
    {
        _tamanio++;
        _elementos ~= elemento;
        if (_ordenados.length == 0)
            _ordenados ~= elemento;
        else if (elemento >= _ordenados[$-1])
            _ordenados ~= elemento;
        _maximo = _ordenados[$-1];
    }

    public auto desapilar() nothrow @safe
    {
        T tope;
        if (_tamanio > 0)
        {
            tope = _elementos[$-1];
            _elementos = _elementos[0..($-1)];
            _tamanio--;
            if (tope == _maximo)
            {
                _ordenados = _ordenados[0..($-1)];
                _maximo = _ordenados[$-1];
            }
            return tuple!("ok", "val")(true, tope);
        }
        return tuple!("ok", "val")(false, tope);
    }

    public auto mirar() nothrow @safe
    {
        return _tamanio == 0 ? tuple!("ok", "val")(false, T.init) : tuple!("ok", "val")(true, _elementos[$-1]);
    }

    public override string toString() const @safe
    {
        import std.format : format;
        return "%s\t\tTamanio: %d\t\tMaximo: %d".format(_elementos, _tamanio, _maximo);
    }

    private T[] _elementos;
    private T[] _ordenados;
    private int _tamanio;
    private int _maximo;
}
