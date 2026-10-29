(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for DBusObject from cyclic group D_bus_interface_and__d_bus_object *)

(** The [GDBusObject] type is the base type for D-Bus objects on both the
    service side (see
    {{!Ocgio.D_bus_object_skeleton.class-type-d_bus_object_skeleton_t}[Gio.DBusObjectSkeleton]})
    and the client side (see
    {{!Ocgio.D_bus_object_proxy.class-type-d_bus_object_proxy_t}[Gio.DBusObjectProxy]}).
    It is essentially just a container of interfaces.

    Its methods, signals and properties are on {!class-type-d_bus_object_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgio.Raw.D_bus_object}. *)

(** {1:class Class} *)

class type d_bus_object_t = D_bus_interface_and__d_bus_object.d_bus_object_t
(** {b The methods, signals and properties of a [DBusObject].}

    The [GDBusObject] type is the base type for D-Bus objects on both the
    service side (see
    {{!Ocgio.D_bus_object_skeleton.class-type-d_bus_object_skeleton_t}[Gio.DBusObjectSkeleton]})
    and the client side (see
    {{!Ocgio.D_bus_object_proxy.class-type-d_bus_object_proxy_t}[Gio.DBusObjectProxy]}).
    It is essentially just a container of interfaces. *)

class d_bus_object : Raw.D_bus_object.t -> d_bus_object_t
(** Wraps a raw handle of {!Ocgio.Raw.D_bus_object.t}. *)

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
