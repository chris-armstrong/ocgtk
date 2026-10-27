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
 Its methods, signals and properties are on {!class-type-info_bar_t}. The \
 functions it is built on are in {!Ocgtk.Raw.Info_bar}."]

(** The methods, signals and properties of a [GtkInfoBar]. *)
class type info_bar_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_close :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_response :
    ?after:bool ->
    callback:(response_id:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method add_action_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int ->
    unit

  method add_button : string -> int -> Button.button_t

  method add_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method get_message_type : unit -> Enums.messagetype
  method get_revealed : unit -> bool
  method get_show_close_button : unit -> bool

  method remove_action_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method remove_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method response : int -> unit
  method set_default_response : int -> unit
  method set_message_type : Enums.messagetype -> unit
  method set_response_sensitive : int -> bool -> unit
  method set_revealed : bool -> unit
  method set_show_close_button : bool -> unit
  method as_info_bar : Raw.Info_bar.t
end

class info_bar : Raw.Info_bar.t -> info_bar_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Info_bar.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkInfoBar], give one already wrapped. *)

val new_ : unit -> info_bar_t
