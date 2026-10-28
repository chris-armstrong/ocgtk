[@@@ocaml.text
"[GtkInfoBar] can be used to show messages to the user without a dialog.\n\n\
 An example GtkInfoBar\n\n\
 It is often temporarily shown at the top or bottom of a document.\n\
 In contrast to [Gtk.Dialog], which has an action area at the\n\
 bottom, [GtkInfoBar] has an action area at the side.\n\n\
 The API of [GtkInfoBar] is very similar to [GtkDialog], allowing you\n\
 to add buttons to the action area with [Gtk.InfoBar.add_button]\n\
 or [Gtk.InfoBar.new_with_buttons]. The sensitivity of action widgets\n\
 can be controlled with [Gtk.InfoBar.set_response_sensitive].\n\n\
 To add widgets to the main content area of a [GtkInfoBar], use\n\
 [Gtk.InfoBar.add_child].\n\n\
 Similar to [Gtk.MessageDialog], the contents of a [GtkInfoBar]\n\
 can by classified as error message, warning, informational message, etc,\n\
 by using [Gtk.InfoBar.set_message_type]. GTK may use the message\n\
 type to determine how the message is displayed.\n\n\
 A simple example for using a [GtkInfoBar]:\n\n\
 {[\n\
 GtkWidget *message_label;\n\
 GtkWidget *widget;\n\
 GtkWidget *grid;\n\
 GtkInfoBar *bar;\n\n\
 // set up info bar\n\
 widget = gtk_info_bar_new ();\n\
 bar = GTK_INFO_BAR (widget);\n\
 grid = gtk_grid_new ();\n\n\
 message_label = gtk_label_new (\"\");\n\
 gtk_info_bar_add_child (bar, message_label);\n\
 gtk_info_bar_add_button (bar,\n\
\                         _(\"_OK\"),\n\
\                         GTK_RESPONSE_OK);\n\
 g_signal_connect (bar,\n\
\                  \"response\",\n\
\                  G_CALLBACK (gtk_widget_hide),\n\
\                  NULL);\n\
 gtk_grid_attach (GTK_GRID (grid),\n\
\                 widget,\n\
\                 0, 2, 1, 1);\n\n\
 // ...\n\n\
 // show an error message\n\
 gtk_label_set_text (GTK_LABEL (message_label), \"An error occurred!\");\n\
 gtk_info_bar_set_message_type (bar, GTK_MESSAGE_ERROR);\n\
 gtk_widget_show (bar);\n\
 ]}\n\n\
 {b GtkInfoBar as GtkBuildable}\n\n\
 [GtkInfoBar] supports a custom [<action-widgets>] element, which can contain\n\
 multiple [<action-widget>] elements. The “response” attribute specifies a\n\
 numeric response, and the content of the element is the id of widget\n\
 (which should be a child of the dialogs [action_area]).\n\n\
 [GtkInfoBar] supports adding action widgets by specifying “action” as\n\
 the “type” attribute of a [<child>] element. The widget will be added\n\
 either to the action area. The response id has to be associated\n\
 with the action widget using the [<action-widgets>] element.\n\n\
 {b CSS nodes}\n\n\
 [GtkInfoBar] has a single CSS node with name infobar. The node may get\n\
 one of the style classes .info, .warning, .error or .question, depending\n\
 on the message type.\n\
 If the info bar shows a close button, that button will have the .close\n\
 style class applied.\n\n\
 Its methods, signals and properties are on {!class-type-info_bar_t}. Its \
 constructors are under {!section-constructors}. The functions it is built on \
 are in {!Ocgtk.Raw.Info_bar}."]

(** The methods, signals and properties of a [InfoBar]. *)
class type info_bar_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

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

  method add_action_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int ->
    unit
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

  method add_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Adds a widget to the content area of the info bar. *)

  method get_message_type : unit -> Enums.messagetype
  (** Returns the message type of the message area. *)

  method get_revealed : unit -> bool
  (** Returns whether the info bar is currently revealed. *)

  method get_show_close_button : unit -> bool
  (** Returns whether the widget will display a standard close button. *)

  method remove_action_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Removes a widget from the action area of [info_bar].

      The widget must have been put there by a call to
      [Gtk.InfoBar.add_action_widget] or [Gtk.InfoBar.add_button]. *)

  method remove_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
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
      sense, so revealing has no effect if [Gtk.Widget:visible] is [FALSE]. *)

  method set_show_close_button : bool -> unit
  (** If true, a standard close button is shown.

      When clicked it emits the response [GTK_RESPONSE_CLOSE]. *)

  method as_info_bar : Raw.Info_bar.t
end

class info_bar : Raw.Info_bar.t -> info_bar_t
(** Wraps a raw handle of {!Ocgtk.Raw.Info_bar.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> info_bar_t
(** Creates a new [GtkInfoBar] object. *)
