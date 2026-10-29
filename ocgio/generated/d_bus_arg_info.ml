class type d_bus_arg_info_t = object
  (** {2:methods Methods} *)

  method ref : unit -> Raw.D_bus_arg_info.t
  (** If [info] is statically allocated does nothing. Otherwise increases the
      reference count. *)

  (** {2:conversions Conversions} *)

  method as_d_bus_arg_info : Raw.D_bus_arg_info.t
end

(* High-level class for DBusArgInfo *)
class d_bus_arg_info (obj : Raw.D_bus_arg_info.t) : d_bus_arg_info_t =
  object (self)
    method ref : unit -> Raw.D_bus_arg_info.t =
      fun () -> Raw.D_bus_arg_info.ref obj

    method as_d_bus_arg_info = obj
  end
