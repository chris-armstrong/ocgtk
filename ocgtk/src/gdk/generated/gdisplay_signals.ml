(* Signal handlers for Display *)
class display_signals (obj : App_launch_context_cycle_de440b34.Display.t) =
  object
    method on_opened ~callback =
      Gobject.Signal.connect_simple obj ~name:"opened" ~callback ~after:false
    (** Emitted when the connection to the windowing system for @display is opened. *)
  end
