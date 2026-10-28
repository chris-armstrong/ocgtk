(** An interface for widgets that can be oriented horizontally or vertically.

    [GtkOrientable] is more flexible in that it allows the orientation to be
    changed at runtime, allowing the widgets to “flip”.

    {b CSS nodes}

    [GtkWidget] types implementing the [GtkOrientable] interface will
    automatically acquire the [horizontal] or [vertical] CSS class depending on
    the value of the [Gtk.Orientable:orientation] property.

    Its methods, signals and properties are on {!class-type-orientable_t}. The
    functions it is built on are in {!Ocgtk.Raw.Orientable}. *)

(** {b The methods, signals and properties of a [Orientable].}

    An interface for widgets that can be oriented horizontally or vertically.

    [GtkOrientable] is more flexible in that it allows the orientation to be
    changed at runtime, allowing the widgets to “flip”.

    {b CSS nodes}

    [GtkWidget] types implementing the [GtkOrientable] interface will
    automatically acquire the [horizontal] or [vertical] CSS class depending on
    the value of the [Gtk.Orientable:orientation] property. *)
class type orientable_t = object
  method get_orientation : unit -> Enums.orientation
  (** Retrieves the orientation of the [orientable]. *)

  method set_orientation : Enums.orientation -> unit
  (** Sets the orientation of the [orientable]. *)

  method as_orientable : Raw.Orientable.t
end

class orientable : Raw.Orientable.t -> orientable_t
(** Wraps a raw handle of {!Ocgtk.Raw.Orientable.t}. *)
