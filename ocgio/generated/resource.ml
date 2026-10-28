class type resource_t = object
  method _register : unit -> unit
  (** Registers the resource with the process-global set of resources.

      Once a resource is registered the files in it can be accessed with the
      global resource lookup functions like [Gio.resources_lookup_data]. *)

  method _unregister : unit -> unit
  (** Unregisters the resource from the process-global set of resources. *)

  method enumerate_children :
    string -> Enums.resourcelookupflags -> (string array, GError.t) result
  (** Returns all the names of children at the specified [path] in the resource.

      The return result is a [NULL] terminated list of strings which should be
      released with [GLib.strfreev].

      If [path] is invalid or does not exist in the [Gio.Resource],
      [G_RESOURCE_ERROR_NOT_FOUND] will be returned.

      [lookup_flags] controls the behaviour of the lookup. *)

  method has_children : string -> bool
  (** Returns whether the specified [path] in the resource has children. *)

  method lookup_data :
    string -> Enums.resourcelookupflags -> (Glib_bytes.t, GError.t) result
  (** Looks for a file at the specified [path] in the resource and returns a
      [GLib.Bytes] that lets you directly access the data in memory.

      The data is always followed by a zero byte, so you can safely use the data
      as a C string. However, that byte is not included in the size of the
      [GLib.Bytes].

      For uncompressed resource files this is a pointer directly into the
      resource bundle, which is typically in some read-only data section in the
      program binary. For compressed files, memory is allocated on the heap and
      the data is automatically uncompressed.

      [lookup_flags] controls the behaviour of the lookup.

      This can return error [G_RESOURCE_ERROR_NOT_FOUND] if [path] was not found
      in [resource], or [G_RESOURCE_ERROR_INTERNAL] if decompression of a
      compressed resource failed. *)

  method open_stream :
    string ->
    Enums.resourcelookupflags ->
    (Input_stream.input_stream_t, GError.t) result
  (** Looks for a file at the specified [path] in the resource and returns a
      [Gio.InputStream] that lets you read the data.

      [lookup_flags] controls the behaviour of the lookup.

      The only error this can return is [G_RESOURCE_ERROR_NOT_FOUND], if [path]
      was not found in [resource]. *)

  method ref : unit -> Raw.Resource.t
  (** Atomically increments the reference count of [resource] by one.

      This function is threadsafe and may be called from any thread. *)

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
