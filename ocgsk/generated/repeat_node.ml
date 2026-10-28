class type repeat_node_t = object
  inherit Render_node.render_node_t

  method get_child : unit -> Render_node.render_node_t
  (** Retrieves the child of [node]. *)

  method get_child_bounds : unit -> Ocgraphene.Rect.rect_t
  (** Retrieves the bounding rectangle of the child of [node]. *)

  method as_repeat_node : Raw.Repeat_node.t
end

(* High-level class for RepeatNode *)
class repeat_node (obj : Raw.Repeat_node.t) : repeat_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_child : unit -> Render_node.render_node_t =
      fun () -> new Render_node.render_node (Raw.Repeat_node.get_child obj)

    method get_child_bounds : unit -> Ocgraphene.Rect.rect_t =
      fun () -> new Ocgraphene.Rect.rect (Raw.Repeat_node.get_child_bounds obj)

    method as_repeat_node = obj
  end

let new_ (bounds : Ocgraphene.Rect.rect_t) (child : Render_node.render_node_t)
    (child_bounds : Ocgraphene.Rect.rect_t option) : repeat_node_t =
  let bounds = bounds#as_rect in
  let child = child#as_render_node in
  let child_bounds = Option.map (fun c -> c#as_rect) child_bounds in
  let obj_ = Raw.Repeat_node.new_ bounds child child_bounds in
  new repeat_node obj_
