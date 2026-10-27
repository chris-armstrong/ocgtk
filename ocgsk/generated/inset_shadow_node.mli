(** A render node for an inset shadow.

    Its methods, signals and properties are on
    {!class-type-inset_shadow_node_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgsk.Raw.Inset_shadow_node}. *)

(** The methods, signals and properties of a [GskInsetShadowNode]. *)
class type inset_shadow_node_t = object
  inherit Render_node.render_node_t

  method get_blur_radius : unit -> float
  (** Retrieves the blur radius to apply to the shadow. *)

  method get_color : unit -> Ocgdk.Rgb_a.rgb_a_t
  (** Retrieves the color of the inset shadow.

      The value returned by this function will not be correct if the render node
      was created for a non-sRGB color. *)

  method get_dx : unit -> float
  (** Retrieves the horizontal offset of the inset shadow. *)

  method get_dy : unit -> float
  (** Retrieves the vertical offset of the inset shadow. *)

  method get_outline : unit -> Raw.Rounded_rect.t
  (** Retrieves the outline rectangle of the inset shadow. *)

  method get_spread : unit -> float
  (** Retrieves how much the shadow spreads inwards. *)

  method as_inset_shadow_node : Raw.Inset_shadow_node.t
end

class inset_shadow_node : Raw.Inset_shadow_node.t -> inset_shadow_node_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Inset_shadow_node.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GskInsetShadowNode], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ :
  Raw.Rounded_rect.t ->
  Ocgdk.Rgb_a.rgb_a_t ->
  float ->
  float ->
  float ->
  float ->
  inset_shadow_node_t
(** Creates a [GskRenderNode] that will render an inset shadow into the box
    given by [outline]. *)
