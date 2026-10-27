(** An interface for widgets that can be oriented horizontally or vertically.

    [GtkOrientable] is more flexible in that it allows the orientation to be
    changed at runtime, allowing the widgets to “flip”.

    {b CSS nodes}

    [GtkWidget] types implementing the [GtkOrientable] interface will
    automatically acquire the [horizontal] or [vertical] CSS class depending on
    the value of the [Gtk.Orientable:orientation] property.

    Its methods, signals and properties are on {!class-type-orientable_t}. The
    functions it is built on are in {!Ocgtk.Raw.Orientable}. *)

(** The methods, signals and properties of a [GtkOrientable]. *)
class type orientable_t = object
  method get_orientation : unit -> Enums.orientation
  method set_orientation : Enums.orientation -> unit
  method as_orientable : Raw.Orientable.t
end

class orientable : Raw.Orientable.t -> orientable_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Orientable.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkOrientable], give one already wrapped. *)
