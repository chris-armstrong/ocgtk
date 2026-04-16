class type file_dialog_t = object
  method get_accept_label : unit -> string option
  method get_default_filter : unit -> GFile_filter.file_filter_t option
  method get_filters : unit -> Ocgtk_gio.Gio.List_model.list_model_t option
  method get_initial_file : unit -> Ocgtk_gio.Gio.File.file_t option
  method get_initial_folder : unit -> Ocgtk_gio.Gio.File.file_t option
  method get_initial_name : unit -> string option
  method get_modal : unit -> bool
  method get_title : unit -> string

  method open_finish :
    Ocgtk_gio.Gio.Async_result.async_result_t ->
    (Ocgtk_gio.Gio.File.file_t option, GError.t) result

  method open_multiple_finish :
    Ocgtk_gio.Gio.Async_result.async_result_t ->
    (Ocgtk_gio.Gio.List_model.list_model_t option, GError.t) result

  method save_finish :
    Ocgtk_gio.Gio.Async_result.async_result_t ->
    (Ocgtk_gio.Gio.File.file_t option, GError.t) result

  method select_folder_finish :
    Ocgtk_gio.Gio.Async_result.async_result_t ->
    (Ocgtk_gio.Gio.File.file_t option, GError.t) result

  method select_multiple_folders_finish :
    Ocgtk_gio.Gio.Async_result.async_result_t ->
    (Ocgtk_gio.Gio.List_model.list_model_t option, GError.t) result

  method set_accept_label : string option -> unit
  method set_default_filter : GFile_filter.file_filter_t option -> unit
  method set_filters : Ocgtk_gio.Gio.List_model.list_model_t option -> unit
  method set_initial_file : Ocgtk_gio.Gio.File.file_t option -> unit
  method set_initial_folder : Ocgtk_gio.Gio.File.file_t option -> unit
  method set_initial_name : string option -> unit
  method set_modal : bool -> unit
  method set_title : string -> unit
  method as_file_dialog : File_dialog.t
end

class file_dialog : File_dialog.t -> file_dialog_t

val new_ : unit -> file_dialog_t
