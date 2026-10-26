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

(* High-level class for Text *)
class text (obj : Raw.Text.t) : text_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit
      Accessible_text.accessible_text (Raw.Accessible_text.from_gobject obj)

    inherit Editable.editable (Raw.Editable.from_gobject obj)

    method on_activate ?(after = false) ~callback () =
      Raw.Text.on_activate ~after self#as_text ~callback

    method on_backspace ?(after = false) ~callback () =
      Raw.Text.on_backspace ~after self#as_text ~callback

    method on_copy_clipboard ?(after = false) ~callback () =
      Raw.Text.on_copy_clipboard ~after self#as_text ~callback

    method on_cut_clipboard ?(after = false) ~callback () =
      Raw.Text.on_cut_clipboard ~after self#as_text ~callback

    method on_delete_from_cursor ?(after = false) ~callback () =
      Raw.Text.on_delete_from_cursor ~after self#as_text ~callback

    method on_insert_at_cursor ?(after = false) ~callback () =
      Raw.Text.on_insert_at_cursor ~after self#as_text ~callback

    method on_insert_emoji ?(after = false) ~callback () =
      Raw.Text.on_insert_emoji ~after self#as_text ~callback

    method on_move_cursor ?(after = false) ~callback () =
      Raw.Text.on_move_cursor ~after self#as_text ~callback

    method on_paste_clipboard ?(after = false) ~callback () =
      Raw.Text.on_paste_clipboard ~after self#as_text ~callback

    method on_preedit_changed ?(after = false) ~callback () =
      Raw.Text.on_preedit_changed ~after self#as_text ~callback

    method on_toggle_overwrite ?(after = false) ~callback () =
      Raw.Text.on_toggle_overwrite ~after self#as_text ~callback

    method get_activates_default : unit -> bool =
      fun () -> Raw.Text.get_activates_default obj

    method get_attributes : unit -> Ocpango.Attr_list.attr_list_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocpango.Attr_list.attr_list ret)
          (Raw.Text.get_attributes obj)

    method get_buffer : unit -> Entry_buffer.entry_buffer_t =
      fun () -> new Entry_buffer.entry_buffer (Raw.Text.get_buffer obj)

    method get_enable_emoji_completion : unit -> bool =
      fun () -> Raw.Text.get_enable_emoji_completion obj

    method get_extra_menu : unit -> Ocgio.Menu_model.menu_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.Menu_model.menu_model ret)
          (Raw.Text.get_extra_menu obj)

    method get_input_hints : unit -> Enums.inputhints =
      fun () -> Raw.Text.get_input_hints obj

    method get_input_purpose : unit -> Enums.inputpurpose =
      fun () -> Raw.Text.get_input_purpose obj

    method get_invisible_char : unit -> int =
      fun () -> Raw.Text.get_invisible_char obj

    method get_max_length : unit -> int = fun () -> Raw.Text.get_max_length obj

    method get_overwrite_mode : unit -> bool =
      fun () -> Raw.Text.get_overwrite_mode obj

    method get_placeholder_text : unit -> string option =
      fun () -> Raw.Text.get_placeholder_text obj

    method get_propagate_text_width : unit -> bool =
      fun () -> Raw.Text.get_propagate_text_width obj

    method get_tabs : unit -> Ocpango.Tab_array.tab_array_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocpango.Tab_array.tab_array ret)
          (Raw.Text.get_tabs obj)

    method get_text_length : unit -> UInt16.t =
      fun () -> Raw.Text.get_text_length obj

    method get_truncate_multiline : unit -> bool =
      fun () -> Raw.Text.get_truncate_multiline obj

    method get_visibility : unit -> bool = fun () -> Raw.Text.get_visibility obj

    method grab_focus_without_selecting : unit -> bool =
      fun () -> Raw.Text.grab_focus_without_selecting obj

    method set_activates_default : bool -> unit =
      fun activates -> Raw.Text.set_activates_default obj activates

    method set_attributes : Ocpango.Attr_list.attr_list_t option -> unit =
      fun attrs ->
        let attrs = Option.map (fun c -> c#as_attr_list) attrs in
        Raw.Text.set_attributes obj attrs

    method set_buffer : Entry_buffer.entry_buffer_t -> unit =
      fun buffer ->
        let buffer = buffer#as_entry_buffer in
        Raw.Text.set_buffer obj buffer

    method set_enable_emoji_completion : bool -> unit =
      fun enable_emoji_completion ->
        Raw.Text.set_enable_emoji_completion obj enable_emoji_completion

    method set_extra_menu : Ocgio.Menu_model.menu_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_menu_model) model in
        Raw.Text.set_extra_menu obj model

    method set_input_hints : Enums.inputhints -> unit =
      fun hints -> Raw.Text.set_input_hints obj hints

    method set_input_purpose : Enums.inputpurpose -> unit =
      fun purpose -> Raw.Text.set_input_purpose obj purpose

    method set_invisible_char : int -> unit =
      fun ch -> Raw.Text.set_invisible_char obj ch

    method set_max_length : int -> unit =
      fun length -> Raw.Text.set_max_length obj length

    method set_overwrite_mode : bool -> unit =
      fun overwrite -> Raw.Text.set_overwrite_mode obj overwrite

    method set_placeholder_text : string option -> unit =
      fun text -> Raw.Text.set_placeholder_text obj text

    method set_propagate_text_width : bool -> unit =
      fun propagate_text_width ->
        Raw.Text.set_propagate_text_width obj propagate_text_width

    method set_tabs : Ocpango.Tab_array.tab_array_t option -> unit =
      fun tabs ->
        let tabs = Option.map (fun c -> c#as_tab_array) tabs in
        Raw.Text.set_tabs obj tabs

    method set_truncate_multiline : bool -> unit =
      fun truncate_multiline ->
        Raw.Text.set_truncate_multiline obj truncate_multiline

    method set_visibility : bool -> unit =
      fun visible -> Raw.Text.set_visibility obj visible

    method unset_invisible_char : unit -> unit =
      fun () -> Raw.Text.unset_invisible_char obj

    method im_module = Raw.Text.get_im_module obj
    method set_im_module v = Raw.Text.set_im_module obj v
    method invisible_char_set = Raw.Text.get_invisible_char_set obj
    method set_invisible_char_set v = Raw.Text.set_invisible_char_set obj v
    method scroll_offset = Raw.Text.get_scroll_offset obj
    method as_text = obj
  end

let new_ () : text_t = new text (Raw.Text.new_ ())

let new_with_buffer (buffer : Entry_buffer.entry_buffer_t) : text_t =
  let buffer = buffer#as_entry_buffer in
  let obj_ = Raw.Text.new_with_buffer buffer in
  new text obj_
