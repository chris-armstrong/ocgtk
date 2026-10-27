(** Bindings for [cairo_pattern_t].

    Its methods, signals and properties are on {!class-type-pattern_t}. The
    functions it is built on are in {!Occairo.Raw.Pattern}. *)

(** The methods, signals and properties of a [cairo_pattern_t]. *)
class type pattern_t = object
  method as_pattern : Raw.Pattern.t
end

class pattern : Raw.Pattern.t -> pattern_t
(** Wraps a layer 1 handle, {!Occairo.Raw.Pattern.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [cairo_pattern_t], give one already wrapped. *)
