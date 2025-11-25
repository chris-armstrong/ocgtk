(* GENERATED CODE - DO NOT EDIT *)
(* Widget: LayoutManager *)

type t = Gtk.widget

(** Queues a resize on the `GtkWidget` using @manager, if any.

This function should be called by subclasses of `GtkLayoutManager`
in response to changes to their layout management policies. *)
external layout_changed : t -> unit = "ml_gtk_layout_manager_layout_changed"

(** Retrieves the `GtkWidget` using the given `GtkLayoutManager`. *)
external get_widget : t -> Gtk.widget option = "ml_gtk_layout_manager_get_widget"

(** Retrieves the request mode of @manager. *)
external get_request_mode : t -> Gtk_enums.sizerequestmode = "ml_gtk_layout_manager_get_request_mode"

(** Retrieves a `GtkLayoutChild` instance for the `GtkLayoutManager`,
creating one if necessary.

The @child widget must be a child of the widget using @manager.

The `GtkLayoutChild` instance is owned by the `GtkLayoutManager`,
and is guaranteed to exist as long as @child is a child of the
`GtkWidget` using the given `GtkLayoutManager`. *)
external get_layout_child : t -> Gtk.widget -> Gtk.widget = "ml_gtk_layout_manager_get_layout_child"

(** Assigns the given @width, @height, and @baseline to
a @widget, and computes the position and sizes of the children of
the @widget using the layout management policy of @manager. *)
external allocate : t -> Gtk.widget -> int -> int -> int -> unit = "ml_gtk_layout_manager_allocate"

