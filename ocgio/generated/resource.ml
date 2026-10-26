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

(* High-level class for Resource *)
class resource (obj : Raw.Resource.t) : resource_t =
  object (self)
    method _register : unit -> unit = fun () -> Raw.Resource._register obj
    method _unregister : unit -> unit = fun () -> Raw.Resource._unregister obj

    method enumerate_children :
        string -> Enums.resourcelookupflags -> (string array, GError.t) result =
      fun path lookup_flags ->
        Raw.Resource.enumerate_children obj path lookup_flags

    method has_children : string -> bool =
      fun path -> Raw.Resource.has_children obj path

    method lookup_data :
        string -> Enums.resourcelookupflags -> (Glib_bytes.t, GError.t) result =
      fun path lookup_flags -> Raw.Resource.lookup_data obj path lookup_flags

    method open_stream :
        string ->
        Enums.resourcelookupflags ->
        (Input_stream.input_stream_t, GError.t) result =
      fun path lookup_flags ->
        Result.map
          (fun ret -> new Input_stream.input_stream ret)
          (Raw.Resource.open_stream obj path lookup_flags)

    method ref : unit -> Raw.Resource.t = fun () -> Raw.Resource.ref obj
    method as_resource = obj
  end

let new_from_data (data : Glib_bytes.t) : (resource_t, GError.t) result =
  let obj_ = Raw.Resource.new_from_data data in
  Result.map (fun obj_ -> new resource obj_) obj_
