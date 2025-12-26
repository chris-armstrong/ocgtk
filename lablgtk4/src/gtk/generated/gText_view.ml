(* Signal class defined in gtext_view_signals.ml *)

(* High-level class for TextView *)
class text_view (obj : Text_view.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Text_view.as_widget obj)
  inherit Gtext_view_signals.text_view_signals obj

  method add_child_at_anchor : 'p1 'p2. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> (#GText_child_anchor.text_child_anchor as 'p2) -> unit =
    fun child anchor ->
      let child = child#as_widget in
      let anchor = anchor#as_text_child_anchor in
      (Text_view.add_child_at_anchor obj child anchor)

  method add_overlay : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> int -> int -> unit =
    fun child xpos ypos ->
      let child = child#as_widget in
      (Text_view.add_overlay obj child xpos ypos)

  method backward_display_line : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> bool =
    fun iter ->
      (Text_view.backward_display_line obj iter)

  method backward_display_line_start : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> bool =
    fun iter ->
      (Text_view.backward_display_line_start obj iter)

  method forward_display_line : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> bool =
    fun iter ->
      (Text_view.forward_display_line obj iter)

  method forward_display_line_end : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> bool =
    fun iter ->
      (Text_view.forward_display_line_end obj iter)

  method get_accepts_tab : unit -> bool =
    fun () ->
      (Text_view.get_accepts_tab obj)

  method get_bottom_margin : unit -> int =
    fun () ->
      (Text_view.get_bottom_margin obj)

  method get_buffer : unit -> GText_buffer_and__text_iter_and__text_mark.text_buffer =
    fun () ->
      new  GText_buffer_and__text_iter_and__text_mark.text_buffer(Text_view.get_buffer obj)

  method get_cursor_visible : unit -> bool =
    fun () ->
      (Text_view.get_cursor_visible obj)

  method get_editable : unit -> bool =
    fun () ->
      (Text_view.get_editable obj)

  method get_gutter : Gtk_enums.textwindowtype -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option =
    fun win ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Text_view.get_gutter obj win)

  method get_indent : unit -> int =
    fun () ->
      (Text_view.get_indent obj)

  method get_input_hints : unit -> Gtk_enums.inputhints =
    fun () ->
      (Text_view.get_input_hints obj)

  method get_input_purpose : unit -> Gtk_enums.inputpurpose =
    fun () ->
      (Text_view.get_input_purpose obj)

  method get_justification : unit -> Gtk_enums.justification =
    fun () ->
      (Text_view.get_justification obj)

  method get_left_margin : unit -> int =
    fun () ->
      (Text_view.get_left_margin obj)

  method get_monospace : unit -> bool =
    fun () ->
      (Text_view.get_monospace obj)

  method get_overwrite : unit -> bool =
    fun () ->
      (Text_view.get_overwrite obj)

  method get_pixels_above_lines : unit -> int =
    fun () ->
      (Text_view.get_pixels_above_lines obj)

  method get_pixels_below_lines : unit -> int =
    fun () ->
      (Text_view.get_pixels_below_lines obj)

  method get_pixels_inside_wrap : unit -> int =
    fun () ->
      (Text_view.get_pixels_inside_wrap obj)

  method get_right_margin : unit -> int =
    fun () ->
      (Text_view.get_right_margin obj)

  method get_top_margin : unit -> int =
    fun () ->
      (Text_view.get_top_margin obj)

  method move_mark_onscreen : 'p1. (#GText_buffer_and__text_iter_and__text_mark.text_mark as 'p1) -> bool =
    fun mark ->
      let mark = mark#as_text_mark in
      (Text_view.move_mark_onscreen obj mark)

  method move_overlay : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> int -> int -> unit =
    fun child xpos ypos ->
      let child = child#as_widget in
      (Text_view.move_overlay obj child xpos ypos)

  method move_visually : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> int -> bool =
    fun iter count ->
      (Text_view.move_visually obj iter count)

  method place_cursor_onscreen : unit -> bool =
    fun () ->
      (Text_view.place_cursor_onscreen obj)

  method remove : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> unit =
    fun child ->
      let child = child#as_widget in
      (Text_view.remove obj child)

  method reset_cursor_blink : unit -> unit =
    fun () ->
      (Text_view.reset_cursor_blink obj)

  method reset_im_context : unit -> unit =
    fun () ->
      (Text_view.reset_im_context obj)

  method scroll_mark_onscreen : 'p1. (#GText_buffer_and__text_iter_and__text_mark.text_mark as 'p1) -> unit =
    fun mark ->
      let mark = mark#as_text_mark in
      (Text_view.scroll_mark_onscreen obj mark)

  method scroll_to_iter : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> float -> bool -> float -> float -> bool =
    fun iter within_margin use_align xalign yalign ->
      (Text_view.scroll_to_iter obj iter within_margin use_align xalign yalign)

  method scroll_to_mark : 'p1. (#GText_buffer_and__text_iter_and__text_mark.text_mark as 'p1) -> float -> bool -> float -> float -> unit =
    fun mark within_margin use_align xalign yalign ->
      let mark = mark#as_text_mark in
      (Text_view.scroll_to_mark obj mark within_margin use_align xalign yalign)

  method set_accepts_tab : bool -> unit =
    fun accepts_tab ->
      (Text_view.set_accepts_tab obj accepts_tab)

  method set_bottom_margin : int -> unit =
    fun bottom_margin ->
      (Text_view.set_bottom_margin obj bottom_margin)

  method set_buffer : 'p1. (#GText_buffer_and__text_iter_and__text_mark.text_buffer as 'p1) option -> unit =
    fun buffer ->
      let buffer = Option.map (fun (c) -> c#as_text_buffer) buffer in
      (Text_view.set_buffer obj buffer)

  method set_cursor_visible : bool -> unit =
    fun setting ->
      (Text_view.set_cursor_visible obj setting)

  method set_editable : bool -> unit =
    fun setting ->
      (Text_view.set_editable obj setting)

  method set_gutter : 'p1. Gtk_enums.textwindowtype -> (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun win widget ->
      let widget = Option.map (fun (c) -> c#as_widget) widget in
      (Text_view.set_gutter obj win widget)

  method set_indent : int -> unit =
    fun indent ->
      (Text_view.set_indent obj indent)

  method set_input_hints : Gtk_enums.inputhints -> unit =
    fun hints ->
      (Text_view.set_input_hints obj hints)

  method set_input_purpose : Gtk_enums.inputpurpose -> unit =
    fun purpose ->
      (Text_view.set_input_purpose obj purpose)

  method set_justification : Gtk_enums.justification -> unit =
    fun justification ->
      (Text_view.set_justification obj justification)

  method set_left_margin : int -> unit =
    fun left_margin ->
      (Text_view.set_left_margin obj left_margin)

  method set_monospace : bool -> unit =
    fun monospace ->
      (Text_view.set_monospace obj monospace)

  method set_overwrite : bool -> unit =
    fun overwrite ->
      (Text_view.set_overwrite obj overwrite)

  method set_pixels_above_lines : int -> unit =
    fun pixels_above_lines ->
      (Text_view.set_pixels_above_lines obj pixels_above_lines)

  method set_pixels_below_lines : int -> unit =
    fun pixels_below_lines ->
      (Text_view.set_pixels_below_lines obj pixels_below_lines)

  method set_pixels_inside_wrap : int -> unit =
    fun pixels_inside_wrap ->
      (Text_view.set_pixels_inside_wrap obj pixels_inside_wrap)

  method set_right_margin : int -> unit =
    fun right_margin ->
      (Text_view.set_right_margin obj right_margin)

  method set_top_margin : int -> unit =
    fun top_margin ->
      (Text_view.set_top_margin obj top_margin)

  method starts_display_line : Text_buffer_and__text_iter_and__text_mark.Text_iter.t -> bool =
    fun iter ->
      (Text_view.starts_display_line obj iter)

  method im_module = Text_view.get_im_module obj
  method set_im_module v =  Text_view.set_im_module obj v

  method as_widget = (Text_view.as_widget obj)
    method as_text_view = obj
end

