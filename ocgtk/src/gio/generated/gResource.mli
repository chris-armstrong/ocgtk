class type resource_t = object
    method _register : unit -> unit
    method _unregister : unit -> unit
    method enumerate_children : string -> Gio_enums.resourcelookupflags -> (string array, GError.t) result
    method open_stream : string -> Gio_enums.resourcelookupflags -> (GInput_stream.input_stream_t, GError.t) result
    method ref : unit -> Resource.t
    method unref : unit -> unit
    method as_resource : Resource.t
end

class resource : Resource.t -> resource_t

