(* GENERATED CODE - DO NOT EDIT *)
(* Orientable: Orientable *)

(** An interface for widgets that can be oriented horizontally or vertically.

    [GtkOrientable] is more flexible in that it allows the orientation to be
    changed at runtime, allowing the widgets to “flip”.

    {b CSS nodes}

    [GtkWidget] types implementing the [GtkOrientable] interface will
    automatically acquire the [horizontal] or [vertical] CSS class depending on
    the value of the [Gtk.Orientable:orientation] property. *)

type t = [ `orientable ] Gobject.obj

external from_gobject : 'a Gobject.obj -> t = "ml_gtk_orientable_from_gobject"

(* Methods *)

external set_orientation : t -> Gtk_enums.orientation -> unit
  = "ml_gtk_orientable_set_orientation"
(** Sets the orientation of the [orientable]. *)

external get_orientation : t -> Gtk_enums.orientation
  = "ml_gtk_orientable_get_orientation"
(** Retrieves the orientation of the [orientable]. *)

(* Properties *)
