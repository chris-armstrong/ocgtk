(** Struct used in [Gio.DBusError.register_error_domain].

    Its methods, signals and properties are on
    {!class-type-d_bus_error_entry_t}. The functions it is built on are in
    {!Ocgio.Raw.D_bus_error_entry}. *)

(** The methods, signals and properties of a [GDBusErrorEntry]. *)
class type d_bus_error_entry_t = object
  method as_d_bus_error_entry : Raw.D_bus_error_entry.t
end

class d_bus_error_entry : Raw.D_bus_error_entry.t -> d_bus_error_entry_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.D_bus_error_entry.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GDBusErrorEntry], give one already wrapped. *)
