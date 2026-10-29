class type subsurface_node_t = object
  inherit Render_node.render_node_t

  (** {2:methods Methods} *)

  method get_child : unit -> Render_node.render_node_t
  (** Gets the child node that is getting drawn by the given [node]. *)

  (** {2:conversions Conversions} *)

  method as_subsurface_node : Raw.Subsurface_node.t
end

(* High-level class for SubsurfaceNode *)
class subsurface_node (obj : Raw.Subsurface_node.t) : subsurface_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_child : unit -> Render_node.render_node_t =
      fun () -> new Render_node.render_node (Raw.Subsurface_node.get_child obj)

    method as_subsurface_node = obj
  end
