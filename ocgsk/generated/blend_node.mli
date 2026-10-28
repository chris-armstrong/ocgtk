(** A render node applying a blending function between its two child nodes.

    Its methods, signals and properties are on {!class-type-blend_node_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgsk.Raw.Blend_node}. *)

(** The methods, signals and properties of a [BlendNode]. *)
class type blend_node_t = object
  inherit Render_node.render_node_t

  method get_blend_mode : unit -> Enums.blendmode
  (** Retrieves the blend mode used by [node]. *)

  method get_bottom_child : unit -> Render_node.render_node_t
  (** Retrieves the bottom [GskRenderNode] child of the [node]. *)

  method get_top_child : unit -> Render_node.render_node_t
  (** Retrieves the top [GskRenderNode] child of the [node]. *)

  method as_blend_node : Raw.Blend_node.t
end

class blend_node : Raw.Blend_node.t -> blend_node_t
(** Wraps a raw handle of {!Ocgsk.Raw.Blend_node.t}. *)

(** {2:constructors Constructors} *)

val new_ :
  Render_node.render_node_t ->
  Render_node.render_node_t ->
  Enums.blendmode ->
  blend_node_t
(** Creates a [GskRenderNode] that will use [blend_mode] to blend the [top] node
    onto the [bottom] node. *)
