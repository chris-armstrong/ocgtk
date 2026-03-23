(* Signal class defined in gfont_dialog_button_signals.ml *)

class type font_dialog_button_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Gfont_dialog_button_signals.font_dialog_button_signals
    method get_dialog : unit -> GFont_dialog.font_dialog_t option
    method get_font_desc : unit -> Ocgtk_pango.Pango.Font_description.font_description_t option
    method get_font_features : unit -> string option
    method get_language : unit -> Ocgtk_pango.Pango.Language.language_t option
    method get_level : unit -> Gtk_enums.fontlevel
    method get_use_font : unit -> bool
    method get_use_size : unit -> bool
    method set_dialog : GFont_dialog.font_dialog_t -> unit
    method set_font_desc : Ocgtk_pango.Pango.Font_description.font_description_t -> unit
    method set_font_features : string option -> unit
    method set_language : Ocgtk_pango.Pango.Language.language_t option -> unit
    method set_level : Gtk_enums.fontlevel -> unit
    method set_use_font : bool -> unit
    method set_use_size : bool -> unit
    method as_font_dialog_button : Font_dialog_button.t
end

(* High-level class for FontDialogButton *)
class font_dialog_button (obj : Font_dialog_button.t) : font_dialog_button_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit Gfont_dialog_button_signals.font_dialog_button_signals obj

  method get_dialog : unit -> GFont_dialog.font_dialog_t option =
    fun () ->
      Option.map (fun ret -> new GFont_dialog.font_dialog ret) (Font_dialog_button.get_dialog obj)

  method get_font_desc : unit -> Ocgtk_pango.Pango.Font_description.font_description_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_pango.Pango.Font_description.font_description ret) (Font_dialog_button.get_font_desc obj)

  method get_font_features : unit -> string option =
    fun () ->
      (Font_dialog_button.get_font_features obj)

  method get_language : unit -> Ocgtk_pango.Pango.Language.language_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_pango.Pango.Language.language ret) (Font_dialog_button.get_language obj)

  method get_level : unit -> Gtk_enums.fontlevel =
    fun () ->
      (Font_dialog_button.get_level obj)

  method get_use_font : unit -> bool =
    fun () ->
      (Font_dialog_button.get_use_font obj)

  method get_use_size : unit -> bool =
    fun () ->
      (Font_dialog_button.get_use_size obj)

  method set_dialog : GFont_dialog.font_dialog_t -> unit =
    fun dialog ->
      let dialog = dialog#as_font_dialog in
      (Font_dialog_button.set_dialog obj dialog)

  method set_font_desc : Ocgtk_pango.Pango.Font_description.font_description_t -> unit =
    fun font_desc ->
      let font_desc = font_desc#as_font_description in
      (Font_dialog_button.set_font_desc obj font_desc)

  method set_font_features : string option -> unit =
    fun font_features ->
      (Font_dialog_button.set_font_features obj font_features)

  method set_language : Ocgtk_pango.Pango.Language.language_t option -> unit =
    fun language ->
      let language = Option.map (fun (c) -> c#as_language) language in
      (Font_dialog_button.set_language obj language)

  method set_level : Gtk_enums.fontlevel -> unit =
    fun level ->
      (Font_dialog_button.set_level obj level)

  method set_use_font : bool -> unit =
    fun use_font ->
      (Font_dialog_button.set_use_font obj use_font)

  method set_use_size : bool -> unit =
    fun use_size ->
      (Font_dialog_button.set_use_size obj use_size)

    method as_font_dialog_button = obj
end

let new_ (dialog : GFont_dialog.font_dialog_t option) : font_dialog_button_t =
  let dialog = Option.map (fun c -> c#as_font_dialog) dialog in
  new font_dialog_button (Font_dialog_button.new_ dialog)

