class type shortcut_action_t = object
  method activate :
    Gtk_enums.shortcutactionflags ->
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    Gvariant.t option ->
    bool

  method to_string : unit -> string
  method as_shortcut_action : Shortcut_action.t
end

(* High-level class for ShortcutAction *)
class shortcut_action (obj : Shortcut_action.t) : shortcut_action_t =
  object (self)
    method activate :
        Gtk_enums.shortcutactionflags ->
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t ->
        Gvariant.t option ->
        bool =
      fun flags widget args ->
        let widget = widget#as_widget in
        Shortcut_action.activate obj flags widget args

    method to_string : unit -> string = fun () -> Shortcut_action.to_string obj
    method as_shortcut_action = obj
  end

let parse_string (string : string) : shortcut_action_t =
  let obj_ = Shortcut_action.parse_string string in
  new shortcut_action obj_
