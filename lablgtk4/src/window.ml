(* GTK4 Window - Manually Created *)

type t = [`window | `widget] Gobject.obj

external create : unit -> t = "ml_gtk_window_new"
external set_child : t -> Gtk.widget option -> unit = "ml_gtk_window_set_child"
external get_child : t -> Gtk.widget option = "ml_gtk_window_get_child"
external set_title : t -> string -> unit = "ml_gtk_window_set_title"
external get_title : t -> string = "ml_gtk_window_get_title"
external set_default_size : t -> width:int -> height:int -> unit = "ml_gtk_window_set_default_size"
external get_default_size : t -> int * int = "ml_gtk_window_get_default_size"
external set_resizable : t -> bool -> unit = "ml_gtk_window_set_resizable"
external get_resizable : t -> bool = "ml_gtk_window_get_resizable"
external set_modal : t -> bool -> unit = "ml_gtk_window_set_modal"
external get_modal : t -> bool = "ml_gtk_window_get_modal"
external destroy : t -> unit = "ml_gtk_window_destroy"
external present : t -> unit = "ml_gtk_window_present"
external close : t -> unit = "ml_gtk_window_close"

let as_widget (window : t) : Gtk.widget = Obj.magic window
