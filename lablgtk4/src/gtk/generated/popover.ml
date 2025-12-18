(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Popover *)

type t = [`popover | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new Popover *)
external new_ : unit -> t = "ml_gtk_popover_new"

(* Properties *)

(** Sets the preferred position for @popover to appear.

If the @popover is currently visible, it will be immediately
updated.

This preference will be respected where possible, although
on lack of space (eg. if close to the window edges), the
`GtkPopover` may choose to appear on the opposite side. *)
external set_position : t -> Gtk_enums.positiontype -> unit = "ml_gtk_popover_set_position"

(** Sets the offset to use when calculating the position
of the popover.

These values are used when preparing the [struct@Gdk.PopupLayout]
for positioning the popover. *)
external set_offset : t -> int -> int -> unit = "ml_gtk_popover_set_offset"

(** Sets whether mnemonics should be visible. *)
external set_mnemonics_visible : t -> bool -> unit = "ml_gtk_popover_set_mnemonics_visible"

(** Sets whether this popover should draw an arrow
pointing at the widget it is relative to. *)
external set_has_arrow : t -> bool -> unit = "ml_gtk_popover_set_has_arrow"

(** Sets the default widget of a `GtkPopover`.

The default widget is the widget that’s activated when the user
presses Enter in a dialog (for example). This function sets or
unsets the default widget for a `GtkPopover`. *)
external set_default_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_popover_set_default_widget"

(** Sets the child widget of @popover. *)
external set_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_popover_set_child"

(** If @cascade_popdown is %TRUE, the popover will be
closed when a child modal popover is closed.

If %FALSE, @popover will stay visible. *)
external set_cascade_popdown : t -> bool -> unit = "ml_gtk_popover_set_cascade_popdown"

(** Sets whether @popover is modal.

A modal popover will grab the keyboard focus on it when being
displayed. Focus will wrap around within the popover. Clicking
outside the popover area or pressing Esc will dismiss the popover.

Called this function on an already showing popup with a new
autohide value different from the current one, will cause the
popup to be hidden. *)
external set_autohide : t -> bool -> unit = "ml_gtk_popover_set_autohide"

(** Allocate a size for the `GtkPopover`.

This function needs to be called in size-allocate by widgets
who have a `GtkPopover` as child. When using a layout manager,
this is happening automatically.

To make a popover appear on screen, use [method@Gtk.Popover.popup]. *)
external present : t -> unit = "ml_gtk_popover_present"

(** Pops @popover up. *)
external popup : t -> unit = "ml_gtk_popover_popup"

(** Pops @popover down.

This may have the side-effect of closing a parent popover
as well. See [property@Gtk.Popover:cascade-popdown]. *)
external popdown : t -> unit = "ml_gtk_popover_popdown"

(** Returns the preferred position of @popover. *)
external get_position : t -> Gtk_enums.positiontype = "ml_gtk_popover_get_position"

(** Gets whether mnemonics are visible. *)
external get_mnemonics_visible : t -> bool = "ml_gtk_popover_get_mnemonics_visible"

(** Gets whether this popover is showing an arrow
pointing at the widget that it is relative to. *)
external get_has_arrow : t -> bool = "ml_gtk_popover_get_has_arrow"

(** Gets the child widget of @popover. *)
external get_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_popover_get_child"

(** Returns whether the popover will close after a modal child is closed. *)
external get_cascade_popdown : t -> bool = "ml_gtk_popover_get_cascade_popdown"

(** Returns whether the popover is modal.

See [method@Gtk.Popover.set_autohide] for the
implications of this. *)
external get_autohide : t -> bool = "ml_gtk_popover_get_autohide"

