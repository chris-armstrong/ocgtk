class type clip_node_t = object
  inherit Render_node.render_node_t

  method get_child : unit -> Render_node.render_node_t
  (** Gets the child node that is getting clipped by the given [node]. *)

  method get_clip : unit -> Ocgraphene.Rect.rect_t
  (** Retrieves the clip rectangle for [node]. *)

  method as_clip_node : Raw.Clip_node.t
end

(* High-level class for ClipNode *)
class clip_node (obj : Raw.Clip_node.t) : clip_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_child : unit -> Render_node.render_node_t =
      fun () -> new Render_node.render_node (Raw.Clip_node.get_child obj)

    method get_clip : unit -> Ocgraphene.Rect.rect_t =
      fun () -> new Ocgraphene.Rect.rect (Raw.Clip_node.get_clip obj)

    method as_clip_node = obj
  end

let new_ (child : Render_node.render_node_t) (clip : Ocgraphene.Rect.rect_t) :
    clip_node_t =
  let child = child#as_render_node in
  let clip = clip#as_rect in
  let obj_ = Raw.Clip_node.new_ child clip in
  new clip_node obj_
