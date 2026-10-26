class type static_resource_t = object
  method fini : unit -> unit
  method get_resource : unit -> Raw.Resource.t
  method init : unit -> unit
  method as_static_resource : Raw.Static_resource.t
end

(* High-level class for StaticResource *)
class static_resource (obj : Raw.Static_resource.t) : static_resource_t =
  object (self)
    method fini : unit -> unit = fun () -> Raw.Static_resource.fini obj

    method get_resource : unit -> Raw.Resource.t =
      fun () -> Raw.Static_resource.get_resource obj

    method init : unit -> unit = fun () -> Raw.Static_resource.init obj
    method as_static_resource = obj
  end
