class type stroke_node_t = object
  inherit GRender_node.render_node_t
  method get_child : unit -> GRender_node.render_node_t
  method get_path : unit -> Path_and__path_measure_and__path_point.Path.t
  method get_stroke : unit -> Stroke.t
  method as_stroke_node : Stroke_node.t
end

(* High-level class for StrokeNode *)
class stroke_node (obj : Stroke_node.t) : stroke_node_t =
  object (self)
    inherit GRender_node.render_node (obj :> Render_node.t)

    method get_child : unit -> GRender_node.render_node_t =
      fun () -> new GRender_node.render_node (Stroke_node.get_child obj)

    method get_path : unit -> Path_and__path_measure_and__path_point.Path.t =
      fun () -> Stroke_node.get_path obj

    method get_stroke : unit -> Stroke.t = fun () -> Stroke_node.get_stroke obj
    method as_stroke_node = obj
  end

let new_ (child : GRender_node.render_node_t)
    (path : Path_and__path_measure_and__path_point.Path.t) (stroke : Stroke.t) :
    stroke_node_t =
  let child = child#as_render_node in
  let obj_ = Stroke_node.new_ child path stroke in
  new stroke_node obj_
