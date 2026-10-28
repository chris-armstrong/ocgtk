(** A render node drawing one or more shadows behind its single child node.

    Its methods, signals and properties are on {!class-type-shadow_node_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgsk.Raw.Shadow_node}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ShadowNode].}

    A render node drawing one or more shadows behind its single child node. *)
class type shadow_node_t = object
  inherit Render_node.render_node_t

  method get_child : unit -> Render_node.render_node_t
  (** Retrieves the child [GskRenderNode] of the shadow [node]. *)

  method get_n_shadows : unit -> Gsize.t
  (** Retrieves the number of shadows in the [node]. *)

  method get_shadow : Gsize.t -> Raw.Shadow.t
  (** Retrieves the shadow data at the given index [i]. *)

  method as_shadow_node : Raw.Shadow_node.t
end

class shadow_node : Raw.Shadow_node.t -> shadow_node_t
(** Wraps a raw handle of {!Ocgsk.Raw.Shadow_node.t}. *)

(** {1:constructors Constructors} *)

val new_ :
  Render_node.render_node_t -> Raw.Shadow.t array -> Gsize.t -> shadow_node_t
(** Creates a [GskRenderNode] that will draw a [child] with the given [shadows]
    below it. *)
