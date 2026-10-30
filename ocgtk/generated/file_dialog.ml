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

      Leaving the accept label unset or setting it as [None] will fall back to a
      default label, depending on what API is used to launch the file dialog. *)

  method set_default_filter : File_filter.file_filter_t option -> unit
  (** Sets the filter that will be selected by default in the file chooser
      dialog.

      If set to [None], the first item in [Gtk.FileDialog:filters] will be used
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

(* High-level class for FileDialog *)
class file_dialog (obj : Raw.File_dialog.t) : file_dialog_t =
  object (self)
    method get_accept_label : unit -> string option =
      fun () -> Raw.File_dialog.get_accept_label obj

    method get_default_filter : unit -> File_filter.file_filter_t option =
      fun () ->
        Option.map
          (fun ret -> new File_filter.file_filter ret)
          (Raw.File_dialog.get_default_filter obj)

    method get_filters : unit -> Ocgio.List_model.list_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.List_model.list_model ret)
          (Raw.File_dialog.get_filters obj)

    method get_initial_file : unit -> Ocgio.File.file_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.File.file ret)
          (Raw.File_dialog.get_initial_file obj)

    method get_initial_folder : unit -> Ocgio.File.file_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.File.file ret)
          (Raw.File_dialog.get_initial_folder obj)

    method get_initial_name : unit -> string option =
      fun () -> Raw.File_dialog.get_initial_name obj

    method get_modal : unit -> bool = fun () -> Raw.File_dialog.get_modal obj
    method get_title : unit -> string = fun () -> Raw.File_dialog.get_title obj

    method open_finish :
        Ocgio.Async_result.async_result_t ->
        (Ocgio.File.file_t, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new Ocgio.File.file ret)
          (Raw.File_dialog.open_finish obj result)

    method open_multiple_finish :
        Ocgio.Async_result.async_result_t ->
        (Ocgio.List_model.list_model_t, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new Ocgio.List_model.list_model ret)
          (Raw.File_dialog.open_multiple_finish obj result)

    method save_finish :
        Ocgio.Async_result.async_result_t ->
        (Ocgio.File.file_t, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new Ocgio.File.file ret)
          (Raw.File_dialog.save_finish obj result)

    method select_folder_finish :
        Ocgio.Async_result.async_result_t ->
        (Ocgio.File.file_t, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new Ocgio.File.file ret)
          (Raw.File_dialog.select_folder_finish obj result)

    method select_multiple_folders_finish :
        Ocgio.Async_result.async_result_t ->
        (Ocgio.List_model.list_model_t, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new Ocgio.List_model.list_model ret)
          (Raw.File_dialog.select_multiple_folders_finish obj result)

    method set_accept_label : string option -> unit =
      fun accept_label -> Raw.File_dialog.set_accept_label obj accept_label

    method set_default_filter : File_filter.file_filter_t option -> unit =
      fun filter ->
        let filter = Option.map (fun c -> c#as_file_filter) filter in
        Raw.File_dialog.set_default_filter obj filter

    method set_filters : Ocgio.List_model.list_model_t option -> unit =
      fun filters ->
        let filters = Option.map (fun c -> c#as_list_model) filters in
        Raw.File_dialog.set_filters obj filters

    method set_initial_file : Ocgio.File.file_t option -> unit =
      fun file ->
        let file = Option.map (fun c -> c#as_file) file in
        Raw.File_dialog.set_initial_file obj file

    method set_initial_folder : Ocgio.File.file_t option -> unit =
      fun folder ->
        let folder = Option.map (fun c -> c#as_file) folder in
        Raw.File_dialog.set_initial_folder obj folder

    method set_initial_name : string option -> unit =
      fun name -> Raw.File_dialog.set_initial_name obj name

    method set_modal : bool -> unit =
      fun modal -> Raw.File_dialog.set_modal obj modal

    method set_title : string -> unit =
      fun title -> Raw.File_dialog.set_title obj title

    method as_file_dialog = obj
  end

let new_ () : file_dialog_t = new file_dialog (Raw.File_dialog.new_ ())
