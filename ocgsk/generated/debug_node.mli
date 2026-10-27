(** A render node that emits a debugging message when drawing its child node.

    Its methods, signals and properties are on {!class-type-debug_node_t}. The
    functions it is built on are in {!Ocgsk.Raw.Debug_node}. *)

(** The methods, signals and properties of a [GskDebugNode]. *)
class type debug_node_t = object
  inherit Render_node.render_node_t

  method get_child : unit -> Render_node.render_node_t
  (** Gets the child node that is getting drawn by the given [node]. *)

  method get_message : unit -> string
  (** Gets the debug message that was set on this node *)

  method as_debug_node : Raw.Debug_node.t
end

class debug_node : Raw.Debug_node.t -> debug_node_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Debug_node.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GskDebugNode], give one already wrapped. *)

val new_ : Render_node.render_node_t -> string -> debug_node_t
