(** Bindings for [cairo_rectangle_t].

    Its methods, signals and properties are on {!class-type-rectangle_t}. The
    functions it is built on are in {!Occairo.Raw.Rectangle}. *)

(** The methods, signals and properties of a [cairo_rectangle_t]. *)
class type rectangle_t = object
  method as_rectangle : Raw.Rectangle.t
end

class rectangle : Raw.Rectangle.t -> rectangle_t
(** Wraps a layer 1 handle, {!Occairo.Raw.Rectangle.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [cairo_rectangle_t], give one already wrapped. *)
