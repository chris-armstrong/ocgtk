class type fill_node_t = object
  inherit Render_node.render_node_t

  (** {2:methods Methods} *)

  method get_child : unit -> Render_node.render_node_t
  (** Gets the child node that is getting drawn by the given [node]. *)

  method get_fill_rule : unit -> Enums.fillrule
  (** Retrieves the fill rule used to determine how the path is filled. *)

  method get_path : unit -> Raw.Path.t
  (** Retrieves the path used to describe the area filled with the contents of
      the [node]. *)

  (** {2:conversions Conversions} *)

  method as_fill_node : Raw.Fill_node.t
end

(* High-level class for FillNode *)
class fill_node (obj : Raw.Fill_node.t) : fill_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_child : unit -> Render_node.render_node_t =
      fun () -> new Render_node.render_node (Raw.Fill_node.get_child obj)

    method get_fill_rule : unit -> Enums.fillrule =
      fun () -> Raw.Fill_node.get_fill_rule obj

    method get_path : unit -> Raw.Path.t = fun () -> Raw.Fill_node.get_path obj
    method as_fill_node = obj
  end

let new_ (child : Render_node.render_node_t) (path : Raw.Path.t)
    (fill_rule : Enums.fillrule) : fill_node_t =
  let child = child#as_render_node in
  let obj_ = Raw.Fill_node.new_ child path fill_rule in
  new fill_node obj_
