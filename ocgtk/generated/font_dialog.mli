class type font_dialog_t = object
  method choose_face_finish :
    Ocgio.Async_result.async_result_t ->
    (Ocpango.Font_face.font_face_t, GError.t) result

  method choose_family_finish :
    Ocgio.Async_result.async_result_t ->
    (Ocpango.Font_family.font_family_t, GError.t) result

  method choose_font_finish :
    Ocgio.Async_result.async_result_t ->
    (Ocpango.Font_description.font_description_t, GError.t) result

  method get_filter : unit -> Filter.filter_t option
  method get_font_map : unit -> Ocpango.Font_map.font_map_t option
  method get_language : unit -> Ocpango.Language.language_t option
  method get_modal : unit -> bool
  method get_title : unit -> string
  method set_filter : Filter.filter_t option -> unit
  method set_font_map : Ocpango.Font_map.font_map_t option -> unit
  method set_language : Ocpango.Language.language_t -> unit
  method set_modal : bool -> unit
  method set_title : string -> unit
  method as_font_dialog : Raw.Font_dialog.t
end

class font_dialog : Raw.Font_dialog.t -> font_dialog_t

val new_ : unit -> font_dialog_t
