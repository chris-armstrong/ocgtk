class type font_chooser_t = object
  method on_font_activated :
    ?after:bool ->
    callback:(fontname:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_font : unit -> string option
  (** Gets the currently-selected font name.

      Note that this can be a different string than what you set with
      [Gtk.FontChooser.set_font], as the font chooser widget may normalize font
      names and thus return a string with a different structure. For example,
      “Helvetica Italic Bold 12” could be normalized to “Helvetica Bold Italic
      12”.

      Use [Pango.FontDescription.equal] if you want to compare two font
      descriptions. *)

  method get_font_desc :
    unit -> Ocpango.Font_description.font_description_t option
  (** Gets the currently-selected font.

      Note that this can be a different string than what you set with
      [Gtk.FontChooser.set_font], as the font chooser widget may normalize font
      names and thus return a string with a different structure. For example,
      “Helvetica Italic Bold 12” could be normalized to “Helvetica Bold Italic
      12”.

      Use [Pango.FontDescription.equal] if you want to compare two font
      descriptions. *)

  method get_font_face : unit -> Ocpango.Font_face.font_face_t option
  (** Gets the [PangoFontFace] representing the selected font group details
      (i.e. family, slant, weight, width, etc).

      If the selected font is not installed, returns [NULL]. *)

  method get_font_family : unit -> Ocpango.Font_family.font_family_t option
  (** Gets the [PangoFontFamily] representing the selected font family.

      Font families are a collection of font faces.

      If the selected font is not installed, returns [NULL]. *)

  method get_font_features : unit -> string
  (** Gets the currently-selected font features.

      The format of the returned string is compatible with the
      {{:https://www.w3.org/TR/css-fonts-4/#font-rend-desc}CSS
       font-feature-settings property}. It can be passed to
      [Pango.AttrFontFeatures.new]. *)

  method get_font_map : unit -> Ocpango.Font_map.font_map_t option
  (** Gets the custom font map of this font chooser widget, or [NULL] if it does
      not have one. *)

  method get_font_size : unit -> int
  (** The selected font size. *)

  method get_language : unit -> string
  (** Gets the language that is used for font features. *)

  method get_level : unit -> Enums.fontchooserlevel
  (** Returns the current level of granularity for selecting fonts. *)

  method get_preview_text : unit -> string
  (** Gets the text displayed in the preview area. *)

  method get_show_preview_entry : unit -> bool
  (** Returns whether the preview entry is shown or not. *)

  method set_font : string -> unit
  (** Sets the currently-selected font. *)

  method set_font_desc : Ocpango.Font_description.font_description_t -> unit
  (** Sets the currently-selected font from [font_desc]. *)

  method set_font_map : Ocpango.Font_map.font_map_t option -> unit
  (** Sets a custom font map to use for this font chooser widget.

      A custom font map can be used to present application-specific fonts
      instead of or in addition to the normal system fonts.

      {[
      FcConfig * config;
      PangoFontMap * fontmap;

      config = FcInitLoadConfigAndFonts ();
      FcConfigAppFontAddFile (config, my_app_font_file);

      fontmap = pango_cairo_font_map_new_for_font_type CAIRO_FONT_TYPE_FT;
      pango_fc_font_map_set_config (PANGO_FC_FONT_MAP fontmap, config);

      gtk_font_chooser_set_font_map (font_chooser, fontmap)
      ]}

      Note that other GTK widgets will only be able to use the
      application-specific font if it is present in the font map they use:

      {[
      context = gtk_widget_get_pango_context label;
      pango_context_set_font_map (context, fontmap)
      ]} *)

  method set_language : string -> unit
  (** Sets the language to use for font features. *)

  method set_level : Enums.fontchooserlevel -> unit
  (** Sets the desired level of granularity for selecting fonts. *)

  method set_preview_text : string -> unit
  (** Sets the text displayed in the preview area.

      The [text] is used to show how the selected font looks. *)

  method set_show_preview_entry : bool -> unit
  (** Shows or hides the editable preview entry. *)

  method as_font_chooser : Raw.Font_chooser.t
end

(* High-level class for FontChooser *)
class font_chooser (obj : Raw.Font_chooser.t) : font_chooser_t =
  object (self)
    method on_font_activated ?(after = false) ~callback () =
      Raw.Font_chooser.on_font_activated ~after self#as_font_chooser ~callback

    method get_font : unit -> string option =
      fun () -> Raw.Font_chooser.get_font obj

    method get_font_desc :
        unit -> Ocpango.Font_description.font_description_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocpango.Font_description.font_description ret)
          (Raw.Font_chooser.get_font_desc obj)

    method get_font_face : unit -> Ocpango.Font_face.font_face_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocpango.Font_face.font_face ret)
          (Raw.Font_chooser.get_font_face obj)

    method get_font_family : unit -> Ocpango.Font_family.font_family_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocpango.Font_family.font_family ret)
          (Raw.Font_chooser.get_font_family obj)

    method get_font_features : unit -> string =
      fun () -> Raw.Font_chooser.get_font_features obj

    method get_font_map : unit -> Ocpango.Font_map.font_map_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocpango.Font_map.font_map ret)
          (Raw.Font_chooser.get_font_map obj)

    method get_font_size : unit -> int =
      fun () -> Raw.Font_chooser.get_font_size obj

    method get_language : unit -> string =
      fun () -> Raw.Font_chooser.get_language obj

    method get_level : unit -> Enums.fontchooserlevel =
      fun () -> Raw.Font_chooser.get_level obj

    method get_preview_text : unit -> string =
      fun () -> Raw.Font_chooser.get_preview_text obj

    method get_show_preview_entry : unit -> bool =
      fun () -> Raw.Font_chooser.get_show_preview_entry obj

    method set_font : string -> unit =
      fun fontname -> Raw.Font_chooser.set_font obj fontname

    method set_font_desc : Ocpango.Font_description.font_description_t -> unit =
      fun font_desc ->
        let font_desc = font_desc#as_font_description in
        Raw.Font_chooser.set_font_desc obj font_desc

    method set_font_map : Ocpango.Font_map.font_map_t option -> unit =
      fun fontmap ->
        let fontmap = Option.map (fun c -> c#as_font_map) fontmap in
        Raw.Font_chooser.set_font_map obj fontmap

    method set_language : string -> unit =
      fun language -> Raw.Font_chooser.set_language obj language

    method set_level : Enums.fontchooserlevel -> unit =
      fun level -> Raw.Font_chooser.set_level obj level

    method set_preview_text : string -> unit =
      fun text -> Raw.Font_chooser.set_preview_text obj text

    method set_show_preview_entry : bool -> unit =
      fun show_preview_entry ->
        Raw.Font_chooser.set_show_preview_entry obj show_preview_entry

    method as_font_chooser = obj
  end
