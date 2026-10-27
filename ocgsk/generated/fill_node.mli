(** A render node filling the area given by [Gsk.Path] and [Gsk.FillRule] with
    the child node.

    Its methods, signals and properties are on {!class-type-fill_node_t}. The
    functions it is built on are in {!Ocgsk.Raw.Fill_node}. *)

(** The methods, signals and properties of a [GskFillNode]. *)
class type fill_node_t = object
  inherit Render_node.render_node_t

  method get_child : unit -> Render_node.render_node_t
  (** Gets the child node that is getting drawn by the given [node]. *)

  method get_fill_rule : unit -> Enums.fillrule
  (** Retrieves the fill rule used to determine how the path is filled. *)

  method get_path : unit -> Raw.Path.t
  (** Retrieves the path used to describe the area filled with the contents of
      the [node]. *)

  method as_fill_node : Raw.Fill_node.t
end

class fill_node : Raw.Fill_node.t -> fill_node_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Fill_node.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GskFillNode], give one already wrapped. *)

val new_ :
  Render_node.render_node_t -> Raw.Path.t -> Enums.fillrule -> fill_node_t
