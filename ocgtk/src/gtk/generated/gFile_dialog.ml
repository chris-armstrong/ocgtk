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

(* High-level class for FileDialog *)
class file_dialog (obj : File_dialog.t) : file_dialog_t =
  object (self)
    method get_accept_label : unit -> string option =
      fun () -> File_dialog.get_accept_label obj

    method get_default_filter : unit -> GFile_filter.file_filter_t option =
      fun () ->
        Option.map
          (fun ret -> new GFile_filter.file_filter ret)
          (File_dialog.get_default_filter obj)

    method get_filters : unit -> Ocgtk_gio.Gio.List_model.list_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgtk_gio.Gio.List_model.list_model ret)
          (File_dialog.get_filters obj)

    method get_initial_file : unit -> Ocgtk_gio.Gio.File.file_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgtk_gio.Gio.File.file ret)
          (File_dialog.get_initial_file obj)

    method get_initial_folder : unit -> Ocgtk_gio.Gio.File.file_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgtk_gio.Gio.File.file ret)
          (File_dialog.get_initial_folder obj)

    method get_initial_name : unit -> string option =
      fun () -> File_dialog.get_initial_name obj

    method get_modal : unit -> bool = fun () -> File_dialog.get_modal obj
    method get_title : unit -> string = fun () -> File_dialog.get_title obj

    method open_finish :
        Ocgtk_gio.Gio.Async_result.async_result_t ->
        (Ocgtk_gio.Gio.File.file_t option, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret ->
            Option.map (fun ret -> new Ocgtk_gio.Gio.File.file ret) ret)
          (File_dialog.open_finish obj result)

    method open_multiple_finish :
        Ocgtk_gio.Gio.Async_result.async_result_t ->
        (Ocgtk_gio.Gio.List_model.list_model_t option, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret ->
            Option.map
              (fun ret -> new Ocgtk_gio.Gio.List_model.list_model ret)
              ret)
          (File_dialog.open_multiple_finish obj result)

    method save_finish :
        Ocgtk_gio.Gio.Async_result.async_result_t ->
        (Ocgtk_gio.Gio.File.file_t option, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret ->
            Option.map (fun ret -> new Ocgtk_gio.Gio.File.file ret) ret)
          (File_dialog.save_finish obj result)

    method select_folder_finish :
        Ocgtk_gio.Gio.Async_result.async_result_t ->
        (Ocgtk_gio.Gio.File.file_t option, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret ->
            Option.map (fun ret -> new Ocgtk_gio.Gio.File.file ret) ret)
          (File_dialog.select_folder_finish obj result)

    method select_multiple_folders_finish :
        Ocgtk_gio.Gio.Async_result.async_result_t ->
        (Ocgtk_gio.Gio.List_model.list_model_t option, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret ->
            Option.map
              (fun ret -> new Ocgtk_gio.Gio.List_model.list_model ret)
              ret)
          (File_dialog.select_multiple_folders_finish obj result)

    method set_accept_label : string option -> unit =
      fun accept_label -> File_dialog.set_accept_label obj accept_label

    method set_default_filter : GFile_filter.file_filter_t option -> unit =
      fun filter ->
        let filter = Option.map (fun c -> c#as_file_filter) filter in
        File_dialog.set_default_filter obj filter

    method set_filters : Ocgtk_gio.Gio.List_model.list_model_t option -> unit =
      fun filters ->
        let filters = Option.map (fun c -> c#as_list_model) filters in
        File_dialog.set_filters obj filters

    method set_initial_file : Ocgtk_gio.Gio.File.file_t option -> unit =
      fun file ->
        let file = Option.map (fun c -> c#as_file) file in
        File_dialog.set_initial_file obj file

    method set_initial_folder : Ocgtk_gio.Gio.File.file_t option -> unit =
      fun folder ->
        let folder = Option.map (fun c -> c#as_file) folder in
        File_dialog.set_initial_folder obj folder

    method set_initial_name : string option -> unit =
      fun name -> File_dialog.set_initial_name obj name

    method set_modal : bool -> unit =
      fun modal -> File_dialog.set_modal obj modal

    method set_title : string -> unit =
      fun title -> File_dialog.set_title obj title

    method as_file_dialog = obj
  end

let new_ () : file_dialog_t = new file_dialog (File_dialog.new_ ())
