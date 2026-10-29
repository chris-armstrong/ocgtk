class type application_window_t = object
  inherit Window.window_t
  inherit Ocgio.Action_group.action_group_t
  inherit Ocgio.Action_map.action_map_t

  (** {2:methods Methods} *)

  method get_help_overlay : unit -> Shortcuts_window.shortcuts_window_t option
  (** Gets the [GtkShortcutsWindow] that is associated with [window].

      See [Gtk.ApplicationWindow.set_help_overlay]. *)

  method get_id : unit -> int
  (** Returns the unique ID of the window.

      If the window has not yet been added to a [GtkApplication], returns [0].
  *)

  method get_show_menubar : unit -> bool
  (** Returns whether the window will display a menubar for the app menu and
      menubar as needed. *)

  method set_help_overlay : Shortcuts_window.shortcuts_window_t option -> unit
  (** Associates a shortcuts window with the application window.

      Additionally, sets up an action with the name [win.show-help-overlay] to
      present it.

      The window takes responsibility for destroying the help overlay. *)

  method set_show_menubar : bool -> unit
  (** Sets whether the window will display a menubar for the app menu and
      menubar as needed. *)

  (** {2:conversions Conversions} *)

  method as_application_window : Raw.Application_window.t
end

(* High-level class for ApplicationWindow *)
class application_window (obj : Raw.Application_window.t) : application_window_t
  =
  object (self)
    inherit Window.window (obj :> Raw.Window.t)

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

let new_ (application : Application.application_t) : application_window_t =
  let application = application#as_application in
  let obj_ = Raw.Application_window.new_ application in
  new application_window obj_
