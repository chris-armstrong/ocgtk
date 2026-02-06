(* Signal handlers for PrintOperation *)
class print_operation_signals (obj : Print_operation.t) = object
  (** Emitted at between the various phases of the print operation.

See [enum@Gtk.PrintStatus] for the phases that are being discriminated.
Use [method@Gtk.PrintOperation.get_status] to find out the current
status. *)
  method on_status_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"status-changed" ~callback ~after:false

end
