(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TextView *)

type t = Gtk.Widget.t

(** Create a new TextView *)
external new_ : unit -> t = "ml_gtk_text_view_new"

(** Create a new TextView *)
external new_with_buffer : Gtk.Widget.t -> t = "ml_gtk_text_view_new_with_buffer"

(* Properties *)

(** Get property: accepts-tab *)
external get_accepts_tab : t -> bool = "ml_gtk_text_view_get_accepts_tab"

(** Set property: accepts-tab *)
external set_accepts_tab : t -> bool -> unit = "ml_gtk_text_view_set_accepts_tab"

(** Get property: bottom-margin *)
external get_bottom_margin : t -> int = "ml_gtk_text_view_get_bottom_margin"

(** Set property: bottom-margin *)
external set_bottom_margin : t -> int -> unit = "ml_gtk_text_view_set_bottom_margin"

(** Get property: cursor-visible *)
external get_cursor_visible : t -> bool = "ml_gtk_text_view_get_cursor_visible"

(** Set property: cursor-visible *)
external set_cursor_visible : t -> bool -> unit = "ml_gtk_text_view_set_cursor_visible"

(** Get property: editable *)
external get_editable : t -> bool = "ml_gtk_text_view_get_editable"

(** Set property: editable *)
external set_editable : t -> bool -> unit = "ml_gtk_text_view_set_editable"

(** Get property: indent *)
external get_indent : t -> int = "ml_gtk_text_view_get_indent"

(** Set property: indent *)
external set_indent : t -> int -> unit = "ml_gtk_text_view_set_indent"

(** Get property: left-margin *)
external get_left_margin : t -> int = "ml_gtk_text_view_get_left_margin"

(** Set property: left-margin *)
external set_left_margin : t -> int -> unit = "ml_gtk_text_view_set_left_margin"

(** Get property: monospace *)
external get_monospace : t -> bool = "ml_gtk_text_view_get_monospace"

(** Set property: monospace *)
external set_monospace : t -> bool -> unit = "ml_gtk_text_view_set_monospace"

(** Get property: overwrite *)
external get_overwrite : t -> bool = "ml_gtk_text_view_get_overwrite"

(** Set property: overwrite *)
external set_overwrite : t -> bool -> unit = "ml_gtk_text_view_set_overwrite"

(** Get property: pixels-above-lines *)
external get_pixels_above_lines : t -> int = "ml_gtk_text_view_get_pixels_above_lines"

(** Set property: pixels-above-lines *)
external set_pixels_above_lines : t -> int -> unit = "ml_gtk_text_view_set_pixels_above_lines"

(** Get property: pixels-below-lines *)
external get_pixels_below_lines : t -> int = "ml_gtk_text_view_get_pixels_below_lines"

(** Set property: pixels-below-lines *)
external set_pixels_below_lines : t -> int -> unit = "ml_gtk_text_view_set_pixels_below_lines"

(** Get property: pixels-inside-wrap *)
external get_pixels_inside_wrap : t -> int = "ml_gtk_text_view_get_pixels_inside_wrap"

(** Set property: pixels-inside-wrap *)
external set_pixels_inside_wrap : t -> int -> unit = "ml_gtk_text_view_set_pixels_inside_wrap"

(** Get property: right-margin *)
external get_right_margin : t -> int = "ml_gtk_text_view_get_right_margin"

(** Set property: right-margin *)
external set_right_margin : t -> int -> unit = "ml_gtk_text_view_set_right_margin"

(** Get property: top-margin *)
external get_top_margin : t -> int = "ml_gtk_text_view_get_top_margin"

(** Set property: top-margin *)
external set_top_margin : t -> int -> unit = "ml_gtk_text_view_set_top_margin"

external starts_display_line : t -> unit -> bool = "ml_gtk_text_view_starts_display_line"

external set_wrap_mode : t -> int -> unit = "ml_gtk_text_view_set_wrap_mode"

external set_tabs : t -> unit -> unit = "ml_gtk_text_view_set_tabs"

external set_justification : t -> int -> unit = "ml_gtk_text_view_set_justification"

