(* GENERATED CODE - DO NOT EDIT *)
(* DebugController: DebugController *)

(** [GDebugController] is an interface to expose control of debugging features
    and debug output.

    It is implemented on Linux using [Gio.DebugControllerDBus], which exposes a
    D-Bus interface to allow authenticated peers to control debug features in
    this process.

    Whether debug output is enabled is exposed as
    [Gio.DebugController:debug-enabled]. This controls
    [GLib.log_set_debug_enabled] by default. Application code may connect to the
    [GObject.Object::notify] signal for it to control other parts of its debug
    infrastructure as necessary.

    If your application or service is using the default GLib log writer
    function, creating one of the built-in implementations of [GDebugController]
    should be all that’s needed to dynamically enable or disable debug output.
*)

type t = [ `debug_controller ] Gobject.obj

external from_gobject : 'a Gobject.obj -> t
  = "ml_gio_debug_controller_from_gobject"

(* Methods *)

external set_debug_enabled : t -> bool -> unit
  = "ml_g_debug_controller_set_debug_enabled"
(** Set the value of [GDebugController:debug]-enabled. *)

external get_debug_enabled : t -> bool
  = "ml_g_debug_controller_get_debug_enabled"
(** Get the value of [GDebugController:debug]-enabled. *)

(* Properties *)
