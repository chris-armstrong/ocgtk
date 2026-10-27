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

    Its methods, signals and properties are on {!class-type-popup_layout_t}. The
    functions it is built on are in {!Ocgdk.Raw.Popup_layout}. *)

(** The methods, signals and properties of a [GdkPopupLayout]. *)
class type popup_layout_t = object
  method equal : Raw.Popup_layout.t -> bool
  method get_anchor_hints : unit -> Enums.anchorhints
  method get_anchor_rect : unit -> Raw.Rectangle.t
  method get_rect_anchor : unit -> Enums.gravity
  method get_surface_anchor : unit -> Enums.gravity
  method ref : unit -> Raw.Popup_layout.t
  method set_anchor_hints : Enums.anchorhints -> unit
  method set_anchor_rect : Raw.Rectangle.t -> unit
  method set_offset : int -> int -> unit
  method set_rect_anchor : Enums.gravity -> unit
  method set_shadow_width : int -> int -> int -> int -> unit
  method set_surface_anchor : Enums.gravity -> unit
  method as_popup_layout : Raw.Popup_layout.t
end

class popup_layout : Raw.Popup_layout.t -> popup_layout_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Popup_layout.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkPopupLayout], give one already wrapped. *)

val new_ : Raw.Rectangle.t -> Enums.gravity -> Enums.gravity -> popup_layout_t
