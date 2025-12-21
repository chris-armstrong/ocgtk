class resource : Resource.t ->
  object
    method _register : unit -> unit
    method _unregister : unit -> unit
    method ref : unit -> Resource.t
    method unref : unit -> unit
    method as_resource : Resource.t
  end

