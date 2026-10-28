(** A render node that emits a debugging message when drawing its child node.

    Its methods, signals and properties are on {!class-type-debug_node_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgsk.Raw.Debug_node}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DebugNode].}

    A render node that emits a debugging message when drawing its child node. *)
class type debug_node_t = object
  inherit Render_node.render_node_t

  method get_child : unit -> Render_node.render_node_t
  (** Gets the child node that is getting drawn by the given [node]. *)

  method get_message : unit -> string
  (** Gets the debug message that was set on this node *)

  method as_debug_node : Raw.Debug_node.t
end

class debug_node : Raw.Debug_node.t -> debug_node_t
(** Wraps a raw handle of {!Ocgsk.Raw.Debug_node.t}. *)

(** {1:constructors Constructors} *)

val new_ : Render_node.render_node_t -> string -> debug_node_t
(** Creates a [GskRenderNode] that will add debug information about the given
    [child].

    Adding this node has no visual effect. *)
