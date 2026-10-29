class type cross_fade_node_t = object
  inherit Render_node.render_node_t

  (** {2:methods Methods} *)

  method get_end_child : unit -> Render_node.render_node_t
  (** Retrieves the child [GskRenderNode] at the end of the cross-fade. *)

  method get_progress : unit -> float
  (** Retrieves the progress value of the cross fade. *)

  method get_start_child : unit -> Render_node.render_node_t
  (** Retrieves the child [GskRenderNode] at the beginning of the cross-fade. *)

  (** {2:conversions Conversions} *)

  method as_cross_fade_node : Raw.Cross_fade_node.t
end

(* High-level class for CrossFadeNode *)
class cross_fade_node (obj : Raw.Cross_fade_node.t) : cross_fade_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_end_child : unit -> Render_node.render_node_t =
      fun () ->
        new Render_node.render_node (Raw.Cross_fade_node.get_end_child obj)

    method get_progress : unit -> float =
      fun () -> Raw.Cross_fade_node.get_progress obj

    method get_start_child : unit -> Render_node.render_node_t =
      fun () ->
        new Render_node.render_node (Raw.Cross_fade_node.get_start_child obj)

    method as_cross_fade_node = obj
  end

let new_ (start : Render_node.render_node_t) (end_ : Render_node.render_node_t)
    (progress : float) : cross_fade_node_t =
  let start = start#as_render_node in
  let end_ = end_#as_render_node in
  let obj_ = Raw.Cross_fade_node.new_ start end_ progress in
  new cross_fade_node obj_
