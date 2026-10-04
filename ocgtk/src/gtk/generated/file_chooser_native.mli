(* GENERATED CODE - DO NOT EDIT *)
(* FileChooserNative: FileChooserNative *)

[@@@ocaml.text
"[GtkFileChooserNative] is an abstraction of a dialog suitable\n\
 for use with “File Open” or “File Save as” commands.\n\n\
 By default, this just uses a [GtkFileChooserDialog] to implement\n\
 the actual dialog. However, on some platforms, such as Windows and\n\
 macOS, the native platform file chooser is used instead. When the\n\
 application is running in a sandboxed environment without direct\n\
 filesystem access (such as Flatpak), [GtkFileChooserNative] may call\n\
 the proper APIs (portals) to let the user choose a file and make it\n\
 available to the application.\n\n\
 While the API of [GtkFileChooserNative] closely mirrors [GtkFileChooserDialog],\n\
 the main difference is that there is no access to any [GtkWindow] or \
 [GtkWidget]\n\
 for the dialog. This is required, as there may not be one in the case of a\n\
 platform native dialog.\n\n\
 Showing, hiding and running the dialog is handled by the\n\
 [Gtk.NativeDialog] functions.\n\n\
 Note that unlike [GtkFileChooserDialog], [GtkFileChooserNative] objects\n\
 are not toplevel widgets, and GTK does not keep them alive. It is your\n\
 responsibility to keep a reference until you are done with the\n\
 object.\n\n\
 {b Typical usage}\n\n\
 In the simplest of cases, you can the following code to use\n\
 [GtkFileChooserNative] to select a file for opening:\n\n\
 {[\n\
 static void\n\
 on_response (GtkNativeDialog *native,\n\
\             int              response)\n\
 {\n\
\  if (response == GTK_RESPONSE_ACCEPT)\n\
\    {\n\
\      GtkFileChooser *chooser = GTK_FILE_CHOOSER (native);\n\
\      GFile *file = gtk_file_chooser_get_file (chooser);\n\n\
\      open_file (file);\n\n\
\      g_object_unref (file);\n\
\    }\n\n\
\  g_object_unref (native);\n\
 }\n\n\
\  // ...\n\
\  GtkFileChooserNative *native;\n\
\  GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_OPEN;\n\n\
\  native = gtk_file_chooser_native_new (\"Open File\",\n\
\                                        parent_window,\n\
\                                        action,\n\
\                                        \"_Open\",\n\
\                                        \"_Cancel\");\n\n\
\  g_signal_connect (native, \"response\", G_CALLBACK (on_response), NULL);\n\
\  gtk_native_dialog_show (GTK_NATIVE_DIALOG (native));\n\
 ]}\n\n\
 To use a [GtkFileChooserNative] for saving, you can use this:\n\n\
 {[\n\
 static void\n\
 on_response (GtkNativeDialog *native,\n\
\             int              response)\n\
 {\n\
\  if (response == GTK_RESPONSE_ACCEPT)\n\
\    {\n\
\      GtkFileChooser *chooser = GTK_FILE_CHOOSER (native);\n\
\      GFile *file = gtk_file_chooser_get_file (chooser);\n\n\
\      save_to_file (file);\n\n\
\      g_object_unref (file);\n\
\    }\n\n\
\  g_object_unref (native);\n\
 }\n\n\
\  // ...\n\
\  GtkFileChooserNative *native;\n\
\  GtkFileChooser *chooser;\n\
\  GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_SAVE;\n\n\
\  native = gtk_file_chooser_native_new (\"Save File\",\n\
\                                        parent_window,\n\
\                                        action,\n\
\                                        \"_Save\",\n\
\                                        \"_Cancel\");\n\
\  chooser = GTK_FILE_CHOOSER (native);\n\n\
\  if (user_edited_a_new_document)\n\
\    gtk_file_chooser_set_current_name (chooser, _(\"Untitled document\"));\n\
\  else\n\
\    gtk_file_chooser_set_file (chooser, existing_file, NULL);\n\n\
\  g_signal_connect (native, \"response\", G_CALLBACK (on_response), NULL);\n\
\  gtk_native_dialog_show (GTK_NATIVE_DIALOG (native));\n\
 ]}\n\n\
 For more information on how to best set up a file dialog,\n\
 see the [Gtk.FileChooserDialog] documentation.\n\n\
 {b Response Codes}\n\n\
 [GtkFileChooserNative] inherits from [Gtk.NativeDialog],\n\
 which means it will return [GTK_RESPONSE_ACCEPT] if the user accepted,\n\
 and [GTK_RESPONSE_CANCEL] if he pressed cancel. It can also return\n\
 [GTK_RESPONSE_DELETE_EVENT] if the window was unexpectedly closed.\n\n\
 {b Differences from [GtkFileChooserDialog]}\n\n\
 There are a few things in the [Gtk.FileChooser] interface that\n\
 are not possible to use with [GtkFileChooserNative], as such use would\n\
 prohibit the use of a native dialog.\n\n\
 No operations that change the dialog work while the dialog is visible.\n\
 Set all the properties that are required before showing the dialog.\n\n\
 {b Win32 details}\n\n\
 On windows the [IFileDialog] implementation (added in Windows Vista) is\n\
 used. It supports many of the features that [GtkFileChooser] has, but\n\
 there are some things it does not handle:\n\n\
 - Any [Gtk.FileFilter] added using a mimetype\n\n\
 If any of these features are used the regular [GtkFileChooserDialog]\n\
 will be used in place of the native one.\n\n\
 {b Portal details}\n\n\
 When the [org.freedesktop.portal.FileChooser] portal is available on\n\
 the session bus, it is used to bring up an out-of-process file chooser.\n\
 Depending on the kind of session the application is running in, this may\n\
 or may not be a GTK file chooser.\n\n\
 {b macOS details}\n\n\
 On macOS the [NSSavePanel] and [NSOpenPanel] classes are used to provide\n\
 native file chooser dialogs. Some features provided by [GtkFileChooser]\n\
 are not supported:\n\n\
 - Shortcut folders."]

type t = [ `file_chooser_native | `native_dialog | `object_ ] Gobject.obj

external new_ :
  string option ->
  Application_and__window_and__window_group.Window.t option ->
  Gtk_enums.filechooseraction ->
  string option ->
  string option ->
  t = "ml_gtk_file_chooser_native_new"
(** Create a new FileChooserNative *)

(* Methods *)

external set_cancel_label : t -> string option -> unit
  = "ml_gtk_file_chooser_native_set_cancel_label"
(** Sets the custom label text for the cancel button.

    If characters in [label] are preceded by an underscore, they are underlined.
    If you need a literal underscore character in a label, use “__” (two
    underscores). The first underlined character represents a keyboard
    accelerator called a mnemonic.

    Pressing Alt and that key should activate the button. *)

external set_accept_label : t -> string option -> unit
  = "ml_gtk_file_chooser_native_set_accept_label"
(** Sets the custom label text for the accept button.

    If characters in [label] are preceded by an underscore, they are underlined.
    If you need a literal underscore character in a label, use “__” (two
    underscores). The first underlined character represents a keyboard
    accelerator called a mnemonic.

    Pressing Alt and that key should activate the button. *)

external get_cancel_label : t -> string option
  = "ml_gtk_file_chooser_native_get_cancel_label"
(** Retrieves the custom label text for the cancel button. *)

external get_accept_label : t -> string option
  = "ml_gtk_file_chooser_native_get_accept_label"
(** Retrieves the custom label text for the accept button. *)

(* Properties *)
