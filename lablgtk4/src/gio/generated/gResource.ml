(* High-level class for Resource *)
class resource (obj : Resource.t) = object (self)

  method _register : unit -> unit =
    fun () ->
      (Resource._register obj)

  method _unregister : unit -> unit =
    fun () ->
      (Resource._unregister obj)

  method open_stream : string -> Gio_enums.resourcelookupflags -> (GInput_stream.input_stream, GError.t) result =
    fun path lookup_flags ->
      Result.map (fun ret -> new GInput_stream.input_stream ret)(Resource.open_stream obj path lookup_flags)

  method ref : unit -> Resource.t =
    fun () ->
      (Resource.ref obj)

  method unref : unit -> unit =
    fun () ->
      (Resource.unref obj)

    method as_resource = obj
end

