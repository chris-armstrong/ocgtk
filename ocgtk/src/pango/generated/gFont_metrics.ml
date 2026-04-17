class type font_metrics_t = object
    method get_approximate_char_width : unit -> int
    method get_approximate_digit_width : unit -> int
    method get_ascent : unit -> int
    method get_descent : unit -> int
    method get_height : unit -> int
    method get_strikethrough_position : unit -> int
    method get_strikethrough_thickness : unit -> int
    method get_underline_position : unit -> int
    method get_underline_thickness : unit -> int
    method ref : unit -> Font_metrics.t option
    method unref : unit -> unit
    method as_font_metrics : Font_metrics.t
end

(* High-level class for FontMetrics *)
class font_metrics (obj : Font_metrics.t) : font_metrics_t = object (self)

  method get_approximate_char_width : unit -> int =
    fun () ->
      (Font_metrics.get_approximate_char_width obj)

  method get_approximate_digit_width : unit -> int =
    fun () ->
      (Font_metrics.get_approximate_digit_width obj)

  method get_ascent : unit -> int =
    fun () ->
      (Font_metrics.get_ascent obj)

  method get_descent : unit -> int =
    fun () ->
      (Font_metrics.get_descent obj)

  method get_height : unit -> int =
    fun () ->
      (Font_metrics.get_height obj)

  method get_strikethrough_position : unit -> int =
    fun () ->
      (Font_metrics.get_strikethrough_position obj)

  method get_strikethrough_thickness : unit -> int =
    fun () ->
      (Font_metrics.get_strikethrough_thickness obj)

  method get_underline_position : unit -> int =
    fun () ->
      (Font_metrics.get_underline_position obj)

  method get_underline_thickness : unit -> int =
    fun () ->
      (Font_metrics.get_underline_thickness obj)

  method ref : unit -> Font_metrics.t option =
    fun () ->
      (Font_metrics.ref obj)

  method unref : unit -> unit =
    fun () ->
      (Font_metrics.unref obj)

    method as_font_metrics = obj
end

