(* High-level class for PrintDialog *)
class print_dialog (obj : Print_dialog.t) = object (self)

  method get_accept_label : unit -> string =
    fun () ->
      (Print_dialog.get_accept_label obj)

  method get_modal : unit -> bool =
    fun () ->
      (Print_dialog.get_modal obj)

  method get_title : unit -> string =
    fun () ->
      (Print_dialog.get_title obj)

  method print_file_finish : 'p1. (#Ocgtk_gio.Gio.async_result as 'p1) -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (Print_dialog.print_file_finish obj result)

  method print_finish : 'p1. (#Ocgtk_gio.Gio.async_result as 'p1) -> (Ocgtk_gio.Gio.output_stream option, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      Result.map (fun ret -> Option.map (fun ret -> new Ocgtk_gio.Gio.output_stream ret) ret)(Print_dialog.print_finish obj result)

  method set_accept_label : string -> unit =
    fun accept_label ->
      (Print_dialog.set_accept_label obj accept_label)

  method set_modal : bool -> unit =
    fun modal ->
      (Print_dialog.set_modal obj modal)

  method set_title : string -> unit =
    fun title ->
      (Print_dialog.set_title obj title)

  method setup_finish : 'p1. (#Ocgtk_gio.Gio.async_result as 'p1) -> (Print_setup.t option, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (Print_dialog.setup_finish obj result)

    method as_print_dialog = obj
end

