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
    {!class-type-app_chooser_button_t}. The functions it is built on are in
    {!Ocgtk.Raw.App_chooser_button}. *)

(** The methods, signals and properties of a [GtkAppChooserButton]. *)
class type app_chooser_button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit App_chooser.app_chooser_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_custom_item_activated :
    ?after:bool ->
    callback:(item_name:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method append_custom_item : string -> string -> Ocgio.Icon.icon_t -> unit
  method append_separator : unit -> unit
  method get_heading : unit -> string option
  method get_modal : unit -> bool
  method get_show_default_item : unit -> bool
  method get_show_dialog_item : unit -> bool
  method set_active_custom_item : string -> unit
  method set_heading : string -> unit
  method set_modal : bool -> unit
  method set_show_default_item : bool -> unit
  method set_show_dialog_item : bool -> unit
  method as_app_chooser_button : Raw.App_chooser_button.t
end

class app_chooser_button : Raw.App_chooser_button.t -> app_chooser_button_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.App_chooser_button.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkAppChooserButton], give one already wrapped. *)

val new_ : string -> app_chooser_button_t
