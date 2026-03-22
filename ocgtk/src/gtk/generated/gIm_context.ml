(* Signal class defined in gim_context_signals.ml *)

class type im_context_t = object
    inherit Gim_context_signals.im_context_signals
    method activate_osk : Ocgtk_gdk.Gdk.Event.event_t option -> bool
    method delete_surrounding : int -> int -> bool
    method filter_keypress : Ocgtk_gdk.Gdk.Event.event_t -> bool
    method focus_in : unit -> unit
    method focus_out : unit -> unit
    method reset : unit -> unit
    method set_client_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_cursor_location : Ocgtk_gdk.Gdk.Rectangle.rectangle_t -> unit
    method set_surrounding : string -> int -> int -> unit
    method set_surrounding_with_selection : string -> int -> int -> int -> unit
    method set_use_preedit : bool -> unit
    method input_hints : Gtk_enums.inputhints
    method set_input_hints : Gtk_enums.inputhints -> unit
    method input_purpose : Gtk_enums.inputpurpose
    method set_input_purpose : Gtk_enums.inputpurpose -> unit
    method as_im_context : Im_context.t
end

(* High-level class for IMContext *)
class im_context (obj : Im_context.t) : im_context_t = object (self)
  inherit Gim_context_signals.im_context_signals obj

  method activate_osk : Ocgtk_gdk.Gdk.Event.event_t option -> bool =
    fun event ->
      let event = Option.map (fun (c) -> c#as_event) event in
      (Im_context.activate_osk obj event)

  method delete_surrounding : int -> int -> bool =
    fun offset n_chars ->
      (Im_context.delete_surrounding obj offset n_chars)

  method filter_keypress : Ocgtk_gdk.Gdk.Event.event_t -> bool =
    fun event ->
      let event = event#as_event in
      (Im_context.filter_keypress obj event)

  method focus_in : unit -> unit =
    fun () ->
      (Im_context.focus_in obj)

  method focus_out : unit -> unit =
    fun () ->
      (Im_context.focus_out obj)

  method reset : unit -> unit =
    fun () ->
      (Im_context.reset obj)

  method set_client_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun widget ->
      let widget = Option.map (fun (c) -> c#as_widget) widget in
      (Im_context.set_client_widget obj widget)

  method set_cursor_location : Ocgtk_gdk.Gdk.Rectangle.rectangle_t -> unit =
    fun area ->
      let area = area#as_rectangle in
      (Im_context.set_cursor_location obj area)

  method set_surrounding : string -> int -> int -> unit =
    fun text len cursor_index ->
      (Im_context.set_surrounding obj text len cursor_index)

  method set_surrounding_with_selection : string -> int -> int -> int -> unit =
    fun text len cursor_index anchor_index ->
      (Im_context.set_surrounding_with_selection obj text len cursor_index anchor_index)

  method set_use_preedit : bool -> unit =
    fun use_preedit ->
      (Im_context.set_use_preedit obj use_preedit)

  method input_hints = Im_context.get_input_hints obj
  method set_input_hints v =  Im_context.set_input_hints obj v

  method input_purpose = Im_context.get_input_purpose obj
  method set_input_purpose v =  Im_context.set_input_purpose obj v

    method as_im_context = obj
end

