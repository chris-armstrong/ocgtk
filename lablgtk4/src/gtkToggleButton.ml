(* GTK4 ToggleButton low-level bindings - implementation *)

type t = Gtk.Widget.t

external new_ : unit -> t = "ml_gtk_toggle_button_new"
external new_with_label : string -> t = "ml_gtk_toggle_button_new_with_label"
external new_with_mnemonic : string -> t = "ml_gtk_toggle_button_new_with_mnemonic"

external get_active : t -> bool = "ml_gtk_toggle_button_get_active"
external set_active : t -> bool -> unit = "ml_gtk_toggle_button_set_active"

external toggled : t -> unit = "ml_gtk_toggle_button_toggled"
