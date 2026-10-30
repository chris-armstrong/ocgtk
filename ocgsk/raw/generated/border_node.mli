(* GENERATED CODE - DO NOT EDIT *)
(* BorderNode: BorderNode *)

(** A render node for a border.

    The class built on this module is in {!Ocgsk.Border_node}. *)

type t = [ `border_node | `render_node ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gsk_border_node_get_type"

external new_ : Rounded_rect.t -> float array -> Ocgdk_raw.Rgb_a.t array -> t
  = "ml_gsk_border_node_new"
(** Creates a [GskRenderNode] that will stroke a border rectangle inside the
    given [outline].

    The 4 sides of the border can have different widths and colors. *)

(* Methods *)

external get_widths : t -> float array = "ml_gsk_border_node_get_widths"
(** Retrieves the stroke widths of the border. *)

external get_outline : t -> Rounded_rect.t = "ml_gsk_border_node_get_outline"
(** Retrieves the outline of the border. *)

external get_colors : t -> Ocgdk_raw.Rgb_a.t array
  = "ml_gsk_border_node_get_colors"
(** Retrieves the colors of the border. *)
