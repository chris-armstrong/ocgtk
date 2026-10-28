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
  (** The type of items. See [Gio.ListModel.get_item_type]. *)

  method n_items : int
  (** The number of items. See [Gio.ListModel.get_n_items]. *)

  method as_shortcut_controller : Raw.Shortcut_controller.t
end

(* High-level class for ShortcutController *)
class shortcut_controller (obj : Raw.Shortcut_controller.t) :
  shortcut_controller_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .event_controller
        (obj :> Raw.Event_controller.t)

    inherit Ocgio.List_model.list_model (Ocgio.Raw.List_model.from_gobject obj)
    inherit Buildable.buildable (Raw.Buildable.from_gobject obj)

    method add_shortcut : Shortcut.shortcut_t -> unit =
      fun shortcut ->
        let shortcut = shortcut#as_shortcut in
        Raw.Shortcut_controller.add_shortcut obj shortcut

    method get_mnemonics_modifiers : unit -> Ocgdk.Enums.modifiertype =
      fun () -> Raw.Shortcut_controller.get_mnemonics_modifiers obj

    method get_scope : unit -> Enums.shortcutscope =
      fun () -> Raw.Shortcut_controller.get_scope obj

    method remove_shortcut : Shortcut.shortcut_t -> unit =
      fun shortcut ->
        let shortcut = shortcut#as_shortcut in
        Raw.Shortcut_controller.remove_shortcut obj shortcut

    method set_mnemonics_modifiers : Ocgdk.Enums.modifiertype -> unit =
      fun modifiers ->
        Raw.Shortcut_controller.set_mnemonics_modifiers obj modifiers

    method set_scope : Enums.shortcutscope -> unit =
      fun scope -> Raw.Shortcut_controller.set_scope obj scope

    method item_type = Raw.Shortcut_controller.get_item_type obj
    method n_items = Raw.Shortcut_controller.get_n_items obj
    method as_shortcut_controller = obj
  end

let new_ () : shortcut_controller_t =
  new shortcut_controller (Raw.Shortcut_controller.new_ ())

let new_for_model (model : Ocgio.List_model.list_model_t) :
    shortcut_controller_t =
  let model = model#as_list_model in
  let obj_ = Raw.Shortcut_controller.new_for_model model in
  new shortcut_controller obj_