external set_input_purpose : t -> int -> unit = "ml_gtk_text_view_set_input_purpose"

external set_input_hints : t -> int -> unit = "ml_gtk_text_view_set_input_hints"

external set_gutter : t -> int -> Gtk.Widget.t option -> unit = "ml_gtk_text_view_set_gutter"

external set_extra_menu : t -> unit -> unit = "ml_gtk_text_view_set_extra_menu"

external set_buffer : t -> Gtk.Widget.t option -> unit = "ml_gtk_text_view_set_buffer"

external scroll_mark_onscreen : t -> Gtk.Widget.t -> unit = "ml_gtk_text_view_scroll_mark_onscreen"

external reset_im_context : t -> unit = "ml_gtk_text_view_reset_im_context"

external reset_cursor_blink : t -> unit = "ml_gtk_text_view_reset_cursor_blink"

external remove : t -> Gtk.Widget.t -> unit = "ml_gtk_text_view_remove"

external place_cursor_onscreen : t -> bool = "ml_gtk_text_view_place_cursor_onscreen"

external move_visually : t -> Gtk.Widget.t -> unit -> bool = "ml_gtk_text_view_move_visually"

external move_overlay : t -> Gtk.Widget.t -> unit -> unit -> unit = "ml_gtk_text_view_move_overlay"

external move_mark_onscreen : t -> Gtk.Widget.t -> bool = "ml_gtk_text_view_move_mark_onscreen"

external im_context_filter_keypress : t -> Gdk.Event.t -> bool = "ml_gtk_text_view_im_context_filter_keypress"

external get_wrap_mode : t -> int = "ml_gtk_text_view_get_wrap_mode"

external get_visible_rect : t -> unit -> unit = "ml_gtk_text_view_get_visible_rect"

external get_tabs : t -> unit = "ml_gtk_text_view_get_tabs"

external get_rtl_context : t -> unit = "ml_gtk_text_view_get_rtl_context"

external get_ltr_context : t -> unit = "ml_gtk_text_view_get_ltr_context"

external get_line_yrange : t -> unit -> unit -> unit -> unit = "ml_gtk_text_view_get_line_yrange"

external get_line_at_y : t -> Gtk.Widget.t -> unit -> unit -> unit = "ml_gtk_text_view_get_line_at_y"

external get_justification : t -> int = "ml_gtk_text_view_get_justification"

external get_iter_location : t -> unit -> unit -> unit = "ml_gtk_text_view_get_iter_location"

external get_iter_at_position : t -> Gtk.Widget.t -> unit -> unit -> unit -> bool = "ml_gtk_text_view_get_iter_at_position"

external get_iter_at_location : t -> Gtk.Widget.t -> unit -> unit -> bool = "ml_gtk_text_view_get_iter_at_location"

external get_input_purpose : t -> int = "ml_gtk_text_view_get_input_purpose"

external get_input_hints : t -> int = "ml_gtk_text_view_get_input_hints"

external get_gutter : t -> int -> Gtk.Widget.t = "ml_gtk_text_view_get_gutter"

external get_extra_menu : t -> unit = "ml_gtk_text_view_get_extra_menu"

external get_cursor_locations : t -> unit -> unit -> unit -> unit = "ml_gtk_text_view_get_cursor_locations"

external get_buffer : t -> Gtk.Widget.t = "ml_gtk_text_view_get_buffer"

external forward_display_line_end : t -> Gtk.Widget.t -> bool = "ml_gtk_text_view_forward_display_line_end"

external forward_display_line : t -> Gtk.Widget.t -> bool = "ml_gtk_text_view_forward_display_line"

external backward_display_line_start : t -> Gtk.Widget.t -> bool = "ml_gtk_text_view_backward_display_line_start"

external backward_display_line : t -> Gtk.Widget.t -> bool = "ml_gtk_text_view_backward_display_line"

external add_overlay : t -> Gtk.Widget.t -> unit -> unit -> unit = "ml_gtk_text_view_add_overlay"

external add_child_at_anchor : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit = "ml_gtk_text_view_add_child_at_anchor"

