(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Scrollable *)

type t = Gtk.widget

(* Properties *)

(** Sets the `GtkScrollablePolicy`.

The policy determines whether vertical scrolling should start
below the minimum height or below the natural height. *)
external set_vscroll_policy : t -> Gtk_enums.scrollablepolicy -> unit = "ml_gtk_scrollable_set_vscroll_policy"

(** Sets the vertical adjustment of the `GtkScrollable`. *)
external set_vadjustment : t -> Gtk.widget option -> unit = "ml_gtk_scrollable_set_vadjustment"

(** Sets the `GtkScrollablePolicy`.

The policy determines whether horizontal scrolling should start
below the minimum width or below the natural width. *)
external set_hscroll_policy : t -> Gtk_enums.scrollablepolicy -> unit = "ml_gtk_scrollable_set_hscroll_policy"

(** Sets the horizontal adjustment of the `GtkScrollable`. *)
external set_hadjustment : t -> Gtk.widget option -> unit = "ml_gtk_scrollable_set_hadjustment"

(** Gets the vertical `GtkScrollablePolicy`. *)
external get_vscroll_policy : t -> Gtk_enums.scrollablepolicy = "ml_gtk_scrollable_get_vscroll_policy"

(** Retrieves the `GtkAdjustment` used for vertical scrolling. *)
external get_vadjustment : t -> Gtk.widget = "ml_gtk_scrollable_get_vadjustment"

(** Gets the horizontal `GtkScrollablePolicy`. *)
external get_hscroll_policy : t -> Gtk_enums.scrollablepolicy = "ml_gtk_scrollable_get_hscroll_policy"

(** Retrieves the `GtkAdjustment` used for horizontal scrolling. *)
external get_hadjustment : t -> Gtk.widget = "ml_gtk_scrollable_get_hadjustment"

(** Returns the size of a non-scrolling border around the
outside of the scrollable.

An example for this would be treeview headers. GTK can use
this information to display overlaid graphics, like the
overshoot indication, at the right position. *)
external get_border : t -> Gtk.widget -> bool = "ml_gtk_scrollable_get_border"

