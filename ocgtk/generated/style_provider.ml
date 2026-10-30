class type style_provider_t = object
  (** {2:signals Signals} *)

  method on_gtk_private_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  (** {2:conversions Conversions} *)

  method as_style_provider : Raw.Style_provider.t
end

(* High-level class for StyleProvider *)
class style_provider (obj : Raw.Style_provider.t) : style_provider_t =
  object (self)
    method on_gtk_private_changed ?(after = false) ~callback () =
      Raw.Style_provider.on_gtk_private_changed ~after self#as_style_provider
        ~callback

    method as_style_provider = obj
  end
