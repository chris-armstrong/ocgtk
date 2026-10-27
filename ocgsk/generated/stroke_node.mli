(** A render node that will fill the area determined by stroking the the given
    [Gsk.Path] using the [Gsk.Stroke] attributes.

    Its methods, signals and properties are on {!class-type-stroke_node_t}. The
    functions it is built on are in {!Ocgsk.Raw.Stroke_node}. *)

(** The methods, signals and properties of a [GskStrokeNode]. *)
class type stroke_node_t = object
  inherit Render_node.render_node_t

  method get_child : unit -> Render_node.render_node_t
  (** Gets the child node that is getting drawn by the given [node]. *)

  method get_path : unit -> Raw.Path.t
  (** Retrieves the path that will be stroked with the contents of the [node].
  *)

  method get_stroke : unit -> Raw.Stroke.t
  (** Retrieves the stroke attributes used in this [node]. *)

  method as_stroke_node : Raw.Stroke_node.t
end

class stroke_node : Raw.Stroke_node.t -> stroke_node_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Stroke_node.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GskStrokeNode], give one already wrapped. *)

val new_ :
  Render_node.render_node_t -> Raw.Path.t -> Raw.Stroke.t -> stroke_node_t
