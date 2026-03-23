(* Signal class defined in gapp_chooser_button_signals.ml *)

class type app_chooser_button_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Gapp_chooser_button_signals.app_chooser_button_signals
    method append_custom_item : string -> string -> Ocgtk_gio.Gio.Icon.icon_t -> unit
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
    method as_app_chooser_button : App_chooser_button.t
end

(* High-level class for AppChooserButton *)
class app_chooser_button (obj : App_chooser_button.t) : app_chooser_button_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit Gapp_chooser_button_signals.app_chooser_button_signals obj

  method append_custom_item : string -> string -> Ocgtk_gio.Gio.Icon.icon_t -> unit =
    fun name label icon ->
      let icon = icon#as_icon in
      (App_chooser_button.append_custom_item obj name label icon)

  method append_separator : unit -> unit =
    fun () ->
      (App_chooser_button.append_separator obj)

  method get_heading : unit -> string option =
    fun () ->
      (App_chooser_button.get_heading obj)

  method get_modal : unit -> bool =
    fun () ->
      (App_chooser_button.get_modal obj)

  method get_show_default_item : unit -> bool =
    fun () ->
      (App_chooser_button.get_show_default_item obj)

  method get_show_dialog_item : unit -> bool =
    fun () ->
      (App_chooser_button.get_show_dialog_item obj)

  method set_active_custom_item : string -> unit =
    fun name ->
      (App_chooser_button.set_active_custom_item obj name)

  method set_heading : string -> unit =
    fun heading ->
      (App_chooser_button.set_heading obj heading)

  method set_modal : bool -> unit =
    fun modal ->
      (App_chooser_button.set_modal obj modal)

  method set_show_default_item : bool -> unit =
    fun setting ->
      (App_chooser_button.set_show_default_item obj setting)

  method set_show_dialog_item : bool -> unit =
    fun setting ->
      (App_chooser_button.set_show_dialog_item obj setting)

    method as_app_chooser_button = obj
end

let new_ (content_type : string) : app_chooser_button_t =
  new app_chooser_button (App_chooser_button.new_ content_type)

