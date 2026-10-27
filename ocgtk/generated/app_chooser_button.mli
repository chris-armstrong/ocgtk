(** The [GtkAppChooserButton] lets the user select an application.

    An example GtkAppChooserButton

    Initially, a [GtkAppChooserButton] selects the first application in its
    list, which will either be the most-recently used application or, if
    [Gtk.AppChooserButton:show-default-item] is [TRUE], the default application.

    The list of applications shown in a [GtkAppChooserButton] includes the
    recommended applications for the given content type. When
    [Gtk.AppChooserButton:show-default-item] is set, the default application is
    also included. To let the user chooser other applications, you can set the
    [Gtk.AppChooserButton:show-dialog-item] property, which allows to open a
    full [Gtk.AppChooserDialog].

    It is possible to add custom items to the list, using
    [Gtk.AppChooserButton.append_custom_item]. These items cause the
    [Gtk.AppChooserButton::custom-item-activated] signal to be emitted when they
    are selected.

    To track changes in the selected application, use the
    [Gtk.AppChooserButton::changed] signal.

    {b CSS nodes}

    [GtkAppChooserButton] has a single CSS node with the name
    “appchooserbutton”.

    Its methods, signals and properties are on
    {!class-type-app_chooser_button_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.App_chooser_button}. *)

(** The methods, signals and properties of a [GtkAppChooserButton]. *)
class type app_chooser_button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit App_chooser.app_chooser_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to when the button is activated.

      The [::activate] signal on [GtkAppChooserButton] is an action signal and
      emitting it causes the button to pop up its dialog. *)

  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the active application changes. *)

  method on_custom_item_activated :
    ?after:bool ->
    callback:(item_name:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a custom item is activated.

      Use [Gtk.AppChooserButton.append_custom_item], to add custom items. *)

  method append_custom_item : string -> string -> Ocgio.Icon.icon_t -> unit
  (** Appends a custom item to the list of applications that is shown in the
      popup.

      The item name must be unique per-widget. Clients can use the provided name
      as a detail for the [Gtk.AppChooserButton::custom-item-activated] signal,
      to add a callback for the activation of a particular custom item in the
      list.

      See also [Gtk.AppChooserButton.append_separator]. *)

  method append_separator : unit -> unit
  (** Appends a separator to the list of applications that is shown in the
      popup. *)

  method get_heading : unit -> string option
  (** Returns the text to display at the top of the dialog. *)

  method get_modal : unit -> bool
  (** Gets whether the dialog is modal. *)

  method get_show_default_item : unit -> bool
  (** Returns whether the dropdown menu should show the default application at
      the top. *)

  method get_show_dialog_item : unit -> bool
  (** Returns whether the dropdown menu shows an item for a
      [GtkAppChooserDialog]. *)

  method set_active_custom_item : string -> unit
  (** Selects a custom item.

      See [Gtk.AppChooserButton.append_custom_item].

      Use [Gtk.AppChooser.refresh] to bring the selection to its initial state.
  *)

  method set_heading : string -> unit
  (** Sets the text to display at the top of the dialog.

      If the heading is not set, the dialog displays a default text. *)

  method set_modal : bool -> unit
  (** Sets whether the dialog should be modal. *)

  method set_show_default_item : bool -> unit
  (** Sets whether the dropdown menu of this button should show the default
      application for the given content type at top. *)

  method set_show_dialog_item : bool -> unit
  (** Sets whether the dropdown menu of this button should show an entry to
      trigger a [GtkAppChooserDialog]. *)

  method as_app_chooser_button : Raw.App_chooser_button.t
end

class app_chooser_button : Raw.App_chooser_button.t -> app_chooser_button_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.App_chooser_button.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkAppChooserButton], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : string -> app_chooser_button_t
(** Creates a new [GtkAppChooserButton] for applications that can handle content
    of the given type. *)
