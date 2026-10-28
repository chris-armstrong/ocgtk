(** Shows text in a predefined area.

    Its methods, signals and properties are on {!class-type-inscription_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Inscription}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Inscription].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Accessible_text.class-type-accessible_text_t}Ocgtk.Accessible_text}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}

    Shows text in a predefined area.

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
class type inscription_t = object
  inherit Widget.widget_t
  inherit Accessible_text.accessible_text_t

  (** {2:methods Methods} *)

  method get_attributes : unit -> Ocpango.Attr_list.attr_list_t option
  (** Gets the inscription's attribute list. *)

  method get_min_chars : unit -> int
  (** Gets the [min-chars] of the inscription.

      See the [Gtk.Inscription:min-chars] property. *)

  method get_min_lines : unit -> int
  (** Gets the [min-lines] of the inscription.

      See the [Gtk.Inscription:min-lines] property. *)

  method get_nat_chars : unit -> int
  (** Gets the [nat-chars] of the inscription.

      See the [Gtk.Inscription:nat-chars] property. *)

  method get_nat_lines : unit -> int
  (** Gets the [nat-lines] of the inscription.

      See the [Gtk.Inscription:nat-lines] property. *)

  method get_text : unit -> string option
  (** Gets the text that is displayed. *)

  method get_text_overflow : unit -> Enums.inscriptionoverflow
  (** Gets the inscription's overflow method. *)

  method get_wrap_mode : unit -> Ocpango.Enums.wrapmode
  (** Returns line wrap mode used by the inscription.

      See [Gtk.Inscription.set_wrap_mode]. *)

  method get_xalign : unit -> float
  (** Gets the [xalign] of the inscription.

      See the [Gtk.Inscription:xalign] property. *)

  method get_yalign : unit -> float
  (** Gets the [yalign] of the inscription.

      See the [Gtk.Inscription:yalign] property. *)

  method set_attributes : Ocpango.Attr_list.attr_list_t option -> unit
  (** Apply attributes to the inscription text.

      These attributes will not be evaluated for sizing the inscription. *)

  method set_markup : string option -> unit
  (** Utility function to set the text and attributes to be displayed.

      See the [Gtk.Inscription:markup] property. *)

  method set_min_chars : int -> unit
  (** Sets the [min-chars] of the inscription.

      See the [Gtk.Inscription:min-chars] property. *)

  method set_min_lines : int -> unit
  (** Sets the [min-lines] of the inscription.

      See the [Gtk.Inscription:min-lines] property. *)

  method set_nat_chars : int -> unit
  (** Sets the [nat-chars] of the inscription.

      See the [Gtk.Inscription:nat-chars] property. *)

  method set_nat_lines : int -> unit
  (** Sets the [nat-lines] of the inscription.

      See the [Gtk.Inscription:nat-lines] property. *)

  method set_text : string option -> unit
  (** Sets the text to be displayed. *)

  method set_text_overflow : Enums.inscriptionoverflow -> unit
  (** Sets what to do when the text doesn't fit. *)

  method set_wrap_mode : Ocpango.Enums.wrapmode -> unit
  (** Controls how line wrapping is done. *)

  method set_xalign : float -> unit
  (** Sets the [xalign] of the inscription.

      See the [Gtk.Inscription:xalign] property. *)

  method set_yalign : float -> unit
  (** Sets the [yalign] of the inscription.

      See the [Gtk.Inscription:yalign] property. *)

  (** {2:conversions Conversions} *)

  method as_inscription : Raw.Inscription.t
end

class inscription : Raw.Inscription.t -> inscription_t
(** Wraps a raw handle of {!Ocgtk.Raw.Inscription.t}. *)

(** {1:description Description}

    Shows text in a predefined area.

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

(** {1:constructors Constructors} *)

val new_ : string option -> inscription_t
(** Creates a new [GtkInscription] with the given text. *)
