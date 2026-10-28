(** Information about a method on a D-Bus interface.

    Its methods, signals and properties are on
    {!class-type-d_bus_method_info_t}. The functions it is built on are in
    {!Ocgio.Raw.D_bus_method_info}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DBusMethodInfo].}

    Information about a method on a D-Bus interface. *)
class type d_bus_method_info_t = object
  (** {2:methods Methods} *)

  method ref : unit -> Raw.D_bus_method_info.t
  (** If [info] is statically allocated does nothing. Otherwise increases the
      reference count. *)

  (** {2:conversions Conversions} *)

  method as_d_bus_method_info : Raw.D_bus_method_info.t
end

class d_bus_method_info : Raw.D_bus_method_info.t -> d_bus_method_info_t
(** Wraps a raw handle of {!Ocgio.Raw.D_bus_method_info.t}. *)
