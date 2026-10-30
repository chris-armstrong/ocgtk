(** Points at a location inside a CSS stream.

    Its methods, signals and properties are on {!class-type-css_location_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Css_location}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [CssLocation].}

    Points at a location inside a CSS stream. *)
class type css_location_t = object
  (** {2:conversions Conversions} *)

  method as_css_location : Raw.Css_location.t
end

class css_location : Raw.Css_location.t -> css_location_t
(** Wraps a raw handle of {!Ocgtk.Raw.Css_location.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
