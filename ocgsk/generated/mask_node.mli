(** A render node masking one child node with another.

    Its methods, signals and properties are on {!class-type-mask_node_t}. The
    functions it is built on are in {!Ocgsk.Raw.Mask_node}. *)

(** The methods, signals and properties of a [GskMaskNode]. *)
class type mask_node_t = object
  inherit Render_node.render_node_t
  method get_mask : unit -> Render_node.render_node_t
  method get_mask_mode : unit -> Enums.maskmode
  method get_source : unit -> Render_node.render_node_t
  method as_mask_node : Raw.Mask_node.t
end

class mask_node : Raw.Mask_node.t -> mask_node_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Mask_node.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GskMaskNode], give one already wrapped. *)

val new_ :
  Render_node.render_node_t ->
  Render_node.render_node_t ->
  Enums.maskmode ->
  mask_node_t
