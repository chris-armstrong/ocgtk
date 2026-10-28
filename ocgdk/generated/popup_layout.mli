(** Contains information that is necessary position a [Gdk.Popup] relative to
    its parent.

    The positioning requires a negotiation with the windowing system, since it
    depends on external constraints, such as the position of the parent surface,
    and the screen dimensions.

    The basic ingredients are a rectangle on the parent surface, and the anchor
    on both that rectangle and the popup. The anchors specify a side or corner
    to place next to each other.

    Popup anchors

    For cases where placing the anchors next to each other would make the popup
    extend offscreen, the layout includes some hints for how to resolve this
    problem. The hints may suggest to flip the anchor position to the other
    side, or to 'slide' the popup along a side, or to resize it.

    Flipping popups

    Sliding popups

    These hints may be combined.

    Ultimatively, it is up to the windowing system to determine the position and
    size of the popup. You can learn about the result by calling
    [Gdk.Popup.get_position_x], [Gdk.Popup.get_position_y],
    [Gdk.Popup.get_rect_anchor] and [Gdk.Popup.get_surface_anchor] after the
    popup has been presented. This can be used to adjust the rendering. For
    example, GtkPopover changes its arrow position accordingly. But you have to
    be careful avoid changing the size of the popover, or it has to be presented
    again.

    Its methods, signals and properties are on {!class-type-popup_layout_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgdk.Raw.Popup_layout}. *)

(** {b The methods, signals and properties of a [PopupLayout].}

    Contains information that is necessary position a [Gdk.Popup] relative to
    its parent.

    The positioning requires a negotiation with the windowing system, since it
    depends on external constraints, such as the position of the parent surface,
    and the screen dimensions.

    The basic ingredients are a rectangle on the parent surface, and the anchor
    on both that rectangle and the popup. The anchors specify a side or corner
    to place next to each other.

    Popup anchors

    For cases where placing the anchors next to each other would make the popup
    extend offscreen, the layout includes some hints for how to resolve this
    problem. The hints may suggest to flip the anchor position to the other
    side, or to 'slide' the popup along a side, or to resize it.

    Flipping popups

    Sliding popups

    These hints may be combined.

    Ultimatively, it is up to the windowing system to determine the position and
    size of the popup. You can learn about the result by calling
    [Gdk.Popup.get_position_x], [Gdk.Popup.get_position_y],
    [Gdk.Popup.get_rect_anchor] and [Gdk.Popup.get_surface_anchor] after the
    popup has been presented. This can be used to adjust the rendering. For
    example, GtkPopover changes its arrow position accordingly. But you have to
    be careful avoid changing the size of the popover, or it has to be presented
    again. *)
class type popup_layout_t = object
  method equal : Raw.Popup_layout.t -> bool
  (** Check whether [layout] and [other] has identical layout properties. *)

  method get_anchor_hints : unit -> Enums.anchorhints
  (** Get the anchor hints. *)

  method get_anchor_rect : unit -> Raw.Rectangle.t
  (** Get the anchor rectangle. *)

  method get_rect_anchor : unit -> Enums.gravity
  (** Returns the anchor position on the anchor rectangle. *)

  method get_surface_anchor : unit -> Enums.gravity
  (** Returns the anchor position on the popup surface. *)

  method ref : unit -> Raw.Popup_layout.t
  (** Increases the reference count of [value]. *)

  method set_anchor_hints : Enums.anchorhints -> unit
  (** Set new anchor hints.

      The set [anchor_hints] determines how [surface] will be moved if the
      anchor points cause it to move off-screen. For example,
      [GDK_ANCHOR_FLIP_X] will replace [GDK_GRAVITY_NORTH_WEST] with
      [GDK_GRAVITY_NORTH_EAST] and vice versa if [surface] extends beyond the
      left or right edges of the monitor. *)

  method set_anchor_rect : Raw.Rectangle.t -> unit
  (** Set the anchor rectangle. *)

  method set_offset : int -> int -> unit
  (** Offset the position of the anchor rectangle with the given delta. *)

  method set_rect_anchor : Enums.gravity -> unit
  (** Set the anchor on the anchor rectangle. *)

  method set_shadow_width : int -> int -> int -> int -> unit
  (** Sets the shadow width of the popup.

      The shadow width corresponds to the part of the computed surface size that
      would consist of the shadow margin surrounding the window, would there be
      any. *)

  method set_surface_anchor : Enums.gravity -> unit
  (** Set the anchor on the popup surface. *)

  method as_popup_layout : Raw.Popup_layout.t
end

class popup_layout : Raw.Popup_layout.t -> popup_layout_t
(** Wraps a raw handle of {!Ocgdk.Raw.Popup_layout.t}. *)

(** {2:constructors Constructors} *)

val new_ : Raw.Rectangle.t -> Enums.gravity -> Enums.gravity -> popup_layout_t
(** Create a popup layout description.

    Used together with [Gdk.Popup.present] to describe how a popup surface
    should be placed and behave on-screen.

    [anchor_rect] is relative to the top-left corner of the surface's parent.
    [rect_anchor] and [surface_anchor] determine anchor points on [anchor_rect]
    and surface to pin together.

    The position of [anchor_rect]'s anchor point can optionally be offset using
    [Gdk.PopupLayout.set_offset], which is equivalent to offsetting the position
    of surface. *)
