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

  method set_accept_label : string -> unit =
    fun accept_label ->
      (Print_dialog.set_accept_label obj accept_label)

  method set_modal : bool -> unit =
    fun modal ->
      (Print_dialog.set_modal obj modal)

  method set_title : string -> unit =
    fun title ->
      (Print_dialog.set_title obj title)

    method as_print_dialog = obj
end

