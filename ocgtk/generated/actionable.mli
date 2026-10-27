(** Provides a way to associate widgets with actions.

    It primarily consists of two properties: [Gtk.Actionable:action-name] and
    [Gtk.Actionable:action-target]. There are also some convenience APIs for
    setting these properties.

    The action will be looked up in action groups that are found among the
    widgets ancestors. Most commonly, these will be the actions with the “win.”
    or “app.” prefix that are associated with the [GtkApplicationWindow] or
    [GtkApplication], but other action groups that are added with
    [Gtk.Widget.insert_action_group] will be consulted as well.

    Its methods, signals and properties are on {!class-type-actionable_t}. The
    functions it is built on are in {!Ocgtk.Raw.Actionable}. *)

(** The methods, signals and properties of a [GtkActionable]. *)
class type actionable_t = object
  method get_action_name : unit -> string option
  (** Gets the action name for [actionable]. *)

  method get_action_target_value : unit -> Gvariant.t option
  (** Gets the current target value of [actionable]. *)

  method set_action_name : string option -> unit
  (** Specifies the name of the action with which this widget should be
      associated.

      If [action_name] is [NULL] then the widget will be unassociated from any
      previous action.

      Usually this function is used when the widget is located (or will be
      located) within the hierarchy of a [GtkApplicationWindow].

      Names are of the form “win.save” or “app.quit” for actions on the
      containing [ApplicationWindow] or its associated [Application],
      respectively. This is the same form used for actions in the [Gio.Menu]
      associated with the window. *)

  method set_action_target_value : Gvariant.t option -> unit
  (** Sets the target value of an actionable widget.

      If [target_value] is [NULL] then the target value is unset.

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

  method as_actionable : Raw.Actionable.t
end

class actionable : Raw.Actionable.t -> actionable_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Actionable.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkActionable], give one already wrapped. *)
