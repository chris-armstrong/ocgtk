(* Signal handlers for ContentProvider *)
class content_provider_signals (obj : Content_provider.t) = object
  (** Emitted whenever the content provided by this provider has changed. *)
  method on_content_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"content-changed" ~callback ~after:false

end
