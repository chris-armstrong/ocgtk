class text_view : Text_view.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gtext_view_signals.text_view_signals
    method add_child_at_anchor : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> #GText_child_anchor.text_child_anchor -> unit
    method add_overlay : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> int -> int -> unit
    method backward_display_line : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> bool
    method backward_display_line_start : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> bool
    method forward_display_line : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> bool
    method forward_display_line_end : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> bool
    method get_accepts_tab : unit -> bool
    method get_bottom_margin : unit -> int
    method get_buffer : unit -> GText_buffer_and__text_iter_and__text_mark.text_buffer
    method get_cursor_visible : unit -> bool
    method get_editable : unit -> bool
    method get_gutter : Gtk_enums.textwindowtype -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_indent : unit -> int
    method get_input_hints : unit -> Gtk_enums.inputhints
    method get_input_purpose : unit -> Gtk_enums.inputpurpose
    method get_justification : unit -> Gtk_enums.justification
    method get_left_margin : unit -> int
    method get_monospace : unit -> bool
    method get_overwrite : unit -> bool
    method get_pixels_above_lines : unit -> int
    method get_pixels_below_lines : unit -> int
    method get_pixels_inside_wrap : unit -> int
    method get_right_margin : unit -> int
    method get_top_margin : unit -> int
    method get_wrap_mode : unit -> Gtk_enums.wrapmode
    method im_context_filter_keypress : 'a. 'a Gdk.event -> bool
    method move_mark_onscreen : #GText_buffer_and__text_iter_and__text_mark.text_mark -> bool
    method move_overlay : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> int -> int -> unit
    method move_visually : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> int -> bool
    method place_cursor_onscreen : unit -> bool
    method remove : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> unit
    method reset_cursor_blink : unit -> unit
    method reset_im_context : unit -> unit
    method scroll_mark_onscreen : #GText_buffer_and__text_iter_and__text_mark.text_mark -> unit
    method scroll_to_iter : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> float -> bool -> float -> float -> bool
    method scroll_to_mark : #GText_buffer_and__text_iter_and__text_mark.text_mark -> float -> bool -> float -> float -> unit
    method set_accepts_tab : bool -> unit
    method set_bottom_margin : int -> unit
    method set_buffer : #GText_buffer_and__text_iter_and__text_mark.text_buffer option -> unit
    method set_cursor_visible : bool -> unit
    method set_editable : bool -> unit
    method set_gutter : Gtk_enums.textwindowtype -> #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_indent : int -> unit
    method set_input_hints : Gtk_enums.inputhints -> unit
    method set_input_purpose : Gtk_enums.inputpurpose -> unit
    method set_justification : Gtk_enums.justification -> unit
    method set_left_margin : int -> unit
    method set_monospace : bool -> unit
    method set_overwrite : bool -> unit
    method set_pixels_above_lines : int -> unit
    method set_pixels_below_lines : int -> unit
    method set_pixels_inside_wrap : int -> unit
    method set_right_margin : int -> unit
    method set_top_margin : int -> unit
    method set_wrap_mode : Gtk_enums.wrapmode -> unit
    method starts_display_line : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> bool
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_text_view : Text_view.t
  end

