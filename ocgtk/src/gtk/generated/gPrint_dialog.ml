class type print_dialog_t = object
  method get_accept_label : unit -> string
  method get_modal : unit -> bool
  method get_page_setup : unit -> GPage_setup.page_setup_t
  method get_print_settings : unit -> GPrint_settings.print_settings_t
  method get_title : unit -> string

  method print_file_finish :
    Ocgtk_gio.Gio.Async_result.async_result_t -> (bool, GError.t) result

  method print_finish :
    Ocgtk_gio.Gio.Async_result.async_result_t ->
    (Ocgtk_gio.Gio.Output_stream.output_stream_t option, GError.t) result

  method set_accept_label : string -> unit
  method set_modal : bool -> unit
  method set_page_setup : GPage_setup.page_setup_t -> unit
  method set_print_settings : GPrint_settings.print_settings_t -> unit
  method set_title : string -> unit

  method setup_finish :
    Ocgtk_gio.Gio.Async_result.async_result_t ->
    (Print_setup.t option, GError.t) result

  method as_print_dialog : Print_dialog.t
end

(* High-level class for PrintDialog *)
class print_dialog (obj : Print_dialog.t) : print_dialog_t =
  object (self)
    method get_accept_label : unit -> string =
      fun () -> Print_dialog.get_accept_label obj

    method get_modal : unit -> bool = fun () -> Print_dialog.get_modal obj

    method get_page_setup : unit -> GPage_setup.page_setup_t =
      fun () -> new GPage_setup.page_setup (Print_dialog.get_page_setup obj)

    method get_print_settings : unit -> GPrint_settings.print_settings_t =
      fun () ->
        new GPrint_settings.print_settings (Print_dialog.get_print_settings obj)

    method get_title : unit -> string = fun () -> Print_dialog.get_title obj

    method print_file_finish :
        Ocgtk_gio.Gio.Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Print_dialog.print_file_finish obj result

    method print_finish :
        Ocgtk_gio.Gio.Async_result.async_result_t ->
        (Ocgtk_gio.Gio.Output_stream.output_stream_t option, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret ->
            Option.map
              (fun ret -> new Ocgtk_gio.Gio.Output_stream.output_stream ret)
              ret)
          (Print_dialog.print_finish obj result)

    method set_accept_label : string -> unit =
      fun accept_label -> Print_dialog.set_accept_label obj accept_label

    method set_modal : bool -> unit =
      fun modal -> Print_dialog.set_modal obj modal

    method set_page_setup : GPage_setup.page_setup_t -> unit =
      fun page_setup ->
        let page_setup = page_setup#as_page_setup in
        Print_dialog.set_page_setup obj page_setup

    method set_print_settings : GPrint_settings.print_settings_t -> unit =
      fun print_settings ->
        let print_settings = print_settings#as_print_settings in
        Print_dialog.set_print_settings obj print_settings

    method set_title : string -> unit =
      fun title -> Print_dialog.set_title obj title

    method setup_finish :
        Ocgtk_gio.Gio.Async_result.async_result_t ->
        (Print_setup.t option, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Print_dialog.setup_finish obj result

    method as_print_dialog = obj
  end

let new_ () : print_dialog_t = new print_dialog (Print_dialog.new_ ())
