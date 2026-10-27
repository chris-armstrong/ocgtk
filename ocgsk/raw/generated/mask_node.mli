(* GENERATED CODE - DO NOT EDIT *)
(* MaskNode: MaskNode *)

(** A render node masking one child node with another.

    The class built on this module is in {!Ocgsk.Mask_node}. *)

type t = [ `mask_node | `render_node ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gsk_mask_node_get_type"

external new_ : Render_node.t -> Render_node.t -> Ocgsk_enums.maskmode -> t
  = "ml_gsk_mask_node_new"
(** Creates a [GskRenderNode] that will mask a given node by another.

    The [mask_mode] determines how the 'mask values' are derived from the colors
    of the [mask]. Applying the mask consists of multiplying the 'mask value'
    with the alpha of the source. *)

(* Methods *)

external get_source : t -> Render_node.t = "ml_gsk_mask_node_get_source"
(** Retrieves the source [GskRenderNode] child of the [node]. *)

external get_mask_mode : t -> Ocgsk_enums.maskmode
  = "ml_gsk_mask_node_get_mask_mode"
(** Retrieves the mask mode used by [node]. *)

external get_mask : t -> Render_node.t = "ml_gsk_mask_node_get_mask"
(** Retrieves the mask [GskRenderNode] child of the [node]. *)
