(** [GInitable] is implemented by objects that can fail during initialization.
    If an object implements this interface then it must be initialized as the
    first thing after construction, either via [Gio.Initable.init] or
    [Gio.AsyncInitable.init_async] (the latter is only available if it also
    implements [Gio.AsyncInitable]).

    If the object is not initialized, or initialization returns with an error,
    then all operations on the object except [g_object_ref()] and
    [g_object_unref()] are considered to be invalid, and have undefined
    behaviour. They will often fail with [GLib.critical] or [GLib.warning], but
    this must not be relied on.

    Users of objects implementing this are not intended to use the interface
    method directly, instead it will be used automatically in various ways. For
    C applications you generally just call [Gio.Initable.new] directly, or
    indirectly via a [foo_thing_new()] wrapper. This will call
    [Gio.Initable.init] under the cover, returning [NULL] and setting a [GError]
    on failure (at which point the instance is unreferenced).

    For bindings in languages where the native constructor supports exceptions
    the binding could check for objects implementing [GInitable] during normal
    construction and automatically initialize them, throwing an exception on
    failure.

    Its methods, signals and properties are on {!class-type-initable_t}. The
    functions it is built on are in {!Ocgio.Raw.Initable}. *)

(** The methods, signals and properties of a [GInitable]. *)
class type initable_t = object
  method init : Cancellable.cancellable_t option -> (bool, GError.t) result
  method as_initable : Raw.Initable.t
end

class initable : Raw.Initable.t -> initable_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Initable.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GInitable], give one already wrapped. *)
