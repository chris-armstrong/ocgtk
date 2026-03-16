(* GENERATED CODE - DO NOT EDIT *)
(* BorderNode: BorderNode *)

type t = [`border_node | `render_node] Gobject.obj

(** Create a new BorderNode *)
external new_ : Rounded_rect.t -> float array -> unit -> t = "ml_gsk_border_node_new"

(* Methods *)
(** Retrieves the stroke widths of the border. *)
external get_widths : t -> float array = "ml_gsk_border_node_get_widths"

(** Retrieves the outline of the border. *)
external get_outline : t -> Rounded_rect.t = "ml_gsk_border_node_get_outline"

