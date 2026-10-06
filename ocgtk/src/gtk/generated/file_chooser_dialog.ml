(* GENERATED CODE - DO NOT EDIT *)
(* FileChooserDialog: FileChooserDialog *)

[@@@ocaml.text
"[GtkFileChooserDialog] is a dialog suitable for use with\n\
 “File Open” or “File Save” commands.\n\n\
 An example GtkFileChooserDialog\n\n\
 This widget works by putting a [Gtk.FileChooserWidget]\n\
 inside a [Gtk.Dialog]. It exposes the [Gtk.FileChooser]\n\
 interface, so you can use all of the [Gtk.FileChooser] functions\n\
 on the file chooser dialog as well as those for [Gtk.Dialog].\n\n\
 Note that [GtkFileChooserDialog] does not have any methods of its\n\
 own. Instead, you should use the functions that work on a\n\
 [Gtk.FileChooser].\n\n\
 If you want to integrate well with the platform you should use the\n\
 [Gtk.FileChooserNative] API, which will use a platform-specific\n\
 dialog if available and fall back to [GtkFileChooserDialog]\n\
 otherwise.\n\n\
 {b Typical usage}\n\n\
 In the simplest of cases, you can the following code to use\n\
 [GtkFileChooserDialog] to select a file for opening:\n\n\
 {[\n\
 static void\n\
 on_open_response (GtkDialog *dialog,\n\
\                  int        response)\n\
 {\n\
\  if (response == GTK_RESPONSE_ACCEPT)\n\
\    {\n\
\      GtkFileChooser *chooser = GTK_FILE_CHOOSER (dialog);\n\n\
\      g_autoptr(GFile) file = gtk_file_chooser_get_file (chooser);\n\n\
\      open_file (file);\n\
\    }\n\n\
\  gtk_window_destroy (GTK_WINDOW (dialog));\n\
 }\n\n\
\  // ...\n\
\  GtkWidget *dialog;\n\
\  GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_OPEN;\n\n\
\  dialog = gtk_file_chooser_dialog_new (\"Open File\",\n\
\                                        parent_window,\n\
\                                        action,\n\
\                                        _(\"_Cancel\"),\n\
\                                        GTK_RESPONSE_CANCEL,\n\
\                                        _(\"_Open\"),\n\
\                                        GTK_RESPONSE_ACCEPT,\n\
\                                        NULL);\n\n\
\  gtk_window_present (GTK_WINDOW (dialog));\n\n\
\  g_signal_connect (dialog, \"response\",\n\
\                    G_CALLBACK (on_open_response),\n\
\                    NULL);\n\
 ]}\n\n\
 To use a dialog for saving, you can use this:\n\n\
 {[\n\
 static void\n\
 on_save_response (GtkDialog *dialog,\n\
\                  int        response)\n\
 {\n\
\  if (response == GTK_RESPONSE_ACCEPT)\n\
\    {\n\
\      GtkFileChooser *chooser = GTK_FILE_CHOOSER (dialog);\n\n\
\      g_autoptr(GFile) file = gtk_file_chooser_get_file (chooser);\n\n\
\      save_to_file (file);\n\
\    }\n\n\
\  gtk_window_destroy (GTK_WINDOW (dialog));\n\
 }\n\n\
\  // ...\n\
\  GtkWidget *dialog;\n\
\  GtkFileChooser *chooser;\n\
\  GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_SAVE;\n\n\
\  dialog = gtk_file_chooser_dialog_new (\"Save File\",\n\
\                                        parent_window,\n\
\                                        action,\n\
\                                        _(\"_Cancel\"),\n\
\                                        GTK_RESPONSE_CANCEL,\n\
\                                        _(\"_Save\"),\n\
\                                        GTK_RESPONSE_ACCEPT,\n\
\                                        NULL);\n\
\  chooser = GTK_FILE_CHOOSER (dialog);\n\n\
\  if (user_edited_a_new_document)\n\
\    gtk_file_chooser_set_current_name (chooser, _(\"Untitled document\"));\n\
\  else\n\
\    gtk_file_chooser_set_file (chooser, existing_filename);\n\n\
\  gtk_window_present (GTK_WINDOW (dialog));\n\n\
\  g_signal_connect (dialog, \"response\",\n\
\                    G_CALLBACK (on_save_response),\n\
\                    NULL);\n\
 ]}\n\n\
 {b Setting up a file chooser dialog}\n\n\
 There are various cases in which you may need to use a \
 [GtkFileChooserDialog]:\n\n\
 - To select a file for opening, use [GTK_FILE_CHOOSER_ACTION_OPEN].\n\n\
 - To save a file for the first time, use [GTK_FILE_CHOOSER_ACTION_SAVE],\n\
 and suggest a name such as “Untitled” with\n\
 [Gtk.FileChooser.set_current_name].\n\n\
 - To save a file under a different name, use [GTK_FILE_CHOOSER_ACTION_SAVE],\n\
 and set the existing file with [Gtk.FileChooser.set_file].\n\n\
 - To choose a folder instead of a file, use \
 [GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER].\n\n\
 In general, you should only cause the file chooser to show a specific\n\
 folder when it is appropriate to use [Gtk.FileChooser.set_file],\n\
 i.e. when you are doing a “Save As” command and you already have a file\n\
 saved somewhere.\n\n\
 {b Response Codes}\n\n\
 [GtkFileChooserDialog] inherits from [Gtk.Dialog], so buttons that\n\
 go in its action area have response codes such as [GTK_RESPONSE_ACCEPT] and\n\
 [GTK_RESPONSE_CANCEL]. For example, you could call\n\
 [Gtk.FileChooserDialog.new] as follows:\n\n\
 {[\n\
 GtkWidget *dialog;\n\
 GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_OPEN;\n\n\
 dialog = gtk_file_chooser_dialog_new (\"Open File\",\n\
\                                      parent_window,\n\
\                                      action,\n\
\                                      _(\"_Cancel\"),\n\
\                                      GTK_RESPONSE_CANCEL,\n\
\                                      _(\"_Open\"),\n\
\                                      GTK_RESPONSE_ACCEPT,\n\
\                                      NULL);\n\
 ]}\n\n\
 This will create buttons for “Cancel” and “Open” that use predefined\n\
 response identifiers from [Gtk.ResponseType].  For most dialog\n\
 boxes you can use your own custom response codes rather than the\n\
 ones in [Gtk.ResponseType], but [GtkFileChooserDialog] assumes that\n\
 its “accept”-type action, e.g. an “Open” or “Save” button,\n\
 will have one of the following response codes:\n\n\
 - [GTK_RESPONSE_ACCEPT]\n\
 - [GTK_RESPONSE_OK]\n\
 - [GTK_RESPONSE_YES]\n\
 - [GTK_RESPONSE_APPLY]\n\n\
 This is because [GtkFileChooserDialog] must intercept responses and switch\n\
 to folders if appropriate, rather than letting the dialog terminate — the\n\
 implementation uses these known response codes to know which responses can\n\
 be blocked if appropriate.\n\n\
 To summarize, make sure you use a predefined response code\n\
 when you use [GtkFileChooserDialog] to ensure proper operation.\n\n\
 {b CSS nodes}\n\n\
 [GtkFileChooserDialog] has a single CSS node with the name [window] and style\n\
 class [.filechooser]."]

type t =
  [ `file_chooser_dialog
  | `dialog
  | `window
  | `widget
  | `initially_unowned
  | `object_ ]
  Gobject.obj

(* Methods *)
