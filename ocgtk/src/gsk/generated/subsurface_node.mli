(* GENERATED CODE - DO NOT EDIT *)
(* SubsurfaceNode: SubsurfaceNode *)

(** A render node that potentially diverts a part of the scene graph to a
    subsurface. *)

type t = [ `subsurface_node | `render_node ] Gobject.obj

(* Methods *)

external get_child : t -> Render_node.t = "ml_gsk_subsurface_node_get_child"
(** Gets the child node that is getting drawn by the given [node]. *)
