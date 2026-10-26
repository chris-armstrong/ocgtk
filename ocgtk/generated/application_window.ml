class type application_window_t = object
  inherit Application_and__window_and__window_group.window_t
  inherit Ocgio.Action_group.action_group_t
  inherit Ocgio.Action_map.action_map_t
  method get_help_overlay : unit -> Shortcuts_window.shortcuts_window_t option
  method get_id : unit -> int
  method get_show_menubar : unit -> bool
  method set_help_overlay : Shortcuts_window.shortcuts_window_t option -> unit
  method set_show_menubar : bool -> unit
  method as_application_window : Raw.Application_window.t
end

(* High-level class for ApplicationWindow *)
class application_window (obj : Raw.Application_window.t) : application_window_t
  =
  object (self)
    inherit
      Application_and__window_and__window_group.window (obj :> Raw.Window.t)

    inherit
      Ocgio.Action_group.action_group (Ocgio.Raw.Action_group.from_gobject obj)

    inherit Ocgio.Action_map.action_map (Ocgio.Raw.Action_map.from_gobject obj)

    method get_help_overlay : unit -> Shortcuts_window.shortcuts_window_t option
        =
      fun () ->
        Option.map
          (fun ret -> new Shortcuts_window.shortcuts_window ret)
          (Raw.Application_window.get_help_overlay obj)

    method get_id : unit -> int = fun () -> Raw.Application_window.get_id obj

    method get_show_menubar : unit -> bool =
      fun () -> Raw.Application_window.get_show_menubar obj

    method set_help_overlay : Shortcuts_window.shortcuts_window_t option -> unit
        =
      fun help_overlay ->
        let help_overlay =
          Option.map (fun c -> c#as_shortcuts_window) help_overlay
        in
        Raw.Application_window.set_help_overlay obj help_overlay

    method set_show_menubar : bool -> unit =
      fun show_menubar ->
        Raw.Application_window.set_show_menubar obj show_menubar

    method as_application_window = obj
  end

let new_ (application : Application_and__window_and__window_group.application_t)
    : application_window_t =
  let application = application#as_application in
  let obj_ = Raw.Application_window.new_ application in
  new application_window obj_
