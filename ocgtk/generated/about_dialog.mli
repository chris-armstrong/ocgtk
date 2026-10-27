[@@@ocaml.text
"Displays information about a program.\n\n\
 The shown information includes the programs' logo, name, copyright,\n\
 website and license. It is also possible to give credits to the authors,\n\
 documenters, translators and artists who have worked on the program.\n\n\
 An about dialog is typically opened when the user selects the [About]\n\
 option from the [Help] menu. All parts of the dialog are optional.\n\n\
 An example GtkAboutDialog\n\n\
 About dialogs often contain links and email addresses. [GtkAboutDialog]\n\
 displays these as clickable links. By default, it calls \
 [Gtk.FileLauncher.launch]\n\
 when a user clicks one. The behaviour can be overridden with the\n\
 [Gtk.AboutDialog::activate-link] signal.\n\n\
 To specify a person with an email address, use a string like\n\
 [Edgar Allan Poe <edgar@poe.com>]. To specify a website with a title,\n\
 use a string like [GTK team https://www.gtk.org].\n\n\
 To make constructing an about dialog as convenient as possible, you can\n\
 use the function [Gtk.show_about_dialog] which constructs and shows\n\
 a dialog and keeps it around so that it can be shown again.\n\n\
 Note that GTK sets a default title of [_(\"About %s\")] on the dialog\n\
 window (where [%s] is replaced by the name of the application, but in\n\
 order to ensure proper translation of the title, applications should\n\
 set the title property explicitly when constructing an about dialog,\n\
 as shown in the following example:\n\n\
 {[\n\
 GFile *logo_file = g_file_new_for_path (\"./logo.png\");\n\
 GdkTexture *example_logo = gdk_texture_new_from_file (logo_file, NULL);\n\
 g_object_unref (logo_file);\n\n\
 gtk_show_about_dialog (NULL,\n\
\                       \"program-name\", \"ExampleCode\",\n\
\                       \"logo\", example_logo,\n\
\                       \"title\", _(\"About ExampleCode\"),\n\
\                       NULL);\n\
 ]}\n\n\
 {b Shortcuts and Gestures}\n\n\
 [GtkAboutDialog] supports the following keyboard shortcuts:\n\n\
 - <kbd>Escape</kbd> closes the window.\n\n\
 {b CSS nodes}\n\n\
 [GtkAboutDialog] has a single CSS node with the name [window] and style\n\
 class [.aboutdialog].\n\n\
 Its methods, signals and properties are on {!class-type-about_dialog_t}. Its \
 constructors are under {!section-constructors}. The functions it is built on \
 are in {!Ocgtk.Raw.About_dialog}."]

(** The methods, signals and properties of a [GtkAboutDialog]. *)
class type about_dialog_t = object
  inherit Application_and__window_and__window_group.window_t

  method on_activate_link :
    ?after:bool ->
    callback:(uri:string -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method add_credit_section : string -> string array -> unit
  [@@ocaml.doc "Creates a new section in the \"Credits\" page."]

  method get_artists : unit -> string array
  (** Returns the names of the artists which are displayed in the credits page.
  *)

  method get_authors : unit -> string array
  (** Returns the names of the authors which are displayed in the credits page.
  *)

  method get_comments : unit -> string option
  (** Returns the comments string. *)

  method get_copyright : unit -> string option
  (** Returns the copyright string. *)

  method get_documenters : unit -> string array
  (** Returns the name of the documenters which are displayed in the credits
      page. *)

  method get_license : unit -> string option
  (** Returns the license information. *)

  method get_logo : unit -> Ocgdk.Paintable.paintable_t option
  (** Returns the paintable displayed as logo in the about dialog. *)

  method get_logo_icon_name : unit -> string option
  (** Returns the icon name displayed as logo in the about dialog. *)

  method get_program_name : unit -> string option
  (** Returns the program name displayed in the about dialog. *)

  method get_system_information : unit -> string option
  (** Returns the system information that is shown in the about dialog. *)

  method get_translator_credits : unit -> string option
  (** Returns the translator credits string which is displayed in the credits
      page. *)

  method get_version : unit -> string option
  (** Returns the version string. *)

  method get_website : unit -> string option
  (** Returns the website URL. *)

  method get_website_label : unit -> string option
  (** Returns the label used for the website link. *)

  method get_wrap_license : unit -> bool
  (** Returns whether the license text in the about dialog is automatically
      wrapped. *)

  method set_artists : string array -> unit
  [@@ocaml.doc
    "Sets the names of the artists to be displayed\nin the \"Credits\" page."]

  method set_authors : string array -> unit
  [@@ocaml.doc
    "Sets the names of the authors which are displayed\n\
     in the \"Credits\" page of the about dialog."]

  method set_comments : string option -> unit
  (** Sets the comments string to display in the about dialog.

      This should be a short string of one or two lines. *)

  method set_copyright : string option -> unit
  (** Sets the copyright string to display in the about dialog.

      This should be a short string of one or two lines. *)

  method set_documenters : string array -> unit
  [@@ocaml.doc
    "Sets the names of the documenters which are displayed\n\
     in the \"Credits\" page."]

  method set_license : string option -> unit
  (** Sets the license information to be displayed in the about dialog.

      If [license] is [NULL], the license page is hidden. *)

  method set_logo : Ocgdk.Paintable.paintable_t option -> unit
  (** Sets the logo in the about dialog. *)

  method set_logo_icon_name : string option -> unit
  (** Sets the icon name to be displayed as logo in the about dialog. *)

  method set_program_name : string option -> unit
  (** Sets the name to display in the about dialog.

      If [name] is not set, the string returned by [g_get_application_name()] is
      used. *)

  method set_system_information : string option -> unit
  (** Sets the system information to be displayed in the about dialog.

      If [system_information] is [NULL], the system information page is hidden.

      See [Gtk.AboutDialog:system-information]. *)

  method set_translator_credits : string option -> unit
  [@@ocaml.doc
    "Sets the translator credits string which is displayed in\n\
     the credits page.\n\n\
     The intended use for this string is to display the translator\n\
     of the language which is currently used in the user interface.\n\
     Using [gettext()], a simple way to achieve that is to mark the\n\
     string for translation:\n\n\
     {[\n\
     GtkWidget *about = gtk_about_dialog_new ();\n\
    \ gtk_about_dialog_set_translator_credits (GTK_ABOUT_DIALOG (about),\n\
    \                                          _(\"translator-credits\"));\n\
     ]}\n\n\
     It is a good idea to use the customary [msgid] “translator-credits”\n\
     for this purpose, since translators will already know the purpose of\n\
     that [msgid], and since [GtkAboutDialog] will detect if \
     “translator-credits”\n\
     is untranslated and omit translator credits."]

  method set_version : string option -> unit
  (** Sets the version string to display in the about dialog. *)

  method set_website : string option -> unit
  (** Sets the URL to use for the website link. *)

  method set_website_label : string -> unit
  (** Sets the label to be used for the website link. *)

  method set_wrap_license : bool -> unit
  (** Sets whether the license text in the about dialog should be automatically
      wrapped. *)

  method as_about_dialog : Raw.About_dialog.t
end

class about_dialog : Raw.About_dialog.t -> about_dialog_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.About_dialog.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkAboutDialog], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : unit -> about_dialog_t
(** Creates a new [GtkAboutDialog]. *)
