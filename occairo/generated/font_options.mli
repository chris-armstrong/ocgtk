(** Bindings for [FontOptions].

    Its methods, signals and properties are on {!class-type-font_options_t}. The
    functions it is built on are in {!Occairo.Raw.Font_options}. *)

(** {b The methods, signals and properties of a [FontOptions].} *)
class type font_options_t = object
  method as_font_options : Raw.Font_options.t
end

class font_options : Raw.Font_options.t -> font_options_t
(** Wraps a raw handle of {!Occairo.Raw.Font_options.t}. *)
