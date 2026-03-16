class stroke : Stroke.t ->
  object
    method copy : unit -> Stroke.t
    method free : unit -> unit
    method get_dash_offset : unit -> float
    method get_line_cap : unit -> Gsk_enums.linecap
    method get_line_join : unit -> Gsk_enums.linejoin
    method get_line_width : unit -> float
    method get_miter_limit : unit -> float
    method set_dash_offset : float -> unit
    method set_line_cap : Gsk_enums.linecap -> unit
    method set_line_join : Gsk_enums.linejoin -> unit
    method set_line_width : float -> unit
    method set_miter_limit : float -> unit
    method as_stroke : Stroke.t
  end

