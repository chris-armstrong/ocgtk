(** Activates a widget.

    Its methods, signals and properties are on {!class-type-activate_action_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Activate_action}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ActivateAction].}

    Inherits from:
    {{!Ocgtk.Shortcut_action.class-type-shortcut_action_t}Ocgtk.Shortcut_action}

    Activates a widget.

    Widgets are activated by calling
    {{!Ocgtk.Widget.class-type-widget_t.method-activate}[Gtk.Widget.activate]}.
*)
class type activate_action_t = object
  inherit Shortcut_action.shortcut_action_t

  (** {2:conversions Conversions} *)

  method as_activate_action : Raw.Activate_action.t
end

class activate_action : Raw.Activate_action.t -> activate_action_t
(** Wraps a raw handle of {!Ocgtk.Raw.Activate_action.t}. *)

(** {1:description Description}

    Activates a widget.

    Widgets are activated by calling
    {{!Ocgtk.Widget.class-type-widget_t.method-activate}[Gtk.Widget.activate]}.
*)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
