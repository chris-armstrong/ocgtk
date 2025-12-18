class font_dialog : Font_dialog.t ->
  object
    method modal : bool
    method set_modal : bool -> unit
    method title : string
    method set_title : string -> unit
    method get_filter : unit -> GFilter.filter option
    method set_filter : #GFilter.filter option -> unit
    method as_font_dialog : Font_dialog.t
  end

