class type resource_t = object
  method _register : unit -> unit
  method _unregister : unit -> unit

  method enumerate_children :
    string -> Enums.resourcelookupflags -> (string array, GError.t) result

  method has_children : string -> bool

  method lookup_data :
    string -> Enums.resourcelookupflags -> (Glib_bytes.t, GError.t) result

  method open_stream :
    string ->
    Enums.resourcelookupflags ->
    (Input_stream.input_stream_t, GError.t) result

  method ref : unit -> Raw.Resource.t
  method as_resource : Raw.Resource.t
end

class resource : Raw.Resource.t -> resource_t

val new_from_data : Glib_bytes.t -> (resource_t, GError.t) result
