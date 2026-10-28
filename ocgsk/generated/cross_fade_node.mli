(** A render node cross fading between two child nodes.

    Its methods, signals and properties are on {!class-type-cross_fade_node_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgsk.Raw.Cross_fade_node}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [CrossFadeNode].}

    A render node cross fading between two child nodes. *)
class type cross_fade_node_t = object
  inherit Render_node.render_node_t

  method get_end_child : unit -> Render_node.render_node_t
  (** Retrieves the child [GskRenderNode] at the end of the cross-fade. *)

  method get_progress : unit -> float
  (** Retrieves the progress value of the cross fade. *)

  method get_start_child : unit -> Render_node.render_node_t
  (** Retrieves the child [GskRenderNode] at the beginning of the cross-fade. *)

  method as_cross_fade_node : Raw.Cross_fade_node.t
end

class cross_fade_node : Raw.Cross_fade_node.t -> cross_fade_node_t
(** Wraps a raw handle of {!Ocgsk.Raw.Cross_fade_node.t}. *)

(** {1:constructors Constructors} *)

val new_ :
  Render_node.render_node_t ->
  Render_node.render_node_t ->
  float ->
  cross_fade_node_t
(** Creates a [GskRenderNode] that will do a cross-fade between [start] and
    [end]. *)
