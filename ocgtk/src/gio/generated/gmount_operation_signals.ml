(* Signal handlers for MountOperation *)
class mount_operation_signals (obj : Mount_operation.t) =
  object
    method on_aborted ~callback =
      Gobject.Signal.connect_simple obj ~name:"aborted" ~callback ~after:false
    (** Emitted by the backend when e.g. a device becomes unavailable while a
        mount operation is in progress.

        Implementations of GMountOperation should handle this signal by
        dismissing open password dialogs. *)
  end
