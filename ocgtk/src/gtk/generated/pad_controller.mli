(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: PadController *)

type t = [`pad_controller | `event_controller | `object_] Gobject.obj

val as_event_controller : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t

(** Create a new PadController *)
external new_ : unit -> unit -> t = "ml_gtk_pad_controller_new"

(* Methods *)
(** A convenience function to add a group of action entries on
@controller.

See [struct@Gtk.PadActionEntry] and [method@Gtk.PadController.set_action]. *)
external set_action_entries : t -> Pad_action_entry.t array -> int -> unit = "ml_gtk_pad_controller_set_action_entries"

(** Adds an individual action to @controller.

This action will only be activated if the given button/ring/strip number
in @index is interacted while the current mode is @mode. -1 may be used
for simple cases, so the action is triggered on all modes.

The given @label should be considered user-visible, so internationalization
rules apply. Some windowing systems may be able to use those for user
feedback. *)
external set_action : t -> Gtk_enums.padactiontype -> int -> int -> string -> string -> unit = "ml_gtk_pad_controller_set_action_bytecode" "ml_gtk_pad_controller_set_action_native"

(* Properties *)

