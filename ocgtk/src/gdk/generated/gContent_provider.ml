(* Signal class defined in gcontent_provider_signals.ml *)

(* High-level class for ContentProvider *)
class content_provider (obj : Content_provider.t) = object (self)
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

  method formats = Content_provider.get_formats obj

  method storable_formats = Content_provider.get_storable_formats obj

    method as_content_provider = obj
end

