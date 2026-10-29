class type scale_t = object
  inherit Range.range_t

  (** {2:methods Methods} *)

  method add_mark : float -> Enums.positiontype -> string option -> unit
  (** Adds a mark at [value].

      A mark is indicated visually by drawing a tick mark next to the scale, and
      GTK makes it easy for the user to position the scale exactly at the marks
      value.

      If [markup] is not [None], text is shown next to the tick mark.

      To remove marks from a scale, use [Gtk.Scale.clear_marks]. *)

  method clear_marks : unit -> unit
  (** Removes any marks that have been added. *)

  method get_digits : unit -> int
  (** Gets the number of decimal places that are displayed in the value. *)

  method get_draw_value : unit -> bool
  (** Returns whether the current value is displayed as a string next to the
      slider. *)

  method get_has_origin : unit -> bool
  (** Returns whether the scale has an origin. *)

  method get_layout : unit -> Ocpango.Layout.layout_t option
  (** Gets the [PangoLayout] used to display the scale.

      The returned object is owned by the scale so does not need to be freed by
      the caller. *)

  method get_value_pos : unit -> Enums.positiontype
  (** Gets the position in which the current value is displayed. *)

  method set_digits : int -> unit
  (** Sets the number of decimal places that are displayed in the value.

      Also causes the value of the adjustment to be rounded to this number of
      digits, so the retrieved value matches the displayed one, if
      [Gtk.Scale:draw-value] is [true] when the value changes. If you want to
      enforce rounding the value when [Gtk.Scale:draw-value] is [false], you can
      set [Gtk.Range:round-digits] instead.

      Note that rounding to a small number of digits can interfere with the
      smooth autoscrolling that is built into [GtkScale]. As an alternative, you
      can use [Gtk.Scale.set_format_value_func] to format the displayed value
      yourself. *)

  method set_draw_value : bool -> unit
  (** Specifies whether the current value is displayed as a string next to the
      slider. *)

  method set_has_origin : bool -> unit
  (** Sets whether the scale has an origin.

      If [Gtk.Scale:has-origin] is set to [true] (the default), the scale will
      highlight the part of the trough between the origin (bottom or left side)
      and the current value. *)

  method set_value_pos : Enums.positiontype -> unit
  (** Sets the position in which the current value is displayed. *)

  (** {2:conversions Conversions} *)

  method as_scale : Raw.Scale.t
end

(* High-level class for Scale *)
class scale (obj : Raw.Scale.t) : scale_t =
  object (self)
    inherit Range.range (obj :> Raw.Range.t)

    method add_mark : float -> Enums.positiontype -> string option -> unit =
      fun value position markup -> Raw.Scale.add_mark obj value position markup

    method clear_marks : unit -> unit = fun () -> Raw.Scale.clear_marks obj
    method get_digits : unit -> int = fun () -> Raw.Scale.get_digits obj

    method get_draw_value : unit -> bool =
      fun () -> Raw.Scale.get_draw_value obj

    method get_has_origin : unit -> bool =
      fun () -> Raw.Scale.get_has_origin obj

    method get_layout : unit -> Ocpango.Layout.layout_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocpango.Layout.layout ret)
          (Raw.Scale.get_layout obj)

    method get_value_pos : unit -> Enums.positiontype =
      fun () -> Raw.Scale.get_value_pos obj

    method set_digits : int -> unit =
      fun digits -> Raw.Scale.set_digits obj digits

    method set_draw_value : bool -> unit =
      fun draw_value -> Raw.Scale.set_draw_value obj draw_value

    method set_has_origin : bool -> unit =
      fun has_origin -> Raw.Scale.set_has_origin obj has_origin

    method set_value_pos : Enums.positiontype -> unit =
      fun pos -> Raw.Scale.set_value_pos obj pos

    method as_scale = obj
  end

let new_ (orientation : Enums.orientation)
    (adjustment : Adjustment.adjustment_t option) : scale_t =
  let adjustment = Option.map (fun c -> c#as_adjustment) adjustment in
  let obj_ = Raw.Scale.new_ orientation adjustment in
  new scale obj_

let new_with_range (orientation : Enums.orientation) (min : float) (max : float)
    (step : float) : scale_t =
  let obj_ = Raw.Scale.new_with_range orientation min max step in
  new scale obj_
