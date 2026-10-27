(** A [PangoFontMetrics] structure holds the overall metric information for a
    font.

    The information in a [PangoFontMetrics] structure may be restricted to a
    script. The fields of this structure are private to implementations of a
    font backend. See the documentation of the corresponding getters for
    documentation of their meaning.

    For an overview of the most important metrics, see:

    Font metrics

    Its methods, signals and properties are on {!class-type-font_metrics_t}. The
    functions it is built on are in {!Ocpango.Raw.Font_metrics}. *)

(** The methods, signals and properties of a [PangoFontMetrics]. *)
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
  method ref : unit -> Raw.Font_metrics.t option
  method as_font_metrics : Raw.Font_metrics.t
end

class font_metrics : Raw.Font_metrics.t -> font_metrics_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Font_metrics.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [PangoFontMetrics], give one already wrapped. *)
