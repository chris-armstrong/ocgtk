(* GENERATED CODE - DO NOT EDIT *)
(* FileDialog: FileDialog *)

type t = [ `file_dialog | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_file_dialog_new"
(** Create a new FileDialog *)

(* Methods *)

external set_title : t -> string -> unit = "ml_gtk_file_dialog_set_title"
(** Sets the title that will be shown on the file chooser dialog. *)

external set_modal : t -> bool -> unit = "ml_gtk_file_dialog_set_modal"
(** Sets whether the file chooser dialog blocks interaction with the parent
    window while it is presented. *)

external set_initial_name : t -> string option -> unit
  = "ml_gtk_file_dialog_set_initial_name"
(** Sets the name for the file that should be initially set. For saving dialogs,
    this will usually be pre-entered into the name field.

    If a file with this name already exists in the directory set via
    [property@Gtk.FileDialog:initial-folder], the dialog should preselect it. *)

external set_initial_folder : t -> Ocgtk_gio.Gio.Wrappers.File.t option -> unit
  = "ml_gtk_file_dialog_set_initial_folder"
(** Sets the folder that will be set as the initial folder in the file chooser
    dialog. *)

external set_initial_file : t -> Ocgtk_gio.Gio.Wrappers.File.t option -> unit
  = "ml_gtk_file_dialog_set_initial_file"
(** Sets the file that will be initially selected in
the file chooser dialog.

This function is a shortcut for calling both
gtk_file_dialog_set_initial_folder() and
gtk_file_dialog_set_initial_name() with the directory and
name of @file respectively. *)

external set_filters : t -> Ocgtk_gio.Gio.Wrappers.List_model.t option -> unit
  = "ml_gtk_file_dialog_set_filters"
(** Sets the filters that will be offered to the user in the file chooser
    dialog. *)

external set_default_filter : t -> File_filter.t option -> unit
  = "ml_gtk_file_dialog_set_default_filter"
(** Sets the filter that will be selected by default in the file chooser dialog.

    If set to %NULL, the first item in [property@Gtk.FileDialog:filters] will be
    used as the default filter. If that list is empty, the dialog will be
    unfiltered. *)

external set_accept_label : t -> string option -> unit
  = "ml_gtk_file_dialog_set_accept_label"
(** Sets the label shown on the file chooser's accept button.

    Leaving the accept label unset or setting it as `NULL` will fall back to a
    default label, depending on what API is used to launch the file dialog. *)

external select_multiple_folders_finish :
  t ->
  Ocgtk_gio.Gio.Wrappers.Async_result.t ->
  (Ocgtk_gio.Gio.Wrappers.List_model.t option, GError.t) result
  = "ml_gtk_file_dialog_select_multiple_folders_finish"
(** Finishes the [method@Gtk.FileDialog.select_multiple_folders] call and
    returns the resulting files in a `GListModel`. *)

external select_folder_finish :
  t ->
  Ocgtk_gio.Gio.Wrappers.Async_result.t ->
  (Ocgtk_gio.Gio.Wrappers.File.t option, GError.t) result
  = "ml_gtk_file_dialog_select_folder_finish"
(** Finishes the [method@Gtk.FileDialog.select_folder] call and returns the
    resulting file. *)

external save_finish :
  t ->
  Ocgtk_gio.Gio.Wrappers.Async_result.t ->
  (Ocgtk_gio.Gio.Wrappers.File.t option, GError.t) result
  = "ml_gtk_file_dialog_save_finish"
(** Finishes the [method@Gtk.FileDialog.save] call and returns the resulting
    file. *)

external open_multiple_finish :
  t ->
  Ocgtk_gio.Gio.Wrappers.Async_result.t ->
  (Ocgtk_gio.Gio.Wrappers.List_model.t option, GError.t) result
  = "ml_gtk_file_dialog_open_multiple_finish"
(** Finishes the [method@Gtk.FileDialog.open] call and returns the resulting
    files in a `GListModel`. *)

external open_finish :
  t ->
  Ocgtk_gio.Gio.Wrappers.Async_result.t ->
  (Ocgtk_gio.Gio.Wrappers.File.t option, GError.t) result
  = "ml_gtk_file_dialog_open_finish"
(** Finishes the [method@Gtk.FileDialog.open] call and returns the resulting
    file. *)

external get_title : t -> string = "ml_gtk_file_dialog_get_title"
(** Returns the title that will be shown on the file chooser dialog. *)

external get_modal : t -> bool = "ml_gtk_file_dialog_get_modal"
(** Returns whether the file chooser dialog blocks interaction with the parent
    window while it is presented. *)

external get_initial_name : t -> string option
  = "ml_gtk_file_dialog_get_initial_name"
(** Gets the name for the file that should be initially set. *)

external get_initial_folder : t -> Ocgtk_gio.Gio.Wrappers.File.t option
  = "ml_gtk_file_dialog_get_initial_folder"
(** Gets the folder that will be set as the initial folder in the file chooser
    dialog. *)

external get_initial_file : t -> Ocgtk_gio.Gio.Wrappers.File.t option
  = "ml_gtk_file_dialog_get_initial_file"
(** Gets the file that will be initially selected in the file chooser dialog. *)

external get_filters : t -> Ocgtk_gio.Gio.Wrappers.List_model.t option
  = "ml_gtk_file_dialog_get_filters"
(** Gets the filters that will be offered to the user in the file chooser
    dialog. *)

external get_default_filter : t -> File_filter.t option
  = "ml_gtk_file_dialog_get_default_filter"
(** Gets the filter that will be selected by default in the file chooser dialog.
*)

external get_accept_label : t -> string option
  = "ml_gtk_file_dialog_get_accept_label"

(* Properties *)
