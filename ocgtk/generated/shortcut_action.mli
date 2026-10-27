(** Encodes an action that can be triggered by a keyboard shortcut.

    [GtkShortcutActions] contain functions that allow easy presentation to end
    users as well as being printed for debugging.

    All [GtkShortcutActions] are immutable, you can only specify their
    properties during construction. If you want to change a action, you have to
    replace it with a new one. If you need to pass arguments to an action, these
    are specified by the higher-level [GtkShortcut] object.

    To activate a [GtkShortcutAction] manually, [Gtk.ShortcutAction.activate]
    can be called.

    GTK provides various actions:

    - [Gtk.MnemonicAction]: a shortcut action that calls
      gtk_widget_mnemonic_activate()
    - [Gtk.CallbackAction]: a shortcut action that invokes a given callback
    - [Gtk.SignalAction]: a shortcut action that emits a given signal
    - [Gtk.ActivateAction]: a shortcut action that calls gtk_widget_activate()
    - [Gtk.NamedAction]: a shortcut action that calls
      gtk_widget_activate_action()
    - [Gtk.NothingAction]: a shortcut action that does nothing

    Its methods, signals and properties are on {!class-type-shortcut_action_t}.
    The functions it is built on are in {!Ocgtk.Raw.Shortcut_action}. *)

(** The methods, signals and properties of a [GtkShortcutAction]. *)
class type shortcut_action_t = object
  method activate :
    Enums.shortcutactionflags ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Gvariant.t option ->
    bool

  method to_string : unit -> string
  method as_shortcut_action : Raw.Shortcut_action.t
end

class shortcut_action : Raw.Shortcut_action.t -> shortcut_action_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Shortcut_action.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkShortcutAction], give one already wrapped. *)

val parse_string : string -> shortcut_action_t
