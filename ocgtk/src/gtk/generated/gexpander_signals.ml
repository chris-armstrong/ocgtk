(* Signal handlers for Expander *)
class expander_signals (obj : Expander.t) =
  object
    method on_activate ~callback =
      Gobject.Signal.connect_simple obj ~name:"activate" ~callback ~after:false
    (** Activates the `GtkExpander`. *)
  end
