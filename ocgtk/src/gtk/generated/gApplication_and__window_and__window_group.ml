(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type application_t = object
    inherit Gapplication_signals.application_signals
    method add_window : window_t -> unit
    method get_accels_for_action : string -> string array
    method get_actions_for_accel : string -> string array
    method get_active_window : unit -> window_t option
    method get_menu_by_id : string -> Ocgtk_gio.Gio.menu_t option
    method get_menubar : unit -> Ocgtk_gio.Gio.menu_model_t option
    method get_window_by_id : int -> window_t option
    method inhibit : window_t option -> Gtk_enums.applicationinhibitflags -> string option -> int
    method list_action_descriptions : unit -> string array
    method remove_window : window_t -> unit
    method set_accels_for_action : string -> string array -> unit
    method set_menubar : Ocgtk_gio.Gio.menu_model_t option -> unit
    method uninhibit : int -> unit
    method register_session : bool
    method set_register_session : bool -> unit
    method screensaver_active : bool
    method as_application : Application_and__window_and__window_group.Application.t
end

and window_t = object
    inherit Gwindow_signals.window_signals
    method close : unit -> unit
    method destroy : unit -> unit
    method fullscreen : unit -> unit
    method fullscreen_on_monitor : Ocgtk_gdk.Gdk.monitor_t -> unit
    method get_application : unit -> application_t option
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_decorated : unit -> bool
    method get_default_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_deletable : unit -> bool
    method get_destroy_with_parent : unit -> bool
    method get_focus : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_focus_visible : unit -> bool
    method get_group : unit -> window_group_t
    method get_handle_menubar_accel : unit -> bool
    method get_hide_on_close : unit -> bool
    method get_icon_name : unit -> string option
    method get_mnemonics_visible : unit -> bool
    method get_modal : unit -> bool
    method get_resizable : unit -> bool
    method get_title : unit -> string option
    method get_titlebar : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_transient_for : unit -> window_t option
    method has_group : unit -> bool
    method is_active : unit -> bool
    method is_fullscreen : unit -> bool
    method is_maximized : unit -> bool
    method is_suspended : unit -> bool
    method maximize : unit -> unit
    method minimize : unit -> unit
    method present : unit -> unit
    method set_application : application_t option -> unit
    method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_decorated : bool -> unit
    method set_default_size : int -> int -> unit
    method set_default_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_deletable : bool -> unit
    method set_destroy_with_parent : bool -> unit
    method set_display : Ocgtk_gdk.Gdk.display_t -> unit
    method set_focus : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_focus_visible : bool -> unit
    method set_handle_menubar_accel : bool -> unit
    method set_hide_on_close : bool -> unit
    method set_icon_name : string option -> unit
    method set_mnemonics_visible : bool -> unit
    method set_modal : bool -> unit
    method set_resizable : bool -> unit
    method set_startup_id : string -> unit
    method set_title : string option -> unit
    method set_titlebar : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_transient_for : window_t option -> unit
    method unfullscreen : unit -> unit
    method unmaximize : unit -> unit
    method unminimize : unit -> unit
    method default_height : int
    method set_default_height : int -> unit
    method default_width : int
    method set_default_width : int -> unit
    method focus_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method set_focus_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method fullscreened : bool
    method set_fullscreened : bool -> unit
    method maximized : bool
    method set_maximized : bool -> unit
    method suspended : bool
    method as_window : Application_and__window_and__window_group.Window.t
end

and window_group_t = object
    method add_window : window_t -> unit
    method remove_window : window_t -> unit
    method as_window_group : Application_and__window_and__window_group.Window_group.t
end


(* Signal class defined in gapplication_signals.ml *)

class application (obj : Application_and__window_and__window_group.Application.t) : application_t = object (self)
  inherit Gapplication_signals.application_signals obj

  method add_window : window_t -> unit =
    fun window ->
      let window = window#as_window in
      (Application_and__window_and__window_group.Application.add_window obj window)

  method get_accels_for_action : string -> string array =
    fun detailed_action_name ->
      (Application_and__window_and__window_group.Application.get_accels_for_action obj detailed_action_name)

  method get_actions_for_accel : string -> string array =
    fun accel ->
      (Application_and__window_and__window_group.Application.get_actions_for_accel obj accel)

  method get_active_window : unit -> window_t option =
    fun () ->
      Option.map (fun ret -> new window ret) (Application_and__window_and__window_group.Application.get_active_window obj)

  method get_menu_by_id : string -> Ocgtk_gio.Gio.menu_t option =
    fun id ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.menu ret) (Application_and__window_and__window_group.Application.get_menu_by_id obj id)

  method get_menubar : unit -> Ocgtk_gio.Gio.menu_model_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.menu_model ret) (Application_and__window_and__window_group.Application.get_menubar obj)

  method get_window_by_id : int -> window_t option =
    fun id ->
      Option.map (fun ret -> new window ret) (Application_and__window_and__window_group.Application.get_window_by_id obj id)

  method inhibit : window_t option -> Gtk_enums.applicationinhibitflags -> string option -> int =
    fun window flags reason ->
      let window = Option.map (fun (c) -> c#as_window) window in
      (Application_and__window_and__window_group.Application.inhibit obj window flags reason)

  method list_action_descriptions : unit -> string array =
    fun () ->
      (Application_and__window_and__window_group.Application.list_action_descriptions obj)

  method remove_window : window_t -> unit =
    fun window ->
      let window = window#as_window in
      (Application_and__window_and__window_group.Application.remove_window obj window)

  method set_accels_for_action : string -> string array -> unit =
    fun detailed_action_name accels ->
      (Application_and__window_and__window_group.Application.set_accels_for_action obj detailed_action_name accels)

  method set_menubar : Ocgtk_gio.Gio.menu_model_t option -> unit =
    fun menubar ->
      let menubar = Option.map (fun (c) -> c#as_menu_model) menubar in
      (Application_and__window_and__window_group.Application.set_menubar obj menubar)

  method uninhibit : int -> unit =
    fun cookie ->
      (Application_and__window_and__window_group.Application.uninhibit obj cookie)

  method register_session = Application_and__window_and__window_group.Application.get_register_session obj
  method set_register_session v =  Application_and__window_and__window_group.Application.set_register_session obj v

  method screensaver_active = Application_and__window_and__window_group.Application.get_screensaver_active obj

    method as_application = obj
end
(* Signal class defined in gwindow_signals.ml *)


and window (obj : Application_and__window_and__window_group.Window.t) : window_t = object (self)
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

  method fullscreen_on_monitor : Ocgtk_gdk.Gdk.monitor_t -> unit =
    fun monitor ->
      let monitor = monitor#as_monitor in
      (Application_and__window_and__window_group.Window.fullscreen_on_monitor obj monitor)

  method get_application : unit -> application_t option =
    fun () ->
      Option.map (fun ret -> new application ret) (Application_and__window_and__window_group.Window.get_application obj)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Application_and__window_and__window_group.Window.get_child obj)

  method get_decorated : unit -> bool =
    fun () ->
      (Application_and__window_and__window_group.Window.get_decorated obj)

  method get_default_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Application_and__window_and__window_group.Window.get_default_widget obj)

  method get_deletable : unit -> bool =
    fun () ->
      (Application_and__window_and__window_group.Window.get_deletable obj)

  method get_destroy_with_parent : unit -> bool =
    fun () ->
      (Application_and__window_and__window_group.Window.get_destroy_with_parent obj)

  method get_focus : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Application_and__window_and__window_group.Window.get_focus obj)

  method get_focus_visible : unit -> bool =
    fun () ->
      (Application_and__window_and__window_group.Window.get_focus_visible obj)

  method get_group : unit -> window_group_t =
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

  method get_titlebar : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Application_and__window_and__window_group.Window.get_titlebar obj)

  method get_transient_for : unit -> window_t option =
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

  method set_application : application_t option -> unit =
    fun application ->
      let application = Option.map (fun (c) -> c#as_application) application in
      (Application_and__window_and__window_group.Window.set_application obj application)

  method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Application_and__window_and__window_group.Window.set_child obj child)

  method set_decorated : bool -> unit =
    fun setting ->
      (Application_and__window_and__window_group.Window.set_decorated obj setting)

  method set_default_size : int -> int -> unit =
    fun width height ->
      (Application_and__window_and__window_group.Window.set_default_size obj width height)

  method set_default_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun default_widget ->
      let default_widget = Option.map (fun (c) -> c#as_widget) default_widget in
      (Application_and__window_and__window_group.Window.set_default_widget obj default_widget)

  method set_deletable : bool -> unit =
    fun setting ->
      (Application_and__window_and__window_group.Window.set_deletable obj setting)

  method set_destroy_with_parent : bool -> unit =
    fun setting ->
      (Application_and__window_and__window_group.Window.set_destroy_with_parent obj setting)

  method set_display : Ocgtk_gdk.Gdk.display_t -> unit =
    fun display ->
      let display = display#as_display in
      (Application_and__window_and__window_group.Window.set_display obj display)

  method set_focus : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
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

  method set_titlebar : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun titlebar ->
      let titlebar = Option.map (fun (c) -> c#as_widget) titlebar in
      (Application_and__window_and__window_group.Window.set_titlebar obj titlebar)

  method set_transient_for : window_t option -> unit =
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
  method set_focus_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit  = fun v ->  Application_and__window_and__window_group.Window.set_focus_widget obj v#as_widget

  method fullscreened = Application_and__window_and__window_group.Window.get_fullscreened obj
  method set_fullscreened v =  Application_and__window_and__window_group.Window.set_fullscreened obj v

  method maximized = Application_and__window_and__window_group.Window.get_maximized obj
  method set_maximized v =  Application_and__window_and__window_group.Window.set_maximized obj v

  method suspended = Application_and__window_and__window_group.Window.get_suspended obj

    method as_window = obj
end

and window_group (obj : Application_and__window_and__window_group.Window_group.t) : window_group_t = object (self)

  method add_window : window_t -> unit =
    fun window ->
      let window = window#as_window in
      (Application_and__window_and__window_group.Window_group.add_window obj window)

  method remove_window : window_t -> unit =
    fun window ->
      let window = window#as_window in
      (Application_and__window_and__window_group.Window_group.remove_window obj window)

    method as_window_group = obj
end
