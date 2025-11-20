(* GENERATED CODE - DO NOT EDIT *)
(* Widget: CheckButton *)

type t = Gtk.Widget.t

(** Create a new CheckButton *)
external new_ : unit -> t = "ml_gtk_check_button_new"

(** Create a new CheckButton *)
external new_with_label : string option -> t = "ml_gtk_check_button_new_with_label"

(** Create a new CheckButton *)
external new_with_mnemonic : string option -> t = "ml_gtk_check_button_new_with_mnemonic"

(* Properties *)

(** Get property: active *)
external get_active : t -> bool = "ml_gtk_check_button_get_active"

(** Set property: active *)
external set_active : t -> bool -> unit = "ml_gtk_check_button_set_active"

(** Get property: inconsistent *)
external get_inconsistent : t -> bool = "ml_gtk_check_button_get_inconsistent"

(** Set property: inconsistent *)
external set_inconsistent : t -> bool -> unit = "ml_gtk_check_button_set_inconsistent"

(** Get property: label *)
external get_label : t -> string = "ml_gtk_check_button_get_label"

(** Set property: label *)
external set_label : t -> string -> unit = "ml_gtk_check_button_set_label"

(** Get property: use-underline *)
external get_use_underline : t -> bool = "ml_gtk_check_button_get_use_underline"

(** Set property: use-underline *)
external set_use_underline : t -> bool -> unit = "ml_gtk_check_button_set_use_underline"

external set_group : t -> Gtk.Widget.t option -> unit = "ml_gtk_check_button_set_group"

external set_child : t -> Gtk.Widget.t option -> unit = "ml_gtk_check_button_set_child"

external get_child : t -> Gtk.Widget.t = "ml_gtk_check_button_get_child"

