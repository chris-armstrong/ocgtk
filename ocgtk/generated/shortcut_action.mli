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
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Shortcut_action}. *)

(** The methods, signals and properties of a [ShortcutAction]. *)
class type shortcut_action_t = object
  method activate :
    Enums.shortcutactionflags ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Gvariant.t option ->
    bool
  (** Activates the action on the [widget] with the given [args].

      Note that some actions ignore the passed in [flags], [widget] or [args].

      Activation of an action can fail for various reasons. If the action is not
      supported by the [widget], if the [args] don't match the action or if the
      activation otherwise had no effect, [FALSE] will be returned. *)

  method to_string : unit -> string
  (** Prints the given action into a human-readable string.

      This is a small wrapper around [Gtk.ShortcutAction.print] to help when
      debugging. *)

  method as_shortcut_action : Raw.Shortcut_action.t
end

class shortcut_action : Raw.Shortcut_action.t -> shortcut_action_t
(** Wraps a raw handle of {!Ocgtk.Raw.Shortcut_action.t}. *)

(** {2:constructors Constructors} *)

val parse_string : string -> shortcut_action_t
(** Tries to parse the given string into an action.

    On success, the parsed action is returned. When parsing failed, [NULL] is
    returned.

    The accepted strings are:

    - [nothing], for [GtkNothingAction]
    - [activate], for [GtkActivateAction]
    - [mnemonic-activate], for [GtkMnemonicAction]
    - [action(NAME)], for a [GtkNamedAction] for the action named [NAME]
    - [signal(NAME)], for a [GtkSignalAction] for the signal [NAME] *)
