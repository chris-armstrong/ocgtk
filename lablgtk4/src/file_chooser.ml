(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FileChooser *)

type t = Gtk.Widget.t

(* Properties *)

external get_create_folders : t -> bool = "ml_gtk_file_chooser_get_create_folders"

external set_create_folders : t -> bool -> unit = "ml_gtk_file_chooser_set_create_folders"

external get_select_multiple : t -> bool = "ml_gtk_file_chooser_get_select_multiple"

external set_select_multiple : t -> bool -> unit = "ml_gtk_file_chooser_set_select_multiple"

external set_filter : t -> Gtk.Widget.t -> unit = "ml_gtk_file_chooser_set_filter"

external set_current_name : t -> string -> unit = "ml_gtk_file_chooser_set_current_name"

external set_choice : t -> string -> string -> unit = "ml_gtk_file_chooser_set_choice"

external set_action : t -> Gtk_enums.filechooseraction -> unit = "ml_gtk_file_chooser_set_action"

external remove_filter : t -> Gtk.Widget.t -> unit = "ml_gtk_file_chooser_remove_filter"

external remove_choice : t -> string -> unit = "ml_gtk_file_chooser_remove_choice"

external get_filter : t -> Gtk.Widget.t = "ml_gtk_file_chooser_get_filter"

external get_choice : t -> string -> string = "ml_gtk_file_chooser_get_choice"

external get_action : t -> Gtk_enums.filechooseraction = "ml_gtk_file_chooser_get_action"

external add_filter : t -> Gtk.Widget.t -> unit = "ml_gtk_file_chooser_add_filter"

