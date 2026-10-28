(** Information about a D-Bus interface.

    Its methods, signals and properties are on
    {!class-type-d_bus_interface_info_t}. The functions it is built on are in
    {!Ocgio.Raw.D_bus_interface_info}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DBusInterfaceInfo].}

    Information about a D-Bus interface. *)
class type d_bus_interface_info_t = object
  method cache_build : unit -> unit
  (** Builds a lookup-cache to speed up g_dbus_interface_info_lookup_method(),
      g_dbus_interface_info_lookup_signal() and
      g_dbus_interface_info_lookup_property().

      If this has already been called with [info], the existing cache is used
      and its use count is increased.

      Note that [info] cannot be modified until
      g_dbus_interface_info_cache_release() is called. *)

  method cache_release : unit -> unit
  (** Decrements the usage count for the cache for [info] built by
      g_dbus_interface_info_cache_build() (if any) and frees the resources used
      by the cache if the usage count drops to zero. *)

  method lookup_method : string -> Raw.D_bus_method_info.t option
  (** Looks up information about a method.

      The cost of this function is O(n) in number of methods unless
      g_dbus_interface_info_cache_build() has been used on [info]. *)

  method lookup_property : string -> Raw.D_bus_property_info.t option
  (** Looks up information about a property.

      The cost of this function is O(n) in number of properties unless
      g_dbus_interface_info_cache_build() has been used on [info]. *)

  method lookup_signal : string -> Raw.D_bus_signal_info.t option
  (** Looks up information about a signal.

      The cost of this function is O(n) in number of signals unless
      g_dbus_interface_info_cache_build() has been used on [info]. *)

  method ref : unit -> Raw.D_bus_interface_info.t
  (** If [info] is statically allocated does nothing. Otherwise increases the
      reference count. *)

  method as_d_bus_interface_info : Raw.D_bus_interface_info.t
end

class d_bus_interface_info :
  Raw.D_bus_interface_info.t ->
  d_bus_interface_info_t
(** Wraps a raw handle of {!Ocgio.Raw.D_bus_interface_info.t}. *)
