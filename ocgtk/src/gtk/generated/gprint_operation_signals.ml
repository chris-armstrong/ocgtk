(* Signal handlers for PrintOperation *)
class print_operation_signals (obj : Print_operation.t) = object
  (** Emitted when displaying the print dialog.

If you return a widget in a handler for this signal it will be
added to a custom tab in the print dialog. You typically return a
container widget with multiple widgets in it.

The print dialog owns the returned widget, and its lifetime is not
controlled by the application. However, the widget is guaranteed
to stay around until the [signal@Gtk.PrintOperation::custom-widget-apply]
signal is emitted on the operation. Then you can read out any
information you need from the widgets. *)
  method on_create_custom_widget ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"create-custom-widget" ~callback ~after:false

  (** Emitted at between the various phases of the print operation.

See [enum@Gtk.PrintStatus] for the phases that are being discriminated.
Use [method@Gtk.PrintOperation.get_status] to find out the current
status. *)
  method on_status_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"status-changed" ~callback ~after:false

end
