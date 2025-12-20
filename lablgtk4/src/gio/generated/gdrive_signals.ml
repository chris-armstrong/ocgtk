(* Signal handlers for Drive *)
class drive_signals (obj : Drive.t) = object
  (** Emitted when the drive's state has changed. *)
  method on_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"changed" ~callback ~after:false

  (** This signal is emitted when the #GDrive have been
disconnected. If the recipient is holding references to the
object they should release them so the object can be
finalized. *)
  method on_disconnected ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"disconnected" ~callback ~after:false

  (** Emitted when the physical eject button (if any) of a drive has
been pressed. *)
  method on_eject_button ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"eject-button" ~callback ~after:false

  (** Emitted when the physical stop button (if any) of a drive has
been pressed. *)
  method on_stop_button ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"stop-button" ~callback ~after:false

end
