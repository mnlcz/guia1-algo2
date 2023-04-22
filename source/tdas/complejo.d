module tdas.complejo;

public final class Complejo
{
    public @property float parteReal() nothrow @safe { return _real; }
    public @property float parteImaginaria() nothrow @safe { return _imag; }

    public this(float r, float i) nothrow @safe
    {
        _real = r;
        _imag = i;
    }

    public Complejo sumar(Complejo otro) const nothrow @safe
    {
        auto r = _real + otro.parteReal;
        auto i = _imag + otro.parteImaginaria;
        return new Complejo(r, i);
    }

    public Complejo multiplicar(Complejo otro) const nothrow @safe
    {
        auto r = _real * otro.parteReal - _imag * otro.parteImaginaria;
        auto i = _real * otro.parteImaginaria + _imag * otro.parteReal;
        return new Complejo(r, i);
    }

    public float modulo() const nothrow @safe
    {
        import std.math : sqrt, pow;
        return sqrt(pow(_real, 2) + pow(_imag, 2));
    }

    public float angulo() const nothrow @safe
    {
        import std.math : atan;
        return atan(_imag / _real);
    }

    public override string toString() const @safe
    {
        import std.format : format;
        return format("%s + %sj", _real, _imag);
    }

    private float _real;
    private float _imag;
}
