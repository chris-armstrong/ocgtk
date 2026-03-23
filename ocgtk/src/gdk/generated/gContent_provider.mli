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

class content_provider : Content_provider.t -> content_provider_t

