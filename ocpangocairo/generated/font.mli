(** [PangoCairoFont] is an interface exported by fonts for use with Cairo.

    Its methods, signals and properties are on {!class-type-font_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocpangocairo.Raw.Font}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Font].}

    Requires:
    - {{!Ocpango.Font.class-type-font_t}Ocpango.Font}

    [PangoCairoFont] is an interface exported by fonts for use with Cairo.

    The actual type of the font will depend on the particular font technology
    Cairo was compiled to use. *)
class type font_t = object
  (** {2:methods Methods} *)

  method get_scaled_font : unit -> Occairo.Scaled_font.scaled_font_t option
  (** Gets the [cairo_scaled_font_t] used by [font]. The scaled font can be
      referenced and kept using [cairo_scaled_font_reference ()]. *)

  (** {2:conversions Conversions} *)

  method as_font : Raw.Font.t
end

class font : Raw.Font.t -> font_t
(** Wraps a raw handle of {!Ocpangocairo.Raw.Font.t}. *)

(** {1:description Description}

    [PangoCairoFont] is an interface exported by fonts for use with Cairo.

    The actual type of the font will depend on the particular font technology
    Cairo was compiled to use. *)

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
