(* High-level class for Stroke *)
class stroke (obj : Stroke.t) = object (self)

  method copy : unit -> Stroke.t =
    fun () ->
      (Stroke.copy obj)

  method free : unit -> unit =
    fun () ->
      (Stroke.free obj)

  method get_dash_offset : unit -> float =
    fun () ->
      (Stroke.get_dash_offset obj)

  method get_line_cap : unit -> Gsk_enums.linecap =
    fun () ->
      (Stroke.get_line_cap obj)

  method get_line_join : unit -> Gsk_enums.linejoin =
    fun () ->
      (Stroke.get_line_join obj)

  method get_line_width : unit -> float =
    fun () ->
      (Stroke.get_line_width obj)

  method get_miter_limit : unit -> float =
    fun () ->
      (Stroke.get_miter_limit obj)

  method set_dash_offset : float -> unit =
    fun offset ->
      (Stroke.set_dash_offset obj offset)

  method set_line_cap : Gsk_enums.linecap -> unit =
    fun line_cap ->
      (Stroke.set_line_cap obj line_cap)

  method set_line_join : Gsk_enums.linejoin -> unit =
    fun line_join ->
      (Stroke.set_line_join obj line_join)

  method set_line_width : float -> unit =
    fun line_width ->
      (Stroke.set_line_width obj line_width)

  method set_miter_limit : float -> unit =
    fun limit ->
      (Stroke.set_miter_limit obj limit)

  method to_cairo : 'p1. (#Ocgtk_cairo.Cairo.context as 'p1) -> unit =
    fun cr ->
      let cr = cr#as_context in
      (Stroke.to_cairo obj cr)

    method as_stroke = obj
end

