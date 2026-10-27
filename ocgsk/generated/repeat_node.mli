(** A render node repeating its single child node.

    Its methods, signals and properties are on {!class-type-repeat_node_t}. The
    functions it is built on are in {!Ocgsk.Raw.Repeat_node}. *)

(** The methods, signals and properties of a [GskRepeatNode]. *)
class type repeat_node_t = object
  inherit Render_node.render_node_t

  method get_child : unit -> Render_node.render_node_t
  (** Retrieves the child of [node]. *)

  method get_child_bounds : unit -> Ocgraphene.Rect.rect_t
  (** Retrieves the bounding rectangle of the child of [node]. *)

  method as_repeat_node : Raw.Repeat_node.t
end

class repeat_node : Raw.Repeat_node.t -> repeat_node_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Repeat_node.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GskRepeatNode], give one already wrapped. *)

val new_ :
  Ocgraphene.Rect.rect_t ->
  Render_node.render_node_t ->
  Ocgraphene.Rect.rect_t option ->
  repeat_node_t
