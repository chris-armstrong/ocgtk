(** A render node that can contain other render nodes.

    Its methods, signals and properties are on {!class-type-container_node_t}.
    The functions it is built on are in {!Ocgsk.Raw.Container_node}. *)

(** The methods, signals and properties of a [GskContainerNode]. *)
class type container_node_t = object
  inherit Render_node.render_node_t
  method get_child : int -> Render_node.render_node_t
  method get_n_children : unit -> int
  method as_container_node : Raw.Container_node.t
end

class container_node : Raw.Container_node.t -> container_node_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Container_node.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GskContainerNode], give one already wrapped. *)

val new_ : Raw.Render_node.t array -> int -> container_node_t
