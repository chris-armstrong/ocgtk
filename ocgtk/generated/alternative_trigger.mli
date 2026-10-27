(** Combines two shortcut triggers.

    The [GtkAlternativeTrigger] triggers when either of the two trigger.

    This can be cascaded to combine more than two triggers.

    Its methods, signals and properties are on
    {!class-type-alternative_trigger_t}. The functions it is built on are in
    {!Ocgtk.Raw.Alternative_trigger}. *)

(** The methods, signals and properties of a [GtkAlternativeTrigger]. *)
class type alternative_trigger_t = object
  inherit Shortcut_trigger.shortcut_trigger_t
  method get_first : unit -> Shortcut_trigger.shortcut_trigger_t
  method get_second : unit -> Shortcut_trigger.shortcut_trigger_t
  method as_alternative_trigger : Raw.Alternative_trigger.t
end

class alternative_trigger : Raw.Alternative_trigger.t -> alternative_trigger_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Alternative_trigger.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkAlternativeTrigger], give one already wrapped. *)

val new_ :
  Shortcut_trigger.shortcut_trigger_t ->
  Shortcut_trigger.shortcut_trigger_t ->
  alternative_trigger_t
