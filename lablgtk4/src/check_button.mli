(* GENERATED CODE - DO NOT EDIT *)
(* Widget: CheckButton *)

type t = Gtk.Widget.t

(** Create a new CheckButton *)
external new_ : unit -> t = "ml_gtk_check_button_new"

(** Create a new CheckButton *)
external new_ : unit -> t = "ml_gtk_check_button_new_with_label"

(** Create a new CheckButton *)
external new_ : unit -> t = "ml_gtk_check_button_new_with_mnemonic"

(* Properties *)

(** Get property: active *)
external get_active : t -> bool = "ml_gtk_check_button_get_active"

(** Set property: active *)
external set_active : t -> bool -> unit = "ml_gtk_check_button_set_active"

(** Get property: child *)
external get_child : t -> unit = "ml_gtk_check_button_get_child"

(** Set property: child *)
external set_child : t -> unit -> unit = "ml_gtk_check_button_set_child"

(** Get property: group *)
external get_group : t -> unit = "ml_gtk_check_button_get_group"

(** Set property: group *)
external set_group : t -> unit -> unit = "ml_gtk_check_button_set_group"

(** Get property: inconsistent *)
external get_inconsistent : t -> bool = "ml_gtk_check_button_get_inconsistent"

(** Set property: inconsistent *)
external set_inconsistent : t -> bool -> unit = "ml_gtk_check_button_set_inconsistent"

(** Get property: label *)
external get_label : t -> unit = "ml_gtk_check_button_get_label"

(** Set property: label *)
external set_label : t -> unit -> unit = "ml_gtk_check_button_set_label"

(** Get property: use-underline *)
external get_use_underline : t -> bool = "ml_gtk_check_button_get_use_underline"

(** Set property: use-underline *)
external set_use_underline : t -> bool -> unit = "ml_gtk_check_button_set_use_underline"

