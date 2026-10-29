class type mask_node_t = object
  inherit Render_node.render_node_t

  (** {2:methods Methods} *)

  method get_mask : unit -> Render_node.render_node_t
  (** Retrieves the mask [GskRenderNode] child of the [node]. *)

  method get_mask_mode : unit -> Enums.maskmode
  (** Retrieves the mask mode used by [node]. *)

  method get_source : unit -> Render_node.render_node_t
  (** Retrieves the source [GskRenderNode] child of the [node]. *)

  (** {2:conversions Conversions} *)

  method as_mask_node : Raw.Mask_node.t
end

(* High-level class for MaskNode *)
class mask_node (obj : Raw.Mask_node.t) : mask_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_mask : unit -> Render_node.render_node_t =
      fun () -> new Render_node.render_node (Raw.Mask_node.get_mask obj)

    method get_mask_mode : unit -> Enums.maskmode =
      fun () -> Raw.Mask_node.get_mask_mode obj

    method get_source : unit -> Render_node.render_node_t =
      fun () -> new Render_node.render_node (Raw.Mask_node.get_source obj)

    method as_mask_node = obj
  end

let new_ (source : Render_node.render_node_t) (mask : Render_node.render_node_t)
    (mask_mode : Enums.maskmode) : mask_node_t =
  let source = source#as_render_node in
  let mask = mask#as_render_node in
  let obj_ = Raw.Mask_node.new_ source mask mask_mode in
  new mask_node obj_
