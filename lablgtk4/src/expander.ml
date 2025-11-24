(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Expander *)

type t = Gtk.widget

external new_ : string option -> t = "ml_gtk_expander_new"

external new_with_mnemonic : string option -> t = "ml_gtk_expander_new_with_mnemonic"

(* Properties *)

external get_expanded : t -> bool = "ml_gtk_expander_get_expanded"

external set_expanded : t -> bool -> unit = "ml_gtk_expander_set_expanded"

external get_label : t -> string = "ml_gtk_expander_get_label"

external set_label : t -> string -> unit = "ml_gtk_expander_set_label"

external get_resize_toplevel : t -> bool = "ml_gtk_expander_get_resize_toplevel"

external set_resize_toplevel : t -> bool -> unit = "ml_gtk_expander_set_resize_toplevel"

external get_use_markup : t -> bool = "ml_gtk_expander_get_use_markup"

external set_use_markup : t -> bool -> unit = "ml_gtk_expander_set_use_markup"

external get_use_underline : t -> bool = "ml_gtk_expander_get_use_underline"

external set_use_underline : t -> bool -> unit = "ml_gtk_expander_set_use_underline"

external set_label_widget : t -> Gtk.widget option -> unit = "ml_gtk_expander_set_label_widget"

external set_child : t -> Gtk.widget option -> unit = "ml_gtk_expander_set_child"

external get_label_widget : t -> Gtk.widget = "ml_gtk_expander_get_label_widget"

external get_child : t -> Gtk.widget = "ml_gtk_expander_get_child"

