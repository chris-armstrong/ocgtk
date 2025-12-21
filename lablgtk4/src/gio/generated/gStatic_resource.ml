(* High-level class for StaticResource *)
class static_resource (obj : Static_resource.t) = object (self)

  method fini : unit -> unit =
    fun () ->
      (Static_resource.fini obj)

  method get_resource : unit -> Resource.t =
    fun () ->
      (Static_resource.get_resource obj)

  method init : unit -> unit =
    fun () ->
      (Static_resource.init obj)

    method as_static_resource = obj
end

