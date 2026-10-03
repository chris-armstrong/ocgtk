(* GENERATED CODE - DO NOT EDIT *)
(* FileChooserNative: FileChooserNative *)

type t = [ `file_chooser_native | `native_dialog | `object_ ] Gobject.obj
(** [GtkFileChooserNative] is an abstraction of a dialog suitable for use with
    “File Open” or “File Save as” commands.

    By default, this just uses a [GtkFileChooserDialog] to implement the actual
    dialog. However, on some platforms, such as Windows and macOS, the native
    platform file chooser is used instead. When the application is running in a
    sandboxed environment without direct filesystem access (such as Flatpak),
    [GtkFileChooserNative] may call the proper APIs (portals) to let the user
    choose a file and make it available to the application.

    While the API of [GtkFileChooserNative] closely mirrors
    [GtkFileChooserDialog], the main difference is that there is no access to
    any [GtkWindow] or [GtkWidget] for the dialog. This is required, as there
    may not be one in the case of a platform native dialog.

    Showing, hiding and running the dialog is handled by the [Gtk.NativeDialog]
    functions.

    Note that unlike [GtkFileChooserDialog], [GtkFileChooserNative] objects are
    not toplevel widgets, and GTK does not keep them alive. It is your
    responsibility to keep a reference until you are done with the object.

    {b Typical usage}

    In the simplest of cases, you can the following code to use
    [GtkFileChooserNative] to select a file for opening:

    {[
    static void
    on_response (GtkNativeDialog *native,
                 int              response)
    {
      if (response == GTK_RESPONSE_ACCEPT)
        {
          GtkFileChooser *chooser = GTK_FILE_CHOOSER (native);
          GFile *file = gtk_file_chooser_get_file (chooser);

          open_file (file);

          g_object_unref (file);
        }

      g_object_unref (native);
    }

      // ...
      GtkFileChooserNative *native;
      GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_OPEN;

      native = gtk_file_chooser_native_new (“Open File”,
                                            parent_window,
                                            action,
                                            “_Open”,
                                            “_Cancel”);

      g_signal_connect (native, “response”, G_CALLBACK (on_response), NULL);
      gtk_native_dialog_show (GTK_NATIVE_DIALOG (native));
    ]}

    To use a [GtkFileChooserNative] for saving, you can use this:

    {[
    static void
    on_response (GtkNativeDialog *native,
                 int              response)
    {
      if (response == GTK_RESPONSE_ACCEPT)
        {
          GtkFileChooser *chooser = GTK_FILE_CHOOSER (native);
          GFile *file = gtk_file_chooser_get_file (chooser);

          save_to_file (file);

          g_object_unref (file);
        }

      g_object_unref (native);
    }

      // ...
      GtkFileChooserNative *native;
      GtkFileChooser *chooser;
      GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_SAVE;

      native = gtk_file_chooser_native_new (“Save File”,
                                            parent_window,
                                            action,
                                            “_Save”,
                                            “_Cancel”);
      chooser = GTK_FILE_CHOOSER (native);

      if (user_edited_a_new_document)
        gtk_file_chooser_set_current_name (chooser, _(“Untitled document”));
      else
        gtk_file_chooser_set_file (chooser, existing_file, NULL);

      g_signal_connect (native, “response”, G_CALLBACK (on_response), NULL);
      gtk_native_dialog_show (GTK_NATIVE_DIALOG (native));
    ]}

    For more information on how to best set up a file dialog, see the
    [Gtk.FileChooserDialog] documentation.

    {b Response Codes}

    [GtkFileChooserNative] inherits from [Gtk.NativeDialog], which means it will
    return [GTK_RESPONSE_ACCEPT] if the user accepted, and [GTK_RESPONSE_CANCEL]
    if he pressed cancel. It can also return [GTK_RESPONSE_DELETE_EVENT] if the
    window was unexpectedly closed.

    {b Differences from [GtkFileChooserDialog]}

    There are a few things in the [Gtk.FileChooser] interface that are not
    possible to use with [GtkFileChooserNative], as such use would prohibit the
    use of a native dialog.

    No operations that change the dialog work while the dialog is visible. Set
    all the properties that are required before showing the dialog.

    {b Win32 details}

    On windows the [IFileDialog] implementation (added in Windows Vista) is
    used. It supports many of the features that [GtkFileChooser] has, but there
    are some things it does not handle:

    - Any [Gtk.FileFilter] added using a mimetype

    If any of these features are used the regular [GtkFileChooserDialog] will be
    used in place of the native one.

    {b Portal details}

    When the [org.freedesktop.portal.FileChooser] portal is available on the
    session bus, it is used to bring up an out-of-process file chooser.
    Depending on the kind of session the application is running in, this may or
    may not be a GTK file chooser.

    {b macOS details}

    On macOS the [NSSavePanel] and [NSOpenPanel] classes are used to provide
    native file chooser dialogs. Some features provided by [GtkFileChooser] are
    not supported:

    - Shortcut folders. *)

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
