(** Bindings for [cairo_rectangle_int_t].

    Its methods, signals and properties are on {!class-type-rectangle_int_t}.
    The functions it is built on are in {!Occairo.Raw.Rectangle_int}. *)

(** The methods, signals and properties of a [cairo_rectangle_int_t]. *)
class type rectangle_int_t = object
  method as_rectangle_int : Raw.Rectangle_int.t
end

class rectangle_int : Raw.Rectangle_int.t -> rectangle_int_t
(** Wraps a layer 1 handle, {!Occairo.Raw.Rectangle_int.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [cairo_rectangle_int_t], give one already wrapped. *)
