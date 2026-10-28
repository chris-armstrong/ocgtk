class type text_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_text.accessible_text_t
  inherit Editable.editable_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user hits the <kbd>Enter</kbd> key.

      The default bindings for this signal are all forms of the <kbd>Enter</kbd>
      key. *)

  method on_backspace :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user asks for it.

      This is a keybinding signal.

      The default bindings for this signal are <kbd>Backspace</kbd> and
      <kbd>Shift</kbd>+<kbd>Backspace</kbd>. *)

  method on_copy_clipboard :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to copy the selection to the clipboard.

      This is a keybinding signal.

      The default bindings for this signal are <kbd>Ctrl</kbd>+<kbd>c</kbd> and
      <kbd>Ctrl</kbd>+<kbd>Insert</kbd>. *)

  method on_cut_clipboard :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to cut the selection to the clipboard.

      This is a keybinding signal.

      The default bindings for this signal are <kbd>Ctrl</kbd>+<kbd>x</kbd> and
      <kbd>Shift</kbd>+<kbd>Delete</kbd>. *)

  method on_delete_from_cursor :
    ?after:bool ->
    callback:(type_:Enums.deletetype -> count:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the user initiates a text deletion.

      This is a keybinding signal.

      If the [type] is [Gtk.DeleteType.chars], GTK deletes the selection if
      there is one, otherwise it deletes the requested number of characters.

      The default bindings for this signal are <kbd>Delete</kbd> for deleting a
      character and <kbd>Ctrl</kbd>+<kbd>Delete</kbd> for deleting a word. *)

  method on_insert_at_cursor :
    ?after:bool ->
    callback:(string:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the user initiates the insertion of a fixed string at the
      cursor.

      This is a keybinding signal.

      This signal has no default bindings. *)

  method on_insert_emoji :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to present the Emoji chooser.

      This is a keybinding signal.

      The default bindings for this signal are <kbd>Ctrl</kbd>+<kbd>.</kbd> and
      <kbd>Ctrl</kbd>+<kbd>;</kbd> *)

  method on_move_cursor :
    ?after:bool ->
    callback:(step:Enums.movementstep -> count:int -> extend:bool -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the user initiates a cursor movement.

      If the cursor is not visible in [self], this signal causes the viewport to
      be moved instead.

      This is a keybinding signal.

      Applications should not connect to it, but may emit it with
      [GObject.signal_emit_by_name] if they need to control the cursor
      programmatically.

      The default bindings for this signal come in two variants, the variant
      with the <kbd>Shift</kbd> modifier extends the selection, the variant
      without it does not. There are too many key combinations to list them all
      here.

      - <kbd>←</kbd>, <kbd>→</kbd>, <kbd>↑</kbd>, <kbd>↓</kbd> move by
        individual characters/lines
      - <kbd>Ctrl</kbd>+<kbd>←</kbd>, etc. move by words/paragraphs
      - <kbd>Home</kbd> and <kbd>End</kbd> move to the ends of the buffer *)

  method on_paste_clipboard :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to paste the contents of the clipboard.

      This is a keybinding signal.

      The default bindings for this signal are <kbd>Ctrl</kbd>+<kbd>v</kbd> and
      <kbd>Shift</kbd>+<kbd>Insert</kbd>. *)

  method on_preedit_changed :
    ?after:bool ->
    callback:(preedit:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the preedit text changes.

      If an input method is used, the typed text will not immediately be
      committed to the buffer. So if you are interested in the text, connect to
      this signal. *)

  method on_toggle_overwrite :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to toggle the overwrite mode.

      This is a keybinding signal.

      The default bindings for this signal is <kbd>Insert</kbd>. *)

  method get_activates_default : unit -> bool
  (** Returns whether pressing <kbd>Enter</kbd> will activate the default widget
      for the window containing the widget.

      See [Gtk.Text.set_activates_default]. *)

  method get_attributes : unit -> Ocpango.Attr_list.attr_list_t option
  (** Gets the attribute list that was set on the text widget.

      See [Gtk.Text.set_attributes]. *)

  method get_buffer : unit -> Entry_buffer.entry_buffer_t
  (** Get the entry buffer object which holds the text for this widget. *)

  method get_enable_emoji_completion : unit -> bool
  (** Returns whether Emoji completion is enabled. *)

  method get_extra_menu : unit -> Ocgio.Menu_model.menu_model_t option
  (** Gets the extra menu model of the text widget.

      See [Gtk.Text.set_extra_menu]. *)

  method get_input_hints : unit -> Enums.inputhints
  (** Gets the input hints of the text widget. *)

  method get_input_purpose : unit -> Enums.inputpurpose
  (** Gets the input purpose of the text widget. *)

  method get_invisible_char : unit -> int
  (** Retrieves the character displayed when visibility is set to false.

      Note that GTK does not compute this value unless it needs it, so the value
      returned by this function is not very useful unless it has been explicitly
      set with [Gtk.Text.set_invisible_char]. *)

  method get_max_length : unit -> int
  (** Retrieves the maximum allowed length of the contents.

      See [Gtk.Text.set_max_length].

      This is equivalent to getting [self]'s [GtkEntryBuffer] and calling
      [Gtk.EntryBuffer.get_max_length] on it. *)

  method get_overwrite_mode : unit -> bool
  (** Gets whether text is overwritten when typing.

      See [Gtk.Text.set_overwrite_mode]. *)

  method get_placeholder_text : unit -> string option
  (** Retrieves the text that will be displayed when the text widget is empty
      and unfocused

      See [Gtk.Text.set_placeholder_text]. *)

  method get_propagate_text_width : unit -> bool
  (** Returns whether the text widget will grow and shrink with the content. *)

  method get_tabs : unit -> Ocpango.Tab_array.tab_array_t option
  (** Gets the tab stops for the text widget.

      See [Gtk.Text.set_tabs]. *)

  method get_text_length : unit -> UInt16.t
  (** Retrieves the length of the contents.

      This is equivalent to getting [self]'s [GtkEntryBuffer] and calling
      [Gtk.EntryBuffer.get_length] on it. *)

  method get_truncate_multiline : unit -> bool
  (** Returns whether pasted text will be truncated to the first line. *)

  method get_visibility : unit -> bool
  (** Retrieves whether the text is visible. *)

  method grab_focus_without_selecting : unit -> bool
  (** Causes the text widget to have the keyboard focus.

      It behaves like [Gtk.Widget.grab_focus], except that it does not select
      the contents of [self].

      You only want to call this on some special entries which the user usually
      doesn't want to replace all text in, such as search-as-you-type entries.
  *)

  method set_activates_default : bool -> unit
  (** Sets whether pressing <kbd>Enter</kbd> will activate the default widget.

      This usually means that the dialog containing [self] will be closed, since
      the default widget is usually one of the dialog buttons. *)

  method set_attributes : Ocpango.Attr_list.attr_list_t option -> unit
  (** Apply attributes to the contents of the text widget. *)

  method set_buffer : Entry_buffer.entry_buffer_t -> unit
  (** Set the entry buffer object which holds the text for this widget. *)

  method set_enable_emoji_completion : bool -> unit
  (** Sets whether Emoji completion is enabled.

      If it is, typing ':', followed by a recognized keyword, will pop up a
      window with suggested Emojis matching the keyword. *)

  method set_extra_menu : Ocgio.Menu_model.menu_model_t option -> unit
  (** Sets a menu model to add to the context menu of the text widget. *)

  method set_input_hints : Enums.inputhints -> unit
  (** Sets hints that allow input methods to fine-tune their behaviour. *)

  method set_input_purpose : Enums.inputpurpose -> unit
  (** Sets the input purpose of the text widget.

      The input purpose can be used by on-screen keyboards and other input
      methods to adjust their behaviour. *)

  method set_invisible_char : int -> unit
  (** Sets the character to use when in “password mode”.

      By default, GTK picks the best invisible char available in the current
      font. If you set the invisible char to 0, then the user will get no
      feedback at all; there will be no text on the screen as they type. *)

  method set_max_length : int -> unit
  (** Sets the maximum allowed length of the contents.

      If the current contents are longer than the given length, they will be
      truncated to fit.

      This is equivalent to getting [self]'s [GtkEntryBuffer] and calling
      [Gtk.EntryBuffer.set_max_length] on it. *)

  method set_overwrite_mode : bool -> unit
  (** Sets whether the text is overwritten when typing. *)

  method set_placeholder_text : string option -> unit
  (** Sets the text to be displayed when the text widget is empty and unfocused.

      This can be used to give a visual hint of the expected contents of the
      text widget. *)

  method set_propagate_text_width : bool -> unit
  (** Sets whether the text widget should grow and shrink with the content. *)

  method set_tabs : Ocpango.Tab_array.tab_array_t option -> unit
  (** Sets tab stops for the text widget. *)

  method set_truncate_multiline : bool -> unit
  (** Sets whether pasted text should be truncated to the first line. *)

  method set_visibility : bool -> unit
  (** Sets whether the contents of the text widget are visible or not.

      When visibility is set to false, characters are displayed as the invisible
      char, and it will also appear that way when the text in the widget is
      copied to the clipboard.

      By default, GTK picks the best invisible character available in the
      current font, but it can be changed with [Gtk.Text.set_invisible_char].

      Note that you probably want to set [Gtk.Text:input-purpose] to
      [Gtk.InputPurpose.password] or [Gtk.InputPurpose.pin] to inform input
      methods about the purpose of this widget, in addition to setting
      visibility to false. *)

  method unset_invisible_char : unit -> unit
  (** Unsets the invisible char.

      After calling this, the default invisible char is used again. *)

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
