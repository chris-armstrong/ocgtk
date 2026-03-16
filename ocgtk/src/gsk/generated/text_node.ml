(* GENERATED CODE - DO NOT EDIT *)
(* TextNode: TextNode *)

type t = [`text_node | `render_node] Gobject.obj

(** Create a new TextNode *)
external new_ : unit -> unit -> unit -> unit -> t = "ml_gsk_text_node_new"

(* Methods *)
(** Checks whether the text @node has color glyphs. *)
external has_color_glyphs : t -> bool = "ml_gsk_text_node_has_color_glyphs"

(** Retrieves the number of glyphs in the text node. *)
external get_num_glyphs : t -> int = "ml_gsk_text_node_get_num_glyphs"

