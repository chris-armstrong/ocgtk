(* GTK4 Frame - Manually Created *)

type t = [`frame | `widget] Gobject.obj

external create_impl : string option -> t = "ml_gtk_frame_new"
external set_child : t -> Gtk.widget option -> unit = "ml_gtk_frame_set_child"
external get_child : t -> Gtk.widget option = "ml_gtk_frame_get_child"
external set_label : t -> string option -> unit = "ml_gtk_frame_set_label"
external get_label : t -> string option = "ml_gtk_frame_get_label"
external set_label_xalign : t -> float -> unit = "ml_gtk_frame_set_label_align"
external get_label_xalign : t -> float = "ml_gtk_frame_get_label_align"

let create ?label () = create_impl label

let as_widget (frame : t) : Gtk.widget = Obj.magic frame
