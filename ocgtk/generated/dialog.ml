class type dialog_t = object
  inherit Application_and__window_and__window_group.window_t

  (** {2:signals Signals} *)

  method on_close :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user uses a keybinding to close the dialog.

      This is a keybinding signal.

      The default binding for this signal is the Escape key. *)

  method on_response :
    ?after:bool ->
    callback:(response_id:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when an action widget is clicked.

      The signal is also emitted when the dialog receives a delete event, and
      when [Gtk.Dialog.response] is called. On a delete event, the response ID
      is [GTK_RESPONSE_DELETE_EVENT]. Otherwise, it depends on which action
      widget was clicked. *)

  (** {2:methods Methods} *)

  method add_action_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int ->
    unit
  (** Adds an activatable widget to the action area of a [GtkDialog].

      GTK connects a signal handler that will emit the [Gtk.Dialog::response]
      signal on the dialog when the widget is activated. The widget is appended
      to the end of the dialog’s action area.

      If you want to add a non-activatable widget, simply pack it into the
      [action_area] field of the [GtkDialog] struct. *)

  method add_button :
    string ->
    int ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
  (** Adds a button with the given text.

      GTK arranges things so that clicking the button will emit the
      [Gtk.Dialog::response] signal with the given [response_id]. The button is
      appended to the end of the dialog’s action area. The button widget is
      returned, but usually you don’t need it. *)

  method get_content_area : unit -> Box.box_t
  (** Returns the content area of [dialog]. *)

  method get_header_bar : unit -> Header_bar.header_bar_t
  (** Returns the header bar of [dialog].

      Note that the headerbar is only used by the dialog if the
      [Gtk.Dialog:use-header-bar] property is [TRUE]. *)

  method get_response_for_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int
  (** Gets the response id of a widget in the action area of a dialog. *)

  method get_widget_for_response :
    int ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the widget button that uses the given response ID in the action area
      of a dialog. *)

  method response : int -> unit
  (** Emits the ::response signal with the given response ID.

      Used to indicate that the user has responded to the dialog in some way. *)

  method set_default_response : int -> unit
  (** Sets the default widget for the dialog based on the response ID.

      Pressing “Enter” normally activates the default widget. *)

  method set_response_sensitive : int -> bool -> unit
  (** A convenient way to sensitize/desensitize dialog buttons.

      Calls [gtk_widget_set_sensitive (widget, @setting)] for each widget in the
      dialog’s action area with the given [response_id]. *)

  (** {2:properties Properties} *)

  method use_header_bar : int
  [@@ocaml.doc
    "[TRUE] if the dialog uses a headerbar for action buttons\n\
     instead of the action-area.\n\n\
     For technical reasons, this property is declared as an integer\n\
     property, but you should only set it to [TRUE] or [FALSE].\n\n\
     {b Creating a dialog with headerbar}\n\n\
     Builtin [GtkDialog] subclasses such as [Gtk.ColorChooserDialog]\n\
     set this property according to platform conventions (using the\n\
     [Gtk.Settings:gtk-dialogs-use-header] setting).\n\n\
     Here is how you can achieve the same:\n\n\
     {[\n\
     g_object_get (settings, \"gtk-dialogs-use-header\", &header, NULL);\n\
     dialog = g_object_new (GTK_TYPE_DIALOG, header, TRUE, NULL);\n\
     ]}"]

  (** {2:conversions Conversions} *)

  method as_dialog : Raw.Dialog.t
end

(* High-level class for Dialog *)
class dialog (obj : Raw.Dialog.t) : dialog_t =
  object (self)
    inherit
      Application_and__window_and__window_group.window (obj :> Raw.Window.t)

    method on_close ?(after = false) ~callback () =
      Raw.Dialog.on_close ~after self#as_dialog ~callback

    method on_response ?(after = false) ~callback () =
      Raw.Dialog.on_response ~after self#as_dialog ~callback

    method add_action_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        int ->
        unit =
      fun child response_id ->
        let child = child#as_widget in
        Raw.Dialog.add_action_widget obj child response_id

    method add_button :
        string ->
        int ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t =
      fun button_text response_id ->
        new
          Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
          .widget
          (Raw.Dialog.add_button obj button_text response_id)

    method get_content_area : unit -> Box.box_t =
      fun () -> new Box.box (Raw.Dialog.get_content_area obj)

    method get_header_bar : unit -> Header_bar.header_bar_t =
      fun () -> new Header_bar.header_bar (Raw.Dialog.get_header_bar obj)

    method get_response_for_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        int =
      fun widget ->
        let widget = widget#as_widget in
        Raw.Dialog.get_response_for_widget obj widget

    method get_widget_for_response :
        int ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun response_id ->
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
          (Raw.Dialog.get_widget_for_response obj response_id)

    method response : int -> unit =
      fun response_id -> Raw.Dialog.response obj response_id

    method set_default_response : int -> unit =
      fun response_id -> Raw.Dialog.set_default_response obj response_id

    method set_response_sensitive : int -> bool -> unit =
      fun response_id setting ->
        Raw.Dialog.set_response_sensitive obj response_id setting

    method use_header_bar = Raw.Dialog.get_use_header_bar obj
    method as_dialog = obj
  end

let new_ () : dialog_t = new dialog (Raw.Dialog.new_ ())
