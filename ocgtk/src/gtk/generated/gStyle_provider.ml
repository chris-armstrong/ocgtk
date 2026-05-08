class type style_provider_t = object
  method on_gtk_private_changed :
    callback:(unit -> unit) -> Gobject.Signal.handler_id

  method as_style_provider : Style_provider.t
end

(* High-level class for StyleProvider *)
class style_provider (obj : Style_provider.t) : style_provider_t =
  object (self)
    method on_gtk_private_changed ~callback =
      Style_provider.on_gtk_private_changed self#as_style_provider ~callback

    method as_style_provider = obj
  end
