class type stroke_node_t = object
  inherit Render_node.render_node_t
  method get_child : unit -> Render_node.render_node_t
  method get_path : unit -> Raw.Path.t
  method get_stroke : unit -> Raw.Stroke.t
  method as_stroke_node : Raw.Stroke_node.t
end

(* High-level class for StrokeNode *)
class stroke_node (obj : Raw.Stroke_node.t) : stroke_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_child : unit -> Render_node.render_node_t =
      fun () -> new Render_node.render_node (Raw.Stroke_node.get_child obj)

    method get_path : unit -> Raw.Path.t =
      fun () -> Raw.Stroke_node.get_path obj

    method get_stroke : unit -> Raw.Stroke.t =
      fun () -> Raw.Stroke_node.get_stroke obj

    method as_stroke_node = obj
  end

let new_ (child : Render_node.render_node_t) (path : Raw.Path.t)
    (stroke : Raw.Stroke.t) : stroke_node_t =
  let child = child#as_render_node in
  let obj_ = Raw.Stroke_node.new_ child path stroke in
  new stroke_node obj_
