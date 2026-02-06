(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)
(* Signal class defined in gapplication_signals.ml *)

class application (obj : Application_and__window_and__window_group.Application.t) = object (self)
  inherit Gapplication_signals.application_signals obj

  method add_window : 'p1. (<as_window: Application_and__window_and__window_group.Window.t; ..> as 'p1) -> unit =
    fun window ->
      let window = window#as_window in
      (Application_and__window_and__window_group.Application.add_window obj window)

  method get_accels_for_action : string -> string array =
    fun detailed_action_name ->
      (Application_and__window_and__window_group.Application.get_accels_for_action obj detailed_action_name)

  method get_actions_for_accel : string -> string array =
    fun accel ->
      (Application_and__window_and__window_group.Application.get_actions_for_accel obj accel)

  method get_active_window : unit -> window option =
    fun () ->
      Option.map (fun ret -> new window ret) (Application_and__window_and__window_group.Application.get_active_window obj)

  method get_window_by_id : int -> window option =
    fun id ->
      Option.map (fun ret -> new window ret) (Application_and__window_and__window_group.Application.get_window_by_id obj id)

  method inhibit : 'p1. (<as_window: Application_and__window_and__window_group.Window.t; ..> as 'p1) option -> Gtk_enums.applicationinhibitflags -> string option -> int =
    fun window flags reason ->
      let window = Option.map (fun (c) -> c#as_window) window in
      (Application_and__window_and__window_group.Application.inhibit obj window flags reason)

  method list_action_descriptions : unit -> string array =
    fun () ->
      (Application_and__window_and__window_group.Application.list_action_descriptions obj)

  method remove_window : 'p1. (<as_window: Application_and__window_and__window_group.Window.t; ..> as 'p1) -> unit =
    fun window ->
      let window = window#as_window in
      (Application_and__window_and__window_group.Application.remove_window obj window)

  method set_accels_for_action : string -> string array -> unit =
    fun detailed_action_name accels ->
      (Application_and__window_and__window_group.Application.set_accels_for_action obj detailed_action_name accels)

  method uninhibit : int -> unit =
    fun cookie ->
      (Application_and__window_and__window_group.Application.uninhibit obj cookie)

  method register_session = Application_and__window_and__window_group.Application.get_register_session obj
  method set_register_session v =  Application_and__window_and__window_group.Application.set_register_session obj v

  method screensaver_active = Application_and__window_and__window_group.Application.get_screensaver_active obj

    method as_application = obj
end
(* Signal class defined in gwindow_signals.ml *)


