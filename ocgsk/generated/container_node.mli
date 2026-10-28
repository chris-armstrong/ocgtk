(** A render node that can contain other render nodes.

    Its methods, signals and properties are on {!class-type-container_node_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgsk.Raw.Container_node}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ContainerNode].}

    Inherits from:
    {{!Ocgsk.Render_node.class-type-render_node_t}Ocgsk.Render_node}

    A render node that can contain other render nodes. *)
class type container_node_t = object
  inherit Render_node.render_node_t

  (** {2:methods Methods} *)

  method get_child : int -> Render_node.render_node_t
  (** Gets one of the children of [container]. *)

  method get_n_children : unit -> int
  (** Retrieves the number of direct children of [node]. *)

  (** {2:conversions Conversions} *)

  method as_container_node : Raw.Container_node.t
end

class container_node : Raw.Container_node.t -> container_node_t
(** Wraps a raw handle of {!Ocgsk.Raw.Container_node.t}. *)

(** {1:constructors Constructors} *)

val new_ : Raw.Render_node.t array -> int -> container_node_t
(** Creates a new [GskRenderNode] instance for holding the given [children].

    The new node will acquire a reference to each of the children. *)
