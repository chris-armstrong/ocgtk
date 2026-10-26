class type static_resource_t = object
  method fini : unit -> unit
  method get_resource : unit -> Raw.Resource.t
  method init : unit -> unit
  method as_static_resource : Raw.Static_resource.t
end

class static_resource : Raw.Static_resource.t -> static_resource_t
