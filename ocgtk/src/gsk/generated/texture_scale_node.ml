(* GENERATED CODE - DO NOT EDIT *)
(* TextureScaleNode: TextureScaleNode *)

type t = [`texture_scale_node | `render_node] Gobject.obj

(** Create a new TextureScaleNode *)
external new_ : unit -> unit -> Gsk_enums.scalingfilter -> t = "ml_gsk_texture_scale_node_new"

(* Methods *)
(** Retrieves the `GskScalingFilter` used when creating this `GskRenderNode`. *)
external get_filter : t -> Gsk_enums.scalingfilter = "ml_gsk_texture_scale_node_get_filter"

