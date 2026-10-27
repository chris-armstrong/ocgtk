class type text_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_text.accessible_text_t
  inherit Editable.editable_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_backspace :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_copy_clipboard :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_cut_clipboard :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_delete_from_cursor :
    ?after:bool ->
    callback:(type_:Enums.deletetype -> count:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_insert_at_cursor :
    ?after:bool ->
    callback:(string:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_insert_emoji :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_move_cursor :
    ?after:bool ->
    callback:(step:Enums.movementstep -> count:int -> extend:bool -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_paste_clipboard :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_preedit_changed :
    ?after:bool ->
    callback:(preedit:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_toggle_overwrite :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_activates_default : unit -> bool
  method get_attributes : unit -> Ocpango.Attr_list.attr_list_t option
  method get_buffer : unit -> Entry_buffer.entry_buffer_t
  method get_enable_emoji_completion : unit -> bool
  method get_extra_menu : unit -> Ocgio.Menu_model.menu_model_t option
  method get_input_hints : unit -> Enums.inputhints
  method get_input_purpose : unit -> Enums.inputpurpose
  method get_invisible_char : unit -> int
  method get_max_length : unit -> int
  method get_overwrite_mode : unit -> bool
  method get_placeholder_text : unit -> string option
  method get_propagate_text_width : unit -> bool
  method get_tabs : unit -> Ocpango.Tab_array.tab_array_t option
  method get_text_length : unit -> UInt16.t
  method get_truncate_multiline : unit -> bool
  method get_visibility : unit -> bool
  method grab_focus_without_selecting : unit -> bool
  method set_activates_default : bool -> unit
  method set_attributes : Ocpango.Attr_list.attr_list_t option -> unit
  method set_buffer : Entry_buffer.entry_buffer_t -> unit
  method set_enable_emoji_completion : bool -> unit
  method set_extra_menu : Ocgio.Menu_model.menu_model_t option -> unit
  method set_input_hints : Enums.inputhints -> unit
  method set_input_purpose : Enums.inputpurpose -> unit
  method set_invisible_char : int -> unit
  method set_max_length : int -> unit
  method set_overwrite_mode : bool -> unit
  method set_placeholder_text : string option -> unit
  method set_propagate_text_width : bool -> unit
  method set_tabs : Ocpango.Tab_array.tab_array_t option -> unit
  method set_truncate_multiline : bool -> unit
  method set_visibility : bool -> unit
  method unset_invisible_char : unit -> unit
  method im_module : string
  method set_im_module : string -> unit
  method invisible_char_set : bool
  method set_invisible_char_set : bool -> unit
  method scroll_offset : int
  method as_text : Raw.Text.t
end

class text : Raw.Text.t -> text_t

val new_ : unit -> text_t
val new_with_buffer : Entry_buffer.entry_buffer_t -> text_t
