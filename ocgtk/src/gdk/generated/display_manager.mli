(* GENERATED CODE - DO NOT EDIT *)
(* DisplayManager: DisplayManager *)

type t = [`display_manager | `object_] Gobject.obj

(* Methods *)
(** Sets @display as the default display. *)
external set_default_display : t -> App_launch_context_cycle_de440b34.Display.t -> unit = "ml_gdk_display_manager_set_default_display"

(** Opens a display. *)
external open_display : t -> string option -> App_launch_context_cycle_de440b34.Display.t option = "ml_gdk_display_manager_open_display"

(** List all currently open displays. *)
external list_displays : t -> App_launch_context_cycle_de440b34.Display.t list = "ml_gdk_display_manager_list_displays"

(** Gets the default `GdkDisplay`. *)
external get_default_display : t -> App_launch_context_cycle_de440b34.Display.t option = "ml_gdk_display_manager_get_default_display"

(* Properties *)

val on_display_opened : ?after:bool -> t -> callback:(display:App_launch_context_cycle_de440b34.Display.t -> unit) -> Gobject.Signal.handler_id
