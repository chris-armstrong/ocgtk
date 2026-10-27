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
  (** Gets the approximate character width for a font metrics structure.

      This is merely a representative value useful, for example, for determining
      the initial size for a window. Actual characters in text will be wider and
      narrower than this. *)

  method get_approximate_digit_width : unit -> int
  (** Gets the approximate digit width for a font metrics structure.

      This is merely a representative value useful, for example, for determining
      the initial size for a window. Actual digits in text can be wider or
      narrower than this, though this value is generally somewhat more accurate
      than the result of pango_font_metrics_get_approximate_char_width() for
      digits. *)

  method get_ascent : unit -> int
  (** Gets the ascent from a font metrics structure.

      The ascent is the distance from the baseline to the logical top of a line
      of text. (The logical top may be above or below the top of the actual
      drawn ink. It is necessary to lay out the text to figure where the ink
      will be.) *)

  method get_descent : unit -> int
  (** Gets the descent from a font metrics structure.

      The descent is the distance from the baseline to the logical bottom of a
      line of text. (The logical bottom may be above or below the bottom of the
      actual drawn ink. It is necessary to lay out the text to figure where the
      ink will be.) *)

  method get_height : unit -> int
  (** Gets the line height from a font metrics structure.

      The line height is the recommended distance between successive baselines
      in wrapped text using this font.

      If the line height is not available, 0 is returned. *)

  method get_strikethrough_position : unit -> int
  (** Gets the suggested position to draw the strikethrough.

      The value returned is the distance {i above} the baseline of the top of
      the strikethrough. *)

  method get_strikethrough_thickness : unit -> int
  (** Gets the suggested thickness to draw for the strikethrough. *)

  method get_underline_position : unit -> int
  (** Gets the suggested position to draw the underline.

      The value returned is the distance {i above} the baseline of the top of
      the underline. Since most fonts have underline positions beneath the
      baseline, this value is typically negative. *)

  method get_underline_thickness : unit -> int
  (** Gets the suggested thickness to draw for the underline. *)

  method ref : unit -> Raw.Font_metrics.t option
  (** Increase the reference count of a font metrics structure by one. *)

  method as_font_metrics : Raw.Font_metrics.t
end

class font_metrics : Raw.Font_metrics.t -> font_metrics_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Font_metrics.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [PangoFontMetrics], give one already wrapped. *)
