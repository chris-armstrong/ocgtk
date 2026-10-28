class type rounded_clip_node_t = object
  inherit Render_node.render_node_t

  (** {2:methods Methods} *)

  method get_child : unit -> Render_node.render_node_t
  (** Gets the child node that is getting clipped by the given [node]. *)

  method get_clip : unit -> Raw.Rounded_rect.t
  (** Retrieves the rounded rectangle used to clip the contents of the [node].
  *)

  (** {2:conversions Conversions} *)

  method as_rounded_clip_node : Raw.Rounded_clip_node.t
end

(* High-level class for RoundedClipNode *)
class rounded_clip_node (obj : Raw.Rounded_clip_node.t) : rounded_clip_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_child : unit -> Render_node.render_node_t =
      fun () ->
        new Render_node.render_node (Raw.Rounded_clip_node.get_child obj)

    method get_clip : unit -> Raw.Rounded_rect.t =
      fun () -> Raw.Rounded_clip_node.get_clip obj

    method as_rounded_clip_node = obj
  end

let new_ (child : Render_node.render_node_t) (clip : Raw.Rounded_rect.t) :
    rounded_clip_node_t =
  let child = child#as_render_node in
  let obj_ = Raw.Rounded_clip_node.new_ child clip in
  new rounded_clip_node obj_
