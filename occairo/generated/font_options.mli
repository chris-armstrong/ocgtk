(** Bindings for [cairo_font_options_t].

    Its methods, signals and properties are on {!class-type-font_options_t}. The
    functions it is built on are in {!Occairo.Raw.Font_options}. *)

(** The methods, signals and properties of a [cairo_font_options_t]. *)
class type font_options_t = object
  method as_font_options : Raw.Font_options.t
end

class font_options : Raw.Font_options.t -> font_options_t
(** Wraps a layer 1 handle, {!Occairo.Raw.Font_options.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [cairo_font_options_t], give one already wrapped. *)
