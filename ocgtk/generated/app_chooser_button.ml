class type app_chooser_button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit App_chooser.app_chooser_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_custom_item_activated :
    ?after:bool ->
    callback:(item_name:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method append_custom_item : string -> string -> Ocgio.Icon.icon_t -> unit
  method append_separator : unit -> unit
  method get_heading : unit -> string option
  method get_modal : unit -> bool
  method get_show_default_item : unit -> bool
  method get_show_dialog_item : unit -> bool
  method set_active_custom_item : string -> unit
  method set_heading : string -> unit
  method set_modal : bool -> unit
  method set_show_default_item : bool -> unit
  method set_show_dialog_item : bool -> unit
  method as_app_chooser_button : Raw.App_chooser_button.t
end

(* High-level class for AppChooserButton *)
class app_chooser_button (obj : Raw.App_chooser_button.t) : app_chooser_button_t
  =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit App_chooser.app_chooser (Raw.App_chooser.from_gobject obj)

    method on_activate ?(after = false) ~callback () =
      Raw.App_chooser_button.on_activate ~after self#as_app_chooser_button
        ~callback

    method on_changed ?(after = false) ~callback () =
      Raw.App_chooser_button.on_changed ~after self#as_app_chooser_button
        ~callback

    method on_custom_item_activated ?(after = false) ~callback () =
      Raw.App_chooser_button.on_custom_item_activated ~after
        self#as_app_chooser_button ~callback

    method append_custom_item : string -> string -> Ocgio.Icon.icon_t -> unit =
      fun name label icon ->
        let icon = icon#as_icon in
        Raw.App_chooser_button.append_custom_item obj name label icon

    method append_separator : unit -> unit =
      fun () -> Raw.App_chooser_button.append_separator obj

    method get_heading : unit -> string option =
      fun () -> Raw.App_chooser_button.get_heading obj

    method get_modal : unit -> bool =
      fun () -> Raw.App_chooser_button.get_modal obj

    method get_show_default_item : unit -> bool =
      fun () -> Raw.App_chooser_button.get_show_default_item obj

    method get_show_dialog_item : unit -> bool =
      fun () -> Raw.App_chooser_button.get_show_dialog_item obj

    method set_active_custom_item : string -> unit =
      fun name -> Raw.App_chooser_button.set_active_custom_item obj name

    method set_heading : string -> unit =
      fun heading -> Raw.App_chooser_button.set_heading obj heading

    method set_modal : bool -> unit =
      fun modal -> Raw.App_chooser_button.set_modal obj modal

    method set_show_default_item : bool -> unit =
      fun setting -> Raw.App_chooser_button.set_show_default_item obj setting

    method set_show_dialog_item : bool -> unit =
      fun setting -> Raw.App_chooser_button.set_show_dialog_item obj setting

    method as_app_chooser_button = obj
  end

let new_ (content_type : string) : app_chooser_button_t =
  let obj_ = Raw.App_chooser_button.new_ content_type in
  new app_chooser_button obj_
