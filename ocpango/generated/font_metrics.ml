class type font_metrics_t = object
  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_font_metrics : Raw.Font_metrics.t
end

(* High-level class for FontMetrics *)
class font_metrics (obj : Raw.Font_metrics.t) : font_metrics_t =
  object (self)
    method get_approximate_char_width : unit -> int =
      fun () -> Raw.Font_metrics.get_approximate_char_width obj

    method get_approximate_digit_width : unit -> int =
      fun () -> Raw.Font_metrics.get_approximate_digit_width obj

    method get_ascent : unit -> int = fun () -> Raw.Font_metrics.get_ascent obj

    method get_descent : unit -> int =
      fun () -> Raw.Font_metrics.get_descent obj

    method get_height : unit -> int = fun () -> Raw.Font_metrics.get_height obj

    method get_strikethrough_position : unit -> int =
      fun () -> Raw.Font_metrics.get_strikethrough_position obj

    method get_strikethrough_thickness : unit -> int =
      fun () -> Raw.Font_metrics.get_strikethrough_thickness obj

    method get_underline_position : unit -> int =
      fun () -> Raw.Font_metrics.get_underline_position obj

    method get_underline_thickness : unit -> int =
      fun () -> Raw.Font_metrics.get_underline_thickness obj

    method ref : unit -> Raw.Font_metrics.t option =
      fun () -> Raw.Font_metrics.ref obj

    method as_font_metrics = obj
  end
