class type style_provider_t = object
    method on_gtk_private_changed : ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
    method as_style_provider : Style_provider.t
end

class style_provider : Style_provider.t -> style_provider_t

