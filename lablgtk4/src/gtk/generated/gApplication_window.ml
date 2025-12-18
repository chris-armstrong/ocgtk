(* High-level class for ApplicationWindow *)
class application_window (obj : Application_window.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Application_window.as_widget obj)

  method show_menubar = Application_window.get_show_menubar obj
  method set_show_menubar v = Application_window.set_show_menubar obj v

  method get_help_overlay : unit -> GShortcuts_window.shortcuts_window option = fun () -> Option.map (fun ret -> new GShortcuts_window.shortcuts_window ret) (Application_window.get_help_overlay obj )

  method get_id : unit -> int = fun () -> (Application_window.get_id obj )

  method set_help_overlay : 'p1. (#GShortcuts_window.shortcuts_window as 'p1) option -> unit =
    fun help_overlay ->
      let help_overlay = Option.map (fun (c) -> c#as_shortcuts_window) help_overlay in
      (Application_window.set_help_overlay obj help_overlay)

  method as_widget = (Application_window.as_widget obj)
    method as_application_window = obj
end

