class type im_context_t = object
  method on_commit : callback:(str:string -> unit) -> Gobject.Signal.handler_id

  method on_delete_surrounding :
    callback:(offset:int -> n_chars:int -> bool) -> Gobject.Signal.handler_id

  method on_preedit_changed :
    callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_preedit_end : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method on_preedit_start : callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_retrieve_surrounding :
    callback:(unit -> bool) -> Gobject.Signal.handler_id

  method activate_osk : Ocgtk_gdk.Gdk.Event.event_t option -> bool
  method delete_surrounding : int -> int -> bool

  method filter_key :
    bool ->
    Ocgtk_gdk.Gdk.Surface.surface_t ->
    Ocgtk_gdk.Gdk.Device.device_t ->
    UInt32.t ->
    int ->
    Ocgtk_gdk.Gdk.modifiertype ->
    int ->
    bool

  method filter_keypress : Ocgtk_gdk.Gdk.Event.event_t -> bool
  method focus_in : unit -> unit
  method focus_out : unit -> unit
  method reset : unit -> unit

  method set_client_widget :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option ->
    unit

  method set_cursor_location : Ocgtk_gdk.Gdk.Rectangle.rectangle_t -> unit
  method set_surrounding : string -> int -> int -> unit
  method set_surrounding_with_selection : string -> int -> int -> int -> unit
  method set_use_preedit : bool -> unit
  method input_hints : Gtk_enums.inputhints
  method set_input_hints : Gtk_enums.inputhints -> unit
  method input_purpose : Gtk_enums.inputpurpose
  method set_input_purpose : Gtk_enums.inputpurpose -> unit
  method as_im_context : Im_context.t
end

class im_context : Im_context.t -> im_context_t
