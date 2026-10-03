(* GENERATED CODE - DO NOT EDIT *)
(* Initable: Initable *)

type t = [ `initable ] Gobject.obj
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
    failure. *)

external from_gobject : 'a Gobject.obj -> t = "ml_gio_initable_from_gobject"

(* Methods *)

external init : t -> Cancellable.t option -> (bool, GError.t) result
  = "ml_g_initable_init"
(** Initializes the object implementing the interface.

    This method is intended for language bindings. If writing in C,
    g_initable_new() should typically be used instead.

    The object must be initialized before any real use after initial
    construction, either with this function or g_async_initable_init_async().

    Implementations may also support cancellation. If [cancellable] is not
    [NULL], then initialization can be cancelled by triggering the cancellable
    object from another thread. If the operation was cancelled, the error
    [G_IO_ERROR_CANCELLED] will be returned. If [cancellable] is not [NULL] and
    the object doesn't support cancellable initialization the error
    [G_IO_ERROR_NOT_SUPPORTED] will be returned.

    If the object is not initialized, or initialization returns with an error,
    then all operations on the object except g_object_ref() and g_object_unref()
    are considered to be invalid, and have undefined behaviour. See the
    \[description\][Gio.Initable] for more details.

    Callers should not assume that a class which implements [GInitable] can be
    initialized multiple times, unless the class explicitly documents itself as
    supporting this. Generally, a class’ implementation of init() can assume
    (and assert) that it will only be called once. Previously, this
    documentation recommended all [GInitable] implementations should be
    idempotent; that recommendation was relaxed in GLib 2.54.

    If a class explicitly supports being initialized multiple times, it is
    recommended that the method is idempotent: multiple calls with the same
    arguments should return the same results. Only the first call initializes
    the object; further calls return the result of the first call.

    One reason why a class might need to support idempotent initialization is if
    it is designed to be used via the singleton pattern, with a
    [GObjectClass].constructor that sometimes returns an existing instance. In
    this pattern, a caller would expect to be able to call g_initable_init() on
    the result of g_object_new(), regardless of whether it is in fact a new
    instance. *)
