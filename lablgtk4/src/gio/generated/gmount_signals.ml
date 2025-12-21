(* Signal handlers for Mount *)
class mount_signals (obj : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.t) = object
  (** Emitted when the mount has been changed. *)
  method on_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"changed" ~callback ~after:false

  (** This signal may be emitted when the #GMount is about to be
unmounted.

This signal depends on the backend and is only emitted if
GIO was used to unmount. *)
  method on_pre_unmount ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"pre-unmount" ~callback ~after:false

  (** This signal is emitted when the #GMount have been
unmounted. If the recipient is holding references to the
object they should release them so the object can be
finalized. *)
  method on_unmounted ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"unmounted" ~callback ~after:false

end
