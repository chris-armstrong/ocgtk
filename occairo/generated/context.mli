(** Bindings for [cairo_t].

    Its methods, signals and properties are on {!class-type-context_t}. The
    functions it is built on are in {!Occairo.Raw.Context}. *)

(** The methods, signals and properties of a [cairo_t]. *)
class type context_t = object
  method as_context : Raw.Context.t
end

class context : Raw.Context.t -> context_t
(** Wraps a layer 1 handle, {!Occairo.Raw.Context.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [cairo_t], give one already wrapped. *)
