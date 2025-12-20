(* High-level class for Resource *)
class resource (obj : Resource.t) = object (self)

  method _register : unit -> unit =
    fun () ->
      (Resource._register obj)

  method _unregister : unit -> unit =
    fun () ->
      (Resource._unregister obj)

  method ref : unit -> Resource.t =
    fun () ->
      (Resource.ref obj)

  method unref : unit -> unit =
    fun () ->
      (Resource.unref obj)

    method as_resource = obj
end

