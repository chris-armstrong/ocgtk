(* GENERATED CODE - DO NOT EDIT *)
(* BlendNode: BlendNode *)

(** A render node applying a blending function between its two child nodes.

    The class built on this module is in {!Ocgsk.Blend_node}. *)

type t = [ `blend_node | `render_node ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gsk_blend_node_get_type"

external new_ : Render_node.t -> Render_node.t -> Ocgsk_enums.blendmode -> t
  = "ml_gsk_blend_node_new"
(** Creates a [GskRenderNode] that will use [blend_mode] to blend the [top] node
    onto the [bottom] node. *)

(* Methods *)

external get_top_child : t -> Render_node.t = "ml_gsk_blend_node_get_top_child"
(** Retrieves the top [GskRenderNode] child of the [node]. *)

external get_bottom_child : t -> Render_node.t
  = "ml_gsk_blend_node_get_bottom_child"
(** Retrieves the bottom [GskRenderNode] child of the [node]. *)

external get_blend_mode : t -> Ocgsk_enums.blendmode
  = "ml_gsk_blend_node_get_blend_mode"
(** Retrieves the blend mode used by [node]. *)
