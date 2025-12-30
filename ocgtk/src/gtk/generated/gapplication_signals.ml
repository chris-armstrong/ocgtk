(* Signal handlers for Application *)
class application_signals (obj : Application_and__window_and__window_group.Application.t) = object
  (** Emitted when the session manager is about to end the session.

This signal is only emitted if [property@Gtk.Application:register-session]
is `TRUE`. Applications can connect to this signal and call
[method@Gtk.Application.inhibit] with `GTK_APPLICATION_INHIBIT_LOGOUT`
to delay the end of the session until state has been saved. *)
  method on_query_end ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"query-end" ~callback ~after:false

end
