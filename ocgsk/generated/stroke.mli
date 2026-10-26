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

class stroke : Raw.Stroke.t -> stroke_t

val new_ : float -> stroke_t
