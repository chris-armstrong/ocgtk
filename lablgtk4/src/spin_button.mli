(* GENERATED CODE - DO NOT EDIT *)
(* Widget: SpinButton *)

type t = Gtk.Widget.t

(** Create a new SpinButton *)
external new_ : unit -> t = "ml_gtk_spin_button_new"

(** Create a new SpinButton *)
external new_ : unit -> t = "ml_gtk_spin_button_new_with_range"

(* Properties *)

(** Get property: activates-default *)
external get_activates_default : t -> bool = "ml_gtk_spin_button_get_activates_default"

(** Set property: activates-default *)
external set_activates_default : t -> bool -> unit = "ml_gtk_spin_button_set_activates_default"

(** Get property: climb-rate *)
external get_climb_rate : t -> float = "ml_gtk_spin_button_get_climb_rate"

(** Set property: climb-rate *)
external set_climb_rate : t -> float -> unit = "ml_gtk_spin_button_set_climb_rate"

(** Get property: digits *)
external get_digits : t -> int = "ml_gtk_spin_button_get_digits"

(** Set property: digits *)
external set_digits : t -> int -> unit = "ml_gtk_spin_button_set_digits"

(** Get property: numeric *)
external get_numeric : t -> bool = "ml_gtk_spin_button_get_numeric"

(** Set property: numeric *)
external set_numeric : t -> bool -> unit = "ml_gtk_spin_button_set_numeric"

(** Get property: snap-to-ticks *)
external get_snap_to_ticks : t -> bool = "ml_gtk_spin_button_get_snap_to_ticks"

(** Set property: snap-to-ticks *)
external set_snap_to_ticks : t -> bool -> unit = "ml_gtk_spin_button_set_snap_to_ticks"

(** Get property: value *)
external get_value : t -> float = "ml_gtk_spin_button_get_value"

(** Set property: value *)
external set_value : t -> float -> unit = "ml_gtk_spin_button_set_value"

(** Get property: wrap *)
external get_wrap : t -> bool = "ml_gtk_spin_button_get_wrap"

(** Set property: wrap *)
external set_wrap : t -> bool -> unit = "ml_gtk_spin_button_set_wrap"

external update : t -> unit = "ml_gtk_spin_button_update"

external spin : t -> unit -> unit -> unit = "ml_gtk_spin_button_spin"

external set_update_policy : t -> int -> unit = "ml_gtk_spin_button_set_update_policy"

external set_range : t -> unit -> unit -> unit = "ml_gtk_spin_button_set_range"

external set_increments : t -> unit -> unit -> unit = "ml_gtk_spin_button_set_increments"

external set_adjustment : t -> unit -> unit = "ml_gtk_spin_button_set_adjustment"

external get_value_as_int : t -> unit = "ml_gtk_spin_button_get_value_as_int"

external get_update_policy : t -> int = "ml_gtk_spin_button_get_update_policy"

external get_range : t -> unit -> unit -> unit = "ml_gtk_spin_button_get_range"

external get_increments : t -> unit -> unit -> unit = "ml_gtk_spin_button_get_increments"

external get_adjustment : t -> unit = "ml_gtk_spin_button_get_adjustment"

external configure : t -> unit -> unit -> int -> unit = "ml_gtk_spin_button_configure"

