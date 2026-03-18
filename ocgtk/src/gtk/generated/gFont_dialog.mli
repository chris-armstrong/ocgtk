class font_dialog : Font_dialog.t ->
  object
    method choose_face_finish : #Ocgtk_gio.Gio.async_result -> (Ocgtk_pango.Pango.font_face option, GError.t) result
    method choose_family_finish : #Ocgtk_gio.Gio.async_result -> (Ocgtk_pango.Pango.font_family option, GError.t) result
    method choose_font_finish : #Ocgtk_gio.Gio.async_result -> (Ocgtk_pango.Pango.font_description option, GError.t) result
    method get_filter : unit -> GFilter.filter option
    method get_font_map : unit -> Ocgtk_pango.Pango.font_map option
    method get_language : unit -> Ocgtk_pango.Pango.language option
    method get_modal : unit -> bool
    method get_title : unit -> string
    method set_filter : #GFilter.filter option -> unit
    method set_font_map : #Ocgtk_pango.Pango.font_map option -> unit
    method set_language : #Ocgtk_pango.Pango.language -> unit
    method set_modal : bool -> unit
    method set_title : string -> unit
    method as_font_dialog : Font_dialog.t
  end

