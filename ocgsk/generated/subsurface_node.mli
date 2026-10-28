(** A render node that potentially diverts a part of the scene graph to a
    subsurface.

    Its methods, signals and properties are on {!class-type-subsurface_node_t}.
    The functions it is built on are in {!Ocgsk.Raw.Subsurface_node}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [SubsurfaceNode].}

    A render node that potentially diverts a part of the scene graph to a
    subsurface. *)
class type subsurface_node_t = object
  inherit Render_node.render_node_t

  (** {2:methods Methods} *)

  method get_child : unit -> Render_node.render_node_t
  (** Gets the child node that is getting drawn by the given [node]. *)

  (** {2:conversions Conversions} *)

  method as_subsurface_node : Raw.Subsurface_node.t
end

class subsurface_node : Raw.Subsurface_node.t -> subsurface_node_t
(** Wraps a raw handle of {!Ocgsk.Raw.Subsurface_node.t}. *)
