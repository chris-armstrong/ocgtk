class type check_button_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Gcheck_button_signals.check_button_signals
    method get_active : unit -> bool
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_inconsistent : unit -> bool
    method get_label : unit -> string option
    method get_use_underline : unit -> bool
    method set_active : bool -> unit
    method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_group : check_button_t option -> unit
    method set_inconsistent : bool -> unit
    method set_label : string option -> unit
    method set_use_underline : bool -> unit
    method as_check_button : Check_button.t
end

class check_button : Check_button.t -> check_button_t

val new_ : unit -> check_button_t
val new_with_label : string option -> check_button_t
val new_with_mnemonic : string option -> check_button_t
