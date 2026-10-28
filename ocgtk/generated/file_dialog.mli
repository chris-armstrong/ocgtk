(** Asynchronous API to present a file chooser dialog.

    Its methods, signals and properties are on {!class-type-file_dialog_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.File_dialog}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FileDialog].}

    Asynchronous API to present a file chooser dialog.

    [GtkFileDialog] collects the arguments that are needed to present the dialog
    to the user, such as a title for the dialog and whether it should be modal.

    The dialog is shown with [Gtk.FileDialog.open], [Gtk.FileDialog.save], etc.
*)
class type file_dialog_t = object
  (** {2:methods Methods} *)

  method get_accept_label : unit -> string option
  (** Retrieves the text used by the dialog on its accept button. *)

  method get_default_filter : unit -> File_filter.file_filter_t option
  (** Gets the filter that will be selected by default in the file chooser
      dialog. *)

  method get_filters : unit -> Ocgio.List_model.list_model_t option
  (** Gets the filters that will be offered to the user in the file chooser
      dialog. *)

  method get_initial_file : unit -> Ocgio.File.file_t option
  (** Gets the file that will be initially selected in the file chooser dialog.
  *)

  method get_initial_folder : unit -> Ocgio.File.file_t option
  (** Gets the folder that will be set as the initial folder in the file chooser
      dialog. *)

  method get_initial_name : unit -> string option
  (** Gets the filename that will be initially selected. *)

  method get_modal : unit -> bool
  (** Returns whether the file chooser dialog blocks interaction with the parent
      window while it is presented. *)

  method get_title : unit -> string
  (** Returns the title that will be shown on the file chooser dialog. *)

  method open_finish :
    Ocgio.Async_result.async_result_t -> (Ocgio.File.file_t, GError.t) result
  (** Finishes the [Gtk.FileDialog.open] call.

      Note that this function returns a [Gtk.DialogError.DISMISSED] error if the
      user cancels the dialog. *)

  method open_multiple_finish :
    Ocgio.Async_result.async_result_t ->
    (Ocgio.List_model.list_model_t, GError.t) result
  (** Finishes the [Gtk.FileDialog.open] call.

      Note that this function returns a [Gtk.DialogError.DISMISSED] error if the
      user cancels the dialog. *)

  method save_finish :
    Ocgio.Async_result.async_result_t -> (Ocgio.File.file_t, GError.t) result
  (** Finishes the [Gtk.FileDialog.save] call.

      Note that this function returns a [Gtk.DialogError.DISMISSED] error if the
      user cancels the dialog. *)

  method select_folder_finish :
    Ocgio.Async_result.async_result_t -> (Ocgio.File.file_t, GError.t) result
  (** Finishes the [Gtk.FileDialog.select_folder] call.

      Note that this function returns a [Gtk.DialogError.DISMISSED] error if the
      user cancels the dialog. *)

  method select_multiple_folders_finish :
    Ocgio.Async_result.async_result_t ->
    (Ocgio.List_model.list_model_t, GError.t) result
  (** Finishes the [Gtk.FileDialog.select_multiple_folders] call.

      Note that this function returns a [Gtk.DialogError.DISMISSED] error if the
      user cancels the dialog. *)

  method set_accept_label : string option -> unit
  (** Sets the label shown on the file chooser's accept button.

      Leaving the accept label unset or setting it as [NULL] will fall back to a
      default label, depending on what API is used to launch the file dialog. *)

  method set_default_filter : File_filter.file_filter_t option -> unit
  (** Sets the filter that will be selected by default in the file chooser
      dialog.

      If set to [NULL], the first item in [Gtk.FileDialog:filters] will be used
      as the default filter. If that list is empty, the dialog will be
      unfiltered. *)

  method set_filters : Ocgio.List_model.list_model_t option -> unit
  (** Sets the filters that will be offered to the user in the file chooser
      dialog. *)

  method set_initial_file : Ocgio.File.file_t option -> unit
  (** Sets the file that will be initially selected in the file chooser dialog.

      This function is a shortcut for calling both
      [Gtk.FileDialog.set_initial_folder] and [Gtk.FileDialog.set_initial_name]
      with the directory and name of [file], respectively. *)

  method set_initial_folder : Ocgio.File.file_t option -> unit
  (** Sets the folder that will be set as the initial folder in the file chooser
      dialog. *)

  method set_initial_name : string option -> unit
  (** Sets the filename that will be initially selected.

      For save dialogs, [name] will usually be pre-entered into the name field.

      If a file with this name already exists in the directory set via
      [Gtk.FileDialog:initial-folder], the dialog will preselect it. *)

  method set_modal : bool -> unit
  (** Sets whether the file chooser dialog blocks interaction with the parent
      window while it is presented. *)

  method set_title : string -> unit
  (** Sets the title that will be shown on the file chooser dialog. *)

  (** {2:conversions Conversions} *)

  method as_file_dialog : Raw.File_dialog.t
end

class file_dialog : Raw.File_dialog.t -> file_dialog_t
(** Wraps a raw handle of {!Ocgtk.Raw.File_dialog.t}. *)

(** {1:description Description}

    Asynchronous API to present a file chooser dialog.

    [GtkFileDialog] collects the arguments that are needed to present the dialog
    to the user, such as a title for the dialog and whether it should be modal.

    The dialog is shown with [Gtk.FileDialog.open], [Gtk.FileDialog.save], etc.
*)

(** {1:constructors Constructors} *)

val new_ : unit -> file_dialog_t
(** Creates a new [GtkFileDialog] object. *)
