(* GENERATED CODE - DO NOT EDIT *)
(* ColorNode: ColorNode *)

(** A render node for a solid color. *)

type t = [ `color_node | `render_node ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gsk_color_node_get_type"

external new_ : Ocgdk_raw.Rgb_a.t -> Ocgraphene_raw.Rect.t -> t
  = "ml_gsk_color_node_new"
(** Create a new ColorNode *)

(* Methods *)

external get_color : t -> Ocgdk_raw.Rgb_a.t = "ml_gsk_color_node_get_color"
(** Retrieves the color of the given [node].

    The value returned by this function will not be correct if the render node
    was created for a non-sRGB color. *)
