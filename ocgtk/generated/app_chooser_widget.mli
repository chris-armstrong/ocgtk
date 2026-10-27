(** [GtkAppChooserWidget] is a widget for selecting applications.

    It is the main building block for [Gtk.AppChooserDialog]. Most applications
    only need to use the latter; but you can use this widget as part of a larger
    widget if you have special needs.

    [GtkAppChooserWidget] offers detailed control over what applications are
    shown, using the [Gtk.AppChooserWidget:show-default],
    [Gtk.AppChooserWidget:show-recommended],
    [Gtk.AppChooserWidget:show-fallback], [Gtk.AppChooserWidget:show-other] and
    [Gtk.AppChooserWidget:show-all] properties. See the [Gtk.AppChooser]
    documentation for more information about these groups of applications.

    To keep track of the selected application, use the
    [Gtk.AppChooserWidget::application-selected] and
    [Gtk.AppChooserWidget::application-activated] signals.

    {b CSS nodes}

    [GtkAppChooserWidget] has a single CSS node with name appchooser.

    Its methods, signals and properties are on
    {!class-type-app_chooser_widget_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.App_chooser_widget}. *)

(** The methods, signals and properties of a [GtkAppChooserWidget]. *)
class type app_chooser_widget_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit App_chooser.app_chooser_t

  method on_application_activated :
    ?after:bool ->
    callback:(application:Ocgio.App_info.app_info_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_application_selected :
    ?after:bool ->
    callback:(application:Ocgio.App_info.app_info_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_default_text : unit -> string option
  (** Returns the text that is shown if there are not applications that can
      handle the content type. *)

  method get_show_all : unit -> bool
  (** Gets whether the app chooser should show all applications in a flat list.
  *)

  method get_show_default : unit -> bool
  (** Gets whether the app chooser should show the default handler for the
      content type in a separate section. *)

  method get_show_fallback : unit -> bool
  (** Gets whether the app chooser should show related applications for the
      content type in a separate section. *)

  method get_show_other : unit -> bool
  (** Gets whether the app chooser should show applications which are unrelated
      to the content type. *)

  method get_show_recommended : unit -> bool
  (** Gets whether the app chooser should show recommended applications for the
      content type in a separate section. *)

  method set_default_text : string -> unit
  (** Sets the text that is shown if there are not applications that can handle
      the content type. *)

  method set_show_all : bool -> unit
  (** Sets whether the app chooser should show all applications in a flat list.
  *)

  method set_show_default : bool -> unit
  (** Sets whether the app chooser should show the default handler for the
      content type in a separate section. *)

  method set_show_fallback : bool -> unit
  (** Sets whether the app chooser should show related applications for the
      content type in a separate section. *)

  method set_show_other : bool -> unit
  (** Sets whether the app chooser should show applications which are unrelated
      to the content type. *)

  method set_show_recommended : bool -> unit
  (** Sets whether the app chooser should show recommended applications for the
      content type in a separate section. *)

  method as_app_chooser_widget : Raw.App_chooser_widget.t
end

class app_chooser_widget : Raw.App_chooser_widget.t -> app_chooser_widget_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.App_chooser_widget.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkAppChooserWidget], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : string -> app_chooser_widget_t
(** Creates a new [GtkAppChooserWidget] for applications that can handle content
    of the given type. *)
