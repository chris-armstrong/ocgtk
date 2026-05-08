(* GENERATED CODE - DO NOT EDIT *)
(* Text: Text *)

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
(** Sets whether the contents of the `GtkText` are visible or not.

    When visibility is set to %FALSE, characters are displayed as the invisible
    char, and will also appear that way when the text in the widget is copied to
    the clipboard.

    By default, GTK picks the best invisible character available in the current
    font, but it can be changed with [method@Gtk.Text.set_invisible_char].

    Note that you probably want to set [property@Gtk.Text:input-purpose] to
    %GTK_INPUT_PURPOSE_PASSWORD or %GTK_INPUT_PURPOSE_PIN to inform input
    methods about the purpose of this self, in addition to setting visibility to
    %FALSE. *)

external set_truncate_multiline : t -> bool -> unit
  = "ml_gtk_text_set_truncate_multiline"
(** Sets whether the `GtkText` should truncate multi-line text that is pasted
    into the widget. *)

external set_tabs : t -> Ocgtk_pango.Pango.Wrappers.Tab_array.t option -> unit
  = "ml_gtk_text_set_tabs"
(** Sets tabstops that are applied to the text. *)

external set_propagate_text_width : t -> bool -> unit
  = "ml_gtk_text_set_propagate_text_width"
(** Sets whether the `GtkText` should grow and shrink with the content. *)

external set_placeholder_text : t -> string option -> unit
  = "ml_gtk_text_set_placeholder_text"
(** Sets text to be displayed in @self when it is empty.

This can be used to give a visual hint of the expected
contents of the `GtkText`. *)

external set_overwrite_mode : t -> bool -> unit
  = "ml_gtk_text_set_overwrite_mode"
(** Sets whether the text is overwritten when typing in the `GtkText`. *)

external set_max_length : t -> int -> unit = "ml_gtk_text_set_max_length"
(** Sets the maximum allowed length of the contents of the widget.

If the current contents are longer than the given length, then
they will be truncated to fit.

This is equivalent to getting @self's `GtkEntryBuffer` and
calling [method@Gtk.EntryBuffer.set_max_length] on it. *)

external set_invisible_char : t -> int -> unit
  = "ml_gtk_text_set_invisible_char"
(** Sets the character to use when in “password mode”.

    By default, GTK picks the best invisible char available in the current font.
    If you set the invisible char to 0, then the user will get no feedback at
    all; there will be no text on the screen as they type. *)

external set_input_purpose : t -> Gtk_enums.inputpurpose -> unit
  = "ml_gtk_text_set_input_purpose"
(** Sets the input purpose of the `GtkText`.

    This can be used by on-screen keyboards and other input methods to adjust
    their behaviour. *)

external set_input_hints : t -> Gtk_enums.inputhints -> unit
  = "ml_gtk_text_set_input_hints"
(** Sets input hints that allow input methods to fine-tune their behaviour. *)

external set_extra_menu :
  t -> Ocgtk_gio.Gio.Wrappers.Menu_model.t option -> unit
  = "ml_gtk_text_set_extra_menu"
(** Sets a menu model to add when constructing
the context menu for @self. *)

external set_enable_emoji_completion : t -> bool -> unit
  = "ml_gtk_text_set_enable_emoji_completion"
(** Sets whether Emoji completion is enabled.

    If it is, typing ':', followed by a recognized keyword, will pop up a window
    with suggested Emojis matching the keyword. *)

external set_buffer : t -> Entry_buffer.t -> unit = "ml_gtk_text_set_buffer"
(** Set the `GtkEntryBuffer` object which holds the text for this widget. *)

external set_attributes :
  t -> Ocgtk_pango.Pango.Wrappers.Attr_list.t option -> unit
  = "ml_gtk_text_set_attributes"
(** Sets attributes that are applied to the text. *)

external set_activates_default : t -> bool -> unit
  = "ml_gtk_text_set_activates_default"
(** If @activates is %TRUE, pressing Enter will activate
the default widget for the window containing @self.

This usually means that the dialog containing the `GtkText`
will be closed, since the default widget is usually one of
the dialog buttons. *)

external grab_focus_without_selecting : t -> bool
  = "ml_gtk_text_grab_focus_without_selecting"
(** Causes @self to have keyboard focus.

It behaves like [method@Gtk.Widget.grab_focus],
except that it doesn't select the contents of @self.
You only want to call this on some special entries
which the user usually doesn't want to replace all text in,
such as search-as-you-type entries. *)

external get_visibility : t -> bool = "ml_gtk_text_get_visibility"
(** Retrieves whether the text in @self is visible. *)

external get_truncate_multiline : t -> bool
  = "ml_gtk_text_get_truncate_multiline"
(** Returns whether the `GtkText` will truncate multi-line text that is pasted
    into the widget *)

external get_text_length : t -> UInt16.t = "ml_gtk_text_get_text_length"
(** Retrieves the current length of the text in @self.

This is equivalent to getting @self's `GtkEntryBuffer`
and calling [method@Gtk.EntryBuffer.get_length] on it. *)

external get_tabs : t -> Ocgtk_pango.Pango.Wrappers.Tab_array.t option
  = "ml_gtk_text_get_tabs"
(** Gets the tabstops that were set on the `GtkText`.

    See [method@Gtk.Text.set_tabs]. *)

external get_propagate_text_width : t -> bool
  = "ml_gtk_text_get_propagate_text_width"
