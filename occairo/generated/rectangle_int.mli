(** Bindings for [RectangleInt].

    Its methods, signals and properties are on {!class-type-rectangle_int_t}.
    The functions it is built on are in {!Occairo.Raw.Rectangle_int}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [RectangleInt].} *)
class type rectangle_int_t = object
  method as_rectangle_int : Raw.Rectangle_int.t
end

class rectangle_int : Raw.Rectangle_int.t -> rectangle_int_t
(** Wraps a raw handle of {!Occairo.Raw.Rectangle_int.t}. *)
