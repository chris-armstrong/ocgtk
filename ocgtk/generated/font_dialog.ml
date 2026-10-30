class type font_dialog_t = object
  (** {2:methods Methods} *)

  method choose_face_finish :
    Ocgio.Async_result.async_result_t ->
    (Ocpango.Font_face.font_face_t, GError.t) result
  (** Finishes the [Gtk.FontDialog.choose_face] call.

      Note that this function returns a [Gtk.DialogError.DISMISSED] error if the
      user cancels the dialog. *)

  method choose_family_finish :
    Ocgio.Async_result.async_result_t ->
    (Ocpango.Font_family.font_family_t, GError.t) result
  (** Finishes the [Gtk.FontDialog.choose_family] call.

      Note that this function returns a [Gtk.DialogError.DISMISSED] error if the
      user cancels the dialog. *)

  method choose_font_finish :
    Ocgio.Async_result.async_result_t ->
    (Ocpango.Font_description.font_description_t, GError.t) result
  (** Finishes the [Gtk.FontDialog.choose_font] call.

      Note that this function returns a [Gtk.DialogError.DISMISSED] error if the
      user cancels the dialog. *)

  method get_filter : unit -> Filter.filter_t option
  (** Returns the filter that decides which fonts to display in the font chooser
      dialog. *)

  method get_font_map : unit -> Ocpango.Font_map.font_map_t option
  (** Returns the fontmap from which fonts are selected, or [None] for the
      default fontmap. *)

  method get_language : unit -> Ocpango.Language.language_t option
  (** Returns the language for which font features are applied. *)

  method get_modal : unit -> bool
  (** Returns whether the font chooser dialog blocks interaction with the parent
      window while it is presented. *)

  method get_title : unit -> string
  (** Returns the title that will be shown on the font chooser dialog. *)

  method set_filter : Filter.filter_t option -> unit
  (** Adds a filter that decides which fonts to display in the font chooser
      dialog.

      The filter must be able to handle both [PangoFontFamily] and
      [PangoFontFace] objects. *)

  method set_font_map : Ocpango.Font_map.font_map_t option -> unit
  (** Sets the fontmap from which fonts are selected.

      If [fontmap] is [None], the default fontmap is used. *)

  method set_language : Ocpango.Language.language_t -> unit
  (** Sets the language for which font features are applied. *)

  method set_modal : bool -> unit
  (** Sets whether the font chooser dialog blocks interaction with the parent
      window while it is presented. *)

  method set_title : string -> unit
  (** Sets the title that will be shown on the font chooser dialog. *)

  (** {2:conversions Conversions} *)

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
