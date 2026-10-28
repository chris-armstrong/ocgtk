(** A CSS style change.

    Its methods, signals and properties are on {!class-type-css_style_change_t}.
    The functions it is built on are in {!Ocgtk.Raw.Css_style_change}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [CssStyleChange].}

    A CSS style change. *)
class type css_style_change_t = object
  (** {2:conversions Conversions} *)

  method as_css_style_change : Raw.Css_style_change.t
end

class css_style_change : Raw.Css_style_change.t -> css_style_change_t
(** Wraps a raw handle of {!Ocgtk.Raw.Css_style_change.t}. *)
