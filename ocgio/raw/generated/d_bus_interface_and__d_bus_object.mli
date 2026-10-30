(* GENERATED CODE - DO NOT EDIT *)
(* Combined modules for cyclic dependencies *)

(** The layer 1 modules of {!Ocgio.Raw.D_bus_interface},
    {!Ocgio.Raw.D_bus_object}, defined together because they refer to each
    other. Each has a module of its own that re-exports it; use that module
    rather than this one. *)

(** Base type for D-Bus interfaces.

    The [GDBusInterface] type is the base type for D-Bus interfaces both on the
    service side (see
    {{!Ocgio.Raw.D_bus_interface_skeleton}[Gio.DBusInterfaceSkeleton]}) and
    client side (see {{!Ocgio.Raw.D_bus_proxy}[Gio.DBusProxy]}).

    The class built on this module is in {!Ocgio.D_bus_interface}. *)
module rec D_bus_interface : sig
  type t = [ `d_bus_interface ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gio_d_bus_interface_get_type"

  external from_gobject : 'a Gobject.obj -> t
    = "ml_gio_d_bus_interface_from_gobject"

  (* Methods *)

  external set_object : t -> D_bus_object.t option -> unit
    = "ml_g_dbus_interface_set_object"
  (** Sets the {{!Ocgio.Raw.D_bus_object}[GDBusObject]} for [interface_] to
      [object].

      Note that [interface_] will hold a weak reference to [object]. *)

  external get_info : t -> D_bus_interface_info.t
    = "ml_g_dbus_interface_get_info"
  (** Gets D-Bus introspection information for the D-Bus interface implemented
      by [interface_]. *)

  external dup_object : t -> D_bus_object.t option
    = "ml_g_dbus_interface_dup_object"
  (** Gets the {{!Ocgio.Raw.D_bus_object}[GDBusObject]} that [interface_]
      belongs to, if any. *)
end

(** The [GDBusObject] type is the base type for D-Bus objects on both the
    service side (see
    {{!Ocgio.Raw.D_bus_object_skeleton}[Gio.DBusObjectSkeleton]}) and the client
    side (see {{!Ocgio.Raw.D_bus_object_proxy}[Gio.DBusObjectProxy]}). It is
    essentially just a container of interfaces.

    The class built on this module is in {!Ocgio.D_bus_object}. *)
and D_bus_object : sig
  type t = [ `d_bus_object ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gio_d_bus_object_get_type"

  external from_gobject : 'a Gobject.obj -> t
    = "ml_gio_d_bus_object_from_gobject"

  (* Methods *)

  external get_object_path : t -> string = "ml_g_dbus_object_get_object_path"
  (** Gets the object path for [object]. *)

  external get_interfaces : t -> D_bus_interface.t list
    = "ml_g_dbus_object_get_interfaces"
  (** Gets the D-Bus interfaces associated with [object]. *)

  external get_interface : t -> string -> D_bus_interface.t option
    = "ml_g_dbus_object_get_interface"
  (** Gets the D-Bus interface with name [interface_name] associated with
      [object], if any. *)

  val on_interface_added :
    ?after:bool ->
    t ->
    callback:(interface:D_bus_interface.t -> unit) ->
    Gobject.Signal.handler_id
  (** Emitted when [interface] is added to [object]. *)

  val on_interface_removed :
    ?after:bool ->
    t ->
    callback:(interface:D_bus_interface.t -> unit) ->
    Gobject.Signal.handler_id
  (** Emitted when [interface] is removed from [object]. *)
end
