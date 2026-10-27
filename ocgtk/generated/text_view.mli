(** Displays the contents of a [Gtk.TextBuffer].

    An example GtkTextView

    You may wish to begin by reading the conceptual overview, which gives an
    overview of all the objects and data types related to the text widget and
    how they work together.

    {b Shortcuts and Gestures}

    [GtkTextView] supports the following keyboard shortcuts:

    - <kbd>Shift</kbd>+<kbd>F10</kbd> or <kbd>Menu</kbd> opens the context menu.
    - <kbd>Ctrl</kbd>+<kbd>Z</kbd> undoes the last modification.
    - <kbd>Ctrl</kbd>+<kbd>Y</kbd> or
      <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>Z</kbd> redoes the last undone
      modification.
    - <kbd>Clear</kbd> clears the content.

    Additionally, the following signals have default keybindings:

    - [Gtk.TextView::backspace]
    - [Gtk.TextView::copy-clipboard]
    - [Gtk.TextView::cut-clipboard]
    - [Gtk.TextView::delete-from-cursor]
    - [Gtk.TextView::insert-emoji]
    - [Gtk.TextView::move-cursor]
    - [Gtk.TextView::paste-clipboard]
    - [Gtk.TextView::select-all]
    - [Gtk.TextView::toggle-cursor-visible]
    - [Gtk.TextView::toggle-overwrite]

    {b Actions}

    [GtkTextView] defines a set of built-in actions:

    - [clipboard.copy] copies the contents to the clipboard.
    - [clipboard.cut] copies the contents to the clipboard and deletes it from
      the widget.
    - [clipboard.paste] inserts the contents of the clipboard into the widget.
    - [menu.popup] opens the context menu.
    - [misc.insert-emoji] opens the Emoji chooser.
    - [selection.delete] deletes the current selection.
    - [selection.select-all] selects all of the widgets content.
    - [text.redo] redoes the last change to the contents.
    - [text.undo] undoes the last change to the contents.
    - [text.clear] clears the content.

    {b CSS nodes}

    {[
    textview.view
    ├── border.top
    ├── border.left
    ├── text
    │   ╰── [selection]
    ├── border.right
    ├── border.bottom
    ╰── [window.popup]
    ]}

    [GtkTextView] has a main css node with name textview and style class .view,
    and subnodes for each of the border windows, and the main text area, with
    names border and text, respectively. The border nodes each get one of the
    style classes .left, .right, .top or .bottom.

    A node representing the selection will appear below the text node.

    If a context menu is opened, the window node will appear as a subnode of the
    main node.

    {b Accessibility}

    [GtkTextView] uses the [Gtk.AccessibleRole.text_box] role.

    Its methods, signals and properties are on {!class-type-text_view_t}. The
    functions it is built on are in {!Ocgtk.Raw.Text_view}. *)

(** The methods, signals and properties of a [GtkTextView]. *)
class type text_view_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_text.accessible_text_t
  inherit Scrollable.scrollable_t

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
    callback:
      (step:Enums.movementstep -> count:int -> extend_selection:bool -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_move_viewport :
    ?after:bool ->
    callback:(step:Enums.scrollstep -> count:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_paste_clipboard :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_preedit_changed :
    ?after:bool ->
    callback:(preedit:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_select_all :
    ?after:bool ->
    callback:(select:bool -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_set_anchor :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_toggle_cursor_visible :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_toggle_overwrite :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method add_child_at_anchor :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Text_child_anchor.text_child_anchor_t ->
    unit

  method add_overlay :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int ->
    int ->
    unit

  method backward_display_line : Raw.Text_iter.t -> bool
  method backward_display_line_start : Raw.Text_iter.t -> bool
  method forward_display_line : Raw.Text_iter.t -> bool
  method forward_display_line_end : Raw.Text_iter.t -> bool
  method get_accepts_tab : unit -> bool
  method get_bottom_margin : unit -> int

  method get_buffer :
    unit -> Text_buffer_and__text_iter_and__text_mark.text_buffer_t

  method get_cursor_visible : unit -> bool
  method get_editable : unit -> bool
  method get_extra_menu : unit -> Ocgio.Menu_model.menu_model_t

  method get_gutter :
    Enums.textwindowtype ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_indent : unit -> int
  method get_input_hints : unit -> Enums.inputhints
  method get_input_purpose : unit -> Enums.inputpurpose
  method get_justification : unit -> Enums.justification
  method get_left_margin : unit -> int
  method get_ltr_context : unit -> Ocpango.Context.context_t
  method get_monospace : unit -> bool
  method get_overwrite : unit -> bool
  method get_pixels_above_lines : unit -> int
  method get_pixels_below_lines : unit -> int
  method get_pixels_inside_wrap : unit -> int
  method get_right_margin : unit -> int
  method get_rtl_context : unit -> Ocpango.Context.context_t
  method get_tabs : unit -> Ocpango.Tab_array.tab_array_t option
  method get_top_margin : unit -> int
  method get_wrap_mode : unit -> Enums.wrapmode
  method im_context_filter_keypress : Ocgdk.Event.event_t -> bool

  method move_mark_onscreen :
    Text_buffer_and__text_iter_and__text_mark.text_mark_t -> bool

  method move_overlay :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int ->
    int ->
    unit

  method move_visually : Raw.Text_iter.t -> int -> bool
  method place_cursor_onscreen : unit -> bool

  method remove :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method reset_cursor_blink : unit -> unit
  method reset_im_context : unit -> unit

  method scroll_mark_onscreen :
    Text_buffer_and__text_iter_and__text_mark.text_mark_t -> unit

  method scroll_to_iter :
    Raw.Text_iter.t -> float -> bool -> float -> float -> bool

  method scroll_to_mark :
    Text_buffer_and__text_iter_and__text_mark.text_mark_t ->
    float ->
    bool ->
    float ->
    float ->
    unit

  method set_accepts_tab : bool -> unit
  method set_bottom_margin : int -> unit

  method set_buffer :
    Text_buffer_and__text_iter_and__text_mark.text_buffer_t option -> unit

  method set_cursor_visible : bool -> unit
  method set_editable : bool -> unit
  method set_extra_menu : Ocgio.Menu_model.menu_model_t option -> unit

  method set_gutter :
    Enums.textwindowtype ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_indent : int -> unit
  method set_input_hints : Enums.inputhints -> unit
  method set_input_purpose : Enums.inputpurpose -> unit
  method set_justification : Enums.justification -> unit
  method set_left_margin : int -> unit
  method set_monospace : bool -> unit
  method set_overwrite : bool -> unit
  method set_pixels_above_lines : int -> unit
  method set_pixels_below_lines : int -> unit
  method set_pixels_inside_wrap : int -> unit
  method set_right_margin : int -> unit
  method set_tabs : Ocpango.Tab_array.tab_array_t -> unit
  method set_top_margin : int -> unit
  method set_wrap_mode : Enums.wrapmode -> unit
  method starts_display_line : Raw.Text_iter.t -> bool
  method im_module : string
  method set_im_module : string -> unit
  method as_text_view : Raw.Text_view.t
end

class text_view : Raw.Text_view.t -> text_view_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Text_view.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkTextView], give one already wrapped. *)

val new_ : unit -> text_view_t

val new_with_buffer :
  Text_buffer_and__text_iter_and__text_mark.text_buffer_t -> text_view_t
