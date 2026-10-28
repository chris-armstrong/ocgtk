(** A render node masking one child node with another.

    Its methods, signals and properties are on {!class-type-mask_node_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgsk.Raw.Mask_node}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [MaskNode].}

    A render node masking one child node with another. *)
class type mask_node_t = object
  inherit Render_node.render_node_t

  method get_mask : unit -> Render_node.render_node_t
  (** Retrieves the mask [GskRenderNode] child of the [node]. *)

  method get_mask_mode : unit -> Enums.maskmode
  (** Retrieves the mask mode used by [node]. *)

  method get_source : unit -> Render_node.render_node_t
  (** Retrieves the source [GskRenderNode] child of the [node]. *)

  method as_mask_node : Raw.Mask_node.t
end

class mask_node : Raw.Mask_node.t -> mask_node_t
(** Wraps a raw handle of {!Ocgsk.Raw.Mask_node.t}. *)

(** {1:constructors Constructors} *)

val new_ :
  Render_node.render_node_t ->
  Render_node.render_node_t ->
  Enums.maskmode ->
  mask_node_t
(** Creates a [GskRenderNode] that will mask a given node by another.

    The [mask_mode] determines how the 'mask values' are derived from the colors
    of the [mask]. Applying the mask consists of multiplying the 'mask value'
    with the alpha of the source. *)
