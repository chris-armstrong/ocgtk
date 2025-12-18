class print_dialog : Print_dialog.t ->
  object
    method accept_label : string
    method set_accept_label : string -> unit
    method modal : bool
    method set_modal : bool -> unit
    method title : string
    method set_title : string -> unit
    method as_print_dialog : Print_dialog.t
  end

