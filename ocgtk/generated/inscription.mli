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

    [GtkInscription] has a single CSS node with the name label.

    Its methods, signals and properties are on {!class-type-inscription_t}. The
    functions it is built on are in {!Ocgtk.Raw.Inscription}. *)

(** The methods, signals and properties of a [GtkInscription]. *)
class type inscription_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_text.accessible_text_t
  method get_attributes : unit -> Ocpango.Attr_list.attr_list_t option
  method get_min_chars : unit -> int
  method get_min_lines : unit -> int
  method get_nat_chars : unit -> int
  method get_nat_lines : unit -> int
  method get_text : unit -> string option
  method get_text_overflow : unit -> Enums.inscriptionoverflow
  method get_wrap_mode : unit -> Ocpango.Enums.wrapmode
  method get_xalign : unit -> float
  method get_yalign : unit -> float
  method set_attributes : Ocpango.Attr_list.attr_list_t option -> unit
  method set_markup : string option -> unit
  method set_min_chars : int -> unit
  method set_min_lines : int -> unit
  method set_nat_chars : int -> unit
  method set_nat_lines : int -> unit
  method set_text : string option -> unit
  method set_text_overflow : Enums.inscriptionoverflow -> unit
  method set_wrap_mode : Ocpango.Enums.wrapmode -> unit
  method set_xalign : float -> unit
  method set_yalign : float -> unit
  method as_inscription : Raw.Inscription.t
end

class inscription : Raw.Inscription.t -> inscription_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Inscription.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkInscription], give one already wrapped. *)

val new_ : string option -> inscription_t
