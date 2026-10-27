(** The shadow parameters in a shadow node.

    Its methods, signals and properties are on {!class-type-shadow_t}. The
    functions it is built on are in {!Ocgsk.Raw.Shadow}. *)

(** The methods, signals and properties of a [GskShadow]. *)
class type shadow_t = object
  method as_shadow : Raw.Shadow.t
end

class shadow : Raw.Shadow.t -> shadow_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Shadow.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GskShadow], give one already wrapped. *)
