class type font_dialog_button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the font dialog button is activated.

      The [::activate] signal on [GtkFontDialogButton] is an action signal and
      emitting it causes the button to pop up its dialog. *)

  method get_dialog : unit -> Font_dialog.font_dialog_t option
  (** Returns the [GtkFontDialog] of [self]. *)

  method get_font_desc :
    unit -> Ocpango.Font_description.font_description_t option
  [@@ocaml.doc
    "Returns the font of the button.\n\n\
     This function is what should be used to obtain\n\
     the font that was chosen by the user. To get\n\
     informed about changes, listen to \"notify::font-desc\"."]

  method get_font_features : unit -> string option
  [@@ocaml.doc
    "Returns the font features of the button.\n\n\
     This function is what should be used to obtain the font features\n\
     that were chosen by the user. To get informed about changes, listen\n\
     to \"notify::font-features\".\n\n\
     Note that the button will only let users choose font features\n\
     if [Gtk.FontDialogButton:level] is set to\n\
     [GTK_FONT_LEVEL_FEATURES]."]

  method get_language : unit -> Ocpango.Language.language_t option
  (** Returns the language that is used for font features. *)

  method get_level : unit -> Enums.fontlevel
  (** Returns the level of detail at which this dialog lets the user select
      fonts. *)

  method get_use_font : unit -> bool
  (** Returns whether the selected font is used in the label. *)

  method get_use_size : unit -> bool
  (** Returns whether the selected font size is used in the label. *)

  method set_dialog : Font_dialog.font_dialog_t -> unit
  (** Sets a [GtkFontDialog] object to use for creating the font chooser dialog
      that is presented when the user clicks the button. *)

  method set_font_desc : Ocpango.Font_description.font_description_t -> unit
  (** Sets the font of the button. *)

  method set_font_features : string option -> unit
  (** Sets the font features of the button. *)

  method set_language : Ocpango.Language.language_t option -> unit
  (** Sets the language to use for font features. *)

  method set_level : Enums.fontlevel -> unit
  (** Sets the level of detail at which this dialog lets the user select fonts.
  *)

  method set_use_font : bool -> unit
  (** If [use_font] is [TRUE], the font name will be written using the selected
      font. *)

  method set_use_size : bool -> unit
  (** If [use_size] is [TRUE], the font name will be written using the selected
      font size. *)

  method as_font_dialog_button : Raw.Font_dialog_button.t
end

(* High-level class for FontDialogButton *)
class font_dialog_button (obj : Raw.Font_dialog_button.t) : font_dialog_button_t
  =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method on_activate ?(after = false) ~callback () =
      Raw.Font_dialog_button.on_activate ~after self#as_font_dialog_button
        ~callback

    method get_dialog : unit -> Font_dialog.font_dialog_t option =
      fun () ->
        Option.map
          (fun ret -> new Font_dialog.font_dialog ret)
          (Raw.Font_dialog_button.get_dialog obj)

    method get_font_desc :
        unit -> Ocpango.Font_description.font_description_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocpango.Font_description.font_description ret)
          (Raw.Font_dialog_button.get_font_desc obj)

    method get_font_features : unit -> string option =
      fun () -> Raw.Font_dialog_button.get_font_features obj

    method get_language : unit -> Ocpango.Language.language_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocpango.Language.language ret)
          (Raw.Font_dialog_button.get_language obj)

    method get_level : unit -> Enums.fontlevel =
      fun () -> Raw.Font_dialog_button.get_level obj

    method get_use_font : unit -> bool =
      fun () -> Raw.Font_dialog_button.get_use_font obj

    method get_use_size : unit -> bool =
      fun () -> Raw.Font_dialog_button.get_use_size obj

    method set_dialog : Font_dialog.font_dialog_t -> unit =
      fun dialog ->
        let dialog = dialog#as_font_dialog in
        Raw.Font_dialog_button.set_dialog obj dialog

    method set_font_desc : Ocpango.Font_description.font_description_t -> unit =
      fun font_desc ->
        let font_desc = font_desc#as_font_description in
        Raw.Font_dialog_button.set_font_desc obj font_desc

    method set_font_features : string option -> unit =
      fun font_features ->
        Raw.Font_dialog_button.set_font_features obj font_features

    method set_language : Ocpango.Language.language_t option -> unit =
      fun language ->
        let language = Option.map (fun c -> c#as_language) language in
        Raw.Font_dialog_button.set_language obj language

    method set_level : Enums.fontlevel -> unit =
      fun level -> Raw.Font_dialog_button.set_level obj level

    method set_use_font : bool -> unit =
      fun use_font -> Raw.Font_dialog_button.set_use_font obj use_font

    method set_use_size : bool -> unit =
      fun use_size -> Raw.Font_dialog_button.set_use_size obj use_size

    method as_font_dialog_button = obj
  end

let new_ (dialog : Font_dialog.font_dialog_t option) : font_dialog_button_t =
  let dialog = Option.map (fun c -> c#as_font_dialog) dialog in
  let obj_ = Raw.Font_dialog_button.new_ dialog in
  new font_dialog_button obj_
