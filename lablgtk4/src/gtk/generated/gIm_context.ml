(* Signal class defined in gim_context_signals.ml *)

(* High-level class for IMContext *)
class im_context (obj : Im_context.t) = object (self)
  inherit Gim_context_signals.im_context_signals obj

  method activate_osk : 'a. 'a Gdk.event option -> bool = fun event -> (Im_context.activate_osk obj event)

  method delete_surrounding : int -> int -> bool = fun offset n_chars -> (Im_context.delete_surrounding obj offset n_chars)

  method filter_keypress : 'a. 'a Gdk.event -> bool = fun event -> (Im_context.filter_keypress obj event)

  method focus_in : unit -> unit = fun () -> (Im_context.focus_in obj )

  method focus_out : unit -> unit = fun () -> (Im_context.focus_out obj )

  method reset : unit -> unit = fun () -> (Im_context.reset obj )

  method set_client_widget : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun widget ->
      let widget = Option.map (fun (c) -> c#as_widget) widget in
      (Im_context.set_client_widget obj widget)

  method set_surrounding : string -> int -> int -> unit = fun text len cursor_index -> (Im_context.set_surrounding obj text len cursor_index)

  method set_surrounding_with_selection : string -> int -> int -> int -> unit = fun text len cursor_index anchor_index -> (Im_context.set_surrounding_with_selection obj text len cursor_index anchor_index)

  method set_use_preedit : bool -> unit = fun use_preedit -> (Im_context.set_use_preedit obj use_preedit)

    method as_im_context = obj
end

