class static_resource : Static_resource.t ->
  object
    method fini : unit -> unit
    method get_resource : unit -> Resource.t
    method init : unit -> unit
    method as_static_resource : Static_resource.t
  end

