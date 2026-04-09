(* Signal class defined in gtext_signals.ml *)

class type text_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Gtext_signals.text_signals
    method get_activates_default : unit -> bool
    method get_attributes : unit -> Ocgtk_pango.Pango.Attr_list.attr_list_t option
    method get_buffer : unit -> GEntry_buffer.entry_buffer_t
    method get_enable_emoji_completion : unit -> bool
    method get_extra_menu : unit -> Ocgtk_gio.Gio.Menu_model.menu_model_t option
    method get_input_hints : unit -> Gtk_enums.inputhints
    method get_input_purpose : unit -> Gtk_enums.inputpurpose
    method get_invisible_char : unit -> int
    method get_max_length : unit -> int
    method get_overwrite_mode : unit -> bool
    method get_placeholder_text : unit -> string option
    method get_propagate_text_width : unit -> bool
    method get_tabs : unit -> Ocgtk_pango.Pango.Tab_array.tab_array_t option
    method get_text_length : unit -> int
    method get_truncate_multiline : unit -> bool
    method get_visibility : unit -> bool
    method grab_focus_without_selecting : unit -> bool
    method set_activates_default : bool -> unit
    method set_attributes : Ocgtk_pango.Pango.Attr_list.attr_list_t option -> unit
    method set_buffer : GEntry_buffer.entry_buffer_t -> unit
    method set_enable_emoji_completion : bool -> unit
    method set_extra_menu : Ocgtk_gio.Gio.Menu_model.menu_model_t option -> unit
    method set_input_hints : Gtk_enums.inputhints -> unit
    method set_input_purpose : Gtk_enums.inputpurpose -> unit
    method set_invisible_char : int -> unit
    method set_max_length : int -> unit
    method set_overwrite_mode : bool -> unit
    method set_placeholder_text : string option -> unit
    method set_propagate_text_width : bool -> unit
    method set_tabs : Ocgtk_pango.Pango.Tab_array.tab_array_t option -> unit
    method set_truncate_multiline : bool -> unit
    method set_visibility : bool -> unit
    method unset_invisible_char : unit -> unit
    method im_module : string
    method set_im_module : string -> unit
    method invisible_char_set : bool
    method set_invisible_char_set : bool -> unit
    method scroll_offset : int
    method as_text : Text.t
end

(* High-level class for Text *)
class text (obj : Text.t) : text_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit Gtext_signals.text_signals obj

  method get_activates_default : unit -> bool =
    fun () ->
      (Text.get_activates_default obj)

  method get_attributes : unit -> Ocgtk_pango.Pango.Attr_list.attr_list_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_pango.Pango.Attr_list.attr_list ret) (Text.get_attributes obj)

  method get_buffer : unit -> GEntry_buffer.entry_buffer_t =
    fun () ->
      new  GEntry_buffer.entry_buffer(Text.get_buffer obj)

  method get_enable_emoji_completion : unit -> bool =
    fun () ->
      (Text.get_enable_emoji_completion obj)

  method get_extra_menu : unit -> Ocgtk_gio.Gio.Menu_model.menu_model_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.Menu_model.menu_model ret) (Text.get_extra_menu obj)

  method get_input_hints : unit -> Gtk_enums.inputhints =
    fun () ->
      (Text.get_input_hints obj)

  method get_input_purpose : unit -> Gtk_enums.inputpurpose =
    fun () ->
      (Text.get_input_purpose obj)

  method get_invisible_char : unit -> int =
    fun () ->
      (Text.get_invisible_char obj)

  method get_max_length : unit -> int =
    fun () ->
      (Text.get_max_length obj)

  method get_overwrite_mode : unit -> bool =
    fun () ->
      (Text.get_overwrite_mode obj)

  method get_placeholder_text : unit -> string option =
    fun () ->
      (Text.get_placeholder_text obj)

  method get_propagate_text_width : unit -> bool =
    fun () ->
      (Text.get_propagate_text_width obj)

  method get_tabs : unit -> Ocgtk_pango.Pango.Tab_array.tab_array_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_pango.Pango.Tab_array.tab_array ret) (Text.get_tabs obj)

  method get_text_length : unit -> int =
    fun () ->
      (Text.get_text_length obj)

  method get_truncate_multiline : unit -> bool =
    fun () ->
      (Text.get_truncate_multiline obj)

  method get_visibility : unit -> bool =
    fun () ->
      (Text.get_visibility obj)

  method grab_focus_without_selecting : unit -> bool =
    fun () ->
      (Text.grab_focus_without_selecting obj)

  method set_activates_default : bool -> unit =
    fun activates ->
      (Text.set_activates_default obj activates)

  method set_attributes : Ocgtk_pango.Pango.Attr_list.attr_list_t option -> unit =
    fun attrs ->
      let attrs = Option.map (fun (c) -> c#as_attr_list) attrs in
      (Text.set_attributes obj attrs)

  method set_buffer : GEntry_buffer.entry_buffer_t -> unit =
    fun buffer ->
      let buffer = buffer#as_entry_buffer in
      (Text.set_buffer obj buffer)

  method set_enable_emoji_completion : bool -> unit =
    fun enable_emoji_completion ->
      (Text.set_enable_emoji_completion obj enable_emoji_completion)

  method set_extra_menu : Ocgtk_gio.Gio.Menu_model.menu_model_t option -> unit =
    fun model ->
      let model = Option.map (fun (c) -> c#as_menu_model) model in
      (Text.set_extra_menu obj model)

  method set_input_hints : Gtk_enums.inputhints -> unit =
    fun hints ->
      (Text.set_input_hints obj hints)

  method set_input_purpose : Gtk_enums.inputpurpose -> unit =
    fun purpose ->
      (Text.set_input_purpose obj purpose)

  method set_invisible_char : int -> unit =
    fun ch ->
      (Text.set_invisible_char obj ch)

  method set_max_length : int -> unit =
    fun length ->
      (Text.set_max_length obj length)

  method set_overwrite_mode : bool -> unit =
    fun overwrite ->
      (Text.set_overwrite_mode obj overwrite)

  method set_placeholder_text : string option -> unit =
    fun text ->
      (Text.set_placeholder_text obj text)

  method set_propagate_text_width : bool -> unit =
    fun propagate_text_width ->
      (Text.set_propagate_text_width obj propagate_text_width)

  method set_tabs : Ocgtk_pango.Pango.Tab_array.tab_array_t option -> unit =
    fun tabs ->
      let tabs = Option.map (fun (c) -> c#as_tab_array) tabs in
      (Text.set_tabs obj tabs)

  method set_truncate_multiline : bool -> unit =
    fun truncate_multiline ->
      (Text.set_truncate_multiline obj truncate_multiline)

  method set_visibility : bool -> unit =
    fun visible ->
      (Text.set_visibility obj visible)

  method unset_invisible_char : unit -> unit =
    fun () ->
      (Text.unset_invisible_char obj)

  method im_module = Text.get_im_module obj
  method set_im_module v =  Text.set_im_module obj v

  method invisible_char_set = Text.get_invisible_char_set obj
  method set_invisible_char_set v =  Text.set_invisible_char_set obj v

  method scroll_offset = Text.get_scroll_offset obj

    method as_text = obj
end

let new_ () : text_t =
  new text (Text.new_ ())

let new_with_buffer (buffer : GEntry_buffer.entry_buffer_t) : text_t =
  let buffer = buffer#as_entry_buffer in
  let obj_ = Text.new_with_buffer buffer in
  new text obj_

