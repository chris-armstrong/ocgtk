class type font_dialog_t = object
  method choose_face_finish :
    Ocgtk_gio.Gio.Async_result.async_result_t ->
    (Ocgtk_pango.Pango.Font_face.font_face_t option, GError.t) result

  method choose_family_finish :
    Ocgtk_gio.Gio.Async_result.async_result_t ->
    (Ocgtk_pango.Pango.Font_family.font_family_t option, GError.t) result

  method choose_font_finish :
    Ocgtk_gio.Gio.Async_result.async_result_t ->
    ( Ocgtk_pango.Pango.Font_description.font_description_t option,
      GError.t )
    result

  method get_filter : unit -> GFilter.filter_t option
  method get_font_map : unit -> Ocgtk_pango.Pango.Font_map.font_map_t option
  method get_language : unit -> Ocgtk_pango.Pango.Language.language_t option
  method get_modal : unit -> bool
  method get_title : unit -> string
  method set_filter : GFilter.filter_t option -> unit
  method set_font_map : Ocgtk_pango.Pango.Font_map.font_map_t option -> unit
  method set_language : Ocgtk_pango.Pango.Language.language_t -> unit
  method set_modal : bool -> unit
  method set_title : string -> unit
  method as_font_dialog : Font_dialog.t
end

class font_dialog : Font_dialog.t -> font_dialog_t

val new_ : unit -> font_dialog_t
