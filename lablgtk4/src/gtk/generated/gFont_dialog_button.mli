class font_dialog_button : Font_dialog_button.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gfont_dialog_button_signals.font_dialog_button_signals
    method get_dialog : unit -> GFont_dialog.font_dialog option
    method get_font_features : unit -> string option
    method get_level : unit -> Gtk_enums.fontlevel
    method get_use_font : unit -> bool
    method get_use_size : unit -> bool
    method set_dialog : #GFont_dialog.font_dialog -> unit
    method set_font_features : string option -> unit
    method set_level : Gtk_enums.fontlevel -> unit
    method set_use_font : bool -> unit
    method set_use_size : bool -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_font_dialog_button : Font_dialog_button.t
  end

