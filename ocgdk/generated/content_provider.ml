class type content_provider_t = object
  method on_content_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method content_changed : unit -> unit
  method ref_formats : unit -> Raw.Content_formats.t
  method ref_storable_formats : unit -> Raw.Content_formats.t

  method write_mime_type_finish :
    Ocgio.Async_result.async_result_t -> (bool, GError.t) result

  method as_content_provider : Raw.Content_provider.t
end

(* High-level class for ContentProvider *)
class content_provider (obj : Raw.Content_provider.t) : content_provider_t =
  object (self)
    method on_content_changed ?(after = false) ~callback () =
      Raw.Content_provider.on_content_changed ~after self#as_content_provider
        ~callback

    method content_changed : unit -> unit =
      fun () -> Raw.Content_provider.content_changed obj

    method ref_formats : unit -> Raw.Content_formats.t =
      fun () -> Raw.Content_provider.ref_formats obj

    method ref_storable_formats : unit -> Raw.Content_formats.t =
      fun () -> Raw.Content_provider.ref_storable_formats obj

    method write_mime_type_finish :
        Ocgio.Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Content_provider.write_mime_type_finish obj result

    method as_content_provider = obj
  end

let new_for_bytes (mime_type : string) (bytes : Glib_bytes.t) :
    content_provider_t =
  let obj_ = Raw.Content_provider.new_for_bytes mime_type bytes in
  new content_provider obj_

let new_for_value (value : Gobject.Value.t) : content_provider_t =
  let obj_ = Raw.Content_provider.new_for_value value in
  new content_provider obj_

let new_union (providers : Raw.Content_provider.t array option)
    (n_providers : Gsize.t) : content_provider_t =
  let obj_ = Raw.Content_provider.new_union providers n_providers in
  new content_provider obj_
