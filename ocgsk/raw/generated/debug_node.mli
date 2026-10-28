(* GENERATED CODE - DO NOT EDIT *)
(* DebugNode: DebugNode *)

(** A render node that emits a debugging message when drawing its child node.

    The class built on this module is in {!Ocgsk.Debug_node}. *)

type t = [ `debug_node | `render_node ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gsk_debug_node_get_type"

external new_ : Render_node.t -> string -> t = "ml_gsk_debug_node_new"
(** Creates a [GskRenderNode] that will add debug information about the given
    [child].

    Adding this node has no visual effect. *)

(* Methods *)

external get_message : t -> string = "ml_gsk_debug_node_get_message"
(** Gets the debug message that was set on this node *)

external get_child : t -> Render_node.t = "ml_gsk_debug_node_get_child"
(** Gets the child node that is getting drawn by the given [node]. *)
