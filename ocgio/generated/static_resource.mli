(** [GStaticResource] is an opaque data structure and can only be accessed using
    the following functions.

    Its methods, signals and properties are on {!class-type-static_resource_t}.
    The functions it is built on are in {!Ocgio.Raw.Static_resource}. *)

(** The methods, signals and properties of a [GStaticResource]. *)
class type static_resource_t = object
  method fini : unit -> unit
  method get_resource : unit -> Raw.Resource.t
  method init : unit -> unit
  method as_static_resource : Raw.Static_resource.t
end

class static_resource : Raw.Static_resource.t -> static_resource_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Static_resource.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GStaticResource], give one already wrapped. *)
