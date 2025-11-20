(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FileChooser *)

type t = Gtk.Widget.t

(* Properties *)

(** Get property: create-folders *)
external get_create_folders : t -> bool = "ml_gtk_file_chooser_get_create_folders"

(** Set property: create-folders *)
external set_create_folders : t -> bool -> unit = "ml_gtk_file_chooser_set_create_folders"

(** Get property: select-multiple *)
external get_select_multiple : t -> bool = "ml_gtk_file_chooser_get_select_multiple"

(** Set property: select-multiple *)
external set_select_multiple : t -> bool -> unit = "ml_gtk_file_chooser_set_select_multiple"

external set_filter : t -> Gtk.Widget.t -> unit = "ml_gtk_file_chooser_set_filter"

external set_file : t -> unit -> (bool, GError.t) result = "ml_gtk_file_chooser_set_file"

external set_current_name : t -> string -> unit = "ml_gtk_file_chooser_set_current_name"

external set_current_folder : t -> unit -> (bool, GError.t) result = "ml_gtk_file_chooser_set_current_folder"

external set_choice : t -> string -> string -> unit = "ml_gtk_file_chooser_set_choice"

external set_action : t -> Gtk_enums.filechooseraction -> unit = "ml_gtk_file_chooser_set_action"

external remove_shortcut_folder : t -> unit -> (bool, GError.t) result = "ml_gtk_file_chooser_remove_shortcut_folder"

external remove_filter : t -> Gtk.Widget.t -> unit = "ml_gtk_file_chooser_remove_filter"

external remove_choice : t -> string -> unit = "ml_gtk_file_chooser_remove_choice"

external get_shortcut_folders : t -> unit = "ml_gtk_file_chooser_get_shortcut_folders"

external get_filters : t -> unit = "ml_gtk_file_chooser_get_filters"

external get_filter : t -> Gtk.Widget.t = "ml_gtk_file_chooser_get_filter"

external get_files : t -> unit = "ml_gtk_file_chooser_get_files"

external get_file : t -> unit = "ml_gtk_file_chooser_get_file"

external get_current_name : t -> string = "ml_gtk_file_chooser_get_current_name"

external get_current_folder : t -> unit = "ml_gtk_file_chooser_get_current_folder"

external get_choice : t -> string -> string = "ml_gtk_file_chooser_get_choice"

external get_action : t -> Gtk_enums.filechooseraction = "ml_gtk_file_chooser_get_action"

external add_shortcut_folder : t -> unit -> (bool, GError.t) result = "ml_gtk_file_chooser_add_shortcut_folder"

external add_filter : t -> Gtk.Widget.t -> unit = "ml_gtk_file_chooser_add_filter"

external add_choice : t -> string -> string -> unit -> unit -> unit = "ml_gtk_file_chooser_add_choice"

