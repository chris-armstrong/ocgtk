(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ApplicationWindow *)

type t = [`application_window | `window | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new ApplicationWindow *)
external new_ : Gtk.widget -> t = "ml_gtk_application_window_new"

(* Properties *)

(** Sets whether the window will display a menubar for the app menu
and menubar as needed. *)
external set_show_menubar : t -> bool -> unit = "ml_gtk_application_window_set_show_menubar"

(** Associates a shortcuts window with the application window.

Additionally, sets up an action with the name
`win.show-help-overlay` to present it.

@window takes responsibility for destroying @help_overlay. *)
external set_help_overlay : t -> Gtk.widget option -> unit = "ml_gtk_application_window_set_help_overlay"

(** Returns whether the window will display a menubar for the app menu
and menubar as needed. *)
external get_show_menubar : t -> bool = "ml_gtk_application_window_get_show_menubar"

(** Returns the unique ID of the window.

 If the window has not yet been added to a `GtkApplication`, returns `0`. *)
external get_id : t -> int = "ml_gtk_application_window_get_id"

(** Gets the `GtkShortcutsWindow` that is associated with @window.

See [method@Gtk.ApplicationWindow.set_help_overlay]. *)
external get_help_overlay : t -> Gtk.widget = "ml_gtk_application_window_get_help_overlay"

