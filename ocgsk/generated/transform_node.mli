(** A render node applying a [GskTransform] to its single child node.

    Its methods, signals and properties are on {!class-type-transform_node_t}.
    The functions it is built on are in {!Ocgsk.Raw.Transform_node}. *)

(** The methods, signals and properties of a [GskTransformNode]. *)
class type transform_node_t = object
  inherit Render_node.render_node_t

  method get_child : unit -> Render_node.render_node_t
  (** Gets the child node that is getting transformed by the given [node]. *)

  method get_transform : unit -> Raw.Transform.t
  (** Retrieves the [GskTransform] used by the [node]. *)

  method as_transform_node : Raw.Transform_node.t
end

class transform_node : Raw.Transform_node.t -> transform_node_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Transform_node.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GskTransformNode], give one already wrapped. *)

val new_ : Render_node.render_node_t -> Raw.Transform.t -> transform_node_t
