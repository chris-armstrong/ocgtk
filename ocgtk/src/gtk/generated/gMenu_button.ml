class type menu_button_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  method on_activate : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method get_active : unit -> bool
  method get_always_show_arrow : unit -> bool
  method get_can_shrink : unit -> bool

  method get_child :
    unit ->
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option

  method get_has_frame : unit -> bool
  method get_icon_name : unit -> string option
  method get_label : unit -> string option
  method get_menu_model : unit -> Ocgtk_gio.Gio.Menu_model.menu_model_t option
  method get_popover : unit -> GPopover.popover_t option
  method get_primary : unit -> bool
  method get_use_underline : unit -> bool
  method popdown : unit -> unit
  method popup : unit -> unit
  method set_active : bool -> unit
  method set_always_show_arrow : bool -> unit
  method set_can_shrink : bool -> unit

  method set_child :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option ->
    unit

  method set_has_frame : bool -> unit
  method set_icon_name : string -> unit
  method set_label : string -> unit
  method set_menu_model : Ocgtk_gio.Gio.Menu_model.menu_model_t option -> unit

  method set_popover :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option ->
    unit

  method set_primary : bool -> unit
  method set_use_underline : bool -> unit
  method as_menu_button : Menu_button.t
end

(* High-level class for MenuButton *)
class menu_button (obj : Menu_button.t) : menu_button_t =
  object (self)
    inherit
      GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
      .widget
        (obj
          :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget
             .Widget
             .t)

    method on_activate ~callback =
      Menu_button.on_activate self#as_menu_button ~callback

    method get_active : unit -> bool = fun () -> Menu_button.get_active obj

    method get_always_show_arrow : unit -> bool =
      fun () -> Menu_button.get_always_show_arrow obj

    method get_can_shrink : unit -> bool =
      fun () -> Menu_button.get_can_shrink obj

    method get_child :
        unit ->
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
              .widget
              ret)
          (Menu_button.get_child obj)

    method get_has_frame : unit -> bool =
      fun () -> Menu_button.get_has_frame obj

    method get_icon_name : unit -> string option =
      fun () -> Menu_button.get_icon_name obj

    method get_label : unit -> string option =
      fun () -> Menu_button.get_label obj

    method get_menu_model : unit -> Ocgtk_gio.Gio.Menu_model.menu_model_t option
        =
      fun () ->
        Option.map
          (fun ret -> new Ocgtk_gio.Gio.Menu_model.menu_model ret)
          (Menu_button.get_menu_model obj)

    method get_popover : unit -> GPopover.popover_t option =
      fun () ->
        Option.map
          (fun ret -> new GPopover.popover ret)
          (Menu_button.get_popover obj)

    method get_primary : unit -> bool = fun () -> Menu_button.get_primary obj

    method get_use_underline : unit -> bool =
      fun () -> Menu_button.get_use_underline obj

    method popdown : unit -> unit = fun () -> Menu_button.popdown obj
    method popup : unit -> unit = fun () -> Menu_button.popup obj

    method set_active : bool -> unit =
      fun active -> Menu_button.set_active obj active

    method set_always_show_arrow : bool -> unit =
      fun always_show_arrow ->
        Menu_button.set_always_show_arrow obj always_show_arrow

    method set_can_shrink : bool -> unit =
      fun can_shrink -> Menu_button.set_can_shrink obj can_shrink

    method set_child :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Menu_button.set_child obj child

    method set_has_frame : bool -> unit =
      fun has_frame -> Menu_button.set_has_frame obj has_frame

    method set_icon_name : string -> unit =
      fun icon_name -> Menu_button.set_icon_name obj icon_name

    method set_label : string -> unit =
      fun label -> Menu_button.set_label obj label

    method set_menu_model : Ocgtk_gio.Gio.Menu_model.menu_model_t option -> unit
        =
      fun menu_model ->
        let menu_model = Option.map (fun c -> c#as_menu_model) menu_model in
        Menu_button.set_menu_model obj menu_model

    method set_popover :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t
        option ->
        unit =
      fun popover ->
        let popover = Option.map (fun c -> c#as_widget) popover in
        Menu_button.set_popover obj popover

    method set_primary : bool -> unit =
      fun primary -> Menu_button.set_primary obj primary

    method set_use_underline : bool -> unit =
      fun use_underline -> Menu_button.set_use_underline obj use_underline

    method as_menu_button = obj
  end

let new_ () : menu_button_t = new menu_button (Menu_button.new_ ())
