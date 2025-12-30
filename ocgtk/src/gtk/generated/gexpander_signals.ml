(* Signal handlers for Expander *)
class expander_signals (obj : Expander.t) = object
  (** Activates the `GtkExpander`. *)
  method on_activate ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

end
