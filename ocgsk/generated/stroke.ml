class type stroke_t = object
  method get_dash_offset : unit -> float
  method get_line_cap : unit -> Enums.linecap
  method get_line_join : unit -> Enums.linejoin
  method get_line_width : unit -> float
  method get_miter_limit : unit -> float
  method set_dash : float array option -> Gsize.t -> unit
  method set_dash_offset : float -> unit
  method set_line_cap : Enums.linecap -> unit
  method set_line_join : Enums.linejoin -> unit
  method set_line_width : float -> unit
  method set_miter_limit : float -> unit
  method to_cairo : Occairo.Context.context_t -> unit
  method as_stroke : Raw.Stroke.t
end

(* High-level class for Stroke *)
class stroke (obj : Raw.Stroke.t) : stroke_t =
  object (self)
    method get_dash_offset : unit -> float =
      fun () -> Raw.Stroke.get_dash_offset obj

    method get_line_cap : unit -> Enums.linecap =
      fun () -> Raw.Stroke.get_line_cap obj

    method get_line_join : unit -> Enums.linejoin =
      fun () -> Raw.Stroke.get_line_join obj

    method get_line_width : unit -> float =
      fun () -> Raw.Stroke.get_line_width obj

    method get_miter_limit : unit -> float =
      fun () -> Raw.Stroke.get_miter_limit obj

    method set_dash : float array option -> Gsize.t -> unit =
      fun dash n_dash -> Raw.Stroke.set_dash obj dash n_dash

    method set_dash_offset : float -> unit =
      fun offset -> Raw.Stroke.set_dash_offset obj offset

    method set_line_cap : Enums.linecap -> unit =
      fun line_cap -> Raw.Stroke.set_line_cap obj line_cap

    method set_line_join : Enums.linejoin -> unit =
      fun line_join -> Raw.Stroke.set_line_join obj line_join

    method set_line_width : float -> unit =
      fun line_width -> Raw.Stroke.set_line_width obj line_width

    method set_miter_limit : float -> unit =
      fun limit -> Raw.Stroke.set_miter_limit obj limit

    method to_cairo : Occairo.Context.context_t -> unit =
      fun cr ->
        let cr = cr#as_context in
        Raw.Stroke.to_cairo obj cr

    method as_stroke = obj
  end

let new_ (line_width : float) : stroke_t =
  let obj_ = Raw.Stroke.new_ line_width in
  new stroke obj_
