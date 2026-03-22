(* Signal class defined in gcontent_provider_signals.ml *)

class type content_provider_t = object
    inherit Gcontent_provider_signals.content_provider_signals
    method content_changed : unit -> unit
    method ref_formats : unit -> Content_formats.t
    method ref_storable_formats : unit -> Content_formats.t
    method write_mime_type_finish : Ocgtk_gio.Gio.Async_result.async_result_t -> (bool, GError.t) result
    method formats : Content_formats.t
    method storable_formats : Content_formats.t
    method as_content_provider : Content_provider.t
end

(* High-level class for ContentProvider *)
class content_provider (obj : Content_provider.t) : content_provider_t = object (self)
  inherit Gcontent_provider_signals.content_provider_signals obj

  method content_changed : unit -> unit =
    fun () ->
      (Content_provider.content_changed obj)

  method ref_formats : unit -> Content_formats.t =
    fun () ->
      (Content_provider.ref_formats obj)

  method ref_storable_formats : unit -> Content_formats.t =
    fun () ->
      (Content_provider.ref_storable_formats obj)

  method write_mime_type_finish : Ocgtk_gio.Gio.Async_result.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (Content_provider.write_mime_type_finish obj result)

  method formats = Content_provider.get_formats obj

  method storable_formats = Content_provider.get_storable_formats obj

    method as_content_provider = obj
end

