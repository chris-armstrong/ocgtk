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

let on_activate ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"activate" ~callback
    ~after:(Option.value after ~default:false)

let on_state_set ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let state =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_boolean v
        in
        let result = callback ~state in
        let v = Gobject.Closure.result argv in
        let x = result in
        Gobject.Value.set_boolean v x)
  in
  Gobject.Signal.connect obj ~name:"state-set" ~callback:closure
    ~after:(Option.value after ~default:false)
