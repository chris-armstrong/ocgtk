(** A single-line text entry.

    [GtkText] is the common implementation of single-line text editing that is
    shared between [Gtk.Entry], [Gtk.PasswordEntry], [Gtk.SpinButton], and other
    widgets. In all of these, a [GtkText] instance is used as the delegate for
    the [Gtk.Editable] implementation.

    A large number of key bindings s supported by default. If the entered text
    is longer than the allocation of the widget, the widget will scroll so that
    the cursor position is visible.

    When using an entry for passwords and other sensitive information, it can be
    put into “password mode” using [Gtk.Text.set_visibility]. In this mode,
    entered text is displayed using an “invisible” character. By default, GTK
    picks the best invisible character that is available in the current font,
    but it can be changed with [Gtk.Text.set_invisible_char].

    If you want to add icons or progress display in an entry, look at
    [Gtk.Entry]. There are other alternatives for more specialized use cases,
    such as [Gtk.SearchEntry].

    If you need multi-line editable text, use [Gtk.TextView].

    {b Shortcuts and Gestures}

    [GtkText] supports the following keyboard shortcuts:

    - <kbd>Shift</kbd>+<kbd>F10</kbd> or <kbd>Menu</kbd> opens the context menu.
    - <kbd>Ctrl</kbd>+<kbd>A</kbd> or <kbd>Ctrl</kbd>+<kbd>&sol;</kbd> selects
      all the text.
    - <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>A</kbd> or
      <kbd>Ctrl</kbd>+<kbd>&bsol;</kbd> unselects all.
    - <kbd>Ctrl</kbd>+<kbd>Z</kbd> undoes the last modification.
    - <kbd>Ctrl</kbd>+<kbd>Y</kbd> or
      <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>Z</kbd> redoes the last undone
      modification.
    - <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>T</kbd> toggles the text direction.
    - <kbd>Clear</kbd> clears the content.

    Additionally, the following signals have default keybindings:

    - [Gtk.Text::activate]
    - [Gtk.Text::backspace]
    - [Gtk.Text::copy-clipboard]
    - [Gtk.Text::cut-clipboard]
    - [Gtk.Text::delete-from-cursor]
    - [Gtk.Text::insert-emoji]
    - [Gtk.Text::move-cursor]
    - [Gtk.Text::paste-clipboard]
    - [Gtk.Text::toggle-overwrite]

    {b Actions}

    [GtkText] defines a set of built-in actions:

    - [clipboard.copy] copies the contents to the clipboard.
    - [clipboard.cut] copies the contents to the clipboard and deletes it from
      the widget.
    - [clipboard.paste] inserts the contents of the clipboard into the widget.
    - [menu.popup] opens the context menu.
    - [misc.insert-emoji] opens the Emoji chooser.
    - [misc.toggle-visibility] toggles the [GtkText]:visibility property.
    - [misc.toggle-direction] toggles the text direction.
    - [selection.delete] deletes the current selection.
    - [selection.select-all] selects all of the widgets content.
    - [text.redo] redoes the last change to the contents.
    - [text.undo] undoes the last change to the contents.
    - [text.clear] removes all content.

    {b CSS nodes}

    {[
    text[.read-only]
    ├── placeholder
    ├── undershoot.left
    ├── undershoot.right
    ├── [selection]
    ├── [cursor-handle[.top]
    ├── [cursor-handle.bottom]
    ├── [block-cursor]
    ├── [cursor-handle[.top/.bottom][.insertion-cursor]]
    ╰── [window.popup]
    ]}

    [GtkText] has a main node with the name [text]. Depending on the properties
    of the widget, the [.read-only] style class may appear.

    When the entry has a selection, it adds a subnode with the name [selection].

    When the entry is in overwrite mode, it adds a subnode with the name
    [block-cursor] that determines how the block cursor is drawn.

    The CSS node for a context menu is added as a subnode with the name [popup].

    The [undershoot] nodes are used to draw the underflow indication when
    content is scrolled out of view. These nodes get the [.left] or [.right]
    style class added depending on where the indication is drawn.

    When touch is used and touch selection handles are shown, they are using CSS
    nodes with name [cursor-handle]. They get the [.top] or [.bottom] style
    class depending on where they are shown in relation to the selection. If
    there is just a single handle for the text cursor, it gets the style class
    [.insertion-cursor].

    {b Accessibility}

    [GtkText] uses the [Gtk.AccessibleRole.none] role, which causes it to be
    skipped for accessibility. This is because [GtkText] is expected to be used
    as a delegate for a [GtkEditable] implementation that will be represented to
    accessibility.

    Its methods, signals and properties are on {!class-type-text_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Text}. *)

(** The methods, signals and properties of a [GtkText]. *)
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

class text : Raw.Text.t -> text_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Text.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkText], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : unit -> text_t
(** Creates a new [GtkText]. *)

val new_with_buffer : Entry_buffer.entry_buffer_t -> text_t
(** Creates a new [GtkText] with the specified buffer. *)
