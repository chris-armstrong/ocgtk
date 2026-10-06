(* GENERATED CODE - DO NOT EDIT *)
(* Switch: Switch *)

[@@@ocaml.text
"Shows a \"light switch\" that has two states: on or off.\n\n\
 An example GtkSwitch\n\n\
 The user can control which state should be active by clicking the\n\
 empty area, or by dragging the slider.\n\n\
 [GtkSwitch] can also express situations where the underlying state changes\n\
 with a delay. In this case, the slider position indicates the user's recent\n\
 change (represented by the [Gtk.Switch:active] property), while the\n\
 trough color indicates the present underlying state (represented by the\n\
 [Gtk.Switch:state] property).\n\n\
 GtkSwitch with delayed state change\n\n\
 See [Gtk.Switch::state-set] for details.\n\n\
 {b Shortcuts and Gestures}\n\n\
 [GtkSwitch] supports pan and drag gestures to move the slider.\n\n\
 {b CSS nodes}\n\n\
 {[\n\
 switch\n\
 ├── image\n\
 ├── image\n\
 ╰── slider\n\
 ]}\n\n\
 [GtkSwitch] has four css nodes, the main node with the name switch and\n\
 subnodes for the slider and the on and off images. Neither of them is\n\
 using any style classes.\n\n\
 {b Accessibility}\n\n\
 [GtkSwitch] uses the [Gtk.AccessibleRole.switch] role."]

type t = [ `switch | `widget | `initially_unowned | `object_ ] Gobject.obj

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
