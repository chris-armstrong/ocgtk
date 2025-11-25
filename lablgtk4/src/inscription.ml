(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Inscription *)

type t = [`inscription | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new Inscription *)
external new_ : string option -> t = "ml_gtk_inscription_new"

(* Properties *)

(** Sets the `yalign` of the inscription.

See the [property@Gtk.Inscription:yalign] property. *)
external set_yalign : t -> float -> unit = "ml_gtk_inscription_set_yalign"

(** Sets the `xalign` of the inscription.

See the [property@Gtk.Inscription:xalign] property. *)
external set_xalign : t -> float -> unit = "ml_gtk_inscription_set_xalign"

(** Controls how line wrapping is done. *)
external set_wrap_mode : t -> Pango.wrapmode -> unit = "ml_gtk_inscription_set_wrap_mode"

(** Sets what to do when the text doesn't fit. *)
external set_text_overflow : t -> Gtk_enums.inscriptionoverflow -> unit = "ml_gtk_inscription_set_text_overflow"

(** Sets the text to be displayed. *)
external set_text : t -> string option -> unit = "ml_gtk_inscription_set_text"

(** Sets the `nat-lines` of the inscription.

See the [property@Gtk.Inscription:nat-lines] property. *)
external set_nat_lines : t -> int -> unit = "ml_gtk_inscription_set_nat_lines"

(** Sets the `nat-chars` of the inscription.

See the [property@Gtk.Inscription:nat-chars] property. *)
external set_nat_chars : t -> int -> unit = "ml_gtk_inscription_set_nat_chars"

(** Sets the `min-lines` of the inscription.

See the [property@Gtk.Inscription:min-lines] property. *)
external set_min_lines : t -> int -> unit = "ml_gtk_inscription_set_min_lines"

(** Sets the `min-chars` of the inscription.

See the [property@Gtk.Inscription:min-chars] property. *)
external set_min_chars : t -> int -> unit = "ml_gtk_inscription_set_min_chars"

(** Utility function to set the text and attributes to be displayed.

See the [property@Gtk.Inscription:markup] property. *)
external set_markup : t -> string option -> unit = "ml_gtk_inscription_set_markup"

(** Gets the `yalign` of the inscription.

See the [property@Gtk.Inscription:yalign] property. *)
external get_yalign : t -> float = "ml_gtk_inscription_get_yalign"

(** Gets the `xalign` of the inscription.

See the [property@Gtk.Inscription:xalign] property. *)
external get_xalign : t -> float = "ml_gtk_inscription_get_xalign"

(** Returns line wrap mode used by the inscription.

See [method@Gtk.Inscription.set_wrap_mode]. *)
external get_wrap_mode : t -> Pango.wrapmode = "ml_gtk_inscription_get_wrap_mode"

(** Gets the inscription's overflow method. *)
external get_text_overflow : t -> Gtk_enums.inscriptionoverflow = "ml_gtk_inscription_get_text_overflow"

(** Gets the text that is displayed. *)
external get_text : t -> string = "ml_gtk_inscription_get_text"

(** Gets the `nat-lines` of the inscription.

See the [property@Gtk.Inscription:nat-lines] property. *)
external get_nat_lines : t -> int = "ml_gtk_inscription_get_nat_lines"

(** Gets the `nat-chars` of the inscription.

See the [property@Gtk.Inscription:nat-chars] property. *)
external get_nat_chars : t -> int = "ml_gtk_inscription_get_nat_chars"

(** Gets the `min-lines` of the inscription.

See the [property@Gtk.Inscription:min-lines] property. *)
external get_min_lines : t -> int = "ml_gtk_inscription_get_min_lines"

(** Gets the `min-chars` of the inscription.

See the [property@Gtk.Inscription:min-chars] property. *)
external get_min_chars : t -> int = "ml_gtk_inscription_get_min_chars"

