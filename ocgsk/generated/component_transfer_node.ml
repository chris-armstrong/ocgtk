class type component_transfer_node_t = object
  inherit GRender_node.render_node_t
  method get_child : unit -> GRender_node.render_node_t
  method get_transfer : int -> Component_transfer.t
  method as_component_transfer_node : Component_transfer_node.t
end

(* High-level class for ComponentTransferNode *)
class component_transfer_node (obj : Component_transfer_node.t) :
  component_transfer_node_t =
  object (self)
    inherit GRender_node.render_node (obj :> Render_node.t)

    method get_child : unit -> GRender_node.render_node_t =
      fun () ->
        new GRender_node.render_node (Component_transfer_node.get_child obj)

    method get_transfer : int -> Component_transfer.t =
      fun component -> Component_transfer_node.get_transfer obj component

    method as_component_transfer_node = obj
  end

let new_ (child : GRender_node.render_node_t) (r : Component_transfer.t)
    (g : Component_transfer.t) (b : Component_transfer.t)
    (a : Component_transfer.t) : component_transfer_node_t =
  let child = child#as_render_node in
  let obj_ = Component_transfer_node.new_ child r g b a in
  new component_transfer_node obj_
