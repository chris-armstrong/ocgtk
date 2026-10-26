class type shortcut_controller_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

  inherit Ocgio.List_model.list_model_t
  inherit Buildable.buildable_t
  method add_shortcut : Shortcut.shortcut_t -> unit
  method get_mnemonics_modifiers : unit -> Ocgdk.Enums.modifiertype
  method get_scope : unit -> Enums.shortcutscope
  method remove_shortcut : Shortcut.shortcut_t -> unit
  method set_mnemonics_modifiers : Ocgdk.Enums.modifiertype -> unit
  method set_scope : Enums.shortcutscope -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_shortcut_controller : Raw.Shortcut_controller.t
end

class shortcut_controller : Raw.Shortcut_controller.t -> shortcut_controller_t

val new_ : unit -> shortcut_controller_t
val new_for_model : Ocgio.List_model.list_model_t -> shortcut_controller_t
