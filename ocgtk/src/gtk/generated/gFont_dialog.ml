(* High-level class for FontDialog *)
class font_dialog (obj : Font_dialog.t) = object (self)

  method choose_face_finish : 'p1. (#Ocgtk_gio.Gio.async_result as 'p1) -> (Ocgtk_pango.Pango.font_face option, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      Result.map (fun ret -> Option.map (fun ret -> new Ocgtk_pango.Pango.font_face ret) ret)(Font_dialog.choose_face_finish obj result)

  method choose_family_finish : 'p1. (#Ocgtk_gio.Gio.async_result as 'p1) -> (Ocgtk_pango.Pango.font_family option, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      Result.map (fun ret -> Option.map (fun ret -> new Ocgtk_pango.Pango.font_family ret) ret)(Font_dialog.choose_family_finish obj result)

  method choose_font_finish : 'p1. (#Ocgtk_gio.Gio.async_result as 'p1) -> (Ocgtk_pango.Pango.font_description option, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      Result.map (fun ret -> Option.map (fun ret -> new Ocgtk_pango.Pango.font_description ret) ret)(Font_dialog.choose_font_finish obj result)

  method get_filter : unit -> GFilter.filter option =
    fun () ->
      Option.map (fun ret -> new GFilter.filter ret) (Font_dialog.get_filter obj)

  method get_font_map : unit -> Ocgtk_pango.Pango.font_map option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_pango.Pango.font_map ret) (Font_dialog.get_font_map obj)

  method get_language : unit -> Ocgtk_pango.Pango.language option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_pango.Pango.language ret) (Font_dialog.get_language obj)

  method get_modal : unit -> bool =
    fun () ->
      (Font_dialog.get_modal obj)

  method get_title : unit -> string =
    fun () ->
      (Font_dialog.get_title obj)

  method set_filter : 'p1. (#GFilter.filter as 'p1) option -> unit =
    fun filter ->
      let filter = Option.map (fun (c) -> c#as_filter) filter in
      (Font_dialog.set_filter obj filter)

  method set_font_map : 'p1. (#Ocgtk_pango.Pango.font_map as 'p1) option -> unit =
    fun fontmap ->
      let fontmap = Option.map (fun (c) -> c#as_font_map) fontmap in
      (Font_dialog.set_font_map obj fontmap)

  method set_language : 'p1. (#Ocgtk_pango.Pango.language as 'p1) -> unit =
    fun language ->
      let language = language#as_language in
      (Font_dialog.set_language obj language)

  method set_modal : bool -> unit =
    fun modal ->
      (Font_dialog.set_modal obj modal)

  method set_title : string -> unit =
    fun title ->
      (Font_dialog.set_title obj title)

    method as_font_dialog = obj
end

