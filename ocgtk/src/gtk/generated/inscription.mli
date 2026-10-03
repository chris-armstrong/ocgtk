(* GENERATED CODE - DO NOT EDIT *)
(* Inscription: Inscription *)

(** Shows text in a predefined area.

    You likely want to use [GtkLabel] instead as this widget is intended only
    for a small subset of use cases. The main scenario envisaged is inside lists
    such as [GtkColumnView].

    While a [GtkLabel] sizes itself depending on the text that is displayed,
    [GtkInscription] is given a size and inscribes the given text into that
    space as well as it can.

    Users of this widget should take care to plan behaviour for the common case
    where the text doesn't fit exactly in the allocated space.

    {b CSS nodes}

    [GtkInscription] has a single CSS node with the name label. *)

type t = [ `inscription | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : string option -> t = "ml_gtk_inscription_new"
(** Create a new Inscription *)

(* Methods *)

external set_yalign : t -> float -> unit = "ml_gtk_inscription_set_yalign"
(** Sets the [yalign] of the inscription.

    See the [Gtk.Inscription:yalign] property. *)

external set_xalign : t -> float -> unit = "ml_gtk_inscription_set_xalign"
(** Sets the [xalign] of the inscription.

    See the [Gtk.Inscription:xalign] property. *)

external set_wrap_mode : t -> Ocgtk_pango.Pango.wrapmode -> unit
  = "ml_gtk_inscription_set_wrap_mode"
(** Controls how line wrapping is done. *)

external set_text_overflow : t -> Gtk_enums.inscriptionoverflow -> unit
  = "ml_gtk_inscription_set_text_overflow"
(** Sets what to do when the text doesn't fit. *)

external set_text : t -> string option -> unit = "ml_gtk_inscription_set_text"
(** Sets the text to be displayed. *)

external set_nat_lines : t -> int -> unit = "ml_gtk_inscription_set_nat_lines"
(** Sets the [nat-lines] of the inscription.

    See the [Gtk.Inscription:nat-lines] property. *)

external set_nat_chars : t -> int -> unit = "ml_gtk_inscription_set_nat_chars"
(** Sets the [nat-chars] of the inscription.

    See the [Gtk.Inscription:nat-chars] property. *)

external set_min_lines : t -> int -> unit = "ml_gtk_inscription_set_min_lines"
(** Sets the [min-lines] of the inscription.

    See the [Gtk.Inscription:min-lines] property. *)

external set_min_chars : t -> int -> unit = "ml_gtk_inscription_set_min_chars"
(** Sets the [min-chars] of the inscription.

    See the [Gtk.Inscription:min-chars] property. *)

external set_markup : t -> string option -> unit
  = "ml_gtk_inscription_set_markup"
(** Utility function to set the text and attributes to be displayed.

    See the [Gtk.Inscription:markup] property. *)

external set_attributes :
  t -> Ocgtk_pango.Pango.Wrappers.Attr_list.t option -> unit
  = "ml_gtk_inscription_set_attributes"
(** Apply attributes to the inscription text.

    These attributes will not be evaluated for sizing the inscription. *)

external get_yalign : t -> float = "ml_gtk_inscription_get_yalign"
(** Gets the [yalign] of the inscription.

    See the [Gtk.Inscription:yalign] property. *)

external get_xalign : t -> float = "ml_gtk_inscription_get_xalign"
(** Gets the [xalign] of the inscription.

    See the [Gtk.Inscription:xalign] property. *)

external get_wrap_mode : t -> Ocgtk_pango.Pango.wrapmode
  = "ml_gtk_inscription_get_wrap_mode"
(** Returns line wrap mode used by the inscription.

    See [Gtk.Inscription.set_wrap_mode]. *)

external get_text_overflow : t -> Gtk_enums.inscriptionoverflow
  = "ml_gtk_inscription_get_text_overflow"
(** Gets the inscription's overflow method. *)

external get_text : t -> string option = "ml_gtk_inscription_get_text"
(** Gets the text that is displayed. *)

external get_nat_lines : t -> int = "ml_gtk_inscription_get_nat_lines"
(** Gets the [nat-lines] of the inscription.

    See the [Gtk.Inscription:nat-lines] property. *)

external get_nat_chars : t -> int = "ml_gtk_inscription_get_nat_chars"
(** Gets the [nat-chars] of the inscription.

    See the [Gtk.Inscription:nat-chars] property. *)

external get_min_lines : t -> int = "ml_gtk_inscription_get_min_lines"
(** Gets the [min-lines] of the inscription.

    See the [Gtk.Inscription:min-lines] property. *)

external get_min_chars : t -> int = "ml_gtk_inscription_get_min_chars"
(** Gets the [min-chars] of the inscription.

    See the [Gtk.Inscription:min-chars] property. *)

external get_attributes : t -> Ocgtk_pango.Pango.Wrappers.Attr_list.t option
  = "ml_gtk_inscription_get_attributes"
(** Gets the inscription's attribute list. *)

(* Properties *)
