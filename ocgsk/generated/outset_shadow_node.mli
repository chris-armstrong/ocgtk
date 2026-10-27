(** A render node for an outset shadow.

    Its methods, signals and properties are on
    {!class-type-outset_shadow_node_t}. The functions it is built on are in
    {!Ocgsk.Raw.Outset_shadow_node}. *)

(** The methods, signals and properties of a [GskOutsetShadowNode]. *)
class type outset_shadow_node_t = object
  inherit Render_node.render_node_t

  method get_blur_radius : unit -> float
  (** Retrieves the blur radius of the shadow. *)

  method get_color : unit -> Ocgdk.Rgb_a.rgb_a_t
  (** Retrieves the color of the outset shadow.

      The value returned by this function will not be correct if the render node
      was created for a non-sRGB color. *)

  method get_dx : unit -> float
  (** Retrieves the horizontal offset of the outset shadow. *)

  method get_dy : unit -> float
  (** Retrieves the vertical offset of the outset shadow. *)

  method get_outline : unit -> Raw.Rounded_rect.t
  (** Retrieves the outline rectangle of the outset shadow. *)

  method get_spread : unit -> float
  (** Retrieves how much the shadow spreads outwards. *)

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
