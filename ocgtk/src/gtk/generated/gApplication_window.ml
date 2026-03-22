class type application_window_t = object
    inherit GApplication_and__window_and__window_group.window_t
    method get_help_overlay : unit -> GShortcuts_window.shortcuts_window_t option
    method get_id : unit -> int
    method get_show_menubar : unit -> bool
    method set_help_overlay : GShortcuts_window.shortcuts_window_t option -> unit
    method set_show_menubar : bool -> unit
    method as_application_window : Application_window.t
end

(* High-level class for ApplicationWindow *)
class application_window (obj : Application_window.t) : application_window_t = object (self)
  inherit GApplication_and__window_and__window_group.window (Obj.magic obj : Application_and__window_and__window_group.Window.t)

  method get_help_overlay : unit -> GShortcuts_window.shortcuts_window_t option =
    fun () ->
      Option.map (fun ret -> new GShortcuts_window.shortcuts_window ret) (Application_window.get_help_overlay obj)

  method get_id : unit -> int =
    fun () ->
      (Application_window.get_id obj)

  method get_show_menubar : unit -> bool =
    fun () ->
      (Application_window.get_show_menubar obj)

  method set_help_overlay : GShortcuts_window.shortcuts_window_t option -> unit =
    fun help_overlay ->
      let help_overlay = Option.map (fun (c) -> c#as_shortcuts_window) help_overlay in
      (Application_window.set_help_overlay obj help_overlay)

  method set_show_menubar : bool -> unit =
    fun show_menubar ->
      (Application_window.set_show_menubar obj show_menubar)

    method as_application_window = obj
end

let new_ (application : GApplication_and__window_and__window_group.application_t) : application_window_t =
  let application = application#as_application in
  new application_window (Application_window.new_ application)

