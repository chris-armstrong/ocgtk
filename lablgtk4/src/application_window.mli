(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ApplicationWindow *)

type t = Gtk.Widget.t

(** Create a new ApplicationWindow *)
external new_ : Gtk.Widget.t -> t = "ml_gtk_application_window_new"

(* Properties *)

(** Get property: show-menubar *)
external get_show_menubar : t -> bool = "ml_gtk_application_window_get_show_menubar"

(** Set property: show-menubar *)
external set_show_menubar : t -> bool -> unit = "ml_gtk_application_window_set_show_menubar"

external set_help_overlay : t -> Gtk.Widget.t option -> unit = "ml_gtk_application_window_set_help_overlay"

external get_id : t -> int = "ml_gtk_application_window_get_id"

external get_help_overlay : t -> Gtk.Widget.t = "ml_gtk_application_window_get_help_overlay"

