(* GTK4 Grid Container - Manually Created *)

type t = [`grid | `widget] Gobject.obj

(** {2 External C bindings} *)

external create : unit -> t = "ml_gtk_grid_new"
external attach_impl : t -> Gtk.widget -> int -> int -> int -> int -> unit = "ml_gtk_grid_attach_bc" "ml_gtk_grid_attach"
external attach_next_to_impl : t -> Gtk.widget -> Gtk.widget option -> int -> int -> int -> unit = "ml_gtk_grid_attach_next_to_bc" "ml_gtk_grid_attach_next_to"
external remove : t -> Gtk.widget -> unit = "ml_gtk_grid_remove"
external get_child_at_impl : t -> int -> int -> Gtk.widget option = "ml_gtk_grid_get_child_at"
external insert_row_impl : t -> int -> unit = "ml_gtk_grid_insert_row"
let insert_row t ~position = insert_row_impl t position
external insert_column_impl : t -> int -> unit = "ml_gtk_grid_insert_column"
let insert_column t ~position = insert_column_impl t position
external insert_next_to_impl : t -> Gtk.widget -> int -> unit = "ml_gtk_grid_insert_next_to"
external remove_row_impl : t -> int -> unit = "ml_gtk_grid_remove_row"
let remove_row t ~position = remove_row_impl t position
external remove_column_impl : t -> int -> unit = "ml_gtk_grid_remove_column"
let remove_column t ~position = remove_column_impl t position
external get_row_spacing : t -> int = "ml_gtk_grid_get_row_spacing"
external set_row_spacing : t -> int -> unit = "ml_gtk_grid_set_row_spacing"
external get_column_spacing : t -> int = "ml_gtk_grid_get_column_spacing"
external set_column_spacing : t -> int -> unit = "ml_gtk_grid_set_column_spacing"
external get_row_homogeneous : t -> bool = "ml_gtk_grid_get_row_homogeneous"
external set_row_homogeneous : t -> bool -> unit = "ml_gtk_grid_set_row_homogeneous"
external get_column_homogeneous : t -> bool = "ml_gtk_grid_get_column_homogeneous"
external set_column_homogeneous : t -> bool -> unit = "ml_gtk_grid_set_column_homogeneous"
external get_baseline_row : t -> int = "ml_gtk_grid_get_baseline_row"
external set_baseline_row : t -> int -> unit = "ml_gtk_grid_set_baseline_row"

(** {2 Helper functions} *)

(* Convert position_type to/from int *)
let position_type_to_int : Gtk.position_type -> int = function
  | `LEFT -> 0
  | `RIGHT -> 1
  | `TOP -> 2
  | `BOTTOM -> 3

let int_to_position_type : int -> Gtk.position_type = function
  | 0 -> `LEFT
  | 1 -> `RIGHT
  | 2 -> `TOP
  | 3 -> `BOTTOM
  | _ -> `LEFT  (* default *)

(** {2 Wrapped functions} *)

let attach grid ~child ~column ~row ~width ~height =
  attach_impl grid child column row width height

let attach_next_to grid ~child ~sibling ~(side : Gtk.position_type) ~width ~height =
  attach_next_to_impl grid child sibling (position_type_to_int side) width height

let get_child_at grid ~column ~row =
  get_child_at_impl grid column row

let insert_next_to grid ~sibling ~(side : Gtk.position_type) =
  insert_next_to_impl grid sibling (position_type_to_int side)

(* Convert to widget - uses Obj.magic since [`grid | `widget] can't be coerced to [`widget] *)
let as_widget (grid : t) : Gtk.widget = Obj.magic grid
