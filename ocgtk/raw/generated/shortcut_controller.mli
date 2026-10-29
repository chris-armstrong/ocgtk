(* GENERATED CODE - DO NOT EDIT *)
(* ShortcutController: ShortcutController *)

(** Manages keyboard shortcuts and their activation.

    Most common shortcuts are using this controller implicitly, e.g. by adding a
    mnemonic underline to a {{!Ocgtk.Raw.Label}[Gtk.Label]}, or by installing a
    key binding using [Gtk.WidgetClass.add_binding], or by adding accelerators
    to global actions using
    {{!Ocgtk.Raw.Application.val-set_accels_for_action}[Gtk.Application.set_accels_for_action]}.

    But it is possible to create your own shortcut controller, and add shortcuts
    to it.

    [GtkShortcutController] implements {{!Ocgio.Raw.List_model}[Gio.ListModel]}
    for querying the shortcuts that have been added to it.

    {b GtkShortcutController as GtkBuildable}

    [GtkShortcutController]s can be created in
    {{!Ocgtk.Raw.Builder}[Gtk.Builder]} ui files, to set up shortcuts in the
    same place as the widgets.

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

    This example creates a {{!Ocgtk.Raw.Activate_action}[Gtk.ActivateAction]}
    for triggering the [activate] signal of the
    {{!Ocgtk.Raw.Button}[Gtk.Button]}. See
    {{!Ocgtk.Raw.Shortcut_action.val-parse_string}[Gtk.ShortcutAction.parse_string]}
    for the syntax for other kinds of
    {{!Ocgtk.Raw.Shortcut_action}[Gtk.ShortcutAction]}. See
    {{!Ocgtk.Raw.Shortcut_trigger.val-parse_string}[Gtk.ShortcutTrigger.parse_string]}
    to learn more about the syntax for triggers.

    The class built on this module is in {!Ocgtk.Shortcut_controller}. *)

type t = [ `shortcut_controller | `event_controller | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_shortcut_controller_get_type"

external new_ : unit -> t = "ml_gtk_shortcut_controller_new"
(** Creates a new shortcut controller. *)

external new_for_model : Ocgio_raw.List_model.t -> t
  = "ml_gtk_shortcut_controller_new_for_model"
(** Creates a new shortcut controller that takes its shortcuts from the given
    list model.

    A controller created by this function does not let you add or remove
    individual shortcuts using the shortcut controller api, but you can change
    the contents of the model. *)

(* Methods *)

external set_scope : t -> Ocgtk_enums.shortcutscope -> unit
  = "ml_gtk_shortcut_controller_set_scope"
(** Sets the controller to have the given [scope].

    The scope allows shortcuts to be activated outside of the normal event
    propagation. In particular, it allows installing global keyboard shortcuts
    that can be activated even when a widget does not have focus.

    With
    {{!Ocgtk.Enums.type-shortcutscope.constructor-LOCAL}[GTK_SHORTCUT_SCOPE_LOCAL]},
    shortcuts will only be activated when the widget has focus. *)

external set_mnemonics_modifiers : t -> Ocgdk_enums.modifiertype -> unit
  = "ml_gtk_shortcut_controller_set_mnemonics_modifiers"
(** Sets the controller to use the given modifier for mnemonics.

    The mnemonics modifiers determines which modifiers need to be pressed to
    allow activation of shortcuts with mnemonics triggers.

    GTK normally uses the Alt modifier for mnemonics, except in
    [GtkPopoverMenu]s, where mnemonics can be triggered without any modifiers.
    It should be very rarely necessary to change this, and doing so is likely to
    interfere with other shortcuts.

    This value is only relevant for local shortcut controllers. Global and
    managed shortcut controllers will have their shortcuts activated from other
    places which have their own modifiers for activating mnemonics. *)

external remove_shortcut : t -> Shortcut.t -> unit
  = "ml_gtk_shortcut_controller_remove_shortcut"
(** Removes [shortcut] from the list of shortcuts handled by [self].

    If [shortcut] had not been added to [controller] or this controller uses an
    external shortcut list, this function does nothing. *)

external get_scope : t -> Ocgtk_enums.shortcutscope
  = "ml_gtk_shortcut_controller_get_scope"
(** Gets the scope for when this controller activates its shortcuts.

    See
    {{!Ocgtk.Raw.Shortcut_controller.val-set_scope}[Gtk.ShortcutController.set_scope]}
    for details. *)

external get_mnemonics_modifiers : t -> Ocgdk_enums.modifiertype
  = "ml_gtk_shortcut_controller_get_mnemonics_modifiers"
(** Gets the mnemonics modifiers for when this controller activates its
    shortcuts. *)

external add_shortcut : t -> Shortcut.t -> unit
  = "ml_gtk_shortcut_controller_add_shortcut"
(** Adds [shortcut] to the list of shortcuts handled by [self].

    If this controller uses an external shortcut list, this function does
    nothing. *)

(* Properties *)

external get_item_type : t -> Gobject.Type.t
  = "ml_gtk_shortcut_controller_get_item_type"
(** The type of items. See [Gio.ListModel.get_item_type]. *)

external get_n_items : t -> int = "ml_gtk_shortcut_controller_get_n_items"
(** The number of items. See [Gio.ListModel.get_n_items]. *)
