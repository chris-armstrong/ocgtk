(* Signal handlers for PrintOperation *)
class print_operation_signals (obj : Print_operation.t) =
  object
    method on_status_changed ~callback =
      Gobject.Signal.connect_simple obj ~name:"status-changed" ~callback
        ~after:false
    (** Emitted at between the various phases of the print operation.

        See [enum@Gtk.PrintStatus] for the phases that are being discriminated.
        Use [method@Gtk.PrintOperation.get_status] to find out the current
        status. *)
  end
