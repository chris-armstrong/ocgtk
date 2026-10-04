(* GENERATED CODE - DO NOT EDIT *)
(* Dialog: Dialog *)

[@@@ocaml.text
"Dialogs are a convenient way to prompt the user for a small amount\n\
 of input.\n\n\
 An example GtkDialog\n\n\
 Typical uses are to display a message, ask a question, or anything else\n\
 that does not require extensive effort on the user’s part.\n\n\
 The main area of a [GtkDialog] is called the \"content area\", and is yours\n\
 to populate with widgets such a [GtkLabel] or [GtkEntry], to present\n\
 your information, questions, or tasks to the user.\n\n\
 In addition, dialogs allow you to add \"action widgets\". Most commonly,\n\
 action widgets are buttons. Depending on the platform, action widgets may\n\
 be presented in the header bar at the top of the window, or at the bottom\n\
 of the window. To add action widgets, create your [GtkDialog] using\n\
 [Gtk.Dialog.new_with_buttons], or use\n\
 [Gtk.Dialog.add_button], [Gtk.Dialog.add_buttons],\n\
 or [Gtk.Dialog.add_action_widget].\n\n\
 [GtkDialogs] uses some heuristics to decide whether to add a close\n\
 button to the window decorations. If any of the action buttons use\n\
 the response ID [GTK_RESPONSE_CLOSE] or [GTK_RESPONSE_CANCEL], the\n\
 close button is omitted.\n\n\
 Clicking a button that was added as an action widget will emit the\n\
 [Gtk.Dialog::response] signal with a response ID that you specified.\n\
 GTK will never assign a meaning to positive response IDs; these are\n\
 entirely user-defined. But for convenience, you can use the response\n\
 IDs in the [Gtk.ResponseType] enumeration (these all have values\n\
 less than zero). If a dialog receives a delete event, the\n\
 [Gtk.Dialog::response] signal will be emitted with the\n\
 [GTK_RESPONSE_DELETE_EVENT] response ID.\n\n\
 Dialogs are created with a call to [Gtk.Dialog.new] or\n\
 [Gtk.Dialog.new_with_buttons]. The latter is recommended; it allows\n\
 you to set the dialog title, some convenient flags, and add buttons.\n\n\
 A “modal” dialog (that is, one which freezes the rest of the application\n\
 from user input), can be created by calling [Gtk.Window.set_modal]\n\
 on the dialog. When using [Gtk.Dialog.new_with_buttons], you can also\n\
 pass the [GTK_DIALOG_MODAL] flag to make a dialog modal.\n\n\
 For the simple dialog in the following example, a [Gtk.MessageDialog]\n\
 would save some effort. But you’d need to create the dialog contents manually\n\
 if you had more than a simple message in the dialog.\n\n\
 An example for simple [GtkDialog] usage:\n\n\
 {[\n\
 // Function to open a dialog box with a message\n\
 void\n\
 quick_message (GtkWindow *parent, char *message)\n\
 {\n\
\ GtkWidget *dialog, *label, *content_area;\n\
\ GtkDialogFlags flags;\n\n\
\ // Create the widgets\n\
\ flags = GTK_DIALOG_DESTROY_WITH_PARENT;\n\
\ dialog = gtk_dialog_new_with_buttons (\"Message\",\n\
\                                       parent,\n\
\                                       flags,\n\
\                                       _(\"_OK\"),\n\
\                                       GTK_RESPONSE_NONE,\n\
\                                       NULL);\n\
\ content_area = gtk_dialog_get_content_area (GTK_DIALOG (dialog));\n\
\ label = gtk_label_new (message);\n\n\
\ // Ensure that the dialog box is destroyed when the user responds\n\n\
\ g_signal_connect_swapped (dialog,\n\
\                           \"response\",\n\
\                           G_CALLBACK (gtk_window_destroy),\n\
\                           dialog);\n\n\
\ // Add the label, and show everything we’ve added\n\n\
\ gtk_box_append (GTK_BOX (content_area), label);\n\
\ gtk_widget_show (dialog);\n\
 }\n\
 ]}\n\n\
 {b GtkDialog as GtkBuildable}\n\n\
 The [GtkDialog] implementation of the [GtkBuildable] interface exposes the\n\
 [content_area] as an internal child with the name “content_area”.\n\n\
 [GtkDialog] supports a custom [<action-widgets>] element, which can contain\n\
 multiple [<action-widget>] elements. The “response” attribute specifies a\n\
 numeric response, and the content of the element is the id of widget\n\
 (which should be a child of the dialogs [action_area]). To mark a response\n\
 as default, set the “default” attribute of the [<action-widget>] element\n\
 to true.\n\n\
 [GtkDialog] supports adding action widgets by specifying “action” as\n\
 the “type” attribute of a [<child>] element. The widget will be added\n\
 either to the action area or the headerbar of the dialog, depending\n\
 on the “use-header-bar” property. The response id has to be associated\n\
 with the action widget using the [<action-widgets>] element.\n\n\
 An example of a [GtkDialog] UI definition fragment:\n\n\
 {[\n\
 <object class=\"GtkDialog\" id=\"dialog1\">\n\
\  <child type=\"action\">\n\
\    <object class=\"GtkButton\" id=\"button_cancel\"/>\n\
\  </child>\n\
\  <child type=\"action\">\n\
\    <object class=\"GtkButton\" id=\"button_ok\">\n\
\    </object>\n\
\  </child>\n\
\  <action-widgets>\n\
\    <action-widget response=\"cancel\">button_cancel</action-widget>\n\
\    <action-widget response=\"ok\" default=\"true\">button_ok</action-widget>\n\
\  </action-widgets>\n\
 </object>\n\
 ]}\n\n\
 {b Accessibility}\n\n\
 [GtkDialog] uses the [GTK_ACCESSIBLE_ROLE_DIALOG] role."]

