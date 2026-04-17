(* Signal handlers for ContentProvider *)
class content_provider_signals (obj : Content_provider.t) =
  object
    method on_content_changed ~callback =
      Gobject.Signal.connect_simple obj ~name:"content-changed" ~callback
        ~after:false
    (** Emitted whenever the content provided by this provider has changed. *)
  end
