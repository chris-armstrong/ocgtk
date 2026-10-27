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
  method get_action_target_value : unit -> Gvariant.t option
  method set_action_name : string option -> unit
  method set_action_target_value : Gvariant.t option -> unit
  method set_detailed_action_name : string -> unit
  method as_actionable : Raw.Actionable.t
end

class actionable : Raw.Actionable.t -> actionable_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Actionable.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkActionable], give one already wrapped. *)
