(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Inscription *)

type t = [`inscription | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new Inscription *)
external new_ : string option -> t = "ml_gtk_inscription_new"

(* Properties *)

(** Get property: markup *)
external get_markup : t -> string = "ml_gtk_inscription_get_markup"

(** Set property: markup *)
external set_markup : t -> string -> unit = "ml_gtk_inscription_set_markup"

(** Get property: min-chars *)
external get_min_chars : t -> int = "ml_gtk_inscription_get_min_chars"

(** Set property: min-chars *)
external set_min_chars : t -> int -> unit = "ml_gtk_inscription_set_min_chars"

(** Get property: min-lines *)
external get_min_lines : t -> int = "ml_gtk_inscription_get_min_lines"

(** Set property: min-lines *)
external set_min_lines : t -> int -> unit = "ml_gtk_inscription_set_min_lines"

(** Get property: nat-chars *)
external get_nat_chars : t -> int = "ml_gtk_inscription_get_nat_chars"

(** Set property: nat-chars *)
external set_nat_chars : t -> int -> unit = "ml_gtk_inscription_set_nat_chars"

(** Get property: nat-lines *)
external get_nat_lines : t -> int = "ml_gtk_inscription_get_nat_lines"

(** Set property: nat-lines *)
external set_nat_lines : t -> int -> unit = "ml_gtk_inscription_set_nat_lines"

(** Get property: text *)
external get_text : t -> string = "ml_gtk_inscription_get_text"

(** Set property: text *)
external set_text : t -> string -> unit = "ml_gtk_inscription_set_text"

(** Get property: xalign *)
external get_xalign : t -> float = "ml_gtk_inscription_get_xalign"

(** Set property: xalign *)
external set_xalign : t -> float -> unit = "ml_gtk_inscription_set_xalign"

(** Get property: yalign *)
external get_yalign : t -> float = "ml_gtk_inscription_get_yalign"

(** Set property: yalign *)
external set_yalign : t -> float -> unit = "ml_gtk_inscription_set_yalign"

(** Controls how line wrapping is done. *)
external set_wrap_mode : t -> Pango.wrapmode -> unit = "ml_gtk_inscription_set_wrap_mode"

(** Sets what to do when the text doesn't fit. *)
external set_text_overflow : t -> Gtk_enums.inscriptionoverflow -> unit = "ml_gtk_inscription_set_text_overflow"

(** Returns line wrap mode used by the inscription.

See [method@Gtk.Inscription.set_wrap_mode]. *)
external get_wrap_mode : t -> Pango.wrapmode = "ml_gtk_inscription_get_wrap_mode"

(** Gets the inscription's overflow method. *)
external get_text_overflow : t -> Gtk_enums.inscriptionoverflow = "ml_gtk_inscription_get_text_overflow"

