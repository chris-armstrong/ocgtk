(** A render node that can contain other render nodes.

    Its methods, signals and properties are on {!class-type-container_node_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgsk.Raw.Container_node}. *)

(** {b The methods, signals and properties of a [ContainerNode].}

    A render node that can contain other render nodes. *)
class type container_node_t = object
  inherit Render_node.render_node_t

  method get_child : int -> Render_node.render_node_t
  (** Gets one of the children of [container]. *)

  method get_n_children : unit -> int
  (** Retrieves the number of direct children of [node]. *)

  method as_container_node : Raw.Container_node.t
end

class container_node : Raw.Container_node.t -> container_node_t
(** Wraps a raw handle of {!Ocgsk.Raw.Container_node.t}. *)

(** {2:constructors Constructors} *)

val new_ : Raw.Render_node.t array -> int -> container_node_t
(** Creates a new [GskRenderNode] instance for holding the given [children].

    The new node will acquire a reference to each of the children. *)