type t =
  [ `dialog | `window | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_dialog_new"
(** Create a new Dialog *)

(* Methods *)

external set_response_sensitive : t -> int -> bool -> unit
  = "ml_gtk_dialog_set_response_sensitive"
(** A convenient way to sensitize/desensitize dialog buttons.

    Calls [gtk_widget_set_sensitive (widget, @setting)] for each widget in the
    dialog’s action area with the given [response_id]. *)

external set_default_response : t -> int -> unit
  = "ml_gtk_dialog_set_default_response"
(** Sets the default widget for the dialog based on the response ID.

    Pressing “Enter” normally activates the default widget. *)

external response : t -> int -> unit = "ml_gtk_dialog_response"
(** Emits the ::response signal with the given response ID.

    Used to indicate that the user has responded to the dialog in some way. *)

external get_widget_for_response :
  t ->
  int ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_dialog_get_widget_for_response"
(** Gets the widget button that uses the given response ID in the action area of
    a dialog. *)

external get_response_for_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  int = "ml_gtk_dialog_get_response_for_widget"
(** Gets the response id of a widget in the action area of a dialog. *)

external get_header_bar : t -> Header_bar.t = "ml_gtk_dialog_get_header_bar"
(** Returns the header bar of [dialog].

    Note that the headerbar is only used by the dialog if the
    [Gtk.Dialog:use-header-bar] property is [TRUE]. *)

external get_content_area : t -> Box.t = "ml_gtk_dialog_get_content_area"
(** Returns the content area of [dialog]. *)

external add_button :
  t ->
  string ->
  int ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t = "ml_gtk_dialog_add_button"
(** Adds a button with the given text.

    GTK arranges things so that clicking the button will emit the
    [Gtk.Dialog::response] signal with the given [response_id]. The button is
    appended to the end of the dialog’s action area. The button widget is
    returned, but usually you don’t need it. *)

external add_action_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  int ->
  unit = "ml_gtk_dialog_add_action_widget"
(** Adds an activatable widget to the action area of a [GtkDialog].

    GTK connects a signal handler that will emit the [Gtk.Dialog::response]
    signal on the dialog when the widget is activated. The widget is appended to
    the end of the dialog’s action area.

    If you want to add a non-activatable widget, simply pack it into the
    [action_area] field of the [GtkDialog] struct. *)

(* Properties *)

external get_use_header_bar : t -> int = "ml_gtk_dialog_get_use_header_bar"
(** Get property: use-header-bar *)

val on_close :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

val on_response :
  ?after:bool ->
  t ->
  callback:(response_id:int -> unit) ->
  Gobject.Signal.handler_id