(** Returns whether the `GtkText` will grow and shrink with the content. *)

external get_placeholder_text : t -> string option
  = "ml_gtk_text_get_placeholder_text"
(** Retrieves the text that will be displayed when
@self is empty and unfocused

If no placeholder text has been set, %NULL will be returned. *)

external get_overwrite_mode : t -> bool = "ml_gtk_text_get_overwrite_mode"
(** Gets whether text is overwritten when typing in the `GtkText`.

    See [method@Gtk.Text.set_overwrite_mode]. *)

external get_max_length : t -> int = "ml_gtk_text_get_max_length"
(** Retrieves the maximum allowed length of the text in @self.

See [method@Gtk.Text.set_max_length].

This is equivalent to getting @self's `GtkEntryBuffer` and
calling [method@Gtk.EntryBuffer.get_max_length] on it. *)

external get_invisible_char : t -> int = "ml_gtk_text_get_invisible_char"
(** Retrieves the character displayed when visibility is set to false.

    Note that GTK does not compute this value unless it needs it, so the value
    returned by this function is not very useful unless it has been explicitly
    set with [method@Gtk.Text.set_invisible_char]. *)

external get_input_purpose : t -> Gtk_enums.inputpurpose
  = "ml_gtk_text_get_input_purpose"
(** Gets the input purpose of the `GtkText`. *)

external get_input_hints : t -> Gtk_enums.inputhints
  = "ml_gtk_text_get_input_hints"
(** Gets the input hints of the `GtkText`. *)

external get_extra_menu : t -> Ocgtk_gio.Gio.Wrappers.Menu_model.t option
  = "ml_gtk_text_get_extra_menu"
(** Gets the menu model for extra items in the context menu.

    See [method@Gtk.Text.set_extra_menu]. *)

external get_enable_emoji_completion : t -> bool
  = "ml_gtk_text_get_enable_emoji_completion"
(** Returns whether Emoji completion is enabled for this `GtkText` widget. *)

external get_buffer : t -> Entry_buffer.t = "ml_gtk_text_get_buffer"
(** Get the `GtkEntryBuffer` object which holds the text for this widget. *)

external get_attributes : t -> Ocgtk_pango.Pango.Wrappers.Attr_list.t option
  = "ml_gtk_text_get_attributes"
(** Gets the attribute list that was set on the `GtkText`.

    See [method@Gtk.Text.set_attributes]. *)

external get_activates_default : t -> bool = "ml_gtk_text_get_activates_default"
(** Returns whether pressing Enter will activate
the default widget for the window containing @self.

See [method@Gtk.Text.set_activates_default]. *)

external compute_cursor_extents :
  t ->
  Gsize.t ->
  Ocgtk_graphene.Graphene.Wrappers.Rect.t
  * Ocgtk_graphene.Graphene.Wrappers.Rect.t
  = "ml_gtk_text_compute_cursor_extents"
(** Determine the positions of the strong and weak cursors if the
insertion point in the layout is at @position.

The position of each cursor is stored as a zero-width rectangle.
The strong cursor location is the location where characters of
the directionality equal to the base direction are inserted.
The weak cursor location is the location where characters of
the directionality opposite to the base direction are inserted.

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

let on_activate ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"activate" ~callback
    ~after:(Option.value after ~default:false)

let on_backspace ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"backspace" ~callback
    ~after:(Option.value after ~default:false)

let on_copy_clipboard ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"copy-clipboard" ~callback
    ~after:(Option.value after ~default:false)

let on_cut_clipboard ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"cut-clipboard" ~callback
    ~after:(Option.value after ~default:false)

let on_delete_from_cursor ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let type_ =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gtk_enums.deletetype_of_int (Gobject.Value.get_enum_int v)
        in
        let count =
          let v = Gobject.Closure.nth argv ~pos:2 in
          Gobject.Value.get_int v
        in
        callback ~type_ ~count)
  in
  Gobject.Signal.connect obj ~name:"delete-from-cursor" ~callback:closure
    ~after:(Option.value after ~default:false)

let on_insert_at_cursor ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let string =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_string v
        in
        callback ~string)
  in
  Gobject.Signal.connect obj ~name:"insert-at-cursor" ~callback:closure
    ~after:(Option.value after ~default:false)

let on_insert_emoji ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"insert-emoji" ~callback
    ~after:(Option.value after ~default:false)

let on_move_cursor ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let step =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gtk_enums.movementstep_of_int (Gobject.Value.get_enum_int v)
        in
        let count =
          let v = Gobject.Closure.nth argv ~pos:2 in
          Gobject.Value.get_int v
        in
        let extend =
          let v = Gobject.Closure.nth argv ~pos:3 in
          Gobject.Value.get_boolean v
        in
        callback ~step ~count ~extend)
  in
  Gobject.Signal.connect obj ~name:"move-cursor" ~callback:closure
    ~after:(Option.value after ~default:false)

let on_paste_clipboard ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"paste-clipboard" ~callback
    ~after:(Option.value after ~default:false)

let on_preedit_changed ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let preedit =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_string v
        in
        callback ~preedit)
  in
  Gobject.Signal.connect obj ~name:"preedit-changed" ~callback:closure
    ~after:(Option.value after ~default:false)

let on_toggle_overwrite ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"toggle-overwrite" ~callback
    ~after:(Option.value after ~default:false)
