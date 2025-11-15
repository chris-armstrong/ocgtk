(** GTK4 Event Controller System *)

(** Base event controller type *)
type t = [`eventcontroller] Gobject.obj

(** Propagation phase *)
type propagation_phase = [
  | `NONE
  | `CAPTURE   (* Event captured going down *)
  | `BUBBLE    (* Event bubbles up *)
  | `TARGET    (* Event at target widget *)
]

(** Propagation limit *)
type propagation_limit = [
  | `NONE
  | `SAME_NATIVE  (* Stop at window boundary *)
]

module Base : sig
  (** Get the widget this controller is attached to *)
  val get_widget : t -> Gtk.widget option

  (** Get propagation phase *)
  val get_propagation_phase : t -> propagation_phase

  (** Set propagation phase *)
  val set_propagation_phase : t -> propagation_phase -> unit

  (** Get propagation limit *)
  val get_propagation_limit : t -> propagation_limit

  (** Set propagation limit *)
  val set_propagation_limit : t -> propagation_limit -> unit

  (** Reset the controller state *)
  val reset : t -> unit

  (** Get the current event being processed *)
  val get_current_event : t -> Gdk.Event.t option

  (** Get current event time *)
  val get_current_event_time : t -> int
end
