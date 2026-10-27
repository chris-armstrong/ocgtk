(** Manages keyboard shortcuts and their activation.

    Most common shortcuts are using this controller implicitly, e.g. by adding a
    mnemonic underline to a [Gtk.Label], or by installing a key binding using
    [Gtk.WidgetClass.add_binding], or by adding accelerators to global actions
    using [Gtk.Application.set_accels_for_action].

    But it is possible to create your own shortcut controller, and add shortcuts
    to it.

    [GtkShortcutController] implements [Gio.ListModel] for querying the
    shortcuts that have been added to it.

    {b GtkShortcutController as GtkBuildable}

    [GtkShortcutController]s can be created in [Gtk.Builder] ui files, to set up
    shortcuts in the same place as the widgets.

    An example of a UI definition fragment with [GtkShortcutController]:

    {[
      <object class='GtkButton'>
        <child>
          <object class='GtkShortcutController'>
            <property name='scope'>managed</property>
            <child>
              <object class='GtkShortcut'>
                <property name='trigger'>&lt;Control&gt;k</property>
                <property name='action'>activate</property>
              </object>
            </child>
          </object>
        </child>
      </object>
    ]}

    This example creates a [Gtk.ActivateAction] for triggering the [activate]
    signal of the [Gtk.Button]. See [Gtk.ShortcutAction.parse_string] for the
    syntax for other kinds of [Gtk.ShortcutAction]. See
    [Gtk.ShortcutTrigger.parse_string] to learn more about the syntax for
    triggers.

    Its methods, signals and properties are on
    {!class-type-shortcut_controller_t}. The functions it is built on are in
    {!Ocgtk.Raw.Shortcut_controller}. *)

(** The methods, signals and properties of a [GtkShortcutController]. *)
class type shortcut_controller_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

  inherit Ocgio.List_model.list_model_t
  inherit Buildable.buildable_t

  method add_shortcut : Shortcut.shortcut_t -> unit
  (** Adds [shortcut] to the list of shortcuts handled by [self].

      If this controller uses an external shortcut list, this function does
      nothing. *)

  method get_mnemonics_modifiers : unit -> Ocgdk.Enums.modifiertype
  (** Gets the mnemonics modifiers for when this controller activates its
      shortcuts. *)

  method get_scope : unit -> Enums.shortcutscope
  (** Gets the scope for when this controller activates its shortcuts.

      See [Gtk.ShortcutController.set_scope] for details. *)

  method remove_shortcut : Shortcut.shortcut_t -> unit
  (** Removes [shortcut] from the list of shortcuts handled by [self].

      If [shortcut] had not been added to [controller] or this controller uses
      an external shortcut list, this function does nothing. *)

  method set_mnemonics_modifiers : Ocgdk.Enums.modifiertype -> unit
  (** Sets the controller to use the given modifier for mnemonics.

      The mnemonics modifiers determines which modifiers need to be pressed to
      allow activation of shortcuts with mnemonics triggers.

      GTK normally uses the Alt modifier for mnemonics, except in
      [GtkPopoverMenu]s, where mnemonics can be triggered without any modifiers.
      It should be very rarely necessary to change this, and doing so is likely
      to interfere with other shortcuts.

      This value is only relevant for local shortcut controllers. Global and
      managed shortcut controllers will have their shortcuts activated from
      other places which have their own modifiers for activating mnemonics. *)

  method set_scope : Enums.shortcutscope -> unit
  (** Sets the controller to have the given [scope].

      The scope allows shortcuts to be activated outside of the normal event
      propagation. In particular, it allows installing global keyboard shortcuts
      that can be activated even when a widget does not have focus.

      With [GTK_SHORTCUT_SCOPE_LOCAL], shortcuts will only be activated when the
      widget has focus. *)

  method item_type : Gobject.Type.t
  method n_items : int
  method as_shortcut_controller : Raw.Shortcut_controller.t
end

class shortcut_controller : Raw.Shortcut_controller.t -> shortcut_controller_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Shortcut_controller.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkShortcutController], give one already wrapped. *)

val new_ : unit -> shortcut_controller_t
val new_for_model : Ocgio.List_model.list_model_t -> shortcut_controller_t
