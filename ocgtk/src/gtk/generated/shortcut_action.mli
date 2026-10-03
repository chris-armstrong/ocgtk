(* GENERATED CODE - DO NOT EDIT *)
(* ShortcutAction: ShortcutAction *)

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
    - [Gtk.NothingAction]: a shortcut action that does nothing *)

type t = [ `shortcut_action | `object_ ] Gobject.obj

external parse_string : string -> t = "ml_gtk_shortcut_action_parse_string"
(** Create a new ShortcutAction *)

(* Methods *)

external to_string : t -> string = "ml_gtk_shortcut_action_to_string"
(** Prints the given action into a human-readable string.

    This is a small wrapper around [Gtk.ShortcutAction.print] to help when
    debugging. *)

external activate :
  t ->
  Gtk_enums.shortcutactionflags ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  Gvariant.t option ->
  bool = "ml_gtk_shortcut_action_activate"
(** Activates the action on the [widget] with the given [args].

    Note that some actions ignore the passed in [flags], [widget] or [args].

    Activation of an action can fail for various reasons. If the action is not
    supported by the [widget], if the [args] don't match the action or if the
    activation otherwise had no effect, [FALSE] will be returned. *)
