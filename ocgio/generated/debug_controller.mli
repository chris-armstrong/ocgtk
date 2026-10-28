(** [GDebugController] is an interface to expose control of debugging features
    and debug output.

    Its methods, signals and properties are on {!class-type-debug_controller_t}.
    Its full description is under {!section-description}. The functions it is
    built on are in {!Ocgio.Raw.Debug_controller}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DebugController].}

    [GDebugController] is an interface to expose control of debugging features
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
class type debug_controller_t = object
  (** {2:methods Methods} *)

  method get_debug_enabled : unit -> bool
  (** Get the value of [GDebugController:debug]-enabled. *)

  method set_debug_enabled : bool -> unit
  (** Set the value of [GDebugController:debug]-enabled. *)

  (** {2:conversions Conversions} *)

  method as_debug_controller : Raw.Debug_controller.t
end

class debug_controller : Raw.Debug_controller.t -> debug_controller_t
(** Wraps a raw handle of {!Ocgio.Raw.Debug_controller.t}. *)

(** {1:description Description}

    [GDebugController] is an interface to expose control of debugging features
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
