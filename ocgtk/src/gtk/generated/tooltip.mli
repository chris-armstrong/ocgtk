(* GENERATED CODE - DO NOT EDIT *)
(* Tooltip: Tooltip *)

type t = [`tooltip | `object_] Gobject.obj

(* Methods *)
(** Sets the area of the widget, where the contents of this tooltip apply,
to be @rect (in widget coordinates).  This is especially useful for
properly setting tooltips on `GtkTreeView` rows and cells, `GtkIconViews`,
etc.

For setting tooltips on `GtkTreeView`, please refer to the convenience
functions for this: gtk_tree_view_set_tooltip_row() and
gtk_tree_view_set_tooltip_cell(). *)
external set_tip_area : t -> Ocgtk_gdk.Gdk.Wrappers.Rectangle.t -> unit = "ml_gtk_tooltip_set_tip_area"

(** Sets the text of the tooltip to be @text.

If @text is %NULL, the label will be hidden.
See also [method@Gtk.Tooltip.set_markup]. *)
external set_text : t -> string option -> unit = "ml_gtk_tooltip_set_text"

(** Sets the text of the tooltip to be @markup.

The string must be marked up with Pango markup.
If @markup is %NULL, the label will be hidden. *)
external set_markup : t -> string option -> unit = "ml_gtk_tooltip_set_markup"

(** Sets the icon of the tooltip (which is in front of the text) to be
the icon indicated by @icon_name with the size indicated
by @size.  If @icon_name is %NULL, the image will be hidden. *)
external set_icon_from_icon_name : t -> string option -> unit = "ml_gtk_tooltip_set_icon_from_icon_name"

(** Sets the icon of the tooltip (which is in front of the text)
to be the icon indicated by @gicon with the size indicated
by @size. If @gicon is %NULL, the image will be hidden. *)
external set_icon_from_gicon : t -> Ocgtk_gio.Gio.Wrappers.Icon.t option -> unit = "ml_gtk_tooltip_set_icon_from_gicon"

(** Sets the icon of the tooltip (which is in front of the text) to be
@paintable.  If @paintable is %NULL, the image will be hidden. *)
external set_icon : t -> Ocgtk_gdk.Gdk.Wrappers.Paintable.t option -> unit = "ml_gtk_tooltip_set_icon"

(** Replaces the widget packed into the tooltip with
@custom_widget. @custom_widget does not get destroyed when the tooltip goes
away.
By default a box with a `GtkImage` and `GtkLabel` is embedded in
the tooltip, which can be configured using gtk_tooltip_set_markup()
and gtk_tooltip_set_icon(). *)
external set_custom : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_tooltip_set_custom"

