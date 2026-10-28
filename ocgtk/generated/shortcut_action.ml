class type shortcut_action_t = object
  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_shortcut_action : Raw.Shortcut_action.t
end

(* High-level class for ShortcutAction *)
class shortcut_action (obj : Raw.Shortcut_action.t) : shortcut_action_t =
  object (self)
    method activate :
        Enums.shortcutactionflags ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Gvariant.t option ->
        bool =
      fun flags widget args ->
        let widget = widget#as_widget in
        Raw.Shortcut_action.activate obj flags widget args

    method to_string : unit -> string =
      fun () -> Raw.Shortcut_action.to_string obj

    method as_shortcut_action = obj
  end

let parse_string (string : string) : shortcut_action_t =
  let obj_ = Raw.Shortcut_action.parse_string string in
  new shortcut_action obj_
