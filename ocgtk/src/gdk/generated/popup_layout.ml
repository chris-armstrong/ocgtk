(* GENERATED CODE - DO NOT EDIT *)
(* PopupLayout: PopupLayout *)

(** The `GdkPopupLayout` struct contains information that is
necessary position a [iface@Gdk.Popup] relative to its parent.

The positioning requires a negotiation with the windowing system,
since it depends on external constraints, such as the position of
the parent surface, and the screen dimensions.

The basic ingredients are a rectangle on the parent surface,
and the anchor on both that rectangle and the popup. The anchors
specify a side or corner to place next to each other.

![Popup anchors](popup-anchors.png)

For cases where placing the anchors next to each other would make
the popup extend offscreen, the layout includes some hints for how
to resolve this problem. The hints may suggest to flip the anchor
position to the other side, or to 'slide' the popup along a side,
or to resize it.

![Flipping popups](popup-flip.png)

![Sliding popups](popup-slide.png)

These hints may be combined.

Ultimatively, it is up to the windowing system to determine the position
and size of the popup. You can learn about the result by calling
[method@Gdk.Popup.get_position_x], [method@Gdk.Popup.get_position_y],
[method@Gdk.Popup.get_rect_anchor] and [method@Gdk.Popup.get_surface_anchor]
after the popup has been presented. This can be used to adjust the rendering.
For example, [GtkPopover](../gtk4/class.Popover.html) changes its arrow position
accordingly. But you have to be careful avoid changing the size of the popover,
or it has to be presented again. *)
type t = [`popup_layout] Gobject.obj

(* Methods *)
(** Decreases the reference count of @value. *)
external unref : t -> unit = "ml_gdk_popup_layout_unref"

(** Sets the shadow width of the popup.

The shadow width corresponds to the part of the computed
surface size that would consist of the shadow margin
surrounding the window, would there be any. *)
external set_shadow_width : t -> int -> int -> int -> int -> unit = "ml_gdk_popup_layout_set_shadow_width"

(** Offset the position of the anchor rectangle with the given delta. *)
external set_offset : t -> int -> int -> unit = "ml_gdk_popup_layout_set_offset"

(** Set the anchor rectangle. *)
external set_anchor_rect : t -> Rectangle.t -> unit = "ml_gdk_popup_layout_set_anchor_rect"

(** Set new anchor hints.

The set @anchor_hints determines how @surface will be moved
if the anchor points cause it to move off-screen. For example,
%GDK_ANCHOR_FLIP_X will replace %GDK_GRAVITY_NORTH_WEST with
%GDK_GRAVITY_NORTH_EAST and vice versa if @surface extends
beyond the left or right edges of the monitor. *)
external set_anchor_hints : t -> Gdk_enums.anchorhints -> unit = "ml_gdk_popup_layout_set_anchor_hints"

(** Increases the reference count of @value. *)
external ref : t -> t = "ml_gdk_popup_layout_ref"

(** Obtains the shadow widths of this layout. *)
external get_shadow_width : t -> int * int * int * int = "ml_gdk_popup_layout_get_shadow_width"

(** Retrieves the offset for the anchor rectangle. *)
external get_offset : t -> int * int = "ml_gdk_popup_layout_get_offset"

(** Get the anchor rectangle. *)
external get_anchor_rect : t -> Rectangle.t = "ml_gdk_popup_layout_get_anchor_rect"

(** Get the `GdkAnchorHints`. *)
external get_anchor_hints : t -> Gdk_enums.anchorhints = "ml_gdk_popup_layout_get_anchor_hints"

(** Check whether @layout and @other has identical layout properties. *)
external equal : t -> t -> bool = "ml_gdk_popup_layout_equal"

(** Makes a copy of @layout. *)
external copy : t -> t = "ml_gdk_popup_layout_copy"

