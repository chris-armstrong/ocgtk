(* Signal handlers for Drag *)
class drag_signals (obj : Drag.t) = object
  (** Emitted when the destination side has finished reading all data.

The drag object can now free all miscellaneous data. *)
  method on_dnd_finished ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"dnd-finished" ~callback ~after:false

  (** Emitted when the drop operation is performed on an accepting client. *)
  method on_drop_performed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"drop-performed" ~callback ~after:false

end
