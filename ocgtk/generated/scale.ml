class type scale_t = object
  inherit Range.range_t
  method add_mark : float -> Enums.positiontype -> string option -> unit
  method clear_marks : unit -> unit
  method get_digits : unit -> int
  method get_draw_value : unit -> bool
  method get_has_origin : unit -> bool
  method get_layout : unit -> Ocpango.Layout.layout_t option
  method get_value_pos : unit -> Enums.positiontype
  method set_digits : int -> unit
  method set_draw_value : bool -> unit
  method set_has_origin : bool -> unit
  method set_value_pos : Enums.positiontype -> unit
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
