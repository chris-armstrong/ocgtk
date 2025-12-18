(* GENERATED CODE - DO NOT EDIT *)
(* Widget: HeaderBar *)

type t = [`header_bar | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new HeaderBar *)
external new_ : unit -> t = "ml_gtk_header_bar_new"

(* Properties *)

(** Get property: decoration-layout *)
external get_decoration_layout : t -> string = "ml_gtk_header_bar_get_decoration_layout"

(** Set property: decoration-layout *)
external set_decoration_layout : t -> string -> unit = "ml_gtk_header_bar_set_decoration_layout"

(** Get property: show-title-buttons *)
external get_show_title_buttons : t -> bool = "ml_gtk_header_bar_get_show_title_buttons"

(** Set property: show-title-buttons *)
external set_show_title_buttons : t -> bool -> unit = "ml_gtk_header_bar_set_show_title_buttons"

(** Sets the title for the `GtkHeaderBar`.

When set to %NULL, the headerbar will display the title of
the window it is contained in.

The title should help a user identify the current view.
To achieve the same style as the builtin title, use the
“title” style class.

You should set the title widget to %NULL, for the window
title label to be visible again. *)
external set_title_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_header_bar_set_title_widget"

(** Removes a child from the `GtkHeaderBar`.

The child must have been added with
[method@Gtk.HeaderBar.pack_start],
[method@Gtk.HeaderBar.pack_end] or
[method@Gtk.HeaderBar.set_title_widget]. *)
external remove : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> unit = "ml_gtk_header_bar_remove"

(** Adds @child to @bar, packed with reference to the
start of the @bar. *)
external pack_start : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> unit = "ml_gtk_header_bar_pack_start"

(** Adds @child to @bar, packed with reference to the
end of the @bar. *)
external pack_end : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> unit = "ml_gtk_header_bar_pack_end"

(** Retrieves the title widget of the header.

See [method@Gtk.HeaderBar.set_title_widget]. *)
external get_title_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_header_bar_get_title_widget"

