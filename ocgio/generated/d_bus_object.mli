(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for DBusObject from cyclic group D_bus_interface_and__d_bus_object *)

(** The [GDBusObject] type is the base type for D-Bus objects on both the
    service side (see [Gio.DBusObjectSkeleton]) and the client side (see
    [Gio.DBusObjectProxy]). It is essentially just a container of interfaces.

    Its methods, signals and properties are on {!class-type-d_bus_object_t}. The
    functions it is built on are in {!Ocgio.Raw.D_bus_object}. *)

class type d_bus_object_t = D_bus_interface_and__d_bus_object.d_bus_object_t
(** The methods, signals and properties of a [GDBusObject]. *)

class d_bus_object : Raw.D_bus_object.t -> d_bus_object_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.D_bus_object.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GDBusObject], give one already wrapped. *)
