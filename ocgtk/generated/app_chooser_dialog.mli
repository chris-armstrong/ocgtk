(** [GtkAppChooserDialog] shows a [GtkAppChooserWidget] inside a [GtkDialog].

    Its methods, signals and properties are on
    {!class-type-app_chooser_dialog_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.App_chooser_dialog}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [AppChooserDialog].}

    [GtkAppChooserDialog] shows a [GtkAppChooserWidget] inside a [GtkDialog].

    An example GtkAppChooserDialog

    Note that [GtkAppChooserDialog] does not have any interesting methods of its
    own. Instead, you should get the embedded [GtkAppChooserWidget] using
    [Gtk.AppChooserDialog.get_widget] and call its methods if the generic
    [Gtk.AppChooser] interface is not sufficient for your needs.

    To set the heading that is shown above the [GtkAppChooserWidget], use
    [Gtk.AppChooserDialog.set_heading].

    {b CSS nodes}

    [GtkAppChooserDialog] has a single CSS node with the name [window] and style
    class [.appchooser]. *)
class type app_chooser_dialog_t = object
  inherit Dialog.dialog_t
  inherit App_chooser.app_chooser_t

  method get_heading : unit -> string option
  (** Returns the text to display at the top of the dialog. *)

  method get_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
  (** Returns the [GtkAppChooserWidget] of this dialog. *)

  method set_heading : string -> unit
  (** Sets the text to display at the top of the dialog.

      If the heading is not set, the dialog displays a default text. *)

  method gfile : Ocgio.File.file_t
  (** The GFile used by the [GtkAppChooserDialog].

      The dialog's [GtkAppChooserWidget] content type will be guessed from the
      file, if present. *)

  method as_app_chooser_dialog : Raw.App_chooser_dialog.t
end

class app_chooser_dialog : Raw.App_chooser_dialog.t -> app_chooser_dialog_t
(** Wraps a raw handle of {!Ocgtk.Raw.App_chooser_dialog.t}. *)

(** {1:description Description}

    [GtkAppChooserDialog] shows a [GtkAppChooserWidget] inside a [GtkDialog].

    An example GtkAppChooserDialog

    Note that [GtkAppChooserDialog] does not have any interesting methods of its
    own. Instead, you should get the embedded [GtkAppChooserWidget] using
    [Gtk.AppChooserDialog.get_widget] and call its methods if the generic
    [Gtk.AppChooser] interface is not sufficient for your needs.

    To set the heading that is shown above the [GtkAppChooserWidget], use
    [Gtk.AppChooserDialog.set_heading].

    {b CSS nodes}

    [GtkAppChooserDialog] has a single CSS node with the name [window] and style
    class [.appchooser]. *)

(** {1:constructors Constructors} *)

val new_ :
  Application_and__window_and__window_group.window_t option ->
  Enums.dialogflags ->
  Ocgio.File.file_t ->
  app_chooser_dialog_t
(** Creates a new [GtkAppChooserDialog] for the provided [GFile].

    The dialog will show applications that can open the file. *)

val new_for_content_type :
  Application_and__window_and__window_group.window_t option ->
  Enums.dialogflags ->
  string ->
  app_chooser_dialog_t
(** Creates a new [GtkAppChooserDialog] for the provided content type.

    The dialog will show applications that can open the content type. *)
