(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TextView *)

type t = Gtk.Widget.t

external new_ : unit -> t = "ml_gtk_text_view_new"

external new_with_buffer : Gtk.Widget.t -> t = "ml_gtk_text_view_new_with_buffer"

(* Properties *)

external get_accepts_tab : t -> bool = "ml_gtk_text_view_get_accepts_tab"

external set_accepts_tab : t -> bool -> unit = "ml_gtk_text_view_set_accepts_tab"

external get_bottom_margin : t -> int = "ml_gtk_text_view_get_bottom_margin"

external set_bottom_margin : t -> int -> unit = "ml_gtk_text_view_set_bottom_margin"

external get_cursor_visible : t -> bool = "ml_gtk_text_view_get_cursor_visible"

external set_cursor_visible : t -> bool -> unit = "ml_gtk_text_view_set_cursor_visible"

external get_editable : t -> bool = "ml_gtk_text_view_get_editable"

external set_editable : t -> bool -> unit = "ml_gtk_text_view_set_editable"

external get_im_module : t -> string = "ml_gtk_text_view_get_im_module"

external set_im_module : t -> string -> unit = "ml_gtk_text_view_set_im_module"

external get_indent : t -> int = "ml_gtk_text_view_get_indent"

external set_indent : t -> int -> unit = "ml_gtk_text_view_set_indent"

external get_left_margin : t -> int = "ml_gtk_text_view_get_left_margin"

external set_left_margin : t -> int -> unit = "ml_gtk_text_view_set_left_margin"

external get_monospace : t -> bool = "ml_gtk_text_view_get_monospace"

external set_monospace : t -> bool -> unit = "ml_gtk_text_view_set_monospace"

external get_overwrite : t -> bool = "ml_gtk_text_view_get_overwrite"

external set_overwrite : t -> bool -> unit = "ml_gtk_text_view_set_overwrite"

external get_pixels_above_lines : t -> int = "ml_gtk_text_view_get_pixels_above_lines"

external set_pixels_above_lines : t -> int -> unit = "ml_gtk_text_view_set_pixels_above_lines"

external get_pixels_below_lines : t -> int = "ml_gtk_text_view_get_pixels_below_lines"

external set_pixels_below_lines : t -> int -> unit = "ml_gtk_text_view_set_pixels_below_lines"

external get_pixels_inside_wrap : t -> int = "ml_gtk_text_view_get_pixels_inside_wrap"

external set_pixels_inside_wrap : t -> int -> unit = "ml_gtk_text_view_set_pixels_inside_wrap"

external get_right_margin : t -> int = "ml_gtk_text_view_get_right_margin"

external set_right_margin : t -> int -> unit = "ml_gtk_text_view_set_right_margin"

external get_top_margin : t -> int = "ml_gtk_text_view_get_top_margin"

external set_top_margin : t -> int -> unit = "ml_gtk_text_view_set_top_margin"

external set_wrap_mode : t -> Gtk_enums.wrapmode -> unit = "ml_gtk_text_view_set_wrap_mode"

external set_justification : t -> Gtk_enums.justification -> unit = "ml_gtk_text_view_set_justification"

external set_input_purpose : t -> Gtk_enums.inputpurpose -> unit = "ml_gtk_text_view_set_input_purpose"

external set_input_hints : t -> Gtk_enums.inputhints -> unit = "ml_gtk_text_view_set_input_hints"

external set_gutter : t -> Gtk_enums.textwindowtype -> Gtk.Widget.t option -> unit = "ml_gtk_text_view_set_gutter"

external set_buffer : t -> Gtk.Widget.t option -> unit = "ml_gtk_text_view_set_buffer"

external scroll_to_mark : t -> Gtk.Widget.t -> float -> bool -> float -> float -> unit = "ml_gtk_text_view_scroll_to_mark_bytecode" "ml_gtk_text_view_scroll_to_mark_native"

external scroll_to_iter : t -> Gtk.Widget.t -> float -> bool -> float -> float -> bool = "ml_gtk_text_view_scroll_to_iter_bytecode" "ml_gtk_text_view_scroll_to_iter_native"

external scroll_mark_onscreen : t -> Gtk.Widget.t -> unit = "ml_gtk_text_view_scroll_mark_onscreen"

external reset_im_context : t -> unit = "ml_gtk_text_view_reset_im_context"

external reset_cursor_blink : t -> unit = "ml_gtk_text_view_reset_cursor_blink"

external remove : t -> Gtk.Widget.t -> unit = "ml_gtk_text_view_remove"

external place_cursor_onscreen : t -> bool = "ml_gtk_text_view_place_cursor_onscreen"

external move_visually : t -> Gtk.Widget.t -> int -> bool = "ml_gtk_text_view_move_visually"

external move_overlay : t -> Gtk.Widget.t -> int -> int -> unit = "ml_gtk_text_view_move_overlay"

external move_mark_onscreen : t -> Gtk.Widget.t -> bool = "ml_gtk_text_view_move_mark_onscreen"

external im_context_filter_keypress : t -> _ Gdk.event -> bool = "ml_gtk_text_view_im_context_filter_keypress"

external get_wrap_mode : t -> Gtk_enums.wrapmode = "ml_gtk_text_view_get_wrap_mode"

external get_justification : t -> Gtk_enums.justification = "ml_gtk_text_view_get_justification"

external get_iter_at_location : t -> Gtk.Widget.t -> int -> int -> bool = "ml_gtk_text_view_get_iter_at_location"

external get_input_purpose : t -> Gtk_enums.inputpurpose = "ml_gtk_text_view_get_input_purpose"

external get_input_hints : t -> Gtk_enums.inputhints = "ml_gtk_text_view_get_input_hints"

external get_gutter : t -> Gtk_enums.textwindowtype -> Gtk.Widget.t = "ml_gtk_text_view_get_gutter"

external get_buffer : t -> Gtk.Widget.t = "ml_gtk_text_view_get_buffer"

external forward_display_line_end : t -> Gtk.Widget.t -> bool = "ml_gtk_text_view_forward_display_line_end"

external forward_display_line : t -> Gtk.Widget.t -> bool = "ml_gtk_text_view_forward_display_line"

external backward_display_line_start : t -> Gtk.Widget.t -> bool = "ml_gtk_text_view_backward_display_line_start"

external backward_display_line : t -> Gtk.Widget.t -> bool = "ml_gtk_text_view_backward_display_line"

external add_overlay : t -> Gtk.Widget.t -> int -> int -> unit = "ml_gtk_text_view_add_overlay"

external add_child_at_anchor : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit = "ml_gtk_text_view_add_child_at_anchor"