and window (obj : Application_and__window_and__window_group.Window.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Application_and__window_and__window_group.Window.as_widget obj)
  inherit Gwindow_signals.window_signals obj

  method close : unit -> unit =
    fun () ->
      (Application_and__window_and__window_group.Window.close obj)

  method destroy : unit -> unit =
    fun () ->
      (Application_and__window_and__window_group.Window.destroy obj)

  method fullscreen : unit -> unit =
    fun () ->
      (Application_and__window_and__window_group.Window.fullscreen obj)

  method get_application : unit -> application option =
    fun () ->
      Option.map (fun ret -> new application ret) (Application_and__window_and__window_group.Window.get_application obj)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Application_and__window_and__window_group.Window.get_child obj)

  method get_decorated : unit -> bool =
    fun () ->
      (Application_and__window_and__window_group.Window.get_decorated obj)

  method get_default_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Application_and__window_and__window_group.Window.get_default_widget obj)

  method get_deletable : unit -> bool =
    fun () ->
      (Application_and__window_and__window_group.Window.get_deletable obj)

  method get_destroy_with_parent : unit -> bool =
    fun () ->
      (Application_and__window_and__window_group.Window.get_destroy_with_parent obj)

  method get_focus : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Application_and__window_and__window_group.Window.get_focus obj)

  method get_focus_visible : unit -> bool =
    fun () ->
      (Application_and__window_and__window_group.Window.get_focus_visible obj)

  method get_group : unit -> window_group =
    fun () ->
      new  window_group(Application_and__window_and__window_group.Window.get_group obj)

  method get_handle_menubar_accel : unit -> bool =
    fun () ->
      (Application_and__window_and__window_group.Window.get_handle_menubar_accel obj)

  method get_hide_on_close : unit -> bool =
    fun () ->
      (Application_and__window_and__window_group.Window.get_hide_on_close obj)

  method get_icon_name : unit -> string option =
    fun () ->
      (Application_and__window_and__window_group.Window.get_icon_name obj)

  method get_mnemonics_visible : unit -> bool =
    fun () ->
      (Application_and__window_and__window_group.Window.get_mnemonics_visible obj)

  method get_modal : unit -> bool =
    fun () ->
      (Application_and__window_and__window_group.Window.get_modal obj)

  method get_resizable : unit -> bool =
    fun () ->
      (Application_and__window_and__window_group.Window.get_resizable obj)

  method get_title : unit -> string option =
    fun () ->
      (Application_and__window_and__window_group.Window.get_title obj)

  method get_titlebar : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Application_and__window_and__window_group.Window.get_titlebar obj)

  method get_transient_for : unit -> window option =
    fun () ->
      Option.map (fun ret -> new window ret) (Application_and__window_and__window_group.Window.get_transient_for obj)

  method has_group : unit -> bool =
    fun () ->
      (Application_and__window_and__window_group.Window.has_group obj)

  method is_active : unit -> bool =
    fun () ->
      (Application_and__window_and__window_group.Window.is_active obj)

  method is_fullscreen : unit -> bool =
    fun () ->
      (Application_and__window_and__window_group.Window.is_fullscreen obj)

  method is_maximized : unit -> bool =
    fun () ->
      (Application_and__window_and__window_group.Window.is_maximized obj)

  method is_suspended : unit -> bool =
    fun () ->
      (Application_and__window_and__window_group.Window.is_suspended obj)

  method maximize : unit -> unit =
    fun () ->
      (Application_and__window_and__window_group.Window.maximize obj)

  method minimize : unit -> unit =
    fun () ->
      (Application_and__window_and__window_group.Window.minimize obj)

  method present : unit -> unit =
    fun () ->
      (Application_and__window_and__window_group.Window.present obj)

  method set_application : 'p1. (<as_application: Application_and__window_and__window_group.Application.t; ..> as 'p1) option -> unit =
    fun application ->
      let application = Option.map (fun (c) -> c#as_application) application in
      (Application_and__window_and__window_group.Window.set_application obj application)

  method set_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Application_and__window_and__window_group.Window.set_child obj child)

  method set_decorated : bool -> unit =
    fun setting ->
      (Application_and__window_and__window_group.Window.set_decorated obj setting)

  method set_default_size : int -> int -> unit =
    fun width height ->
      (Application_and__window_and__window_group.Window.set_default_size obj width height)

  method set_default_widget : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun default_widget ->
      let default_widget = Option.map (fun (c) -> c#as_widget) default_widget in
      (Application_and__window_and__window_group.Window.set_default_widget obj default_widget)

  method set_deletable : bool -> unit =
    fun setting ->
      (Application_and__window_and__window_group.Window.set_deletable obj setting)

  method set_destroy_with_parent : bool -> unit =
    fun setting ->
      (Application_and__window_and__window_group.Window.set_destroy_with_parent obj setting)

  method set_focus : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun focus ->
      let focus = Option.map (fun (c) -> c#as_widget) focus in
      (Application_and__window_and__window_group.Window.set_focus obj focus)

  method set_focus_visible : bool -> unit =
    fun setting ->
      (Application_and__window_and__window_group.Window.set_focus_visible obj setting)

  method set_handle_menubar_accel : bool -> unit =
    fun handle_menubar_accel ->
      (Application_and__window_and__window_group.Window.set_handle_menubar_accel obj handle_menubar_accel)

  method set_hide_on_close : bool -> unit =
    fun setting ->
      (Application_and__window_and__window_group.Window.set_hide_on_close obj setting)

  method set_icon_name : string option -> unit =
    fun name ->
      (Application_and__window_and__window_group.Window.set_icon_name obj name)

  method set_mnemonics_visible : bool -> unit =
    fun setting ->
      (Application_and__window_and__window_group.Window.set_mnemonics_visible obj setting)

  method set_modal : bool -> unit =
    fun modal ->
      (Application_and__window_and__window_group.Window.set_modal obj modal)

  method set_resizable : bool -> unit =
    fun resizable ->
      (Application_and__window_and__window_group.Window.set_resizable obj resizable)

  method set_startup_id : string -> unit =
    fun startup_id ->
      (Application_and__window_and__window_group.Window.set_startup_id obj startup_id)

  method set_title : string option -> unit =
    fun title ->
      (Application_and__window_and__window_group.Window.set_title obj title)

  method set_titlebar : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun titlebar ->
      let titlebar = Option.map (fun (c) -> c#as_widget) titlebar in
      (Application_and__window_and__window_group.Window.set_titlebar obj titlebar)

  method set_transient_for : 'p1. (<as_window: Application_and__window_and__window_group.Window.t; ..> as 'p1) option -> unit =
    fun parent ->
      let parent = Option.map (fun (c) -> c#as_window) parent in
      (Application_and__window_and__window_group.Window.set_transient_for obj parent)

  method unfullscreen : unit -> unit =
    fun () ->
      (Application_and__window_and__window_group.Window.unfullscreen obj)

  method unmaximize : unit -> unit =
    fun () ->
      (Application_and__window_and__window_group.Window.unmaximize obj)

  method unminimize : unit -> unit =
    fun () ->
      (Application_and__window_and__window_group.Window.unminimize obj)

  method default_height = Application_and__window_and__window_group.Window.get_default_height obj
  method set_default_height v =  Application_and__window_and__window_group.Window.set_default_height obj v

  method default_width = Application_and__window_and__window_group.Window.get_default_width obj
  method set_default_width v =  Application_and__window_and__window_group.Window.set_default_width obj v

  method focus_widget = new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Application_and__window_and__window_group.Window.get_focus_widget obj)
  method set_focus_widget : 'a . (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'a) -> unit  = fun v ->  Application_and__window_and__window_group.Window.set_focus_widget obj v#as_widget

  method fullscreened = Application_and__window_and__window_group.Window.get_fullscreened obj
  method set_fullscreened v =  Application_and__window_and__window_group.Window.set_fullscreened obj v

  method maximized = Application_and__window_and__window_group.Window.get_maximized obj
  method set_maximized v =  Application_and__window_and__window_group.Window.set_maximized obj v

  method suspended = Application_and__window_and__window_group.Window.get_suspended obj

  method as_widget = (Application_and__window_and__window_group.Window.as_widget obj)
    method as_window = obj
end

and window_group (obj : Application_and__window_and__window_group.Window_group.t) = object (self)

  method add_window : 'p1. (<as_window: Application_and__window_and__window_group.Window.t; ..> as 'p1) -> unit =
    fun window ->
      let window = window#as_window in
      (Application_and__window_and__window_group.Window_group.add_window obj window)

  method remove_window : 'p1. (<as_window: Application_and__window_and__window_group.Window.t; ..> as 'p1) -> unit =
    fun window ->
      let window = window#as_window in
      (Application_and__window_and__window_group.Window_group.remove_window obj window)

    method as_window_group = obj
end
