(* GENERATED CODE - DO NOT EDIT *)
(* FileDialog: FileDialog *)

type t = [`file_dialog | `object_] Gobject.obj

(** Create a new FileDialog *)
external new_ : unit -> t = "ml_gtk_file_dialog_new"

(* Properties *)

(** Get property: accept-label *)
external get_accept_label : t -> string = "ml_gtk_file_dialog_get_accept_label"

(** Set property: accept-label *)
external set_accept_label : t -> string -> unit = "ml_gtk_file_dialog_set_accept_label"

(** Get property: initial-name *)
external get_initial_name : t -> string = "ml_gtk_file_dialog_get_initial_name"

(** Set property: initial-name *)
external set_initial_name : t -> string -> unit = "ml_gtk_file_dialog_set_initial_name"

(** Get property: modal *)
external get_modal : t -> bool = "ml_gtk_file_dialog_get_modal"

(** Set property: modal *)
external set_modal : t -> bool -> unit = "ml_gtk_file_dialog_set_modal"

(** Get property: title *)
external get_title : t -> string = "ml_gtk_file_dialog_get_title"

(** Set property: title *)
external set_title : t -> string -> unit = "ml_gtk_file_dialog_set_title"

(** Sets the filter that will be selected by default
in the file chooser dialog.

If set to %NULL, the first item in [property@Gtk.FileDialog:filters]
will be used as the default filter. If that list is empty, the dialog
will be unfiltered. *)
external set_default_filter : t -> File_filter.t option -> unit = "ml_gtk_file_dialog_set_default_filter"

(** Gets the filter that will be selected by default
in the file chooser dialog. *)
external get_default_filter : t -> File_filter.t option = "ml_gtk_file_dialog_get_default_filter"

