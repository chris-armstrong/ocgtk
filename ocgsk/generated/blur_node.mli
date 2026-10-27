(** A render node applying a blur effect to its single child.

    Its methods, signals and properties are on {!class-type-blur_node_t}. The
    functions it is built on are in {!Ocgsk.Raw.Blur_node}. *)

(** The methods, signals and properties of a [GskBlurNode]. *)
class type blur_node_t = object
  inherit Render_node.render_node_t

  method get_child : unit -> Render_node.render_node_t
  (** Retrieves the child [GskRenderNode] of the blur [node]. *)

  method get_radius : unit -> float
  (** Retrieves the blur radius of the [node]. *)

  method as_blur_node : Raw.Blur_node.t
end

class blur_node : Raw.Blur_node.t -> blur_node_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Blur_node.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GskBlurNode], give one already wrapped. *)

val new_ : Render_node.render_node_t -> float -> blur_node_t
