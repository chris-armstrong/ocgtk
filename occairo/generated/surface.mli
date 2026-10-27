(** Bindings for [cairo_surface_t].

    Its methods, signals and properties are on {!class-type-surface_t}. The
    functions it is built on are in {!Occairo.Raw.Surface}. *)

(** The methods, signals and properties of a [cairo_surface_t]. *)
class type surface_t = object
  method as_surface : Raw.Surface.t
end

class surface : Raw.Surface.t -> surface_t
(** Wraps a layer 1 handle, {!Occairo.Raw.Surface.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [cairo_surface_t], give one already wrapped. *)
