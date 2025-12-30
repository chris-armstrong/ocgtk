(* GENERATED CODE - DO NOT EDIT *)
(* DebugControllerDBus: DebugControllerDBus *)

type t = [`debug_controller_d_bus | `object_] Gobject.obj

(* Methods *)
(** Stop the debug controller, unregistering its object from the bus.

Any pending method calls to the object will complete successfully, but new
ones will return an error. This method will block until all pending
#GDebugControllerDBus::authorize signals have been handled. This is expected
to not take long, as it will just be waiting for threads to join. If any
#GDebugControllerDBus::authorize signal handlers are still executing in other
threads, this will block until after they have returned.

This method will be called automatically when the final reference to the
#GDebugControllerDBus is dropped. You may want to call it explicitly to know
when the controller has been fully removed from the bus, or to break
reference count cycles.

Calling this method from within a #GDebugControllerDBus::authorize signal
handler will cause a deadlock and must not be done. *)
external stop : t -> unit = "ml_g_debug_controller_dbus_stop"

(* Properties *)

(** Get property: connection *)
external get_connection : t -> D_bus_connection.t = "ml_gtk_debug_controller_d_bus_get_connection"

