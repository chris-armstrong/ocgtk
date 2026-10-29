(** [GtkMessageDialog] presents a dialog with some message text.

    Its methods, signals and properties are on {!class-type-message_dialog_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Message_dialog}. *)

(** {1:class Class} *)

class type message_dialog_t = object
  inherit Dialog.dialog_t

  (** {2:methods Methods} *)

  method get_message_area : unit -> Widget.widget_t
  (** Returns the message area of the dialog.

      This is the box where the dialog’s primary and secondary labels are
      packed. You can add your own extra content to that box and it will appear
      below those labels. See [Gtk.Dialog.get_content_area] for the
      corresponding function in the parent [Gtk.Dialog]. *)

  method set_markup : string -> unit
  (** Sets the text of the message dialog. *)

  (** {2:properties Properties} *)

  method message_type : Enums.messagetype
  (** The type of the message. *)

  method set_message_type : Enums.messagetype -> unit
  (** The type of the message. *)

  method secondary_text : string
  (** The secondary text of the message dialog. *)

  method set_secondary_text : string -> unit
  (** The secondary text of the message dialog. *)

  method secondary_use_markup : bool
  (** [true] if the secondary text of the dialog includes Pango markup.

      See [Pango.parse_markup]. *)

  method set_secondary_use_markup : bool -> unit
  (** [true] if the secondary text of the dialog includes Pango markup.

      See [Pango.parse_markup]. *)

  method text : string
  (** The primary text of the message dialog.

      If the dialog has a secondary text, this will appear as the title. *)

  method set_text : string -> unit
  (** The primary text of the message dialog.

      If the dialog has a secondary text, this will appear as the title. *)

  method use_markup : bool
  (** [true] if the primary text of the dialog includes Pango markup.

      See [Pango.parse_markup]. *)

  method set_use_markup : bool -> unit
  (** [true] if the primary text of the dialog includes Pango markup.

      See [Pango.parse_markup]. *)

  (** {2:conversions Conversions} *)

  method as_message_dialog : Raw.Message_dialog.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [MessageDialog].}\n\n\
     Inherits from: {{!Ocgtk.Dialog.class-type-dialog_t}Ocgtk.Dialog}\n\n\
     Implements:\n\
     - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}\n\
     - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}\n\
     - \
     {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}\n\
     - {{!Ocgtk.Native.class-type-native_t}Ocgtk.Native}\n\
     - {{!Ocgtk.Root.class-type-root_t}Ocgtk.Root}\n\
     - \
     {{!Ocgtk.Shortcut_manager.class-type-shortcut_manager_t}Ocgtk.Shortcut_manager}\n\n\
     [GtkMessageDialog] presents a dialog with some message text.\n\n\
     An example GtkMessageDialog\n\n\
     It’s simply a convenience widget; you could construct the equivalent of\n\
     [GtkMessageDialog] from [GtkDialog] without too much effort, but\n\
     [GtkMessageDialog] saves typing.\n\n\
     The easiest way to do a modal message dialog is to use the \
     [GTK_DIALOG_MODAL]\n\
     flag, which will call \
     {{!Ocgtk.Window.class-type-window_t.method-set_modal}[Gtk.Window.set_modal]} \
     internally. The dialog will\n\
     prevent interaction with the parent window until it's hidden or destroyed.\n\
     You can use the \
     {{!Ocgtk.Dialog.class-type-dialog_t.method-on_response}[Gtk.Dialog::response]} \
     signal to know when the user\n\
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
     The [GtkMessageDialog] implementation of the [GtkBuildable] interface \
     exposes\n\
     the message area as an internal child with the name “message_area”."]

class message_dialog : Raw.Message_dialog.t -> message_dialog_t
(** Wraps a raw handle of {!Ocgtk.Raw.Message_dialog.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 [GtkMessageDialog] presents a dialog with some message text.\n\n\
 An example GtkMessageDialog\n\n\
 It’s simply a convenience widget; you could construct the equivalent of\n\
 [GtkMessageDialog] from [GtkDialog] without too much effort, but\n\
 [GtkMessageDialog] saves typing.\n\n\
 The easiest way to do a modal message dialog is to use the [GTK_DIALOG_MODAL]\n\
 flag, which will call \
 {{!Ocgtk.Window.class-type-window_t.method-set_modal}[Gtk.Window.set_modal]} \
 internally. The dialog will\n\
 prevent interaction with the parent window until it's hidden or destroyed.\n\
 You can use the \
 {{!Ocgtk.Dialog.class-type-dialog_t.method-on_response}[Gtk.Dialog::response]} \
 signal to know when the user\n\
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

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
