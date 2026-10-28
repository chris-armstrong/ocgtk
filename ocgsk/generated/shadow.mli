(** The shadow parameters in a shadow node.

    Its methods, signals and properties are on {!class-type-shadow_t}. The
    functions it is built on are in {!Ocgsk.Raw.Shadow}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Shadow].}

    The shadow parameters in a shadow node. *)
class type shadow_t = object
  (** {2:conversions Conversions} *)

  method as_shadow : Raw.Shadow.t
end

class shadow : Raw.Shadow.t -> shadow_t
(** Wraps a raw handle of {!Ocgsk.Raw.Shadow.t}. *)
