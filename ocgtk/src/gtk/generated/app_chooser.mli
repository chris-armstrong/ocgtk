(* GENERATED CODE - DO NOT EDIT *)
(* AppChooser: AppChooser *)

(** [GtkAppChooser] is an interface for widgets which allow the user to choose
    an application.

    The main objects that implement this interface are [Gtk.AppChooserWidget],
    [Gtk.AppChooserDialog] and [Gtk.AppChooserButton].

    Applications are represented by GIO [GAppInfo] objects here. GIO has a
    concept of recommended and fallback applications for a given content type.
    Recommended applications are those that claim to handle the content type
    itself, while fallback also includes applications that handle a more generic
    content type. GIO also knows the default and last-used application for a
    given content type. The [GtkAppChooserWidget] provides detailed control over
    whether the shown list of applications should include default, recommended
    or fallback applications.

    To obtain the application that has been selected in a [GtkAppChooser], use
    [Gtk.AppChooser.get_app_info]. *)

type t = [ `app_chooser ] Gobject.obj

external from_gobject : 'a Gobject.obj -> t = "ml_gtk_app_chooser_from_gobject"

(* Methods *)

external refresh : t -> unit = "ml_gtk_app_chooser_refresh"
(** Reloads the list of applications. *)

external get_content_type : t -> string = "ml_gtk_app_chooser_get_content_type"
(** Returns the content type for which the [GtkAppChooser] shows applications.
*)

external get_app_info : t -> Ocgtk_gio.Gio.Wrappers.App_info.t option
  = "ml_gtk_app_chooser_get_app_info"
(** Returns the currently selected application. *)

(* Properties *)
