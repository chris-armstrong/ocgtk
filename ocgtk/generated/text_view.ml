class type text_view_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_text.accessible_text_t
  inherit Scrollable.scrollable_t

  method on_backspace :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Gets emitted when the user asks for it.

      The ::backspace signal is a keybinding signal.

      The default bindings for this signal are <kbd>Backspace</kbd> and
      <kbd>Shift</kbd>+<kbd>Backspace</kbd>. *)

  method on_copy_clipboard :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Gets emitted to copy the selection to the clipboard.

      The ::copy-clipboard signal is a keybinding signal.

      The default bindings for this signal are <kbd>Ctrl</kbd>+<kbd>c</kbd> and
      <kbd>Ctrl</kbd>+<kbd>Insert</kbd>. *)

  method on_cut_clipboard :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Gets emitted to cut the selection to the clipboard.

      The ::cut-clipboard signal is a keybinding signal.

      The default bindings for this signal are <kbd>Ctrl</kbd>+<kbd>x</kbd> and
      <kbd>Shift</kbd>+<kbd>Delete</kbd>. *)

  method on_delete_from_cursor :
    ?after:bool ->
    callback:(type_:Enums.deletetype -> count:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Gets emitted when the user initiates a text deletion.

      The ::delete-from-cursor signal is a keybinding signal.

      If the [type] is [GTK_DELETE_CHARS], GTK deletes the selection if there is
      one, otherwise it deletes the requested number of characters.

      The default bindings for this signal are <kbd>Delete</kbd> for deleting a
      character, <kbd>Ctrl</kbd>+<kbd>Delete</kbd> for deleting a word and
      <kbd>Ctrl</kbd>+<kbd>Backspace</kbd> for deleting a word backwards. *)

  method on_insert_at_cursor :
    ?after:bool ->
    callback:(string:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Gets emitted when the user initiates the insertion of a fixed string at
      the cursor.

      The ::insert-at-cursor signal is a keybinding signal.

      This signal has no default bindings. *)

  method on_insert_emoji :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Gets emitted to present the Emoji chooser for the [text_view].

      The ::insert-emoji signal is a keybinding signal.

      The default bindings for this signal are <kbd>Ctrl</kbd>+<kbd>.</kbd> and
      <kbd>Ctrl</kbd>+<kbd>;</kbd> *)

  method on_move_cursor :
    ?after:bool ->
    callback:
      (step:Enums.movementstep -> count:int -> extend_selection:bool -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Gets emitted when the user initiates a cursor movement.

      The ::move-cursor signal is a keybinding signal. If the cursor is not
      visible in [text_view], this signal causes the viewport to be moved
      instead.

      Applications should not connect to it, but may emit it with
      g_signal_emit_by_name() if they need to control the cursor
      programmatically.

      The default bindings for this signal come in two variants, the variant
      with the <kbd>Shift</kbd> modifier extends the selection, the variant
      without it does not. There are too many key combinations to list them all
      here.

      - <kbd>←</kbd>, <kbd>→</kbd>, <kbd>↑</kbd>, <kbd>↓</kbd> move by
        individual characters/lines
      - <kbd>Ctrl</kbd>+<kbd>←</kbd>, etc. move by words/paragraphs
      - <kbd>Home</kbd> and <kbd>End</kbd> move to the ends of the buffer
      - <kbd>PgUp</kbd> and <kbd>PgDn</kbd> move vertically by pages
      - <kbd>Ctrl</kbd>+<kbd>PgUp</kbd> and <kbd>Ctrl</kbd>+<kbd>PgDn</kbd> move
        horizontally by pages *)

  method on_move_viewport :
    ?after:bool ->
    callback:(step:Enums.scrollstep -> count:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Gets emitted to move the viewport.

      The ::move-viewport signal is a keybinding signal, which can be bound to
      key combinations to allow the user to move the viewport, i.e. change what
      part of the text view is visible in a containing scrolled window.

      There are no default bindings for this signal. *)

  method on_paste_clipboard :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Gets emitted to paste the contents of the clipboard into the text view.

      The ::paste-clipboard signal is a keybinding signal.

      The default bindings for this signal are <kbd>Ctrl</kbd>+<kbd>v</kbd> and
      <kbd>Shift</kbd>+<kbd>Insert</kbd>. *)

  method on_preedit_changed :
    ?after:bool ->
    callback:(preedit:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when preedit text of the active IM changes.

      If an input method is used, the typed text will not immediately be
      committed to the buffer. So if you are interested in the text, connect to
      this signal.

      This signal is only emitted if the text at the given position is actually
      editable. *)

  method on_select_all :
    ?after:bool ->
    callback:(select:bool -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Gets emitted to select or unselect the complete contents of the text view.

      The ::select-all signal is a keybinding signal.

      The default bindings for this signal are <kbd>Ctrl</kbd>+<kbd>a</kbd> and
      <kbd>Ctrl</kbd>+<kbd>/</kbd> for selecting and
      <kbd>Shift</kbd>+<kbd>Ctrl</kbd>+<kbd>a</kbd> and
      <kbd>Ctrl</kbd>+<kbd></kbd> for unselecting. *)

  method on_set_anchor :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  [@@ocaml.doc
    "Gets emitted when the user initiates settings the \"anchor\" mark.\n\n\
     The ::set-anchor signal is a keybinding signal\n\
     which gets emitted when the user initiates setting the \"anchor\"\n\
     mark. The \"anchor\" mark gets placed at the same position as the\n\
     \"insert\" mark.\n\n\
     This signal has no default bindings."]

  method on_toggle_cursor_visible :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Gets emitted to toggle the [cursor-visible] property.

      The ::toggle-cursor-visible signal is a keybinding signal.

      The default binding for this signal is <kbd>F7</kbd>. *)

  method on_toggle_overwrite :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Gets emitted to toggle the overwrite mode of the text view.

      The ::toggle-overwrite signal is a keybinding signal.

      The default binding for this signal is <kbd>Insert</kbd>. *)

  method add_child_at_anchor :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Text_child_anchor.text_child_anchor_t ->
    unit
  (** Adds a child widget in the text buffer, at the given [anchor]. *)

  method add_overlay :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int ->
    int ->
    unit
  (** Adds [child] at a fixed coordinate in the [GtkTextView]'s text window.

      The [xpos] and [ypos] must be in buffer coordinates (see
      [Gtk.TextView.get_iter_location] to convert to buffer coordinates).

      [child] will scroll with the text view.

      If instead you want a widget that will not move with the [GtkTextView]
      contents see [GtkOverlay]. *)

  method backward_display_line : Raw.Text_iter.t -> bool
  (** Moves the given [iter] backward by one display (wrapped) line.

      A display line is different from a paragraph. Paragraphs are separated by
      newlines or other paragraph separator characters. Display lines are
      created by line-wrapping a paragraph. If wrapping is turned off, display
      lines and paragraphs will be the same. Display lines are divided
      differently for each view, since they depend on the view’s width;
      paragraphs are the same in all views, since they depend on the contents of
      the [GtkTextBuffer]. *)

  method backward_display_line_start : Raw.Text_iter.t -> bool
  (** Moves the given [iter] backward to the next display line start.

      A display line is different from a paragraph. Paragraphs are separated by
      newlines or other paragraph separator characters. Display lines are
      created by line-wrapping a paragraph. If wrapping is turned off, display
      lines and paragraphs will be the same. Display lines are divided
      differently for each view, since they depend on the view’s width;
      paragraphs are the same in all views, since they depend on the contents of
      the [GtkTextBuffer]. *)

  method forward_display_line : Raw.Text_iter.t -> bool
  (** Moves the given [iter] forward by one display (wrapped) line.

      A display line is different from a paragraph. Paragraphs are separated by
      newlines or other paragraph separator characters. Display lines are
      created by line-wrapping a paragraph. If wrapping is turned off, display
      lines and paragraphs will be the same. Display lines are divided
      differently for each view, since they depend on the view’s width;
      paragraphs are the same in all views, since they depend on the contents of
      the [GtkTextBuffer]. *)

  method forward_display_line_end : Raw.Text_iter.t -> bool
  (** Moves the given [iter] forward to the next display line end.

      A display line is different from a paragraph. Paragraphs are separated by
      newlines or other paragraph separator characters. Display lines are
      created by line-wrapping a paragraph. If wrapping is turned off, display
      lines and paragraphs will be the same. Display lines are divided
      differently for each view, since they depend on the view’s width;
      paragraphs are the same in all views, since they depend on the contents of
      the [GtkTextBuffer]. *)

  method get_accepts_tab : unit -> bool
  (** Returns whether pressing the <kbd>Tab</kbd> key inserts a tab characters.

      See [Gtk.TextView.set_accepts_tab]. *)

  method get_bottom_margin : unit -> int
  (** Gets the bottom margin for text in the [text_view]. *)

  method get_buffer :
    unit -> Text_buffer_and__text_iter_and__text_mark.text_buffer_t
  (** Returns the [GtkTextBuffer] being displayed by this text view.

      The reference count on the buffer is not incremented; the caller of this
      function won’t own a new reference. *)

  method get_cursor_visible : unit -> bool
  (** Find out whether the cursor should be displayed. *)

  method get_editable : unit -> bool
  (** Returns the default editability of the [GtkTextView].

      Tags in the buffer may override this setting for some ranges of text. *)

  method get_extra_menu : unit -> Ocgio.Menu_model.menu_model_t
  (** Gets the menu model that gets added to the context menu or [NULL] if none
      has been set. *)

  method get_gutter :
    Enums.textwindowtype ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets a [GtkWidget] that has previously been set as gutter.

      See [Gtk.TextView.set_gutter].

      [win] must be one of [GTK_TEXT_WINDOW_LEFT], [GTK_TEXT_WINDOW_RIGHT],
      [GTK_TEXT_WINDOW_TOP], or [GTK_TEXT_WINDOW_BOTTOM]. *)

  method get_indent : unit -> int
  (** Gets the default indentation of paragraphs in [text_view].

      Tags in the view’s buffer may override the default. The indentation may be
      negative. *)

  method get_input_hints : unit -> Enums.inputhints
  (** Gets the [input-hints] of the [GtkTextView]. *)

  method get_input_purpose : unit -> Enums.inputpurpose
  (** Gets the [input-purpose] of the [GtkTextView]. *)

  method get_justification : unit -> Enums.justification
  (** Gets the default justification of paragraphs in [text_view].

      Tags in the buffer may override the default. *)

  method get_left_margin : unit -> int
  (** Gets the default left margin size of paragraphs in the [text_view].

      Tags in the buffer may override the default. *)

  method get_ltr_context : unit -> Ocpango.Context.context_t
  (** Gets the [PangoContext] that is used for rendering LTR directed text
      layouts.

      The context may be replaced when CSS changes occur. *)

  method get_monospace : unit -> bool
  (** Gets whether the [GtkTextView] uses monospace styling. *)

  method get_overwrite : unit -> bool
  (** Returns whether the [GtkTextView] is in overwrite mode or not. *)

  method get_pixels_above_lines : unit -> int
  (** Gets the default number of pixels to put above paragraphs.

      Adding this function with [Gtk.TextView.get_pixels_below_lines] is equal
      to the line space between each paragraph. *)

  method get_pixels_below_lines : unit -> int
  (** Gets the default number of pixels to put below paragraphs.

      The line space is the sum of the value returned by this function and the
      value returned by [Gtk.TextView.get_pixels_above_lines]. *)

  method get_pixels_inside_wrap : unit -> int
  (** Gets the default number of pixels to put between wrapped lines inside a
      paragraph. *)

  method get_right_margin : unit -> int
  (** Gets the default right margin for text in [text_view].

      Tags in the buffer may override the default. *)

  method get_rtl_context : unit -> Ocpango.Context.context_t
  (** Gets the [PangoContext] that is used for rendering RTL directed text
      layouts.

      The context may be replaced when CSS changes occur. *)

  method get_tabs : unit -> Ocpango.Tab_array.tab_array_t option
  (** Gets the default tabs for [text_view].

      Tags in the buffer may override the defaults. The returned array will be
      [NULL] if “standard” (8-space) tabs are used. Free the return value with
      [Pango.TabArray.free]. *)

  method get_top_margin : unit -> int
  (** Gets the top margin for text in the [text_view]. *)

  method get_wrap_mode : unit -> Enums.wrapmode
  (** Gets the line wrapping for the view. *)

  method im_context_filter_keypress : Ocgdk.Event.event_t -> bool
  (** Allow the [GtkTextView] input method to internally handle key press and
      release events.

      If this function returns [TRUE], then no further processing should be done
      for this key event. See [Gtk.IMContext.filter_keypress].

      Note that you are expected to call this function from your handler when
      overriding key event handling. This is needed in the case when you need to
      insert your own key handling between the input method and the default key
      event handling of the [GtkTextView].

      {[
      static gboolean
      gtk_foo_bar_key_press_event (GtkWidget *widget,
                                   GdkEvent  *event)
      {
        guint keyval;

        gdk_event_get_keyval ((GdkEvent*\)event, &keyval);

        if (keyval == GDK_KEY_Return || keyval == GDK_KEY_KP_Enter)
          {
            if (gtk_text_view_im_context_filter_keypress (GTK_TEXT_VIEW (widget), event))
              return TRUE;
          }

        // Do some stuff

        return GTK_WIDGET_CLASS (gtk_foo_bar_parent_class)->key_press_event (widget, event);
      }
      ]} *)

  method move_mark_onscreen :
    Text_buffer_and__text_iter_and__text_mark.text_mark_t -> bool
  (** Moves a mark within the buffer so that it's located within the
      currently-visible text area. *)

  method move_overlay :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int ->
    int ->
    unit
  (** Updates the position of a child.

      See [Gtk.TextView.add_overlay]. *)

  method move_visually : Raw.Text_iter.t -> int -> bool
  (** Move the iterator a given number of characters visually, treating it as
      the strong cursor position.

      If [count] is positive, then the new strong cursor position will be
      [count] positions to the right of the old cursor position. If [count] is
      negative then the new strong cursor position will be [count] positions to
      the left of the old cursor position.

      In the presence of bi-directional text, the correspondence between logical
      and visual order will depend on the direction of the current run, and
      there may be jumps when the cursor is moved off of the end of a run. *)

  method place_cursor_onscreen : unit -> bool
  (** Moves the cursor to the currently visible region of the buffer. *)

  method remove :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Removes a child widget from [text_view]. *)

  method reset_cursor_blink : unit -> unit
  (** Ensures that the cursor is shown.

      This also resets the time that it will stay blinking (or visible, in case
      blinking is disabled).

      This function should be called in response to user input (e.g. from
      derived classes that override the textview's event handlers). *)

  method reset_im_context : unit -> unit
  (** Reset the input method context of the text view if needed.

      This can be necessary in the case where modifying the buffer would confuse
      on-going input method behavior. *)

  method scroll_mark_onscreen :
    Text_buffer_and__text_iter_and__text_mark.text_mark_t -> unit
  (** Scrolls [text_view] the minimum distance such that [mark] is contained
      within the visible area of the widget. *)

  method scroll_to_iter :
    Raw.Text_iter.t -> float -> bool -> float -> float -> bool
  (** Scrolls [text_view] so that [iter] is on the screen in the position
      indicated by [xalign] and [yalign].

      An alignment of 0.0 indicates left or top, 1.0 indicates right or bottom,
      0.5 means center. If [use_align] is [FALSE], the text scrolls the minimal
      distance to get the mark onscreen, possibly not scrolling at all. The
      effective screen for purposes of this function is reduced by a margin of
      size [within_margin].

      Note that this function uses the currently-computed height of the lines in
      the text buffer. Line heights are computed in an idle handler; so this
      function may not have the desired effect if it’s called before the height
      computations. To avoid oddness, consider using
      [Gtk.TextView.scroll_to_mark] which saves a point to be scrolled to after
      line validation. *)

  method scroll_to_mark :
    Text_buffer_and__text_iter_and__text_mark.text_mark_t ->
    float ->
    bool ->
    float ->
    float ->
    unit
  (** Scrolls [text_view] so that [mark] is on the screen in the position
      indicated by [xalign] and [yalign].

      An alignment of 0.0 indicates left or top, 1.0 indicates right or bottom,
      0.5 means center. If [use_align] is [FALSE], the text scrolls the minimal
      distance to get the mark onscreen, possibly not scrolling at all. The
      effective screen for purposes of this function is reduced by a margin of
      size [within_margin]. *)

  method set_accepts_tab : bool -> unit
  (** Sets the behavior of the text widget when the <kbd>Tab</kbd> key is
      pressed.

      If [accepts_tab] is [TRUE], a tab character is inserted. If [accepts_tab]
      is [FALSE] the keyboard focus is moved to the next widget in the focus
      chain.

      Focus can always be moved using <kbd>Ctrl</kbd>+<kbd>Tab</kbd>. *)

  method set_bottom_margin : int -> unit
  (** Sets the bottom margin for text in [text_view].

      Note that this function is confusingly named. In CSS terms, the value set
      here is padding. *)

  method set_buffer :
    Text_buffer_and__text_iter_and__text_mark.text_buffer_t option -> unit
  (** Sets [buffer] as the buffer being displayed by [text_view].

      The previous buffer displayed by the text view is unreferenced, and a
      reference is added to [buffer]. If you owned a reference to [buffer]
      before passing it to this function, you must remove that reference
      yourself; [GtkTextView] will not “adopt” it. *)

  method set_cursor_visible : bool -> unit
  (** Toggles whether the insertion point should be displayed.

      A buffer with no editable text probably shouldn’t have a visible cursor,
      so you may want to turn the cursor off.

      Note that this property may be overridden by the
      [Gtk.Settings:gtk-keynav-use-caret] setting. *)

  method set_editable : bool -> unit
  (** Sets the default editability of the [GtkTextView].

      You can override this default setting with tags in the buffer, using the
      “editable” attribute of tags. *)

  method set_extra_menu : Ocgio.Menu_model.menu_model_t option -> unit
  (** Sets a menu model to add when constructing the context menu for
      [text_view].

      You can pass [NULL] to remove a previously set extra menu. *)

  method set_gutter :
    Enums.textwindowtype ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Places [widget] into the gutter specified by [win].

      [win] must be one of [GTK_TEXT_WINDOW_LEFT], [GTK_TEXT_WINDOW_RIGHT],
      [GTK_TEXT_WINDOW_TOP], or [GTK_TEXT_WINDOW_BOTTOM]. *)

  method set_indent : int -> unit
  (** Sets the default indentation for paragraphs in [text_view].

      Tags in the buffer may override the default. *)

  method set_input_hints : Enums.inputhints -> unit
  (** Sets the [input-hints] of the [GtkTextView].

      The [input-hints] allow input methods to fine-tune their behaviour. *)

  method set_input_purpose : Enums.inputpurpose -> unit
  (** Sets the [input-purpose] of the [GtkTextView].

      The [input-purpose] can be used by on-screen keyboards and other input
      methods to adjust their behaviour. *)

  method set_justification : Enums.justification -> unit
  (** Sets the default justification of text in [text_view].

      Tags in the view’s buffer may override the default. *)

  method set_left_margin : int -> unit
  (** Sets the default left margin for text in [text_view].

      Tags in the buffer may override the default.

      Note that this function is confusingly named. In CSS terms, the value set
      here is padding. *)

  method set_monospace : bool -> unit
  (** Sets whether the [GtkTextView] should display text in monospace styling.
  *)

  method set_overwrite : bool -> unit
  (** Changes the [GtkTextView] overwrite mode. *)

  method set_pixels_above_lines : int -> unit
  (** Sets the default number of blank pixels above paragraphs in [text_view].

      Tags in the buffer for [text_view] may override the defaults. *)

  method set_pixels_below_lines : int -> unit
  (** Sets the default number of pixels of blank space to put below paragraphs
      in [text_view].

      May be overridden by tags applied to [text_view]’s buffer. *)

  method set_pixels_inside_wrap : int -> unit
  (** Sets the default number of pixels of blank space to leave between
      display/wrapped lines within a paragraph.

      May be overridden by tags in [text_view]’s buffer. *)

  method set_right_margin : int -> unit
  (** Sets the default right margin for text in the text view.

      Tags in the buffer may override the default.

      Note that this function is confusingly named. In CSS terms, the value set
      here is padding. *)

  method set_tabs : Ocpango.Tab_array.tab_array_t -> unit
  (** Sets the default tab stops for paragraphs in [text_view].

      Tags in the buffer may override the default. *)

  method set_top_margin : int -> unit
  (** Sets the top margin for text in [text_view].

      Note that this function is confusingly named. In CSS terms, the value set
      here is padding. *)

  method set_wrap_mode : Enums.wrapmode -> unit
  (** Sets the line wrapping for the view. *)

  method starts_display_line : Raw.Text_iter.t -> bool
  (** Determines whether [iter] is at the start of a display line.

      See [Gtk.TextView.forward_display_line] for an explanation of display
      lines vs. paragraphs. *)

  method im_module : string
  (** Which IM (input method) module should be used for this text_view.

      See [Gtk.IMMulticontext].

      Setting this to a non-[NULL] value overrides the system-wide IM module
      setting. See the GtkSettings [Gtk.Settings:gtk-im-module] property. *)

  method set_im_module : string -> unit
  (** Which IM (input method) module should be used for this text_view.

      See [Gtk.IMMulticontext].

      Setting this to a non-[NULL] value overrides the system-wide IM module
      setting. See the GtkSettings [Gtk.Settings:gtk-im-module] property. *)

  method as_text_view : Raw.Text_view.t
end

(* High-level class for TextView *)
class text_view (obj : Raw.Text_view.t) : text_view_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit
      Accessible_text.accessible_text (Raw.Accessible_text.from_gobject obj)

    inherit Scrollable.scrollable (Raw.Scrollable.from_gobject obj)

    method on_backspace ?(after = false) ~callback () =
      Raw.Text_view.on_backspace ~after self#as_text_view ~callback

    method on_copy_clipboard ?(after = false) ~callback () =
      Raw.Text_view.on_copy_clipboard ~after self#as_text_view ~callback

    method on_cut_clipboard ?(after = false) ~callback () =
      Raw.Text_view.on_cut_clipboard ~after self#as_text_view ~callback

    method on_delete_from_cursor ?(after = false) ~callback () =
      Raw.Text_view.on_delete_from_cursor ~after self#as_text_view ~callback

    method on_insert_at_cursor ?(after = false) ~callback () =
      Raw.Text_view.on_insert_at_cursor ~after self#as_text_view ~callback

    method on_insert_emoji ?(after = false) ~callback () =
      Raw.Text_view.on_insert_emoji ~after self#as_text_view ~callback

    method on_move_cursor ?(after = false) ~callback () =
      Raw.Text_view.on_move_cursor ~after self#as_text_view ~callback

    method on_move_viewport ?(after = false) ~callback () =
      Raw.Text_view.on_move_viewport ~after self#as_text_view ~callback

    method on_paste_clipboard ?(after = false) ~callback () =
      Raw.Text_view.on_paste_clipboard ~after self#as_text_view ~callback

    method on_preedit_changed ?(after = false) ~callback () =
      Raw.Text_view.on_preedit_changed ~after self#as_text_view ~callback

    method on_select_all ?(after = false) ~callback () =
      Raw.Text_view.on_select_all ~after self#as_text_view ~callback

    method on_set_anchor ?(after = false) ~callback () =
      Raw.Text_view.on_set_anchor ~after self#as_text_view ~callback

    method on_toggle_cursor_visible ?(after = false) ~callback () =
      Raw.Text_view.on_toggle_cursor_visible ~after self#as_text_view ~callback

    method on_toggle_overwrite ?(after = false) ~callback () =
      Raw.Text_view.on_toggle_overwrite ~after self#as_text_view ~callback

    method add_child_at_anchor :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Text_child_anchor.text_child_anchor_t ->
        unit =
      fun child anchor ->
        let child = child#as_widget in
        let anchor = anchor#as_text_child_anchor in
        Raw.Text_view.add_child_at_anchor obj child anchor

    method add_overlay :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        int ->
        int ->
        unit =
      fun child xpos ypos ->
        let child = child#as_widget in
        Raw.Text_view.add_overlay obj child xpos ypos

    method backward_display_line : Raw.Text_iter.t -> bool =
      fun iter -> Raw.Text_view.backward_display_line obj iter

    method backward_display_line_start : Raw.Text_iter.t -> bool =
      fun iter -> Raw.Text_view.backward_display_line_start obj iter

    method forward_display_line : Raw.Text_iter.t -> bool =
      fun iter -> Raw.Text_view.forward_display_line obj iter

    method forward_display_line_end : Raw.Text_iter.t -> bool =
      fun iter -> Raw.Text_view.forward_display_line_end obj iter

    method get_accepts_tab : unit -> bool =
      fun () -> Raw.Text_view.get_accepts_tab obj

    method get_bottom_margin : unit -> int =
      fun () -> Raw.Text_view.get_bottom_margin obj

    method get_buffer :
        unit -> Text_buffer_and__text_iter_and__text_mark.text_buffer_t =
      fun () ->
        new Text_buffer_and__text_iter_and__text_mark.text_buffer
          (Raw.Text_view.get_buffer obj)

    method get_cursor_visible : unit -> bool =
      fun () -> Raw.Text_view.get_cursor_visible obj

    method get_editable : unit -> bool =
      fun () -> Raw.Text_view.get_editable obj

    method get_extra_menu : unit -> Ocgio.Menu_model.menu_model_t =
      fun () ->
        new Ocgio.Menu_model.menu_model (Raw.Text_view.get_extra_menu obj)

    method get_gutter :
        Enums.textwindowtype ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun win ->
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
          (Raw.Text_view.get_gutter obj win)

    method get_indent : unit -> int = fun () -> Raw.Text_view.get_indent obj

    method get_input_hints : unit -> Enums.inputhints =
      fun () -> Raw.Text_view.get_input_hints obj

    method get_input_purpose : unit -> Enums.inputpurpose =
      fun () -> Raw.Text_view.get_input_purpose obj

    method get_justification : unit -> Enums.justification =
      fun () -> Raw.Text_view.get_justification obj

    method get_left_margin : unit -> int =
      fun () -> Raw.Text_view.get_left_margin obj

    method get_ltr_context : unit -> Ocpango.Context.context_t =
      fun () -> new Ocpango.Context.context (Raw.Text_view.get_ltr_context obj)

    method get_monospace : unit -> bool =
      fun () -> Raw.Text_view.get_monospace obj

    method get_overwrite : unit -> bool =
      fun () -> Raw.Text_view.get_overwrite obj

    method get_pixels_above_lines : unit -> int =
      fun () -> Raw.Text_view.get_pixels_above_lines obj

    method get_pixels_below_lines : unit -> int =
      fun () -> Raw.Text_view.get_pixels_below_lines obj

    method get_pixels_inside_wrap : unit -> int =
      fun () -> Raw.Text_view.get_pixels_inside_wrap obj

    method get_right_margin : unit -> int =
      fun () -> Raw.Text_view.get_right_margin obj

    method get_rtl_context : unit -> Ocpango.Context.context_t =
      fun () -> new Ocpango.Context.context (Raw.Text_view.get_rtl_context obj)

    method get_tabs : unit -> Ocpango.Tab_array.tab_array_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocpango.Tab_array.tab_array ret)
          (Raw.Text_view.get_tabs obj)

    method get_top_margin : unit -> int =
      fun () -> Raw.Text_view.get_top_margin obj

    method get_wrap_mode : unit -> Enums.wrapmode =
      fun () -> Raw.Text_view.get_wrap_mode obj

    method im_context_filter_keypress : Ocgdk.Event.event_t -> bool =
      fun event ->
        let event = event#as_event in
        Raw.Text_view.im_context_filter_keypress obj event

    method move_mark_onscreen :
        Text_buffer_and__text_iter_and__text_mark.text_mark_t -> bool =
      fun mark ->
        let mark = mark#as_text_mark in
        Raw.Text_view.move_mark_onscreen obj mark

    method move_overlay :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        int ->
        int ->
        unit =
      fun child xpos ypos ->
        let child = child#as_widget in
        Raw.Text_view.move_overlay obj child xpos ypos

    method move_visually : Raw.Text_iter.t -> int -> bool =
      fun iter count -> Raw.Text_view.move_visually obj iter count

    method place_cursor_onscreen : unit -> bool =
      fun () -> Raw.Text_view.place_cursor_onscreen obj

    method remove :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Raw.Text_view.remove obj child

    method reset_cursor_blink : unit -> unit =
      fun () -> Raw.Text_view.reset_cursor_blink obj

    method reset_im_context : unit -> unit =
      fun () -> Raw.Text_view.reset_im_context obj

    method scroll_mark_onscreen :
        Text_buffer_and__text_iter_and__text_mark.text_mark_t -> unit =
      fun mark ->
        let mark = mark#as_text_mark in
        Raw.Text_view.scroll_mark_onscreen obj mark

    method scroll_to_iter :
        Raw.Text_iter.t -> float -> bool -> float -> float -> bool =
      fun iter within_margin use_align xalign yalign ->
        Raw.Text_view.scroll_to_iter obj iter within_margin use_align xalign
          yalign

    method scroll_to_mark :
        Text_buffer_and__text_iter_and__text_mark.text_mark_t ->
        float ->
        bool ->
        float ->
        float ->
        unit =
      fun mark within_margin use_align xalign yalign ->
        let mark = mark#as_text_mark in
        Raw.Text_view.scroll_to_mark obj mark within_margin use_align xalign
          yalign

    method set_accepts_tab : bool -> unit =
      fun accepts_tab -> Raw.Text_view.set_accepts_tab obj accepts_tab

    method set_bottom_margin : int -> unit =
      fun bottom_margin -> Raw.Text_view.set_bottom_margin obj bottom_margin

    method set_buffer :
        Text_buffer_and__text_iter_and__text_mark.text_buffer_t option -> unit =
      fun buffer ->
        let buffer = Option.map (fun c -> c#as_text_buffer) buffer in
        Raw.Text_view.set_buffer obj buffer

    method set_cursor_visible : bool -> unit =
      fun setting -> Raw.Text_view.set_cursor_visible obj setting

    method set_editable : bool -> unit =
      fun setting -> Raw.Text_view.set_editable obj setting

    method set_extra_menu : Ocgio.Menu_model.menu_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_menu_model) model in
        Raw.Text_view.set_extra_menu obj model

    method set_gutter :
        Enums.textwindowtype ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun win widget ->
        let widget = Option.map (fun c -> c#as_widget) widget in
        Raw.Text_view.set_gutter obj win widget

    method set_indent : int -> unit =
      fun indent -> Raw.Text_view.set_indent obj indent

    method set_input_hints : Enums.inputhints -> unit =
      fun hints -> Raw.Text_view.set_input_hints obj hints

    method set_input_purpose : Enums.inputpurpose -> unit =
      fun purpose -> Raw.Text_view.set_input_purpose obj purpose

    method set_justification : Enums.justification -> unit =
      fun justification -> Raw.Text_view.set_justification obj justification

    method set_left_margin : int -> unit =
      fun left_margin -> Raw.Text_view.set_left_margin obj left_margin

    method set_monospace : bool -> unit =
      fun monospace -> Raw.Text_view.set_monospace obj monospace

    method set_overwrite : bool -> unit =
      fun overwrite -> Raw.Text_view.set_overwrite obj overwrite

    method set_pixels_above_lines : int -> unit =
      fun pixels_above_lines ->
        Raw.Text_view.set_pixels_above_lines obj pixels_above_lines

    method set_pixels_below_lines : int -> unit =
      fun pixels_below_lines ->
        Raw.Text_view.set_pixels_below_lines obj pixels_below_lines

    method set_pixels_inside_wrap : int -> unit =
      fun pixels_inside_wrap ->
        Raw.Text_view.set_pixels_inside_wrap obj pixels_inside_wrap

    method set_right_margin : int -> unit =
      fun right_margin -> Raw.Text_view.set_right_margin obj right_margin

    method set_tabs : Ocpango.Tab_array.tab_array_t -> unit =
      fun tabs ->
        let tabs = tabs#as_tab_array in
        Raw.Text_view.set_tabs obj tabs

    method set_top_margin : int -> unit =
      fun top_margin -> Raw.Text_view.set_top_margin obj top_margin

    method set_wrap_mode : Enums.wrapmode -> unit =
      fun wrap_mode -> Raw.Text_view.set_wrap_mode obj wrap_mode

    method starts_display_line : Raw.Text_iter.t -> bool =
      fun iter -> Raw.Text_view.starts_display_line obj iter

    method im_module = Raw.Text_view.get_im_module obj
    method set_im_module v = Raw.Text_view.set_im_module obj v
    method as_text_view = obj
  end

let new_ () : text_view_t = new text_view (Raw.Text_view.new_ ())

let new_with_buffer
    (buffer : Text_buffer_and__text_iter_and__text_mark.text_buffer_t) :
    text_view_t =
  let buffer = buffer#as_text_buffer in
  let obj_ = Raw.Text_view.new_with_buffer buffer in
  new text_view obj_
