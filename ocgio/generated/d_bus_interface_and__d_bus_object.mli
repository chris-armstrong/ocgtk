(** The classes of {!Ocgio.D_bus_interface}, {!Ocgio.D_bus_object}, defined
    together because they refer to each other. Each has a module of its own that
    re-exports it; use that module rather than this one. *)

(** {b The methods, signals and properties of a [DBusInterface].}

    Base type for D-Bus interfaces.

    The [GDBusInterface] type is the base type for D-Bus interfaces both on the
    service side (see [Gio.DBusInterfaceSkeleton]) and client side (see
    [Gio.DBusProxy]). *)
class type d_bus_interface_t = object
  (** {2:methods Methods} *)

  method dup_object : unit -> d_bus_object_t option
  (** Gets the [GDBusObject] that [interface_] belongs to, if any. *)

  method get_info : unit -> Raw.D_bus_interface_info.t
  (** Gets D-Bus introspection information for the D-Bus interface implemented
      by [interface_]. *)

  method set_object : d_bus_object_t option -> unit
  (** Sets the [GDBusObject] for [interface_] to [object].

      Note that [interface_] will hold a weak reference to [object]. *)

  (** {2:conversions Conversions} *)

  method as_d_bus_interface : Raw.D_bus_interface.t
end

(** {b The methods, signals and properties of a [DBusObject].}

    The [GDBusObject] type is the base type for D-Bus objects on both the
    service side (see [Gio.DBusObjectSkeleton]) and the client side (see
    [Gio.DBusObjectProxy]). It is essentially just a container of interfaces. *)
and d_bus_object_t = object
  (** {2:signals Signals} *)

  method on_interface_added :
    ?after:bool ->
    callback:(interface:d_bus_interface_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when [interface] is added to [object]. *)

  method on_interface_removed :
    ?after:bool ->
    callback:(interface:d_bus_interface_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when [interface] is removed from [object]. *)

  (** {2:methods Methods} *)

  method get_interface : string -> d_bus_interface_t option
  (** Gets the D-Bus interface with name [interface_name] associated with
      [object], if any. *)

  method get_interfaces : unit -> d_bus_interface_t list
  (** Gets the D-Bus interfaces associated with [object]. *)

  method get_object_path : unit -> string
  (** Gets the object path for [object]. *)

  (** {2:conversions Conversions} *)

  method as_d_bus_object : Raw.D_bus_object.t
end

(** Wraps a raw handle of {!Ocgio.Raw.D_bus_interface.t}. *)
class d_bus_interface : Raw.D_bus_interface.t -> d_bus_interface_t
(** Wraps a raw handle of {!Ocgio.Raw.D_bus_object.t}. *)

and d_bus_object : Raw.D_bus_object.t -> d_bus_object_t
