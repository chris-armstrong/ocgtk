class type inset_shadow_node_t = object
  inherit Render_node.render_node_t

  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_inset_shadow_node : Raw.Inset_shadow_node.t
end

(* High-level class for InsetShadowNode *)
class inset_shadow_node (obj : Raw.Inset_shadow_node.t) : inset_shadow_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_blur_radius : unit -> float =
      fun () -> Raw.Inset_shadow_node.get_blur_radius obj

    method get_color : unit -> Ocgdk.Rgb_a.rgb_a_t =
      fun () -> new Ocgdk.Rgb_a.rgb_a (Raw.Inset_shadow_node.get_color obj)

    method get_dx : unit -> float = fun () -> Raw.Inset_shadow_node.get_dx obj
    method get_dy : unit -> float = fun () -> Raw.Inset_shadow_node.get_dy obj

    method get_outline : unit -> Raw.Rounded_rect.t =
      fun () -> Raw.Inset_shadow_node.get_outline obj

    method get_spread : unit -> float =
      fun () -> Raw.Inset_shadow_node.get_spread obj

    method as_inset_shadow_node = obj
  end

let new_ (outline : Raw.Rounded_rect.t) (color : Ocgdk.Rgb_a.rgb_a_t)
    (dx : float) (dy : float) (spread : float) (blur_radius : float) :
    inset_shadow_node_t =
  let color = color#as_rgb_a in
  let obj_ =
    Raw.Inset_shadow_node.new_ outline color dx dy spread blur_radius
  in
  new inset_shadow_node obj_
