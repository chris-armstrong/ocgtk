(* GENERATED CODE - DO NOT EDIT *)
(* Switch: Switch *)

type t = [ `switch | `widget | `initially_unowned | `object_ ] Gobject.obj
(** Shows a “light switch” that has two states: on or off.

    An example GtkSwitch

    The user can control which state should be active by clicking the empty
    area, or by dragging the slider.

    [GtkSwitch] can also express situations where the underlying state changes
    with a delay. In this case, the slider position indicates the user's recent
    change (represented by the [Gtk.Switch:active] property), while the trough
    color indicates the present underlying state (represented by the
    [Gtk.Switch:state] property).

    GtkSwitch with delayed state change

    See [Gtk.Switch::state-set] for details.

    {b Shortcuts and Gestures}

    [GtkSwitch] supports pan and drag gestures to move the slider.

    {b CSS nodes}

    {[
    switch
    ├── image
    ├── image
    ╰── slider
    ]}

    [GtkSwitch] has four css nodes, the main node with the name switch and
    subnodes for the slider and the on and off images. Neither of them is using
    any style classes.

    {b Accessibility}

    [GtkSwitch] uses the [Gtk.AccessibleRole.switch] role. *)

external new_ : unit -> t = "ml_gtk_switch_new"
(** Create a new Switch *)

(* Methods *)

external set_state : t -> bool -> unit = "ml_gtk_switch_set_state"
(** Sets the underlying state of the [GtkSwitch].

    This function is typically called from a [Gtk.Switch::state-set] signal
    handler in order to set up delayed state changes.

    See [Gtk.Switch::state-set] for details. *)

external set_active : t -> bool -> unit = "ml_gtk_switch_set_active"
(** Changes the state of [self] to the desired one. *)

external get_state : t -> bool = "ml_gtk_switch_get_state"
(** Gets the underlying state of the [GtkSwitch]. *)

external get_active : t -> bool = "ml_gtk_switch_get_active"
(** Gets whether the [GtkSwitch] is in its “on” or “off” state. *)

(* Properties *)

val on_activate :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

val on_state_set :
  ?after:bool -> t -> callback:(state:bool -> bool) -> Gobject.Signal.handler_id
