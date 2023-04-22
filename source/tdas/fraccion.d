module tdas.fraccion;

import std.algorithm.comparison : min;
import std.format : format;

public final class Fraccion
{
    public @property int numerador() nothrow @safe { return _numerador; }
    public @property int denominador() nothrow @safe { return _denominador; }
    public @property int parteEntera() nothrow @safe { return _numerador / _denominador; }

    public this(int n, int d) nothrow @safe
    {
        _numerador = n;
        _denominador = d;
    }

    public Fraccion sumar(Fraccion otra) const nothrow @safe
    {
        auto num = _numerador * otra.denominador + _denominador * otra.numerador;
        auto den = _denominador * otra.denominador;
        return new Fraccion(num, den);
    }

    public Fraccion multiplicar(Fraccion otra) const nothrow @safe
    {
        auto num = _numerador * otra.numerador;
        auto den = _denominador * otra.denominador;
        return new Fraccion(num, den);
    }

    public string representacion() const @safe
    {
        auto lim = min(_numerador, _denominador);
        auto div = 2;
        while (div <= lim)
        {
            if (_numerador % div == 0 && _denominador % div == 0)
                break;
            div++;
        }
        return format("%d/%d", _numerador / div, _denominador / div);
    }

    public override string toString() const @safe
    {
        return format("%d/%d", _numerador, _denominador);
    }

    private int _numerador;
    private int _denominador;
}
