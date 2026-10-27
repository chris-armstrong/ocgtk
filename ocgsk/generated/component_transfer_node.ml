class type component_transfer_node_t = object
  inherit Render_node.render_node_t

  method get_child : unit -> Render_node.render_node_t
  (** Gets the child node that is getting drawn by the given [node]. *)

  method get_transfer : int -> Raw.Component_transfer.t
  (** Gets the component transfer for one of the components. *)

  method as_component_transfer_node : Raw.Component_transfer_node.t
end

(* High-level class for ComponentTransferNode *)
class component_transfer_node (obj : Raw.Component_transfer_node.t) :
  component_transfer_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_child : unit -> Render_node.render_node_t =
      fun () ->
        new Render_node.render_node (Raw.Component_transfer_node.get_child obj)

    method get_transfer : int -> Raw.Component_transfer.t =
      fun component -> Raw.Component_transfer_node.get_transfer obj component

    method as_component_transfer_node = obj
  end

let new_ (child : Render_node.render_node_t) (r : Raw.Component_transfer.t)
    (g : Raw.Component_transfer.t) (b : Raw.Component_transfer.t)
    (a : Raw.Component_transfer.t) : component_transfer_node_t =
  let child = child#as_render_node in
  let obj_ = Raw.Component_transfer_node.new_ child r g b a in
  new component_transfer_node obj_
