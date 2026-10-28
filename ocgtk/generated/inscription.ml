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

(* High-level class for Inscription *)
class inscription (obj : Raw.Inscription.t) : inscription_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)

    inherit
      Accessible_text.accessible_text (Raw.Accessible_text.from_gobject obj)

    method get_attributes : unit -> Ocpango.Attr_list.attr_list_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocpango.Attr_list.attr_list ret)
          (Raw.Inscription.get_attributes obj)

    method get_min_chars : unit -> int =
      fun () -> Raw.Inscription.get_min_chars obj

    method get_min_lines : unit -> int =
      fun () -> Raw.Inscription.get_min_lines obj

    method get_nat_chars : unit -> int =
      fun () -> Raw.Inscription.get_nat_chars obj

    method get_nat_lines : unit -> int =
      fun () -> Raw.Inscription.get_nat_lines obj

    method get_text : unit -> string option =
      fun () -> Raw.Inscription.get_text obj

    method get_text_overflow : unit -> Enums.inscriptionoverflow =
      fun () -> Raw.Inscription.get_text_overflow obj

    method get_wrap_mode : unit -> Ocpango.Enums.wrapmode =
      fun () -> Raw.Inscription.get_wrap_mode obj

    method get_xalign : unit -> float = fun () -> Raw.Inscription.get_xalign obj
    method get_yalign : unit -> float = fun () -> Raw.Inscription.get_yalign obj

    method set_attributes : Ocpango.Attr_list.attr_list_t option -> unit =
      fun attrs ->
        let attrs = Option.map (fun c -> c#as_attr_list) attrs in
        Raw.Inscription.set_attributes obj attrs

    method set_markup : string option -> unit =
      fun markup -> Raw.Inscription.set_markup obj markup

    method set_min_chars : int -> unit =
      fun min_chars -> Raw.Inscription.set_min_chars obj min_chars

    method set_min_lines : int -> unit =
      fun min_lines -> Raw.Inscription.set_min_lines obj min_lines

    method set_nat_chars : int -> unit =
      fun nat_chars -> Raw.Inscription.set_nat_chars obj nat_chars

    method set_nat_lines : int -> unit =
      fun nat_lines -> Raw.Inscription.set_nat_lines obj nat_lines

    method set_text : string option -> unit =
      fun text -> Raw.Inscription.set_text obj text

    method set_text_overflow : Enums.inscriptionoverflow -> unit =
      fun overflow -> Raw.Inscription.set_text_overflow obj overflow

    method set_wrap_mode : Ocpango.Enums.wrapmode -> unit =
      fun wrap_mode -> Raw.Inscription.set_wrap_mode obj wrap_mode

    method set_xalign : float -> unit =
      fun xalign -> Raw.Inscription.set_xalign obj xalign

    method set_yalign : float -> unit =
      fun yalign -> Raw.Inscription.set_yalign obj yalign

    method as_inscription = obj
  end

let new_ (text : string option) : inscription_t =
  let obj_ = Raw.Inscription.new_ text in
  new inscription obj_
