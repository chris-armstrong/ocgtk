(* GENERATED CODE - DO NOT EDIT *)
(* ColorNode: ColorNode *)

type t = [`color_node | `render_node] Gobject.obj

(** Create a new ColorNode *)
external new_ : Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t -> Ocgtk_graphene.Graphene.Wrappers.Rect.t -> t = "ml_gsk_color_node_new"

(* Methods *)
(** Retrieves the color of the given @node. *)
external get_color : t -> Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t = "ml_gsk_color_node_get_color"

