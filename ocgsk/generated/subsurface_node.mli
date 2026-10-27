(** A render node that potentially diverts a part of the scene graph to a
    subsurface.

    Its methods, signals and properties are on {!class-type-subsurface_node_t}.
    The functions it is built on are in {!Ocgsk.Raw.Subsurface_node}. *)

(** The methods, signals and properties of a [GskSubsurfaceNode]. *)
class type subsurface_node_t = object
  inherit Render_node.render_node_t

  method get_child : unit -> Render_node.render_node_t
  (** Gets the child node that is getting drawn by the given [node]. *)

  method as_subsurface_node : Raw.Subsurface_node.t
end

class subsurface_node : Raw.Subsurface_node.t -> subsurface_node_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Subsurface_node.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GskSubsurfaceNode], give one already wrapped. *)
