(* GTK4 Box Container - Manually Created *)

type t = [`box | `widget] Gobject.obj

(** {2 External C bindings} *)

external create_impl : int -> int -> t = "ml_gtk_box_new"
external append : t -> Gtk.widget -> unit = "ml_gtk_box_append"
external prepend : t -> Gtk.widget -> unit = "ml_gtk_box_prepend"
external insert_child_after_impl : t -> Gtk.widget -> Gtk.widget option -> unit = "ml_gtk_box_insert_child_after"
external remove : t -> Gtk.widget -> unit = "ml_gtk_box_remove"
external reorder_child_after_impl : t -> Gtk.widget -> Gtk.widget option -> unit = "ml_gtk_box_reorder_child_after"
external get_spacing : t -> int = "ml_gtk_box_get_spacing"
external set_spacing : t -> int -> unit = "ml_gtk_box_set_spacing"
external get_homogeneous : t -> bool = "ml_gtk_box_get_homogeneous"
external set_homogeneous : t -> bool -> unit = "ml_gtk_box_set_homogeneous"
external get_baseline_position_impl : t -> int = "ml_gtk_box_get_baseline_position"
external set_baseline_position_impl : t -> int -> unit = "ml_gtk_box_set_baseline_position"

(** {2 Helper functions} *)

(* Convert orientation to/from int *)
let orientation_to_int = function
  | `HORIZONTAL -> 0
  | `VERTICAL -> 1

let int_to_orientation = function
  | 0 -> `HORIZONTAL
  | 1 -> `VERTICAL
  | _ -> `HORIZONTAL  (* default *)

(* Convert baseline_position to/from int *)
let baseline_position_to_int : Gtk.baseline_position -> int = function
  | `TOP -> 0
  | `CENTER -> 1
  | `BOTTOM -> 2

let int_to_baseline_position : int -> Gtk.baseline_position = function
  | 0 -> `TOP
  | 1 -> `CENTER
  | 2 -> `BOTTOM
  | _ -> `CENTER  (* default *)

(** {2 Wrapped functions} *)

let create ~orientation ~spacing =
  create_impl (orientation_to_int orientation) spacing

let insert_child_after box ~child ~sibling =
  insert_child_after_impl box child sibling

let reorder_child_after box ~child ~sibling =
  reorder_child_after_impl box child sibling

let get_baseline_position box : Gtk.baseline_position =
  int_to_baseline_position (get_baseline_position_impl box)

let set_baseline_position box (pos : Gtk.baseline_position) =
  set_baseline_position_impl box (baseline_position_to_int pos)

(* Convert to widget - uses Obj.magic since [`box | `widget] can't be coerced to [`widget] *)
let as_widget (box : t) : Gtk.widget = Obj.magic box
