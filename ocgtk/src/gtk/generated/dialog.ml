(* GENERATED CODE - DO NOT EDIT *)
(* Dialog: Dialog *)

(** Dialogs are a convenient way to prompt the user for a small amount of input.

    An example GtkDialog

    Typical uses are to display a message, ask a question, or anything else that
    does not require extensive effort on the user’s part.

    The main area of a [GtkDialog] is called the “content area”, and is yours to
    populate with widgets such a [GtkLabel] or [GtkEntry], to present your
    information, questions, or tasks to the user.

    In addition, dialogs allow you to add “action widgets”. Most commonly,
    action widgets are buttons. Depending on the platform, action widgets may be
    presented in the header bar at the top of the window, or at the bottom of
    the window. To add action widgets, create your [GtkDialog] using
    [Gtk.Dialog.new_with_buttons], or use [Gtk.Dialog.add_button],
    [Gtk.Dialog.add_buttons], or [Gtk.Dialog.add_action_widget].

    [GtkDialogs] uses some heuristics to decide whether to add a close button to
    the window decorations. If any of the action buttons use the response ID
    [GTK_RESPONSE_CLOSE] or [GTK_RESPONSE_CANCEL], the close button is omitted.

    Clicking a button that was added as an action widget will emit the
    [Gtk.Dialog::response] signal with a response ID that you specified. GTK
    will never assign a meaning to positive response IDs; these are entirely
    user-defined. But for convenience, you can use the response IDs in the
    [Gtk.ResponseType] enumeration (these all have values less than zero). If a
    dialog receives a delete event, the [Gtk.Dialog::response] signal will be
    emitted with the [GTK_RESPONSE_DELETE_EVENT] response ID.

    Dialogs are created with a call to [Gtk.Dialog.new] or
    [Gtk.Dialog.new_with_buttons]. The latter is recommended; it allows you to
    set the dialog title, some convenient flags, and add buttons.

    A “modal” dialog (that is, one which freezes the rest of the application
    from user input), can be created by calling [Gtk.Window.set_modal] on the
    dialog. When using [Gtk.Dialog.new_with_buttons], you can also pass the
    [GTK_DIALOG_MODAL] flag to make a dialog modal.

    For the simple dialog in the following example, a [Gtk.MessageDialog] would
    save some effort. But you’d need to create the dialog contents manually if
    you had more than a simple message in the dialog.

    An example for simple [GtkDialog] usage:

    {[
    // Function to open a dialog box with a message
    void
    quick_message (GtkWindow *parent, char *message)
    {
     GtkWidget *dialog, *label, *content_area;
     GtkDialogFlags flags;

     // Create the widgets
     flags = GTK_DIALOG_DESTROY_WITH_PARENT;
     dialog = gtk_dialog_new_with_buttons (“Message”,
                                           parent,
                                           flags,
                                           _(“_OK”),
                                           GTK_RESPONSE_NONE,
                                           NULL);
     content_area = gtk_dialog_get_content_area (GTK_DIALOG (dialog));
     label = gtk_label_new (message);

     // Ensure that the dialog box is destroyed when the user responds

     g_signal_connect_swapped (dialog,
                               “response”,
                               G_CALLBACK (gtk_window_destroy),
                               dialog);

     // Add the label, and show everything we’ve added

     gtk_box_append (GTK_BOX (content_area), label);
     gtk_widget_show (dialog);
    }
    ]}

    {b GtkDialog as GtkBuildable}

    The [GtkDialog] implementation of the [GtkBuildable] interface exposes the
    [content_area] as an internal child with the name “content_area”.

    [GtkDialog] supports a custom [<action-widgets>] element, which can contain
    multiple [<action-widget>] elements. The “response” attribute specifies a
    numeric response, and the content of the element is the id of widget (which
    should be a child of the dialogs [action_area]). To mark a response as
    default, set the “default” attribute of the [<action-widget>] element to
    true.

    [GtkDialog] supports adding action widgets by specifying “action” as the
    “type” attribute of a [<child>] element. The widget will be added either to
    the action area or the headerbar of the dialog, depending on the
    “use-header-bar” property. The response id has to be associated with the
    action widget using the [<action-widgets>] element.

    An example of a [GtkDialog] UI definition fragment:

    {[
    <object class=”GtkDialog” id=”dialog1”>
      <child type=”action”>
        <object class=”GtkButton” id=”button_cancel”/>
      </child>
      <child type=”action”>
        <object class=”GtkButton” id=”button_ok”>
        </object>
      </child>
      <action-widgets>
        <action-widget response=”cancel”>button_cancel</action-widget>
        <action-widget response=”ok” default=”true”>button_ok</action-widget>
      </action-widgets>
    </object>
    ]}

    {b Accessibility}

    [GtkDialog] uses the [GTK_ACCESSIBLE_ROLE_DIALOG] role. *)

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

let on_close ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"close" ~callback
    ~after:(Option.value after ~default:false)

let on_response ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let response_id =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_int v
        in
        callback ~response_id)
  in
  Gobject.Signal.connect obj ~name:"response" ~callback:closure
    ~after:(Option.value after ~default:false)
