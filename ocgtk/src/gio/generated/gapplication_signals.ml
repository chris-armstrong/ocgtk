(* Signal handlers for Application *)
class application_signals (obj : Application.t) = object
  (** The ::activate signal is emitted on the primary instance when an
activation occurs. See g_application_activate(). *)
  method on_activate ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"activate" ~callback ~after:false

  (** The ::shutdown signal is emitted only on the registered primary instance
immediately after the main loop terminates. *)
  method on_shutdown ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"shutdown" ~callback ~after:false

  (** The ::startup signal is emitted on the primary instance immediately
after registration. See g_application_register(). *)
  method on_startup ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"startup" ~callback ~after:false

end
