class type app_chooser_widget_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit App_chooser.app_chooser_t

  (** {2:signals Signals} *)

  method on_application_activated :
    ?after:bool ->
    callback:(application:Ocgio.App_info.app_info_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when an application item is activated from the widget's list.

      This usually happens when the user double clicks an item, or an item is
      selected and the user presses one of the keys Space, Shift+Space, Return
      or Enter. *)

  method on_application_selected :
    ?after:bool ->
    callback:(application:Ocgio.App_info.app_info_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when an application item is selected from the widget's list. *)

  (** {2:methods Methods} *)

  method get_default_text : unit -> string option
  (** Returns the text that is shown if there are not applications that can
      handle the content type. *)

  method get_show_all : unit -> bool
  (** Gets whether the app chooser should show all applications in a flat list.
  *)

  method get_show_default : unit -> bool
  (** Gets whether the app chooser should show the default handler for the
      content type in a separate section. *)

  method get_show_fallback : unit -> bool
  (** Gets whether the app chooser should show related applications for the
      content type in a separate section. *)

  method get_show_other : unit -> bool
  (** Gets whether the app chooser should show applications which are unrelated
      to the content type. *)

  method get_show_recommended : unit -> bool
  (** Gets whether the app chooser should show recommended applications for the
      content type in a separate section. *)

  method set_default_text : string -> unit
  (** Sets the text that is shown if there are not applications that can handle
      the content type. *)

  method set_show_all : bool -> unit
  (** Sets whether the app chooser should show all applications in a flat list.
  *)

  method set_show_default : bool -> unit
  (** Sets whether the app chooser should show the default handler for the
      content type in a separate section. *)

  method set_show_fallback : bool -> unit
  (** Sets whether the app chooser should show related applications for the
      content type in a separate section. *)

  method set_show_other : bool -> unit
  (** Sets whether the app chooser should show applications which are unrelated
      to the content type. *)

  method set_show_recommended : bool -> unit
  (** Sets whether the app chooser should show recommended applications for the
      content type in a separate section. *)

  (** {2:conversions Conversions} *)

  method as_app_chooser_widget : Raw.App_chooser_widget.t
end

(* High-level class for AppChooserWidget *)
class app_chooser_widget (obj : Raw.App_chooser_widget.t) : app_chooser_widget_t
  =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit App_chooser.app_chooser (Raw.App_chooser.from_gobject obj)

    method on_application_activated ?(after = false) ~callback () =
      Raw.App_chooser_widget.on_application_activated ~after
        self#as_app_chooser_widget ~callback:(fun ~application ->
          callback ~application:(new Ocgio.App_info.app_info application))

    method on_application_selected ?(after = false) ~callback () =
      Raw.App_chooser_widget.on_application_selected ~after
        self#as_app_chooser_widget ~callback:(fun ~application ->
          callback ~application:(new Ocgio.App_info.app_info application))

    method get_default_text : unit -> string option =
      fun () -> Raw.App_chooser_widget.get_default_text obj

    method get_show_all : unit -> bool =
      fun () -> Raw.App_chooser_widget.get_show_all obj

    method get_show_default : unit -> bool =
      fun () -> Raw.App_chooser_widget.get_show_default obj

    method get_show_fallback : unit -> bool =
      fun () -> Raw.App_chooser_widget.get_show_fallback obj

    method get_show_other : unit -> bool =
      fun () -> Raw.App_chooser_widget.get_show_other obj

    method get_show_recommended : unit -> bool =
      fun () -> Raw.App_chooser_widget.get_show_recommended obj

    method set_default_text : string -> unit =
      fun text -> Raw.App_chooser_widget.set_default_text obj text

    method set_show_all : bool -> unit =
      fun setting -> Raw.App_chooser_widget.set_show_all obj setting

    method set_show_default : bool -> unit =
      fun setting -> Raw.App_chooser_widget.set_show_default obj setting

    method set_show_fallback : bool -> unit =
      fun setting -> Raw.App_chooser_widget.set_show_fallback obj setting

    method set_show_other : bool -> unit =
      fun setting -> Raw.App_chooser_widget.set_show_other obj setting

    method set_show_recommended : bool -> unit =
      fun setting -> Raw.App_chooser_widget.set_show_recommended obj setting

    method as_app_chooser_widget = obj
  end

let new_ (content_type : string) : app_chooser_widget_t =
  let obj_ = Raw.App_chooser_widget.new_ content_type in
  new app_chooser_widget obj_
