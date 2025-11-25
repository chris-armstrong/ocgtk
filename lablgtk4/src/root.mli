(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Root *)

type t = Gtk.widget

(** If @focus is not the current focus widget, and is focusable, sets
it as the focus widget for the root.

If @focus is %NULL, unsets the focus widget for the root.

To set the focus to a particular widget in the root, it is usually
more convenient to use [method@Gtk.Widget.grab_focus] instead of
this function. *)
external set_focus : t -> Gtk.widget option -> unit = "ml_gtk_root_set_focus"

(** Retrieves the current focused widget within the root.

Note that this is the widget that would have the focus
if the root is active; if the root is not focused then
`gtk_widget_has_focus (widget)` will be %FALSE for the
widget. *)
external get_focus : t -> Gtk.widget = "ml_gtk_root_get_focus"

