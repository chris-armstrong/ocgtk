(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ScrolledWindow *)

type t = [`scrolled_window | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new ScrolledWindow *)
external new_ : unit -> t = "ml_gtk_scrolled_window_new"

(* Properties *)

(** Get property: has-frame *)
external get_has_frame : t -> bool = "ml_gtk_scrolled_window_get_has_frame"

(** Set property: has-frame *)
external set_has_frame : t -> bool -> unit = "ml_gtk_scrolled_window_set_has_frame"

(** Get property: kinetic-scrolling *)
external get_kinetic_scrolling : t -> bool = "ml_gtk_scrolled_window_get_kinetic_scrolling"

(** Set property: kinetic-scrolling *)
external set_kinetic_scrolling : t -> bool -> unit = "ml_gtk_scrolled_window_set_kinetic_scrolling"

(** Get property: max-content-height *)
external get_max_content_height : t -> int = "ml_gtk_scrolled_window_get_max_content_height"

(** Set property: max-content-height *)
external set_max_content_height : t -> int -> unit = "ml_gtk_scrolled_window_set_max_content_height"

(** Get property: max-content-width *)
external get_max_content_width : t -> int = "ml_gtk_scrolled_window_get_max_content_width"

(** Set property: max-content-width *)
external set_max_content_width : t -> int -> unit = "ml_gtk_scrolled_window_set_max_content_width"

(** Get property: min-content-height *)
external get_min_content_height : t -> int = "ml_gtk_scrolled_window_get_min_content_height"

(** Set property: min-content-height *)
external set_min_content_height : t -> int -> unit = "ml_gtk_scrolled_window_set_min_content_height"

(** Get property: min-content-width *)
external get_min_content_width : t -> int = "ml_gtk_scrolled_window_get_min_content_width"

(** Set property: min-content-width *)
external set_min_content_width : t -> int -> unit = "ml_gtk_scrolled_window_set_min_content_width"

(** Get property: overlay-scrolling *)
external get_overlay_scrolling : t -> bool = "ml_gtk_scrolled_window_get_overlay_scrolling"

(** Set property: overlay-scrolling *)
external set_overlay_scrolling : t -> bool -> unit = "ml_gtk_scrolled_window_set_overlay_scrolling"

(** Get property: propagate-natural-height *)
external get_propagate_natural_height : t -> bool = "ml_gtk_scrolled_window_get_propagate_natural_height"

(** Set property: propagate-natural-height *)
external set_propagate_natural_height : t -> bool -> unit = "ml_gtk_scrolled_window_set_propagate_natural_height"

(** Get property: propagate-natural-width *)
external get_propagate_natural_width : t -> bool = "ml_gtk_scrolled_window_get_propagate_natural_width"

(** Set property: propagate-natural-width *)
external set_propagate_natural_width : t -> bool -> unit = "ml_gtk_scrolled_window_set_propagate_natural_width"

(** Unsets the placement of the contents with respect to the scrollbars.

If no window placement is set for a scrolled window,
it defaults to %GTK_CORNER_TOP_LEFT. *)
external unset_placement : t -> unit = "ml_gtk_scrolled_window_unset_placement"

(** Sets the `GtkAdjustment` for the vertical scrollbar. *)
external set_vadjustment : t -> Adjustment.t option -> unit = "ml_gtk_scrolled_window_set_vadjustment"

(** Sets the scrollbar policy for the horizontal and vertical scrollbars.

The policy determines when the scrollbar should appear; it is a value
from the [enum@Gtk.PolicyType] enumeration. If %GTK_POLICY_ALWAYS, the
scrollbar is always present; if %GTK_POLICY_NEVER, the scrollbar is
never present; if %GTK_POLICY_AUTOMATIC, the scrollbar is present only
if needed (that is, if the slider part of the bar would be smaller
than the trough — the display is larger than the page size). *)
external set_policy : t -> Gtk_enums.policytype -> Gtk_enums.policytype -> unit = "ml_gtk_scrolled_window_set_policy"

(** Sets the placement of the contents with respect to the scrollbars
for the scrolled window.

The default is %GTK_CORNER_TOP_LEFT, meaning the child is
in the top left, with the scrollbars underneath and to the right.
Other values in [enum@Gtk.CornerType] are %GTK_CORNER_TOP_RIGHT,
%GTK_CORNER_BOTTOM_LEFT, and %GTK_CORNER_BOTTOM_RIGHT.

See also [method@Gtk.ScrolledWindow.get_placement] and
[method@Gtk.ScrolledWindow.unset_placement]. *)
external set_placement : t -> Gtk_enums.cornertype -> unit = "ml_gtk_scrolled_window_set_placement"

(** Sets the `GtkAdjustment` for the horizontal scrollbar. *)
external set_hadjustment : t -> Adjustment.t option -> unit = "ml_gtk_scrolled_window_set_hadjustment"

(** Sets the child widget of @scrolled_window.

If @child does not implement the [iface@Gtk.Scrollable] interface,
the scrolled window will add @child to a [class@Gtk.Viewport] instance
and then add the viewport as its child widget. *)
external set_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_scrolled_window_set_child"

(** Returns the vertical scrollbar of @scrolled_window. *)
external get_vscrollbar : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = "ml_gtk_scrolled_window_get_vscrollbar"

(** Returns the vertical scrollbar’s adjustment.

This is the adjustment used to connect the vertical
scrollbar to the child widget’s vertical scroll functionality. *)
external get_vadjustment : t -> Adjustment.t = "ml_gtk_scrolled_window_get_vadjustment"

(** Retrieves the current policy values for the horizontal and vertical
scrollbars.

See [method@Gtk.ScrolledWindow.set_policy]. *)
external get_policy : t -> Gtk_enums.policytype * Gtk_enums.policytype = "ml_gtk_scrolled_window_get_policy"

(** Gets the placement of the contents with respect to the scrollbars. *)
external get_placement : t -> Gtk_enums.cornertype = "ml_gtk_scrolled_window_get_placement"

(** Returns the horizontal scrollbar of @scrolled_window. *)
external get_hscrollbar : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = "ml_gtk_scrolled_window_get_hscrollbar"

(** Returns the horizontal scrollbar’s adjustment.

This is the adjustment used to connect the horizontal scrollbar
to the child widget’s horizontal scroll functionality. *)
external get_hadjustment : t -> Adjustment.t = "ml_gtk_scrolled_window_get_hadjustment"

(** Gets the child widget of @scrolled_window.

If the scrolled window automatically added a [class@Gtk.Viewport], this
function will return the viewport widget, and you can retrieve its child
using [method@Gtk.Viewport.get_child]. *)
external get_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_scrolled_window_get_child"

