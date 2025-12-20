class im_context : Im_context.t ->
  object
    inherit Gim_context_signals.im_context_signals
    method delete_surrounding : int -> int -> bool
    method focus_in : unit -> unit
    method focus_out : unit -> unit
    method reset : unit -> unit
    method set_client_widget : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_surrounding : string -> int -> int -> unit
    method set_surrounding_with_selection : string -> int -> int -> int -> unit
    method set_use_preedit : bool -> unit
    method input_purpose : Gtk_enums.inputpurpose
    method set_input_purpose : Gtk_enums.inputpurpose -> unit
    method as_im_context : Im_context.t
  end

