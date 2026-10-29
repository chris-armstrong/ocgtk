(* GENERATED CODE - DO NOT EDIT *)
(* Switch: Switch *)

[@@@ocaml.text
"Shows a \"light switch\" that has two states: on or off.\n\n\
 An example GtkSwitch\n\n\
 The user can control which state should be active by clicking the\n\
 empty area, or by dragging the slider.\n\n\
 [GtkSwitch] can also express situations where the underlying state changes\n\
 with a delay. In this case, the slider position indicates the user's recent\n\
 change (represented by the \
 {{!Ocgtk.Raw.Switch.val-get_active}[Gtk.Switch:active]} property), while the\n\
 trough color indicates the present underlying state (represented by the\n\
 {{!Ocgtk.Raw.Switch.val-get_state}[Gtk.Switch:state]} property).\n\n\
 GtkSwitch with delayed state change\n\n\
 See {{!Ocgtk.Raw.Switch.val-on_state_set}[Gtk.Switch::state-set]} for \
 details.\n\n\
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
 [GtkSwitch] uses the \
 {{!Ocgtk.Enums.type-accessiblerole.constructor-SWITCH}[Gtk.AccessibleRole.switch]} \
 role.\n\n\
 The class built on this module is in {!Ocgtk.Switch}."]

type t = [ `switch | `widget | `initially_unowned | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_switch_get_type"

external new_ : unit -> t = "ml_gtk_switch_new"
(** Creates a new [GtkSwitch] widget. *)

(* Methods *)

external set_state : t -> bool -> unit = "ml_gtk_switch_set_state"
(** Sets the underlying state of the [GtkSwitch].

    This function is typically called from a
    {{!Ocgtk.Raw.Switch.val-on_state_set}[Gtk.Switch::state-set]} signal handler
    in order to set up delayed state changes.

    See {{!Ocgtk.Raw.Switch.val-on_state_set}[Gtk.Switch::state-set]} for
    details. *)

external set_active : t -> bool -> unit = "ml_gtk_switch_set_active"
(** Changes the state of [self] to the desired one. *)

external get_state : t -> bool = "ml_gtk_switch_get_state"
(** Gets the underlying state of the [GtkSwitch]. *)

external get_active : t -> bool = "ml_gtk_switch_get_active"
(** Gets whether the [GtkSwitch] is in its “on” or “off” state. *)

(* Properties *)

val on_activate :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** Emitted to animate the switch.

    Applications should never connect to this signal, but use the
    {{!Ocgtk.Raw.Switch.val-get_active}[Gtk.Switch:active]} property. *)

val on_state_set :
  ?after:bool -> t -> callback:(state:bool -> bool) -> Gobject.Signal.handler_id
(** Emitted to change the underlying state.

    The ::state-set signal is emitted when the user changes the switch position.
    The default handler calls
    {{!Ocgtk.Raw.Switch.val-set_state}[Gtk.Switch.set_state]} with the value of
    [state].

    To implement delayed state change, applications can connect to this signal,
    initiate the change of the underlying state, and call
    {{!Ocgtk.Raw.Switch.val-set_state}[Gtk.Switch.set_state]} when the
    underlying state change is complete. The signal handler should return [true]
    to prevent the default handler from running. *)
