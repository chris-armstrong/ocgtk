(** A render node applying a rectangular clip to its single child node.

    Its methods, signals and properties are on {!class-type-clip_node_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgsk.Raw.Clip_node}. *)

(** The methods, signals and properties of a [ClipNode]. *)
class type clip_node_t = object
  inherit Render_node.render_node_t

  method get_child : unit -> Render_node.render_node_t
  (** Gets the child node that is getting clipped by the given [node]. *)

  method get_clip : unit -> Ocgraphene.Rect.rect_t
  (** Retrieves the clip rectangle for [node]. *)

  method as_clip_node : Raw.Clip_node.t
end

class clip_node : Raw.Clip_node.t -> clip_node_t
(** Wraps a raw handle of {!Ocgsk.Raw.Clip_node.t}. *)

(** {2:constructors Constructors} *)

val new_ : Render_node.render_node_t -> Ocgraphene.Rect.rect_t -> clip_node_t
(** Creates a [GskRenderNode] that will clip the [child] to the area given by
    [clip]. *)
