(* Signal class defined in gmenu_button_signals.ml *)

(* High-level class for MenuButton *)
class menu_button (obj : Menu_button.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Menu_button.as_widget obj)
  inherit Gmenu_button_signals.menu_button_signals obj

  method active = Menu_button.get_active obj
  method set_active v = Menu_button.set_active obj v

  method always_show_arrow = Menu_button.get_always_show_arrow obj
  method set_always_show_arrow v = Menu_button.set_always_show_arrow obj v

  method can_shrink = Menu_button.get_can_shrink obj
  method set_can_shrink v = Menu_button.set_can_shrink obj v

  method has_frame = Menu_button.get_has_frame obj
  method set_has_frame v = Menu_button.set_has_frame obj v

  method icon_name = Menu_button.get_icon_name obj
  method set_icon_name v = Menu_button.set_icon_name obj v

  method label = Menu_button.get_label obj
  method set_label v = Menu_button.set_label obj v

  method primary = Menu_button.get_primary obj
  method set_primary v = Menu_button.set_primary obj v

  method use_underline = Menu_button.get_use_underline obj
  method set_use_underline v = Menu_button.set_use_underline obj v

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Menu_button.get_child obj )

  (* method get_direction = ... *) (* CONFLICT: incompatible signature with parent method *)

  method get_popover : unit -> GPopover.popover option = fun () -> Option.map (fun ret -> new GPopover.popover ret) (Menu_button.get_popover obj )

  method popdown : unit -> unit = fun () -> (Menu_button.popdown obj )

  method popup : unit -> unit = fun () -> (Menu_button.popup obj )

  method set_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Menu_button.set_child obj child)

  (* method set_direction = ... *) (* CONFLICT: incompatible signature with parent method *)

  method set_popover : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun popover ->
      let popover = Option.map (fun (c) -> c#as_widget) popover in
      (Menu_button.set_popover obj popover)

  method as_widget = (Menu_button.as_widget obj)
    method as_menu_button = obj
end

