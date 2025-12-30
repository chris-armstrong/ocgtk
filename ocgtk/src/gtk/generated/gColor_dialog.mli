class color_dialog : Color_dialog.t ->
  object
    method get_modal : unit -> bool
    method get_title : unit -> string
    method get_with_alpha : unit -> bool
    method set_modal : bool -> unit
    method set_title : string -> unit
    method set_with_alpha : bool -> unit
    method as_color_dialog : Color_dialog.t
  end

