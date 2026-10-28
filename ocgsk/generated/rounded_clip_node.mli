(** A render node applying a rounded rectangle clip to its single child.

    Its methods, signals and properties are on
    {!class-type-rounded_clip_node_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgsk.Raw.Rounded_clip_node}. *)

(** {b The methods, signals and properties of a [RoundedClipNode].}

    A render node applying a rounded rectangle clip to its single child. *)
class type rounded_clip_node_t = object
  inherit Render_node.render_node_t

  method get_child : unit -> Render_node.render_node_t
  (** Gets the child node that is getting clipped by the given [node]. *)

  method get_clip : unit -> Raw.Rounded_rect.t
  (** Retrieves the rounded rectangle used to clip the contents of the [node].
  *)

  method as_rounded_clip_node : Raw.Rounded_clip_node.t
end

class rounded_clip_node : Raw.Rounded_clip_node.t -> rounded_clip_node_t
(** Wraps a raw handle of {!Ocgsk.Raw.Rounded_clip_node.t}. *)

(** {2:constructors Constructors} *)

val new_ :
  Render_node.render_node_t -> Raw.Rounded_rect.t -> rounded_clip_node_t
(** Creates a [GskRenderNode] that will clip the [child] to the area given by
    [clip]. *)
