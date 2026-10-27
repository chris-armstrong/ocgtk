(** A render node for an outset shadow.

    Its methods, signals and properties are on
    {!class-type-outset_shadow_node_t}. The functions it is built on are in
    {!Ocgsk.Raw.Outset_shadow_node}. *)

(** The methods, signals and properties of a [GskOutsetShadowNode]. *)
class type outset_shadow_node_t = object
  inherit Render_node.render_node_t
  method get_blur_radius : unit -> float
  method get_color : unit -> Ocgdk.Rgb_a.rgb_a_t
  method get_dx : unit -> float
  method get_dy : unit -> float
  method get_outline : unit -> Raw.Rounded_rect.t
  method get_spread : unit -> float
  method as_outset_shadow_node : Raw.Outset_shadow_node.t
end

class outset_shadow_node : Raw.Outset_shadow_node.t -> outset_shadow_node_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Outset_shadow_node.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GskOutsetShadowNode], give one already wrapped. *)

val new_ :
  Raw.Rounded_rect.t ->
  Ocgdk.Rgb_a.rgb_a_t ->
  float ->
  float ->
  float ->
  float ->
  outset_shadow_node_t
