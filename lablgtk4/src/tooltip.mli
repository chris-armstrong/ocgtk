(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Tooltip *)

type t = Gtk.widget

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

(** Replaces the widget packed into the tooltip with
@custom_widget. @custom_widget does not get destroyed when the tooltip goes
away.
By default a box with a `GtkImage` and `GtkLabel` is embedded in
the tooltip, which can be configured using gtk_tooltip_set_markup()
and gtk_tooltip_set_icon(). *)
external set_custom : t -> Gtk.widget option -> unit = "ml_gtk_tooltip_set_custom"

