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
 Its methods, signals and properties are on {!class-type-about_dialog_t}. The \
 functions it is built on are in {!Ocgtk.Raw.About_dialog}."]

(** The methods, signals and properties of a [GtkAboutDialog]. *)
class type about_dialog_t = object
  inherit Application_and__window_and__window_group.window_t

  method on_activate_link :
    ?after:bool ->
    callback:(uri:string -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method add_credit_section : string -> string array -> unit
  method get_artists : unit -> string array
  method get_authors : unit -> string array
  method get_comments : unit -> string option
  method get_copyright : unit -> string option
  method get_documenters : unit -> string array
  method get_license : unit -> string option
  method get_logo : unit -> Ocgdk.Paintable.paintable_t option
  method get_logo_icon_name : unit -> string option
  method get_program_name : unit -> string option
  method get_system_information : unit -> string option
  method get_translator_credits : unit -> string option
  method get_version : unit -> string option
  method get_website : unit -> string option
  method get_website_label : unit -> string option
  method get_wrap_license : unit -> bool
  method set_artists : string array -> unit
  method set_authors : string array -> unit
  method set_comments : string option -> unit
  method set_copyright : string option -> unit
  method set_documenters : string array -> unit
  method set_license : string option -> unit
  method set_logo : Ocgdk.Paintable.paintable_t option -> unit
  method set_logo_icon_name : string option -> unit
  method set_program_name : string option -> unit
  method set_system_information : string option -> unit
  method set_translator_credits : string option -> unit
  method set_version : string option -> unit
  method set_website : string option -> unit
  method set_website_label : string -> unit
  method set_wrap_license : bool -> unit
  method as_about_dialog : Raw.About_dialog.t
end

class about_dialog : Raw.About_dialog.t -> about_dialog_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.About_dialog.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkAboutDialog], give one already wrapped. *)

val new_ : unit -> about_dialog_t
