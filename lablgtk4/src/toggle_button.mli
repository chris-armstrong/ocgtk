(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ToggleButton *)

type t = Gtk.Widget.t

(** Create a new ToggleButton *)
external new_ : unit -> t = "ml_gtk_toggle_button_new"

(** Create a new ToggleButton *)
external new_ : unit -> t = "ml_gtk_toggle_button_new_with_label"

(** Create a new ToggleButton *)
external new_ : unit -> t = "ml_gtk_toggle_button_new_with_mnemonic"

(* Properties *)

(** Get property: active *)
external get_active : t -> bool = "ml_gtk_toggle_button_get_active"

(** Set property: active *)
external set_active : t -> bool -> unit = "ml_gtk_toggle_button_set_active"

(** Get property: group *)
external get_group : t -> unit = "ml_gtk_toggle_button_get_group"

(** Set property: group *)
external set_group : t -> unit -> unit = "ml_gtk_toggle_button_set_group"

external toggled : t -> unit = "ml_gtk_toggle_button_toggled"

