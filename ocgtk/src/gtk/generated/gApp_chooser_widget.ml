(* Signal class defined in gapp_chooser_widget_signals.ml *)

class type app_chooser_widget_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  inherit GApp_chooser.app_chooser_t
  inherit Gapp_chooser_widget_signals.app_chooser_widget_signals
  method get_default_text : unit -> string option
  method get_show_all : unit -> bool
  method get_show_default : unit -> bool
  method get_show_fallback : unit -> bool
  method get_show_other : unit -> bool
  method get_show_recommended : unit -> bool
  method set_default_text : string -> unit
  method set_show_all : bool -> unit
  method set_show_default : bool -> unit
  method set_show_fallback : bool -> unit
  method set_show_other : bool -> unit
  method set_show_recommended : bool -> unit
  method as_app_chooser_widget : App_chooser_widget.t
end

(* High-level class for AppChooserWidget *)
class app_chooser_widget (obj : App_chooser_widget.t) : app_chooser_widget_t =
  object (self)
    inherit
      GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
      .widget
        (obj
          :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget
             .Widget
             .t)

    inherit GApp_chooser.app_chooser (App_chooser.from_gobject obj)
    inherit Gapp_chooser_widget_signals.app_chooser_widget_signals obj

    method get_default_text : unit -> string option =
      fun () -> App_chooser_widget.get_default_text obj

    method get_show_all : unit -> bool =
      fun () -> App_chooser_widget.get_show_all obj

    method get_show_default : unit -> bool =
      fun () -> App_chooser_widget.get_show_default obj

    method get_show_fallback : unit -> bool =
      fun () -> App_chooser_widget.get_show_fallback obj

    method get_show_other : unit -> bool =
      fun () -> App_chooser_widget.get_show_other obj

    method get_show_recommended : unit -> bool =
      fun () -> App_chooser_widget.get_show_recommended obj

    method set_default_text : string -> unit =
      fun text -> App_chooser_widget.set_default_text obj text

    method set_show_all : bool -> unit =
      fun setting -> App_chooser_widget.set_show_all obj setting

    method set_show_default : bool -> unit =
      fun setting -> App_chooser_widget.set_show_default obj setting

    method set_show_fallback : bool -> unit =
      fun setting -> App_chooser_widget.set_show_fallback obj setting

    method set_show_other : bool -> unit =
      fun setting -> App_chooser_widget.set_show_other obj setting

    method set_show_recommended : bool -> unit =
      fun setting -> App_chooser_widget.set_show_recommended obj setting

    method as_app_chooser_widget = obj
  end

let new_ (content_type : string) : app_chooser_widget_t =
  let obj_ = App_chooser_widget.new_ content_type in
  new app_chooser_widget obj_
