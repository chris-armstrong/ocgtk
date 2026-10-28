(** A color stop in a gradient node.

    Its methods, signals and properties are on {!class-type-color_stop_t}. The
    functions it is built on are in {!Ocgsk.Raw.Color_stop}. *)

(** The methods, signals and properties of a [ColorStop]. *)
class type color_stop_t = object
  method as_color_stop : Raw.Color_stop.t
end

class color_stop : Raw.Color_stop.t -> color_stop_t
(** Wraps a raw handle of {!Ocgsk.Raw.Color_stop.t}. *)
