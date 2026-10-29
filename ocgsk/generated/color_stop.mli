(** A color stop in a gradient node.

    Its methods, signals and properties are on {!class-type-color_stop_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgsk.Raw.Color_stop}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ColorStop].}

    A color stop in a gradient node. *)
class type color_stop_t = object
  (** {2:conversions Conversions} *)

  method as_color_stop : Raw.Color_stop.t
end

class color_stop : Raw.Color_stop.t -> color_stop_t
(** Wraps a raw handle of {!Ocgsk.Raw.Color_stop.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
