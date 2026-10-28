(** A render node controlling the opacity of its single child node.

    Its methods, signals and properties are on {!class-type-opacity_node_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgsk.Raw.Opacity_node}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [OpacityNode].}

    A render node controlling the opacity of its single child node. *)
class type opacity_node_t = object
  inherit Render_node.render_node_t

  method get_child : unit -> Render_node.render_node_t
  (** Gets the child node that is getting opacityed by the given [node]. *)

  method get_opacity : unit -> float
  (** Gets the transparency factor for an opacity node. *)

  method as_opacity_node : Raw.Opacity_node.t
end

class opacity_node : Raw.Opacity_node.t -> opacity_node_t
(** Wraps a raw handle of {!Ocgsk.Raw.Opacity_node.t}. *)

(** {1:constructors Constructors} *)

val new_ : Render_node.render_node_t -> float -> opacity_node_t
(** Creates a [GskRenderNode] that will drawn the [child] with reduced
    [opacity]. *)
