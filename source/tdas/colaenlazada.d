module tdas.colaenlazada;

import tdas.icola;
import tdas.listaenlazada;
import std.typecons : Tuple, tuple;

public final class ColaEnlazada(T) : ICola
{
    public @property ListaEnlazada!T elementos() nothrow @safe { return _elementos; }
    public @property int largo() nothrow @safe { return _elementos.largo; }

    public this() nothrow @safe
    {
        _elementos = new ListaEnlazada!T;
    }

    public void encolar(T elemento) nothrow @safe
    {
        _elementos.agregarAlFinal(elemento);
    }

    public auto desencolar() nothrow @safe
    {
        T primero;
        if (!_elementos.primero.isNull)
        {
            primero = _elementos.primero.get.dato;
            _elementos.primero = _elementos.primero.get.prox;
            return tuple!("ok", "val")(true, primero);
        }
        return tuple!("ok", "val")(false, primero);
    }

    public auto mirar() nothrow @safe
    {
        return largo == 0 ? tuple!("ok", "val")(false, T.init) : tuple!("ok", "val")(true, _elementos.primero.get.dato);
    }

    public string info() @safe
    {
        return _elementos.info;
    }

    private ListaEnlazada!T _elementos;
}
