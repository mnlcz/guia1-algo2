module tdas.mamushka;

import std.typecons : NullableRef, nullableRef;

public enum Color { ROJO, VERDE, AZUL, NEGRO, AMARILLO, BLANCO, }

public final class Mamushka
{
    public @property Color color() nothrow @safe { return _color; }
    public @property int tamanio() nothrow @safe { return _tamanio; }
    public @property NullableRef!Mamushka obtenerGuardada() nothrow @safe { return _contenido; }

    @disable public this();

    public this(Color c, int t) nothrow @safe
    {
        _color = c;
        _tamanio = t;
        _contenido.nullify;
    }

    public bool guardar(Mamushka* m) nothrow
    {
        if (_contenido.isNull && _tamanio > m.tamanio)
        {
            _contenido = nullableRef(m);
            return true;
        }
        auto it = _contenido;
        while (!it.get._contenido.isNull)
            it = it.get._contenido;
        if (it.get._tamanio > m.tamanio)
        {
            it.get._contenido = nullableRef(m);
            return true;
        }
        return false;
    }

    public override string toString() const @safe
    {
        import std.format : format;
        auto c = _contenido.isNull ? "nada" : _contenido.get.toString;
        return "Color: %s\t\tTamanio: %d\n\tContenido:\n\t\t\t\t%s".format(_color, _tamanio, c);
    }

    private Color _color;
    private immutable int _tamanio;
    private NullableRef!(Mamushka) _contenido;
}
