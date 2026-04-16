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

class font_metrics : Font_metrics.t -> font_metrics_t
