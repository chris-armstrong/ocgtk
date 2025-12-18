(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Popover *)

type t = [`popover | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new Popover *)
external new_ : unit -> t = "ml_gtk_popover_new"

(* Properties *)

(** Get property: autohide *)
external get_autohide : t -> bool = "ml_gtk_popover_get_autohide"

(** Set property: autohide *)
external set_autohide : t -> bool -> unit = "ml_gtk_popover_set_autohide"

(** Get property: cascade-popdown *)
external get_cascade_popdown : t -> bool = "ml_gtk_popover_get_cascade_popdown"

(** Set property: cascade-popdown *)
external set_cascade_popdown : t -> bool -> unit = "ml_gtk_popover_set_cascade_popdown"

(** Get property: has-arrow *)
external get_has_arrow : t -> bool = "ml_gtk_popover_get_has_arrow"

(** Set property: has-arrow *)
external set_has_arrow : t -> bool -> unit = "ml_gtk_popover_set_has_arrow"

(** Get property: mnemonics-visible *)
external get_mnemonics_visible : t -> bool = "ml_gtk_popover_get_mnemonics_visible"

(** Set property: mnemonics-visible *)
external set_mnemonics_visible : t -> bool -> unit = "ml_gtk_popover_set_mnemonics_visible"

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

(** Sets the default widget of a `GtkPopover`.

The default widget is the widget that’s activated when the user
presses Enter in a dialog (for example). This function sets or
unsets the default widget for a `GtkPopover`. *)
external set_default_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_popover_set_default_widget"

(** Sets the child widget of @popover. *)
external set_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_popover_set_child"

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

(** Gets the child widget of @popover. *)
external get_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_popover_get_child"

