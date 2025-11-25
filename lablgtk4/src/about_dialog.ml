(* GENERATED CODE - DO NOT EDIT *)
(* Widget: AboutDialog *)

type t = [`about_dialog | `window | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new AboutDialog *)
external new_ : unit -> t = "ml_gtk_about_dialog_new"

(* Properties *)

(** Sets whether the license text in the about dialog should be
automatically wrapped. *)
external set_wrap_license : t -> bool -> unit = "ml_gtk_about_dialog_set_wrap_license"

(** Sets the label to be used for the website link. *)
external set_website_label : t -> string -> unit = "ml_gtk_about_dialog_set_website_label"

(** Sets the URL to use for the website link. *)
external set_website : t -> string option -> unit = "ml_gtk_about_dialog_set_website"

(** Sets the version string to display in the about dialog. *)
external set_version : t -> string option -> unit = "ml_gtk_about_dialog_set_version"

(** Sets the translator credits string which is displayed in
the credits page.

The intended use for this string is to display the translator
of the language which is currently used in the user interface.
Using `gettext()`, a simple way to achieve that is to mark the
string for translation:

```c
GtkWidget *about = gtk_about_dialog_new ();
 gtk_about_dialog_set_translator_credits (GTK_ABOUT_DIALOG (about),
                                          _("translator-credits"));
```

It is a good idea to use the customary `msgid` “translator-credits”
for this purpose, since translators will already know the purpose of
that `msgid`, and since `GtkAboutDialog` will detect if “translator-credits”
is untranslated and omit translator credits. *)
external set_translator_credits : t -> string option -> unit = "ml_gtk_about_dialog_set_translator_credits"

(** Sets the system information to be displayed in the about
dialog.

If `system_information` is `NULL`, the system information
page is hidden.

See [property@Gtk.AboutDialog:system-information]. *)
external set_system_information : t -> string option -> unit = "ml_gtk_about_dialog_set_system_information"

(** Sets the name to display in the about dialog.

If `name` is not set, the string returned
by `g_get_application_name()` is used. *)
external set_program_name : t -> string option -> unit = "ml_gtk_about_dialog_set_program_name"

(** Sets the icon name to be displayed as logo in the about dialog. *)
external set_logo_icon_name : t -> string option -> unit = "ml_gtk_about_dialog_set_logo_icon_name"

(** Sets the license information to be displayed in the
about dialog.

If `license` is `NULL`, the license page is hidden. *)
external set_license : t -> string option -> unit = "ml_gtk_about_dialog_set_license"

(** Sets the copyright string to display in the about dialog.

This should be a short string of one or two lines. *)
external set_copyright : t -> string option -> unit = "ml_gtk_about_dialog_set_copyright"

(** Sets the comments string to display in the about dialog.

This should be a short string of one or two lines. *)
external set_comments : t -> string option -> unit = "ml_gtk_about_dialog_set_comments"

(** Returns whether the license text in the about dialog is
automatically wrapped. *)
external get_wrap_license : t -> bool = "ml_gtk_about_dialog_get_wrap_license"

(** Returns the label used for the website link. *)
external get_website_label : t -> string option = "ml_gtk_about_dialog_get_website_label"

(** Returns the website URL. *)
external get_website : t -> string option = "ml_gtk_about_dialog_get_website"

(** Returns the version string. *)
external get_version : t -> string option = "ml_gtk_about_dialog_get_version"

(** Returns the translator credits string which is displayed
in the credits page. *)
external get_translator_credits : t -> string option = "ml_gtk_about_dialog_get_translator_credits"

(** Returns the system information that is shown in the about dialog. *)
external get_system_information : t -> string option = "ml_gtk_about_dialog_get_system_information"

(** Returns the program name displayed in the about dialog. *)
external get_program_name : t -> string option = "ml_gtk_about_dialog_get_program_name"

(** Returns the icon name displayed as logo in the about dialog. *)
external get_logo_icon_name : t -> string option = "ml_gtk_about_dialog_get_logo_icon_name"

(** Returns the license information. *)
external get_license : t -> string option = "ml_gtk_about_dialog_get_license"

(** Returns the name of the documenters which are displayed
in the credits page. *)
external get_documenters : t -> unit = "ml_gtk_about_dialog_get_documenters"

(** Returns the copyright string. *)
external get_copyright : t -> string option = "ml_gtk_about_dialog_get_copyright"

(** Returns the comments string. *)
external get_comments : t -> string option = "ml_gtk_about_dialog_get_comments"

(** Returns the names of the authors which are displayed
in the credits page. *)
external get_authors : t -> unit = "ml_gtk_about_dialog_get_authors"

(** Returns the names of the artists which are displayed
in the credits page. *)
external get_artists : t -> unit = "ml_gtk_about_dialog_get_artists"

