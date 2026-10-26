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

(* High-level class for FontDialog *)
class font_dialog (obj : Raw.Font_dialog.t) : font_dialog_t =
  object (self)
    method choose_face_finish :
        Ocgio.Async_result.async_result_t ->
        (Ocpango.Font_face.font_face_t, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new Ocpango.Font_face.font_face ret)
          (Raw.Font_dialog.choose_face_finish obj result)

    method choose_family_finish :
        Ocgio.Async_result.async_result_t ->
        (Ocpango.Font_family.font_family_t, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new Ocpango.Font_family.font_family ret)
          (Raw.Font_dialog.choose_family_finish obj result)

    method choose_font_finish :
        Ocgio.Async_result.async_result_t ->
        (Ocpango.Font_description.font_description_t, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new Ocpango.Font_description.font_description ret)
          (Raw.Font_dialog.choose_font_finish obj result)

    method get_filter : unit -> Filter.filter_t option =
      fun () ->
        Option.map
          (fun ret -> new Filter.filter ret)
          (Raw.Font_dialog.get_filter obj)

    method get_font_map : unit -> Ocpango.Font_map.font_map_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocpango.Font_map.font_map ret)
          (Raw.Font_dialog.get_font_map obj)

    method get_language : unit -> Ocpango.Language.language_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocpango.Language.language ret)
          (Raw.Font_dialog.get_language obj)

    method get_modal : unit -> bool = fun () -> Raw.Font_dialog.get_modal obj
    method get_title : unit -> string = fun () -> Raw.Font_dialog.get_title obj

    method set_filter : Filter.filter_t option -> unit =
      fun filter ->
        let filter = Option.map (fun c -> c#as_filter) filter in
        Raw.Font_dialog.set_filter obj filter

    method set_font_map : Ocpango.Font_map.font_map_t option -> unit =
      fun fontmap ->
        let fontmap = Option.map (fun c -> c#as_font_map) fontmap in
        Raw.Font_dialog.set_font_map obj fontmap

    method set_language : Ocpango.Language.language_t -> unit =
      fun language ->
        let language = language#as_language in
        Raw.Font_dialog.set_language obj language

    method set_modal : bool -> unit =
      fun modal -> Raw.Font_dialog.set_modal obj modal

    method set_title : string -> unit =
      fun title -> Raw.Font_dialog.set_title obj title

    method as_font_dialog = obj
  end

let new_ () : font_dialog_t = new font_dialog (Raw.Font_dialog.new_ ())
