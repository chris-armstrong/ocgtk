class type print_dialog_t = object
  (** {2:methods Methods} *)

  method get_accept_label : unit -> string
  (** Returns the label that will be shown on the accept button of the print
      dialog. *)

  method get_modal : unit -> bool
  (** Returns whether the print dialog blocks interaction with the parent window
      while it is presented. *)

  method get_page_setup : unit -> Page_setup.page_setup_t option
  (** Returns the page setup. *)

  method get_print_settings : unit -> Print_settings.print_settings_t option
  (** Returns the print settings for the print dialog. *)

  method get_title : unit -> string
  (** Returns the title that will be shown on the print dialog. *)

  method print_file_finish :
    Ocgio.Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes the [Gtk.PrintDialog.print_file] call and returns the results.

      Note that this function returns a [Gtk.DialogError.DISMISSED] error if the
      user cancels the dialog. *)

  method print_finish :
    Ocgio.Async_result.async_result_t ->
    (Ocgio.Output_stream.output_stream_t, GError.t) result
  (** Finishes the [Gtk.PrintDialog.print] call and returns the results.

      If the call was successful, the content to be printed should be written to
      the returned output stream. Otherwise, [NULL] is returned.

      The overall results of the print operation will be returned in the
      [Gio.OutputStream.close] call, so if you are interested in the results,
      you need to explicitly close the output stream (it will be closed
      automatically if you just unref it). Be aware that the close call may not
      be instant as it operation will for the printer to finish printing.

      Note that this function returns a [Gtk.DialogError.DISMISSED] error if the
      user cancels the dialog. *)

  method set_accept_label : string -> unit
  (** Sets the label that will be shown on the accept button of the print dialog
      shown for [Gtk.PrintDialog.setup]. *)

  method set_modal : bool -> unit
  (** Sets whether the print dialog blocks interaction with the parent window
      while it is presented. *)

  method set_page_setup : Page_setup.page_setup_t -> unit
  (** Set the page setup for the print dialog. *)

  method set_print_settings : Print_settings.print_settings_t -> unit
  (** Sets the print settings for the print dialog. *)

  method set_title : string -> unit
  (** Sets the title that will be shown on the print dialog. *)

  method setup_finish :
    Ocgio.Async_result.async_result_t -> (Raw.Print_setup.t, GError.t) result
  (** Finishes the [Gtk.PrintDialog.setup] call.

      If the call was successful, it returns a [Gtk.PrintSetup] which contains
      the print settings and page setup information that will be used to print.

      Note that this function returns a [Gtk.DialogError.DISMISSED] error if the
      user cancels the dialog. *)

  (** {2:conversions Conversions} *)

  method as_print_dialog : Raw.Print_dialog.t
end

(* High-level class for PrintDialog *)
class print_dialog (obj : Raw.Print_dialog.t) : print_dialog_t =
  object (self)
    method get_accept_label : unit -> string =
      fun () -> Raw.Print_dialog.get_accept_label obj

    method get_modal : unit -> bool = fun () -> Raw.Print_dialog.get_modal obj

    method get_page_setup : unit -> Page_setup.page_setup_t option =
      fun () ->
        Option.map
          (fun ret -> new Page_setup.page_setup ret)
          (Raw.Print_dialog.get_page_setup obj)

    method get_print_settings : unit -> Print_settings.print_settings_t option =
      fun () ->
        Option.map
          (fun ret -> new Print_settings.print_settings ret)
          (Raw.Print_dialog.get_print_settings obj)

    method get_title : unit -> string = fun () -> Raw.Print_dialog.get_title obj

    method print_file_finish :
        Ocgio.Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Print_dialog.print_file_finish obj result

    method print_finish :
        Ocgio.Async_result.async_result_t ->
        (Ocgio.Output_stream.output_stream_t, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new Ocgio.Output_stream.output_stream ret)
          (Raw.Print_dialog.print_finish obj result)

    method set_accept_label : string -> unit =
      fun accept_label -> Raw.Print_dialog.set_accept_label obj accept_label

    method set_modal : bool -> unit =
      fun modal -> Raw.Print_dialog.set_modal obj modal

    method set_page_setup : Page_setup.page_setup_t -> unit =
      fun page_setup ->
        let page_setup = page_setup#as_page_setup in
        Raw.Print_dialog.set_page_setup obj page_setup

    method set_print_settings : Print_settings.print_settings_t -> unit =
      fun print_settings ->
        let print_settings = print_settings#as_print_settings in
        Raw.Print_dialog.set_print_settings obj print_settings

    method set_title : string -> unit =
      fun title -> Raw.Print_dialog.set_title obj title

    method setup_finish :
        Ocgio.Async_result.async_result_t ->
        (Raw.Print_setup.t, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Print_dialog.setup_finish obj result

    method as_print_dialog = obj
  end

let new_ () : print_dialog_t = new print_dialog (Raw.Print_dialog.new_ ())
