(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FileChooserWidget *)

type t = [`file_chooser_widget | `widget] Gobject.obj

val as_widget : t -> Gtk.widget

(** Create a new FileChooserWidget *)
external new_ : Gtk_enums.filechooseraction -> t = "ml_gtk_file_chooser_widget_new"

(* Properties *)

(** Get property: search-mode *)
external get_search_mode : t -> bool = "ml_gtk_file_chooser_widget_get_search_mode"

(** Set property: search-mode *)
external set_search_mode : t -> bool -> unit = "ml_gtk_file_chooser_widget_set_search_mode"

