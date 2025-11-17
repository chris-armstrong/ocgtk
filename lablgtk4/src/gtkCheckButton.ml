(* GTK4 CheckButton low-level bindings - implementation *)

type t = Gtk.Widget.t

external new_ : unit -> t = "ml_gtk_check_button_new"
external new_with_label : string -> t = "ml_gtk_check_button_new_with_label"
external new_with_mnemonic : string -> t = "ml_gtk_check_button_new_with_mnemonic"

external get_active : t -> bool = "ml_gtk_check_button_get_active"
external set_active : t -> bool -> unit = "ml_gtk_check_button_set_active"

external get_label : t -> string = "ml_gtk_check_button_get_label"
external set_label : t -> string -> unit = "ml_gtk_check_button_set_label"

external get_use_underline : t -> bool = "ml_gtk_check_button_get_use_underline"
external set_use_underline : t -> bool -> unit = "ml_gtk_check_button_set_use_underline"

external get_inconsistent : t -> bool = "ml_gtk_check_button_get_inconsistent"
external set_inconsistent : t -> bool -> unit = "ml_gtk_check_button_set_inconsistent"

external set_group : t -> t option -> unit = "ml_gtk_check_button_set_group"
