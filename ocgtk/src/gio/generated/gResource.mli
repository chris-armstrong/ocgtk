class resource : Resource.t ->
  object
    method _register : unit -> unit
    method _unregister : unit -> unit
    method open_stream : string -> Gio_enums.resourcelookupflags -> (GInput_stream.input_stream, GError.t) result
    method ref : unit -> Resource.t
    method unref : unit -> unit
    method as_resource : Resource.t
  end

