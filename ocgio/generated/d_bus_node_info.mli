(** Information about nodes in a remote object hierarchy.

    Its methods, signals and properties are on {!class-type-d_bus_node_info_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgio.Raw.D_bus_node_info}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DBusNodeInfo].}

    Information about nodes in a remote object hierarchy. *)
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
(** Wraps a raw handle of {!Ocgio.Raw.D_bus_node_info.t}. *)

(** {1:constructors Constructors} *)

val new_for_xml : string -> (d_bus_node_info_t, GError.t) result
(** Parses [xml_data] and returns a [GDBusNodeInfo] representing the data.

    The introspection XML must contain exactly one top-level [<node>] element.

    Note that this routine is using a GMarkup-based parser that only accepts a
    subset of valid XML documents. *)
