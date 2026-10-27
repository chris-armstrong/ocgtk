class type font_dialog_button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_dialog : unit -> Font_dialog.font_dialog_t option

  method get_font_desc :
    unit -> Ocpango.Font_description.font_description_t option

  method get_font_features : unit -> string option
  method get_language : unit -> Ocpango.Language.language_t option
  method get_level : unit -> Enums.fontlevel
  method get_use_font : unit -> bool
  method get_use_size : unit -> bool
  method set_dialog : Font_dialog.font_dialog_t -> unit
  method set_font_desc : Ocpango.Font_description.font_description_t -> unit
  method set_font_features : string option -> unit
  method set_language : Ocpango.Language.language_t option -> unit
  method set_level : Enums.fontlevel -> unit
  method set_use_font : bool -> unit
  method set_use_size : bool -> unit
  method as_font_dialog_button : Raw.Font_dialog_button.t
end

class font_dialog_button : Raw.Font_dialog_button.t -> font_dialog_button_t

val new_ : Font_dialog.font_dialog_t option -> font_dialog_button_t
