(* High-level class for ApplicationWindow *)
class application_window (obj : Application_window.t) = object (self)

  method get_help_overlay : unit -> GShortcuts_window.shortcuts_window option =
    fun () ->
      Option.map (fun ret -> new GShortcuts_window.shortcuts_window ret) (Application_window.get_help_overlay obj)

  method get_id : unit -> int =
    fun () ->
      (Application_window.get_id obj)

  method get_show_menubar : unit -> bool =
    fun () ->
      (Application_window.get_show_menubar obj)

  method set_help_overlay : 'p1. (#GShortcuts_window.shortcuts_window as 'p1) option -> unit =
    fun help_overlay ->
      let help_overlay = Option.map (fun (c) -> c#as_shortcuts_window) help_overlay in
      (Application_window.set_help_overlay obj help_overlay)

  method set_show_menubar : bool -> unit =
    fun show_menubar ->
      (Application_window.set_show_menubar obj show_menubar)

    method as_application_window = obj
end

