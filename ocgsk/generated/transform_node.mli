(** A render node applying a [GskTransform] to its single child node.

    Its methods, signals and properties are on {!class-type-transform_node_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgsk.Raw.Transform_node}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [TransformNode].}

    A render node applying a [GskTransform] to its single child node. *)
class type transform_node_t = object
  inherit Render_node.render_node_t

  (** {2:methods Methods} *)

  method get_child : unit -> Render_node.render_node_t
  (** Gets the child node that is getting transformed by the given [node]. *)

  method get_transform : unit -> Raw.Transform.t
  (** Retrieves the [GskTransform] used by the [node]. *)

  (** {2:conversions Conversions} *)

  method as_transform_node : Raw.Transform_node.t
end

class transform_node : Raw.Transform_node.t -> transform_node_t
(** Wraps a raw handle of {!Ocgsk.Raw.Transform_node.t}. *)

(** {1:constructors Constructors} *)

val new_ : Render_node.render_node_t -> Raw.Transform.t -> transform_node_t
(** Creates a [GskRenderNode] that will transform the given [child] with the
    given [transform]. *)
