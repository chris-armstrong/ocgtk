(** Bindings for [cairo_region_t].

    Its methods, signals and properties are on {!class-type-region_t}. The
    functions it is built on are in {!Occairo.Raw.Region}. *)

(** The methods, signals and properties of a [cairo_region_t]. *)
class type region_t = object
  method as_region : Raw.Region.t
end

class region : Raw.Region.t -> region_t
(** Wraps a layer 1 handle, {!Occairo.Raw.Region.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [cairo_region_t], give one already wrapped. *)
