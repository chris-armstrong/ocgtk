(* Signal class defined in gapp_chooser_button_signals.ml *)

(* High-level class for AppChooserButton *)
class app_chooser_button (obj : App_chooser_button.t) = object (self)
  inherit Gapp_chooser_button_signals.app_chooser_button_signals obj

  method append_custom_item : 'p1. string -> string -> (#Ocgtk_gio.Gio.icon as 'p1) -> unit =
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

