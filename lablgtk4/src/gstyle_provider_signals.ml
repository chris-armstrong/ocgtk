(* Signal handlers for StyleProvider *)
class style_provider_signals (obj : Style_provider.t) = object
  method on_gtk_private_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"gtk-private-changed" ~callback ~after:false

end
