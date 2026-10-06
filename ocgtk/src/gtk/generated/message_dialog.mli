(* GENERATED CODE - DO NOT EDIT *)
(* MessageDialog: MessageDialog *)

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
 the message area as an internal child with the name “message_area”."]

type t =
  [ `message_dialog
  | `dialog
  | `window
  | `widget
  | `initially_unowned
  | `object_ ]
  Gobject.obj

(* Methods *)

external set_markup : t -> string -> unit = "ml_gtk_message_dialog_set_markup"
(** Sets the text of the message dialog. *)

external get_message_area :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t = "ml_gtk_message_dialog_get_message_area"
(** Returns the message area of the dialog.

    This is the box where the dialog’s primary and secondary labels are packed.
    You can add your own extra content to that box and it will appear below
    those labels. See [Gtk.Dialog.get_content_area] for the corresponding
    function in the parent [Gtk.Dialog]. *)

(* Properties *)

external get_message_type : t -> Gtk_enums.messagetype
  = "ml_gtk_message_dialog_get_message_type"
(** Get property: message-type *)

external set_message_type : t -> Gtk_enums.messagetype -> unit
  = "ml_gtk_message_dialog_set_message_type"
(** Set property: message-type *)

external get_secondary_text : t -> string
  = "ml_gtk_message_dialog_get_secondary_text"
(** Get property: secondary-text *)

external set_secondary_text : t -> string -> unit
  = "ml_gtk_message_dialog_set_secondary_text"
(** Set property: secondary-text *)

external get_secondary_use_markup : t -> bool
  = "ml_gtk_message_dialog_get_secondary_use_markup"
(** Get property: secondary-use-markup *)

external set_secondary_use_markup : t -> bool -> unit
  = "ml_gtk_message_dialog_set_secondary_use_markup"
(** Set property: secondary-use-markup *)

external get_text : t -> string = "ml_gtk_message_dialog_get_text"
(** Get property: text *)

external set_text : t -> string -> unit = "ml_gtk_message_dialog_set_text"
(** Set property: text *)

external get_use_markup : t -> bool = "ml_gtk_message_dialog_get_use_markup"
(** Get property: use-markup *)

external set_use_markup : t -> bool -> unit
  = "ml_gtk_message_dialog_set_use_markup"
(** Set property: use-markup *)
