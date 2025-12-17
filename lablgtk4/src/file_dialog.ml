(* GENERATED CODE - DO NOT EDIT *)
(* FileDialog: FileDialog *)

type t = [`file_dialog | `object_] Gobject.obj

(** Create a new FileDialog *)
external new_ : unit -> t = "ml_gtk_file_dialog_new"

(* Properties *)

(** Sets the title that will be shown on the
file chooser dialog. *)
external set_title : t -> string -> unit = "ml_gtk_file_dialog_set_title"

(** Sets whether the file chooser dialog
blocks interaction with the parent window
while it is presented. *)
external set_modal : t -> bool -> unit = "ml_gtk_file_dialog_set_modal"

(** Sets the name for the file that should be initially set.
For saving dialogs, this will usually be pre-entered into the name field.

If a file with this name already exists in the directory set via
[property@Gtk.FileDialog:initial-folder], the dialog should preselect it. *)
external set_initial_name : t -> string option -> unit = "ml_gtk_file_dialog_set_initial_name"

(** Sets the filter that will be selected by default
in the file chooser dialog.

If set to %NULL, the first item in [property@Gtk.FileDialog:filters]
will be used as the default filter. If that list is empty, the dialog
will be unfiltered. *)
external set_default_filter : t -> File_filter.t option -> unit = "ml_gtk_file_dialog_set_default_filter"

(** Sets the label shown on the file chooser's accept button.

Leaving the accept label unset or setting it as `NULL` will fall back to
a default label, depending on what API is used to launch the file dialog. *)
external set_accept_label : t -> string option -> unit = "ml_gtk_file_dialog_set_accept_label"

(** Returns the title that will be shown on the
file chooser dialog. *)
external get_title : t -> string = "ml_gtk_file_dialog_get_title"

(** Returns whether the file chooser dialog
blocks interaction with the parent window
while it is presented. *)
external get_modal : t -> bool = "ml_gtk_file_dialog_get_modal"

(** Gets the name for the file that should be initially set. *)
external get_initial_name : t -> string option = "ml_gtk_file_dialog_get_initial_name"

(** Gets the filter that will be selected by default
in the file chooser dialog. *)
external get_default_filter : t -> File_filter.t option = "ml_gtk_file_dialog_get_default_filter"

external get_accept_label : t -> string option = "ml_gtk_file_dialog_get_accept_label"

