module tdas.composicion;

alias fn = float function(float);

public final class Composicion
{
    public void agregar(fn func) nothrow @trusted
    {
        _funciones ~= func;
    }

    public float aplicar(float x) @trusted
    {
        auto v = x;
        while (true)
        {
            if (_funciones.length == 0)
                break;
            auto f = _funciones[$ - 1];
            _funciones = _funciones[0..($ - 1)];
            v = f(v);
        }
        return v;
    }

    private fn[] _funciones;
}
