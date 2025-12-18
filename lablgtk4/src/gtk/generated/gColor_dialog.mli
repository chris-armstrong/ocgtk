class color_dialog : Color_dialog.t ->
  object
    method modal : bool
    method set_modal : bool -> unit
    method title : string
    method set_title : string -> unit
    method with_alpha : bool
    method set_with_alpha : bool -> unit
    method as_color_dialog : Color_dialog.t
  end

