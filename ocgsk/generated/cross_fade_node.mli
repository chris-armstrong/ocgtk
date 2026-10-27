(** A render node cross fading between two child nodes.

    Its methods, signals and properties are on {!class-type-cross_fade_node_t}.
    The functions it is built on are in {!Ocgsk.Raw.Cross_fade_node}. *)

(** The methods, signals and properties of a [GskCrossFadeNode]. *)
class type cross_fade_node_t = object
  inherit Render_node.render_node_t
  method get_end_child : unit -> Render_node.render_node_t
  method get_progress : unit -> float
  method get_start_child : unit -> Render_node.render_node_t
  method as_cross_fade_node : Raw.Cross_fade_node.t
end

class cross_fade_node : Raw.Cross_fade_node.t -> cross_fade_node_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Cross_fade_node.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GskCrossFadeNode], give one already wrapped. *)

val new_ :
  Render_node.render_node_t ->
  Render_node.render_node_t ->
  float ->
  cross_fade_node_t
