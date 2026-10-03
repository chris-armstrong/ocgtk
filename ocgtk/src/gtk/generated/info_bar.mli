(* GENERATED CODE - DO NOT EDIT *)
(* InfoBar: InfoBar *)

(** [GtkInfoBar] can be used to show messages to the user without a dialog.

    An example GtkInfoBar

    It is often temporarily shown at the top or bottom of a document. In
    contrast to [Gtk.Dialog], which has an action area at the bottom,
    [GtkInfoBar] has an action area at the side.

    The API of [GtkInfoBar] is very similar to [GtkDialog], allowing you to add
    buttons to the action area with [Gtk.InfoBar.add_button] or
    [Gtk.InfoBar.new_with_buttons]. The sensitivity of action widgets can be
    controlled with [Gtk.InfoBar.set_response_sensitive].

    To add widgets to the main content area of a [GtkInfoBar], use
    [Gtk.InfoBar.add_child].

    Similar to [Gtk.MessageDialog], the contents of a [GtkInfoBar] can by
    classified as error message, warning, informational message, etc, by using
    [Gtk.InfoBar.set_message_type]. GTK may use the message type to determine
    how the message is displayed.

    A simple example for using a [GtkInfoBar]:

    {[
    GtkWidget *message_label;
    GtkWidget *widget;
    GtkWidget *grid;
    GtkInfoBar *bar;

    // set up info bar
    widget = gtk_info_bar_new ();
    bar = GTK_INFO_BAR (widget);
    grid = gtk_grid_new ();

    message_label = gtk_label_new (“”);
    gtk_info_bar_add_child (bar, message_label);
    gtk_info_bar_add_button (bar,
                             _(“_OK”),
                             GTK_RESPONSE_OK);
    g_signal_connect (bar,
                      “response”,
                      G_CALLBACK (gtk_widget_hide),
                      NULL);
    gtk_grid_attach (GTK_GRID (grid),
                     widget,
                     0, 2, 1, 1);

    // ...

    // show an error message
    gtk_label_set_text (GTK_LABEL (message_label), “An error occurred!”);
    gtk_info_bar_set_message_type (bar, GTK_MESSAGE_ERROR);
    gtk_widget_show (bar);
    ]}

    {b GtkInfoBar as GtkBuildable}

    [GtkInfoBar] supports a custom [<action-widgets>] element, which can contain
    multiple [<action-widget>] elements. The “response” attribute specifies a
    numeric response, and the content of the element is the id of widget (which
    should be a child of the dialogs [action_area]).

    [GtkInfoBar] supports adding action widgets by specifying “action” as the
    “type” attribute of a [<child>] element. The widget will be added either to
    the action area. The response id has to be associated with the action widget
    using the [<action-widgets>] element.

    {b CSS nodes}

    [GtkInfoBar] has a single CSS node with name infobar. The node may get one
    of the style classes .info, .warning, .error or .question, depending on the
    message type. If the info bar shows a close button, that button will have
    the .close style class applied. *)

type t = [ `info_bar | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_info_bar_new"
(** Create a new InfoBar *)

(* Methods *)

external set_show_close_button : t -> bool -> unit
  = "ml_gtk_info_bar_set_show_close_button"
(** If true, a standard close button is shown.

    When clicked it emits the response [GTK_RESPONSE_CLOSE]. *)

external set_revealed : t -> bool -> unit = "ml_gtk_info_bar_set_revealed"
(** Sets whether the [GtkInfoBar] is revealed.

    Changing this will make [info_bar] reveal or conceal itself via a sliding
    transition.

    Note: this does not show or hide [info_bar] in the [Gtk.Widget:visible]
    sense, so revealing has no effect if [Gtk.Widget:visible] is [FALSE]. *)

external set_response_sensitive : t -> int -> bool -> unit
  = "ml_gtk_info_bar_set_response_sensitive"
(** Sets the sensitivity of action widgets for [response_id].

    Calls [gtk_widget_set_sensitive (widget, setting)] for each widget in the
    info bars’s action area with the given [response_id]. A convenient way to
    sensitize/desensitize buttons. *)

external set_message_type : t -> Gtk_enums.messagetype -> unit
  = "ml_gtk_info_bar_set_message_type"
(** Sets the message type of the message area.

    GTK uses this type to determine how the message is displayed. *)

external set_default_response : t -> int -> unit
  = "ml_gtk_info_bar_set_default_response"
(** Sets the last widget in the info bar’s action area with the given
    response_id as the default widget for the dialog.

    Pressing “Enter” normally activates the default widget.

    Note that this function currently requires [info_bar] to be added to a
    widget hierarchy. *)

external response : t -> int -> unit = "ml_gtk_info_bar_response"
(** Emits the “response” signal with the given [response_id]. *)

external remove_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  unit = "ml_gtk_info_bar_remove_child"
(** Removes a widget from the content area of the info bar. *)

external remove_action_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  unit = "ml_gtk_info_bar_remove_action_widget"
(** Removes a widget from the action area of [info_bar].

    The widget must have been put there by a call to
    [Gtk.InfoBar.add_action_widget] or [Gtk.InfoBar.add_button]. *)

external get_show_close_button : t -> bool
  = "ml_gtk_info_bar_get_show_close_button"
(** Returns whether the widget will display a standard close button. *)

external get_revealed : t -> bool = "ml_gtk_info_bar_get_revealed"
(** Returns whether the info bar is currently revealed. *)

external get_message_type : t -> Gtk_enums.messagetype
  = "ml_gtk_info_bar_get_message_type"
(** Returns the message type of the message area. *)

external add_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  unit = "ml_gtk_info_bar_add_child"
(** Adds a widget to the content area of the info bar. *)

external add_button : t -> string -> int -> Button.t
  = "ml_gtk_info_bar_add_button"
(** Adds a button with the given text.

    Clicking the button will emit the [Gtk.InfoBar::response] signal with the
    given response_id. The button is appended to the end of the info bar's
    action area. The button widget is returned, but usually you don't need it.
*)

external add_action_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  int ->
  unit = "ml_gtk_info_bar_add_action_widget"
(** Add an activatable widget to the action area of a [GtkInfoBar].

    This also connects a signal handler that will emit the
    [Gtk.InfoBar::response] signal on the message area when the widget is
    activated. The widget is appended to the end of the message areas action
    area. *)

(* Properties *)

val on_close :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

val on_response :
  ?after:bool ->
  t ->
  callback:(response_id:int -> unit) ->
  Gobject.Signal.handler_id
