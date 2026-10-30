class type transform_node_t = object
  inherit Render_node.render_node_t

  (** {2:methods Methods} *)

  method get_child : unit -> Render_node.render_node_t
  (** Gets the child node that is getting transformed by the given [node]. *)

  method get_transform : unit -> Raw.Transform.t
  (** Retrieves the [GskTransform] used by the [node]. *)

  (** {2:conversions Conversions} *)

  method as_transform_node : Raw.Transform_node.t
end

(* High-level class for TransformNode *)
class transform_node (obj : Raw.Transform_node.t) : transform_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_child : unit -> Render_node.render_node_t =
      fun () -> new Render_node.render_node (Raw.Transform_node.get_child obj)

    method get_transform : unit -> Raw.Transform.t =
      fun () -> Raw.Transform_node.get_transform obj

    method as_transform_node = obj
  end

let new_ (child : Render_node.render_node_t) (transform : Raw.Transform.t) :
    transform_node_t =
  let child = child#as_render_node in
  let obj_ = Raw.Transform_node.new_ child transform in
  new transform_node obj_
