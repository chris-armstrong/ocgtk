(* Signal handlers for Volume *)
class volume_signals (obj : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.t) = object
  (** Emitted when the volume has been changed. *)
  method on_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"changed" ~callback ~after:false

  (** This signal is emitted when the #GVolume have been removed. If
the recipient is holding references to the object they should
release them so the object can be finalized. *)
  method on_removed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"removed" ~callback ~after:false

end
