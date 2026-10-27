[@@@ocaml.text
"[GtkMessageDialog] presents a dialog with some message text.\n\n\
 An example GtkMessageDialog\n\n\
 It’s simply a convenience widget; you could construct the equivalent of\n\
 [GtkMessageDialog] from [GtkDialog] without too much effort, but\n\
 [GtkMessageDialog] saves typing.\n\n\
 The easiest way to do a modal message dialog is to use the [GTK_DIALOG_MODAL]\n\
 flag, which will call [Gtk.Window.set_modal] internally. The dialog will\n\
 prevent interaction with the parent window until it's hidden or destroyed.\n\
 You can use the [Gtk.Dialog::response] signal to know when the user\n\
 dismissed the dialog.\n\n\
 An example for using a modal dialog:\n\n\
 {[\n\
 GtkDialogFlags flags = GTK_DIALOG_DESTROY_WITH_PARENT | GTK_DIALOG_MODAL;\n\
 dialog = gtk_message_dialog_new (parent_window,\n\
\                                 flags,\n\
\                                 GTK_MESSAGE_ERROR,\n\
\                                 GTK_BUTTONS_CLOSE,\n\
\                                 \"Error reading “%s”: %s\",\n\
\                                 filename,\n\
\                                 g_strerror (errno));\n\
 // Destroy the dialog when the user responds to it\n\
 // (e.g. clicks a button)\n\n\
 g_signal_connect (dialog, \"response\",\n\
\                  G_CALLBACK (gtk_window_destroy),\n\
\                  NULL);\n\
 ]}\n\n\
 You might do a non-modal [GtkMessageDialog] simply by omitting the\n\
 [GTK_DIALOG_MODAL] flag:\n\n\
 {[\n\
 GtkDialogFlags flags = GTK_DIALOG_DESTROY_WITH_PARENT;\n\
 dialog = gtk_message_dialog_new (parent_window,\n\
\                                 flags,\n\
\                                 GTK_MESSAGE_ERROR,\n\
\                                 GTK_BUTTONS_CLOSE,\n\
\                                 \"Error reading “%s”: %s\",\n\
\                                 filename,\n\
\                                 g_strerror (errno));\n\n\
 // Destroy the dialog when the user responds to it\n\
 // (e.g. clicks a button)\n\
 g_signal_connect (dialog, \"response\",\n\
\                  G_CALLBACK (gtk_window_destroy),\n\
\                  NULL);\n\
 ]}\n\n\
 {b GtkMessageDialog as GtkBuildable}\n\n\
 The [GtkMessageDialog] implementation of the [GtkBuildable] interface exposes\n\
 the message area as an internal child with the name “message_area”.\n\n\
 Its methods, signals and properties are on {!class-type-message_dialog_t}. \
 The functions it is built on are in {!Ocgtk.Raw.Message_dialog}."]

(** The methods, signals and properties of a [GtkMessageDialog]. *)
class type message_dialog_t = object
  inherit Dialog.dialog_t

  method get_message_area :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
  (** Returns the message area of the dialog.

      This is the box where the dialog’s primary and secondary labels are
      packed. You can add your own extra content to that box and it will appear
      below those labels. See [Gtk.Dialog.get_content_area] for the
      corresponding function in the parent [Gtk.Dialog]. *)

  method set_markup : string -> unit
  (** Sets the text of the message dialog. *)

  method message_type : Enums.messagetype
  method set_message_type : Enums.messagetype -> unit
  method secondary_text : string
  method set_secondary_text : string -> unit
  method secondary_use_markup : bool
  method set_secondary_use_markup : bool -> unit
  method text : string
  method set_text : string -> unit
  method use_markup : bool
  method set_use_markup : bool -> unit
  method as_message_dialog : Raw.Message_dialog.t
end

class message_dialog : Raw.Message_dialog.t -> message_dialog_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Message_dialog.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkMessageDialog], give one already wrapped. *)
