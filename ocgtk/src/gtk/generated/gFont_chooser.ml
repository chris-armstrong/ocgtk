(* Signal class defined in gfont_chooser_signals.ml *)

(* High-level class for FontChooser *)
class font_chooser (obj : Font_chooser.t) = object (self)
  inherit Gfont_chooser_signals.font_chooser_signals obj

  method get_font : unit -> string option =
    fun () ->
      (Font_chooser.get_font obj)

  method get_font_desc : unit -> Ocgtk_pango.Pango.font_description option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_pango.Pango.font_description ret) (Font_chooser.get_font_desc obj)

  method get_font_face : unit -> Ocgtk_pango.Pango.font_face option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_pango.Pango.font_face ret) (Font_chooser.get_font_face obj)

  method get_font_family : unit -> Ocgtk_pango.Pango.font_family option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_pango.Pango.font_family ret) (Font_chooser.get_font_family obj)

  method get_font_features : unit -> string =
    fun () ->
      (Font_chooser.get_font_features obj)

  method get_font_map : unit -> Ocgtk_pango.Pango.font_map option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_pango.Pango.font_map ret) (Font_chooser.get_font_map obj)

  method get_font_size : unit -> int =
    fun () ->
      (Font_chooser.get_font_size obj)

  method get_language : unit -> string =
    fun () ->
      (Font_chooser.get_language obj)

  method get_level : unit -> Gtk_enums.fontchooserlevel =
    fun () ->
      (Font_chooser.get_level obj)

  method get_preview_text : unit -> string =
    fun () ->
      (Font_chooser.get_preview_text obj)

  method get_show_preview_entry : unit -> bool =
    fun () ->
      (Font_chooser.get_show_preview_entry obj)

  method set_font : string -> unit =
    fun fontname ->
      (Font_chooser.set_font obj fontname)

  method set_font_desc : 'p1. (#Ocgtk_pango.Pango.font_description as 'p1) -> unit =
    fun font_desc ->
      let font_desc = font_desc#as_font_description in
      (Font_chooser.set_font_desc obj font_desc)

  method set_font_map : 'p1. (#Ocgtk_pango.Pango.font_map as 'p1) option -> unit =
    fun fontmap ->
      let fontmap = Option.map (fun (c) -> c#as_font_map) fontmap in
      (Font_chooser.set_font_map obj fontmap)

  method set_language : string -> unit =
    fun language ->
      (Font_chooser.set_language obj language)

  method set_level : Gtk_enums.fontchooserlevel -> unit =
    fun level ->
      (Font_chooser.set_level obj level)

  method set_preview_text : string -> unit =
    fun text ->
      (Font_chooser.set_preview_text obj text)

  method set_show_preview_entry : bool -> unit =
    fun show_preview_entry ->
      (Font_chooser.set_show_preview_entry obj show_preview_entry)

    method as_font_chooser = obj
end

