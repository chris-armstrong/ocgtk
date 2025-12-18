(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ApplicationWindow *)

type t = [`application_window | `window | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new ApplicationWindow *)
external new_ : Application_and__window_and__window_group.Application.t -> t = "ml_gtk_application_window_new"

(* Properties *)

(** Get property: show-menubar *)
external get_show_menubar : t -> bool = "ml_gtk_application_window_get_show_menubar"

(** Set property: show-menubar *)
external set_show_menubar : t -> bool -> unit = "ml_gtk_application_window_set_show_menubar"

(** Associates a shortcuts window with the application window.

Additionally, sets up an action with the name
`win.show-help-overlay` to present it.

@window takes responsibility for destroying @help_overlay. *)
external set_help_overlay : t -> Shortcuts_window.t option -> unit = "ml_gtk_application_window_set_help_overlay"

(** Returns the unique ID of the window.

 If the window has not yet been added to a `GtkApplication`, returns `0`. *)
external get_id : t -> int = "ml_gtk_application_window_get_id"

(** Gets the `GtkShortcutsWindow` that is associated with @window.

See [method@Gtk.ApplicationWindow.set_help_overlay]. *)
external get_help_overlay : t -> Shortcuts_window.t option = "ml_gtk_application_window_get_help_overlay"

