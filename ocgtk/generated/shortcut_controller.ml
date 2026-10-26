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
