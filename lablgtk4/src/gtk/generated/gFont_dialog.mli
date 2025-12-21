class font_dialog : Font_dialog.t ->
  object
    method get_filter : unit -> GFilter.filter option
    method get_modal : unit -> bool
    method get_title : unit -> string
    method set_filter : #GFilter.filter option -> unit
    method set_modal : bool -> unit
    method set_title : string -> unit
    method as_font_dialog : Font_dialog.t
  end

