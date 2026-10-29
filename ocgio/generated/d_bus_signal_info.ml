class type d_bus_signal_info_t = object
  (** {2:methods Methods} *)

  method ref : unit -> Raw.D_bus_signal_info.t
  (** If [info] is statically allocated does nothing. Otherwise increases the
      reference count. *)

  (** {2:conversions Conversions} *)

  method as_d_bus_signal_info : Raw.D_bus_signal_info.t
end

(* High-level class for DBusSignalInfo *)
class d_bus_signal_info (obj : Raw.D_bus_signal_info.t) : d_bus_signal_info_t =
  object (self)
    method ref : unit -> Raw.D_bus_signal_info.t =
      fun () -> Raw.D_bus_signal_info.ref obj

    method as_d_bus_signal_info = obj
  end
