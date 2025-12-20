class print_dialog : Print_dialog.t ->
  object
    method get_accept_label : unit -> string
    method get_modal : unit -> bool
    method get_title : unit -> string
    method set_accept_label : string -> unit
    method set_modal : bool -> unit
    method set_title : string -> unit
    method as_print_dialog : Print_dialog.t
  end

