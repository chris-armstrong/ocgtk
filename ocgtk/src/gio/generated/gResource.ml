class type resource_t = object
  method _register : unit -> unit
  method _unregister : unit -> unit

  method enumerate_children :
    string -> Gio_enums.resourcelookupflags -> (string array, GError.t) result

  method lookup_data :
    string -> Gio_enums.resourcelookupflags -> (Glib_bytes.t, GError.t) result

  method open_stream :
    string ->
    Gio_enums.resourcelookupflags ->
    (GInput_stream.input_stream_t, GError.t) result

  method ref : unit -> Resource.t
  method unref : unit -> unit
  method as_resource : Resource.t
end

(* High-level class for Resource *)
class resource (obj : Resource.t) : resource_t =
  object (self)
    method _register : unit -> unit = fun () -> Resource._register obj
    method _unregister : unit -> unit = fun () -> Resource._unregister obj

    method enumerate_children :
        string ->
        Gio_enums.resourcelookupflags ->
        (string array, GError.t) result =
      fun path lookup_flags -> Resource.enumerate_children obj path lookup_flags

    method lookup_data :
        string ->
        Gio_enums.resourcelookupflags ->
        (Glib_bytes.t, GError.t) result =
      fun path lookup_flags -> Resource.lookup_data obj path lookup_flags

    method open_stream :
        string ->
        Gio_enums.resourcelookupflags ->
        (GInput_stream.input_stream_t, GError.t) result =
      fun path lookup_flags ->
        Result.map
          (fun ret -> new GInput_stream.input_stream ret)
          (Resource.open_stream obj path lookup_flags)

    method ref : unit -> Resource.t = fun () -> Resource.ref obj
    method unref : unit -> unit = fun () -> Resource.unref obj
    method as_resource = obj
  end

let new_from_data (data : Glib_bytes.t) : (resource_t, GError.t) result =
  let obj_ = Resource.new_from_data data in
  Result.map (fun obj_ -> new resource obj_) obj_
