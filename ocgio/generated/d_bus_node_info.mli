(** Information about nodes in a remote object hierarchy.

    Its methods, signals and properties are on {!class-type-d_bus_node_info_t}.
    The functions it is built on are in {!Ocgio.Raw.D_bus_node_info}. *)

(** The methods, signals and properties of a [GDBusNodeInfo]. *)
class type d_bus_node_info_t = object
  method lookup_interface : string -> Raw.D_bus_interface_info.t option
  (** Looks up information about an interface.

      The cost of this function is O(n) in number of interfaces. *)

  method ref : unit -> Raw.D_bus_node_info.t
  (** If [info] is statically allocated does nothing. Otherwise increases the
      reference count. *)

  method as_d_bus_node_info : Raw.D_bus_node_info.t
end

class d_bus_node_info : Raw.D_bus_node_info.t -> d_bus_node_info_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.D_bus_node_info.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GDBusNodeInfo], give one already wrapped. *)

val new_for_xml : string -> (d_bus_node_info_t, GError.t) result
