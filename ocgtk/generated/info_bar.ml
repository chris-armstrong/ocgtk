class type info_bar_t = object
  inherit Widget.widget_t

  (** {2:signals Signals} *)

  method on_close :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Gets emitted when the user uses a keybinding to dismiss the info bar.

      The ::close signal is a keybinding signal.

      The default binding for this signal is the Escape key. *)

  method on_response :
    ?after:bool ->
    callback:(response_id:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when an action widget is clicked.

      The signal is also emitted when the application programmer calls
      [Gtk.InfoBar.response]. The [response_id] depends on which action widget
      was clicked. *)

  (** {2:methods Methods} *)

  method add_action_widget : Widget.widget_t -> int -> unit
  (** Add an activatable widget to the action area of a [GtkInfoBar].

      This also connects a signal handler that will emit the
      [Gtk.InfoBar::response] signal on the message area when the widget is
      activated. The widget is appended to the end of the message areas action
      area. *)

  method add_button : string -> int -> Button.button_t
  (** Adds a button with the given text.

      Clicking the button will emit the [Gtk.InfoBar::response] signal with the
      given response_id. The button is appended to the end of the info bar's
      action area. The button widget is returned, but usually you don't need it.
  *)

  method add_child : Widget.widget_t -> unit
  (** Adds a widget to the content area of the info bar. *)

  method get_message_type : unit -> Enums.messagetype
  (** Returns the message type of the message area. *)

  method get_revealed : unit -> bool
  (** Returns whether the info bar is currently revealed. *)

  method get_show_close_button : unit -> bool
  (** Returns whether the widget will display a standard close button. *)

  method remove_action_widget : Widget.widget_t -> unit
  (** Removes a widget from the action area of [info_bar].

      The widget must have been put there by a call to
      [Gtk.InfoBar.add_action_widget] or [Gtk.InfoBar.add_button]. *)

  method remove_child : Widget.widget_t -> unit
  (** Removes a widget from the content area of the info bar. *)

  method response : int -> unit
  (** Emits the “response” signal with the given [response_id]. *)

  method set_default_response : int -> unit
  (** Sets the last widget in the info bar’s action area with the given
      response_id as the default widget for the dialog.

      Pressing “Enter” normally activates the default widget.

      Note that this function currently requires [info_bar] to be added to a
      widget hierarchy. *)

  method set_message_type : Enums.messagetype -> unit
  (** Sets the message type of the message area.

      GTK uses this type to determine how the message is displayed. *)

  method set_response_sensitive : int -> bool -> unit
  (** Sets the sensitivity of action widgets for [response_id].

      Calls [gtk_widget_set_sensitive (widget, setting)] for each widget in the
      info bars’s action area with the given [response_id]. A convenient way to
      sensitize/desensitize buttons. *)

  method set_revealed : bool -> unit
  (** Sets whether the [GtkInfoBar] is revealed.

      Changing this will make [info_bar] reveal or conceal itself via a sliding
      transition.

      Note: this does not show or hide [info_bar] in the [Gtk.Widget:visible]
      sense, so revealing has no effect if [Gtk.Widget:visible] is [false]. *)

  method set_show_close_button : bool -> unit
  (** If true, a standard close button is shown.

      When clicked it emits the response [GTK_RESPONSE_CLOSE]. *)

  (** {2:conversions Conversions} *)

  method as_info_bar : Raw.Info_bar.t
end

(* High-level class for InfoBar *)
class info_bar (obj : Raw.Info_bar.t) : info_bar_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)

    method on_close ?(after = false) ~callback () =
      Raw.Info_bar.on_close ~after self#as_info_bar ~callback

    method on_response ?(after = false) ~callback () =
      Raw.Info_bar.on_response ~after self#as_info_bar ~callback

    method add_action_widget : Widget.widget_t -> int -> unit =
      fun child response_id ->
        let child = child#as_widget in
        Raw.Info_bar.add_action_widget obj child response_id

    method add_button : string -> int -> Button.button_t =
      fun button_text response_id ->
        new Button.button (Raw.Info_bar.add_button obj button_text response_id)

    method add_child : Widget.widget_t -> unit =
      fun widget ->
        let widget = widget#as_widget in
        Raw.Info_bar.add_child obj widget

    method get_message_type : unit -> Enums.messagetype =
      fun () -> Raw.Info_bar.get_message_type obj

    method get_revealed : unit -> bool = fun () -> Raw.Info_bar.get_revealed obj

    method get_show_close_button : unit -> bool =
      fun () -> Raw.Info_bar.get_show_close_button obj

    method remove_action_widget : Widget.widget_t -> unit =
      fun widget ->
        let widget = widget#as_widget in
        Raw.Info_bar.remove_action_widget obj widget

    method remove_child : Widget.widget_t -> unit =
      fun widget ->
        let widget = widget#as_widget in
        Raw.Info_bar.remove_child obj widget

    method response : int -> unit =
      fun response_id -> Raw.Info_bar.response obj response_id

    method set_default_response : int -> unit =
      fun response_id -> Raw.Info_bar.set_default_response obj response_id

    method set_message_type : Enums.messagetype -> unit =
      fun message_type -> Raw.Info_bar.set_message_type obj message_type

    method set_response_sensitive : int -> bool -> unit =
      fun response_id setting ->
        Raw.Info_bar.set_response_sensitive obj response_id setting

    method set_revealed : bool -> unit =
      fun revealed -> Raw.Info_bar.set_revealed obj revealed

    method set_show_close_button : bool -> unit =
      fun setting -> Raw.Info_bar.set_show_close_button obj setting

    method as_info_bar = obj
  end

let new_ () : info_bar_t = new info_bar (Raw.Info_bar.new_ ())
