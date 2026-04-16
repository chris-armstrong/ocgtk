(* Signal class defined in gfont_chooser_signals.ml *)

class type font_chooser_t = object
  inherit Gfont_chooser_signals.font_chooser_signals
  method get_font : unit -> string option

  method get_font_desc :
    unit -> Ocgtk_pango.Pango.Font_description.font_description_t option

  method get_font_face : unit -> Ocgtk_pango.Pango.Font_face.font_face_t option

  method get_font_family :
    unit -> Ocgtk_pango.Pango.Font_family.font_family_t option

  method get_font_features : unit -> string
  method get_font_map : unit -> Ocgtk_pango.Pango.Font_map.font_map_t option
  method get_font_size : unit -> int
  method get_language : unit -> string
  method get_level : unit -> Gtk_enums.fontchooserlevel
  method get_preview_text : unit -> string
  method get_show_preview_entry : unit -> bool
  method set_font : string -> unit

  method set_font_desc :
    Ocgtk_pango.Pango.Font_description.font_description_t -> unit

  method set_font_map : Ocgtk_pango.Pango.Font_map.font_map_t option -> unit
  method set_language : string -> unit
  method set_level : Gtk_enums.fontchooserlevel -> unit
  method set_preview_text : string -> unit
  method set_show_preview_entry : bool -> unit
  method as_font_chooser : Font_chooser.t
end

(* High-level class for FontChooser *)
class font_chooser (obj : Font_chooser.t) : font_chooser_t =
  object (self)
    inherit Gfont_chooser_signals.font_chooser_signals obj

    method get_font : unit -> string option =
      fun () -> Font_chooser.get_font obj

    method get_font_desc :
        unit -> Ocgtk_pango.Pango.Font_description.font_description_t option =
      fun () ->
        Option.map
          (fun ret ->
            new Ocgtk_pango.Pango.Font_description.font_description ret)
          (Font_chooser.get_font_desc obj)

    method get_font_face :
        unit -> Ocgtk_pango.Pango.Font_face.font_face_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgtk_pango.Pango.Font_face.font_face ret)
          (Font_chooser.get_font_face obj)

    method get_font_family :
        unit -> Ocgtk_pango.Pango.Font_family.font_family_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgtk_pango.Pango.Font_family.font_family ret)
          (Font_chooser.get_font_family obj)

    method get_font_features : unit -> string =
      fun () -> Font_chooser.get_font_features obj

    method get_font_map : unit -> Ocgtk_pango.Pango.Font_map.font_map_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgtk_pango.Pango.Font_map.font_map ret)
          (Font_chooser.get_font_map obj)

    method get_font_size : unit -> int =
      fun () -> Font_chooser.get_font_size obj

    method get_language : unit -> string =
      fun () -> Font_chooser.get_language obj

    method get_level : unit -> Gtk_enums.fontchooserlevel =
      fun () -> Font_chooser.get_level obj

    method get_preview_text : unit -> string =
      fun () -> Font_chooser.get_preview_text obj

    method get_show_preview_entry : unit -> bool =
      fun () -> Font_chooser.get_show_preview_entry obj

    method set_font : string -> unit =
      fun fontname -> Font_chooser.set_font obj fontname

    method set_font_desc :
        Ocgtk_pango.Pango.Font_description.font_description_t -> unit =
      fun font_desc ->
        let font_desc = font_desc#as_font_description in
        Font_chooser.set_font_desc obj font_desc

    method set_font_map : Ocgtk_pango.Pango.Font_map.font_map_t option -> unit =
      fun fontmap ->
        let fontmap = Option.map (fun c -> c#as_font_map) fontmap in
        Font_chooser.set_font_map obj fontmap

    method set_language : string -> unit =
      fun language -> Font_chooser.set_language obj language

    method set_level : Gtk_enums.fontchooserlevel -> unit =
      fun level -> Font_chooser.set_level obj level

    method set_preview_text : string -> unit =
      fun text -> Font_chooser.set_preview_text obj text

    method set_show_preview_entry : bool -> unit =
      fun show_preview_entry ->
        Font_chooser.set_show_preview_entry obj show_preview_entry

    method as_font_chooser = obj
  end
