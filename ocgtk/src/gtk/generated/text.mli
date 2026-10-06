(* GENERATED CODE - DO NOT EDIT *)
(* Text: Text *)

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
    accessibility. *)

type t = [ `text | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_text_new"
(** Create a new Text *)

external new_with_buffer : Entry_buffer.t -> t = "ml_gtk_text_new_with_buffer"
(** Create a new Text *)

(* Methods *)

external unset_invisible_char : t -> unit = "ml_gtk_text_unset_invisible_char"
(** Unsets the invisible char.

    After calling this, the default invisible char is used again. *)

external set_visibility : t -> bool -> unit = "ml_gtk_text_set_visibility"
(** Sets whether the contents of the text widget are visible or not.

    When visibility is set to false, characters are displayed as the invisible
    char, and it will also appear that way when the text in the widget is copied
    to the clipboard.

    By default, GTK picks the best invisible character available in the current
    font, but it can be changed with [Gtk.Text.set_invisible_char].

    Note that you probably want to set [Gtk.Text:input-purpose] to
    [Gtk.InputPurpose.password] or [Gtk.InputPurpose.pin] to inform input
    methods about the purpose of this widget, in addition to setting visibility
    to false. *)

external set_truncate_multiline : t -> bool -> unit
  = "ml_gtk_text_set_truncate_multiline"
(** Sets whether pasted text should be truncated to the first line. *)

external set_tabs : t -> Ocgtk_pango.Pango.Wrappers.Tab_array.t option -> unit
  = "ml_gtk_text_set_tabs"
(** Sets tab stops for the text widget. *)

external set_propagate_text_width : t -> bool -> unit
  = "ml_gtk_text_set_propagate_text_width"
(** Sets whether the text widget should grow and shrink with the content. *)

external set_placeholder_text : t -> string option -> unit
  = "ml_gtk_text_set_placeholder_text"
(** Sets the text to be displayed when the text widget is empty and unfocused.

    This can be used to give a visual hint of the expected contents of the text
    widget. *)

external set_overwrite_mode : t -> bool -> unit
  = "ml_gtk_text_set_overwrite_mode"
(** Sets whether the text is overwritten when typing. *)

external set_max_length : t -> int -> unit = "ml_gtk_text_set_max_length"
(** Sets the maximum allowed length of the contents.

    If the current contents are longer than the given length, they will be
    truncated to fit.

    This is equivalent to getting [self]'s [GtkEntryBuffer] and calling
    [Gtk.EntryBuffer.set_max_length] on it. *)

external set_invisible_char : t -> int -> unit
  = "ml_gtk_text_set_invisible_char"
(** Sets the character to use when in “password mode”.

    By default, GTK picks the best invisible char available in the current font.
    If you set the invisible char to 0, then the user will get no feedback at
    all; there will be no text on the screen as they type. *)

external set_input_purpose : t -> Gtk_enums.inputpurpose -> unit
  = "ml_gtk_text_set_input_purpose"
(** Sets the input purpose of the text widget.

    The input purpose can be used by on-screen keyboards and other input methods
    to adjust their behaviour. *)

external set_input_hints : t -> Gtk_enums.inputhints -> unit
  = "ml_gtk_text_set_input_hints"
(** Sets hints that allow input methods to fine-tune their behaviour. *)

external set_extra_menu :
  t -> Ocgtk_gio.Gio.Wrappers.Menu_model.t option -> unit
  = "ml_gtk_text_set_extra_menu"
(** Sets a menu model to add to the context menu of the text widget. *)

external set_enable_emoji_completion : t -> bool -> unit
  = "ml_gtk_text_set_enable_emoji_completion"
(** Sets whether Emoji completion is enabled.

    If it is, typing ':', followed by a recognized keyword, will pop up a window
    with suggested Emojis matching the keyword. *)

external set_buffer : t -> Entry_buffer.t -> unit = "ml_gtk_text_set_buffer"
(** Set the entry buffer object which holds the text for this widget. *)

external set_attributes :
  t -> Ocgtk_pango.Pango.Wrappers.Attr_list.t option -> unit
  = "ml_gtk_text_set_attributes"
(** Apply attributes to the contents of the text widget. *)

external set_activates_default : t -> bool -> unit
  = "ml_gtk_text_set_activates_default"
(** Sets whether pressing <kbd>Enter</kbd> will activate the default widget.

    This usually means that the dialog containing [self] will be closed, since
    the default widget is usually one of the dialog buttons. *)

external grab_focus_without_selecting : t -> bool
  = "ml_gtk_text_grab_focus_without_selecting"
(** Causes the text widget to have the keyboard focus.

    It behaves like [Gtk.Widget.grab_focus], except that it does not select the
    contents of [self].

    You only want to call this on some special entries which the user usually
    doesn't want to replace all text in, such as search-as-you-type entries. *)

external get_visibility : t -> bool = "ml_gtk_text_get_visibility"
(** Retrieves whether the text is visible. *)

external get_truncate_multiline : t -> bool
  = "ml_gtk_text_get_truncate_multiline"
(** Returns whether pasted text will be truncated to the first line. *)

external get_text_length : t -> UInt16.t = "ml_gtk_text_get_text_length"
(** Retrieves the length of the contents.

    This is equivalent to getting [self]'s [GtkEntryBuffer] and calling
    [Gtk.EntryBuffer.get_length] on it. *)

external get_tabs : t -> Ocgtk_pango.Pango.Wrappers.Tab_array.t option
  = "ml_gtk_text_get_tabs"
(** Gets the tab stops for the text widget.

    See [Gtk.Text.set_tabs]. *)

external get_propagate_text_width : t -> bool
  = "ml_gtk_text_get_propagate_text_width"
(** Returns whether the text widget will grow and shrink with the content. *)

external get_placeholder_text : t -> string option
  = "ml_gtk_text_get_placeholder_text"
(** Retrieves the text that will be displayed when the text widget is empty and
    unfocused

    See [Gtk.Text.set_placeholder_text]. *)

external get_overwrite_mode : t -> bool = "ml_gtk_text_get_overwrite_mode"
(** Gets whether text is overwritten when typing.

    See [Gtk.Text.set_overwrite_mode]. *)

external get_max_length : t -> int = "ml_gtk_text_get_max_length"
(** Retrieves the maximum allowed length of the contents.

    See [Gtk.Text.set_max_length].

    This is equivalent to getting [self]'s [GtkEntryBuffer] and calling
    [Gtk.EntryBuffer.get_max_length] on it. *)

external get_invisible_char : t -> int = "ml_gtk_text_get_invisible_char"
(** Retrieves the character displayed when visibility is set to false.

    Note that GTK does not compute this value unless it needs it, so the value
    returned by this function is not very useful unless it has been explicitly
    set with [Gtk.Text.set_invisible_char]. *)

external get_input_purpose : t -> Gtk_enums.inputpurpose
  = "ml_gtk_text_get_input_purpose"
(** Gets the input purpose of the text widget. *)

external get_input_hints : t -> Gtk_enums.inputhints
  = "ml_gtk_text_get_input_hints"
(** Gets the input hints of the text widget. *)

external get_extra_menu : t -> Ocgtk_gio.Gio.Wrappers.Menu_model.t option
  = "ml_gtk_text_get_extra_menu"
(** Gets the extra menu model of the text widget.

    See [Gtk.Text.set_extra_menu]. *)

external get_enable_emoji_completion : t -> bool
  = "ml_gtk_text_get_enable_emoji_completion"
(** Returns whether Emoji completion is enabled. *)

external get_buffer : t -> Entry_buffer.t = "ml_gtk_text_get_buffer"
(** Get the entry buffer object which holds the text for this widget. *)

external get_attributes : t -> Ocgtk_pango.Pango.Wrappers.Attr_list.t option
  = "ml_gtk_text_get_attributes"
(** Gets the attribute list that was set on the text widget.

    See [Gtk.Text.set_attributes]. *)

external get_activates_default : t -> bool = "ml_gtk_text_get_activates_default"
(** Returns whether pressing <kbd>Enter</kbd> will activate the default widget
    for the window containing the widget.

    See [Gtk.Text.set_activates_default]. *)

external compute_cursor_extents :
  t ->
  Gsize.t ->
  Ocgtk_graphene.Graphene.Wrappers.Rect.t
  * Ocgtk_graphene.Graphene.Wrappers.Rect.t
  = "ml_gtk_text_compute_cursor_extents"
(** Determines the positions of the strong and weak cursors for a given
    character position.

    The position of each cursor is stored as a zero-width rectangle. The strong
    cursor location is the location where characters of the directionality equal
    to the base direction are inserted. The weak cursor location is the location
    where characters of the directionality opposite to the base direction are
    inserted.

    The rectangle positions are in widget coordinates. *)

(* Properties *)

external get_im_module : t -> string = "ml_gtk_text_get_im_module"
(** Get property: im-module *)

external set_im_module : t -> string -> unit = "ml_gtk_text_set_im_module"
(** Set property: im-module *)

external get_invisible_char_set : t -> bool
  = "ml_gtk_text_get_invisible_char_set"
(** Get property: invisible-char-set *)

external set_invisible_char_set : t -> bool -> unit
  = "ml_gtk_text_set_invisible_char_set"
(** Set property: invisible-char-set *)

external get_scroll_offset : t -> int = "ml_gtk_text_get_scroll_offset"
(** Get property: scroll-offset *)

val on_activate :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

val on_backspace :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

val on_copy_clipboard :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

val on_cut_clipboard :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

val on_delete_from_cursor :
  ?after:bool ->
  t ->
  callback:(type_:Gtk_enums.deletetype -> count:int -> unit) ->
  Gobject.Signal.handler_id

val on_insert_at_cursor :
  ?after:bool ->
  t ->
  callback:(string:string -> unit) ->
  Gobject.Signal.handler_id

val on_insert_emoji :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

val on_move_cursor :
  ?after:bool ->
  t ->
  callback:(step:Gtk_enums.movementstep -> count:int -> extend:bool -> unit) ->
  Gobject.Signal.handler_id

val on_paste_clipboard :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

val on_preedit_changed :
  ?after:bool ->
  t ->
  callback:(preedit:string -> unit) ->
  Gobject.Signal.handler_id

val on_toggle_overwrite :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
