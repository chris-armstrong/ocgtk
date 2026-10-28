(** [GtkAppChooser] is an interface for widgets which allow the user to choose
    an application.

    Its methods, signals and properties are on {!class-type-app_chooser_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.App_chooser}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [AppChooser].}

    Requires:
    - {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    [GtkAppChooser] is an interface for widgets which allow the user to choose
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
class type app_chooser_t = object
  (** {2:methods Methods} *)

  method get_app_info : unit -> Ocgio.App_info.app_info_t option
  (** Returns the currently selected application. *)

  method get_content_type : unit -> string
  (** Returns the content type for which the [GtkAppChooser] shows applications.
  *)

  method refresh : unit -> unit
  (** Reloads the list of applications. *)

  (** {2:conversions Conversions} *)

  method as_app_chooser : Raw.App_chooser.t
end

class app_chooser : Raw.App_chooser.t -> app_chooser_t
(** Wraps a raw handle of {!Ocgtk.Raw.App_chooser.t}. *)

(** {1:description Description}

    [GtkAppChooser] is an interface for widgets which allow the user to choose
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

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
