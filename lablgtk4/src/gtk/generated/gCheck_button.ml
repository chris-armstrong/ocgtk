(* Signal class defined in gcheck_button_signals.ml *)

(* High-level class for CheckButton *)
class check_button (obj : Check_button.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Check_button.as_widget obj)
  inherit Gcheck_button_signals.check_button_signals obj

  method active = Check_button.get_active obj
  method set_active v = Check_button.set_active obj v

  method inconsistent = Check_button.get_inconsistent obj
  method set_inconsistent v = Check_button.set_inconsistent obj v

  method label = Check_button.get_label obj
  method set_label v = Check_button.set_label obj v

  method use_underline = Check_button.get_use_underline obj
  method set_use_underline v = Check_button.set_use_underline obj v

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Check_button.get_child obj )

  method set_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Check_button.set_child obj child)

  method set_group : 'p1. (<as_check_button: Check_button.t; ..> as 'p1) option -> unit =
    fun group ->
      let group = Option.map (fun (c) -> c#as_check_button) group in
      (Check_button.set_group obj group)

  method as_widget = (Check_button.as_widget obj)
    method as_check_button = obj
end

