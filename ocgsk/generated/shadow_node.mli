(** A render node drawing one or more shadows behind its single child node.

    Its methods, signals and properties are on {!class-type-shadow_node_t}. The
    functions it is built on are in {!Ocgsk.Raw.Shadow_node}. *)

(** The methods, signals and properties of a [GskShadowNode]. *)
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
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Shadow_node.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GskShadowNode], give one already wrapped. *)

val new_ :
  Render_node.render_node_t -> Raw.Shadow.t array -> Gsize.t -> shadow_node_t
