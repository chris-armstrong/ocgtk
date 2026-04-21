(* Signal handlers for Clipboard *)
class clipboard_signals (obj : App_launch_context_cycle_de440b34.Clipboard.t) =
  object
    method on_changed ~callback =
      Gobject.Signal.connect_simple obj ~name:"changed" ~callback ~after:false
    (** Emitted when the clipboard changes ownership. *)
  end
