(** Struct used in [Gio.DBusError.register_error_domain].

    Its methods, signals and properties are on
    {!class-type-d_bus_error_entry_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.D_bus_error_entry}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DBusErrorEntry].}

    Struct used in [Gio.DBusError.register_error_domain]. *)
class type d_bus_error_entry_t = object
  (** {2:conversions Conversions} *)

  method as_d_bus_error_entry : Raw.D_bus_error_entry.t
end

class d_bus_error_entry : Raw.D_bus_error_entry.t -> d_bus_error_entry_t
(** Wraps a raw handle of {!Ocgio.Raw.D_bus_error_entry.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
