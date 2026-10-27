(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for DBusInterface from cyclic group D_bus_interface_and__d_bus_object *)

(** Base type for D-Bus interfaces.

    The [GDBusInterface] type is the base type for D-Bus interfaces both on the
    service side (see [Gio.DBusInterfaceSkeleton]) and client side (see
    [Gio.DBusProxy]).

    Its methods, signals and properties are on {!class-type-d_bus_interface_t}.
    The functions it is built on are in {!Ocgio.Raw.D_bus_interface}. *)

class type d_bus_interface_t =
  D_bus_interface_and__d_bus_object.d_bus_interface_t
(** The methods, signals and properties of a [GDBusInterface]. *)

class d_bus_interface : Raw.D_bus_interface.t -> d_bus_interface_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.D_bus_interface.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GDBusInterface], give one already wrapped. *)
