class type actionable_t = object
  (** {2:methods Methods} *)

  method get_action_name : unit -> string option
  (** Gets the action name for [actionable]. *)

  method get_action_target_value : unit -> Gvariant.t option
  (** Gets the current target value of [actionable]. *)

  method set_action_name : string option -> unit
  (** Specifies the name of the action with which this widget should be
      associated.

      If [action_name] is [None] then the widget will be unassociated from any
      previous action.

      Usually this function is used when the widget is located (or will be
      located) within the hierarchy of a [GtkApplicationWindow].

      Names are of the form “win.save” or “app.quit” for actions on the
      containing [ApplicationWindow] or its associated [Application],
      respectively. This is the same form used for actions in the [Gio.Menu]
      associated with the window. *)

  method set_action_target_value : Gvariant.t option -> unit
  (** Sets the target value of an actionable widget.

      If [target_value] is [None] then the target value is unset.

      The target value has two purposes. First, it is used as the parameter to
      activation of the action associated with the [GtkActionable] widget.
      Second, it is used to determine if the widget should be rendered as
      “active” — the widget is active if the state is equal to the given target.

      Consider the example of associating a set of buttons with a [Gio.Action]
      with string state in a typical “radio button” situation. Each button will
      be associated with the same action, but with a different target value for
      that action. Clicking on a particular button will activate the action with
      the target of that button, which will typically cause the action’s state
      to change to that value. Since the action’s state is now equal to the
      target value of the button, the button will now be rendered as active (and
      the other buttons, with different targets, rendered inactive). *)

  method set_detailed_action_name : string -> unit
  (** Sets the action-name and associated string target value of an actionable
      widget.

      [detailed_action_name] is a string in the format accepted by
      [Gio.Action.parse_detailed_name]. *)

  (** {2:conversions Conversions} *)

  method as_actionable : Raw.Actionable.t
end

(* High-level class for Actionable *)
class actionable (obj : Raw.Actionable.t) : actionable_t =
  object (self)
    method get_action_name : unit -> string option =
      fun () -> Raw.Actionable.get_action_name obj

    method get_action_target_value : unit -> Gvariant.t option =
      fun () -> Raw.Actionable.get_action_target_value obj

    method set_action_name : string option -> unit =
      fun action_name -> Raw.Actionable.set_action_name obj action_name

    method set_action_target_value : Gvariant.t option -> unit =
      fun target_value ->
        Raw.Actionable.set_action_target_value obj target_value

    method set_detailed_action_name : string -> unit =
      fun detailed_action_name ->
        Raw.Actionable.set_detailed_action_name obj detailed_action_name

    method as_actionable = obj
  end
