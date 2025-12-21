(* Signal handlers for MountOperation *)
class mount_operation_signals (obj : Mount_operation.t) = object
  (** Emitted by the backend when e.g. a device becomes unavailable
while a mount operation is in progress.

Implementations of GMountOperation should handle this signal
by dismissing open password dialogs. *)
  method on_aborted ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"aborted" ~callback ~after:false

end
