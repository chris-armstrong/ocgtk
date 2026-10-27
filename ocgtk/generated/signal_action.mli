(** Emits a signal on a widget.

    Signals that are used in this way are referred to as keybinding signals, and
    they are expected to be defined with the [G_SIGNAL_ACTION] flag.

    Its methods, signals and properties are on {!class-type-signal_action_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Signal_action}. *)

(** The methods, signals and properties of a [GtkSignalAction]. *)
class type signal_action_t = object
  inherit Shortcut_action.shortcut_action_t

  method get_signal_name : unit -> string
  (** Returns the name of the signal that will be emitted. *)

  method as_signal_action : Raw.Signal_action.t
end

class signal_action : Raw.Signal_action.t -> signal_action_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Signal_action.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkSignalAction], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : string -> signal_action_t
(** Creates an action that when activated, emits the given action signal on the
    provided widget.

    It will also unpack the args into arguments passed to the signal. *)
