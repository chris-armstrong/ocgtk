(** Bindings for [Rectangle].

    Its methods, signals and properties are on {!class-type-rectangle_t}. The
    functions it is built on are in {!Occairo.Raw.Rectangle}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Rectangle].} *)
class type rectangle_t = object
  method as_rectangle : Raw.Rectangle.t
end

class rectangle : Raw.Rectangle.t -> rectangle_t
(** Wraps a raw handle of {!Occairo.Raw.Rectangle.t}. *)
