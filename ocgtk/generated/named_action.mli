(** Activates a named action.

    Its methods, signals and properties are on {!class-type-named_action_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Named_action}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [NamedAction].}

    Inherits from:
    {{!Ocgtk.Shortcut_action.class-type-shortcut_action_t}Ocgtk.Shortcut_action}

    Activates a named action.

    See [Gtk.WidgetClass.install_action] and [Gtk.Widget.insert_action_group]
    for ways to associate named actions with widgets. *)
class type named_action_t = object
  inherit Shortcut_action.shortcut_action_t

  (** {2:methods Methods} *)

  method get_action_name : unit -> string
  (** Returns the name of the action that will be activated. *)

  (** {2:conversions Conversions} *)

  method as_named_action : Raw.Named_action.t
end

class named_action : Raw.Named_action.t -> named_action_t
(** Wraps a raw handle of {!Ocgtk.Raw.Named_action.t}. *)

(** {1:description Description}

    Activates a named action.

    See [Gtk.WidgetClass.install_action] and [Gtk.Widget.insert_action_group]
    for ways to associate named actions with widgets. *)

(** {1:constructors Constructors} *)

val new_ : string -> named_action_t
(** Creates an action that when activated, activates the named action on the
    widget.

    It also passes the given arguments to it.

    See [Gtk.Widget.insert_action_group] for how to add actions to widgets. *)
