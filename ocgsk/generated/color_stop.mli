(** A color stop in a gradient node.

    Its methods, signals and properties are on {!class-type-color_stop_t}. The
    functions it is built on are in {!Ocgsk.Raw.Color_stop}. *)

(** The methods, signals and properties of a [GskColorStop]. *)
class type color_stop_t = object
  method as_color_stop : Raw.Color_stop.t
end

class color_stop : Raw.Color_stop.t -> color_stop_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Color_stop.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GskColorStop], give one already wrapped. *)
