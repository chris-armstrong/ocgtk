(* GTK4 Button low-level bindings *)

type t = Gtk.widget

(** Constructors *)
external new_ : unit -> t = "ml_gtk_button_new"
external new_with_label : string -> t = "ml_gtk_button_new_with_label"
external new_with_mnemonic : string -> t = "ml_gtk_button_new_with_mnemonic"
external new_from_icon_name : string -> t = "ml_gtk_button_new_from_icon_name"

(** Properties *)
external get_label : t -> string = "ml_gtk_button_get_label"
external set_label : t -> string -> unit = "ml_gtk_button_set_label"

external get_has_frame : t -> bool = "ml_gtk_button_get_has_frame"
external set_has_frame : t -> bool -> unit = "ml_gtk_button_set_has_frame"

external get_use_underline : t -> bool = "ml_gtk_button_get_use_underline"
external set_use_underline : t -> bool -> unit = "ml_gtk_button_set_use_underline"

external get_icon_name : t -> string = "ml_gtk_button_get_icon_name"
external set_icon_name : t -> string -> unit = "ml_gtk_button_set_icon_name"

external get_can_shrink : t -> bool = "ml_gtk_button_get_can_shrink"
external set_can_shrink : t -> bool -> unit = "ml_gtk_button_set_can_shrink"

(** Child management *)
external get_child : t -> Gtk.widget option = "ml_gtk_button_get_child"
external set_child : t -> Gtk.widget option -> unit = "ml_gtk_button_set_child"
