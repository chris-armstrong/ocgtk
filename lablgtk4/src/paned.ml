(* GTK4 Paned Container - Manually Created *)

type t = [`paned | `widget] Gobject.obj

(** {2 External C bindings} *)

external create_impl : int -> t = "ml_gtk_paned_new"
external set_start_child : t -> Gtk.widget option -> unit = "ml_gtk_paned_set_start_child"
external get_start_child : t -> Gtk.widget option = "ml_gtk_paned_get_start_child"
external set_end_child : t -> Gtk.widget option -> unit = "ml_gtk_paned_set_end_child"
external get_end_child : t -> Gtk.widget option = "ml_gtk_paned_get_end_child"
external set_position : t -> int -> unit = "ml_gtk_paned_set_position"
external get_position : t -> int = "ml_gtk_paned_get_position"
external set_wide_handle : t -> bool -> unit = "ml_gtk_paned_set_wide_handle"
external get_wide_handle : t -> bool = "ml_gtk_paned_get_wide_handle"
external set_resize_start_child : t -> bool -> unit = "ml_gtk_paned_set_resize_start_child"
external get_resize_start_child : t -> bool = "ml_gtk_paned_get_resize_start_child"
external set_resize_end_child : t -> bool -> unit = "ml_gtk_paned_set_resize_end_child"
external get_resize_end_child : t -> bool = "ml_gtk_paned_get_resize_end_child"
external set_shrink_start_child : t -> bool -> unit = "ml_gtk_paned_set_shrink_start_child"
external get_shrink_start_child : t -> bool = "ml_gtk_paned_get_shrink_start_child"
external set_shrink_end_child : t -> bool -> unit = "ml_gtk_paned_set_shrink_end_child"
external get_shrink_end_child : t -> bool = "ml_gtk_paned_get_shrink_end_child"

(** {2 Helper functions} *)

(* Convert orientation to/from int *)
let orientation_to_int = function
  | `HORIZONTAL -> 0
  | `VERTICAL -> 1

let create ~orientation =
  create_impl (orientation_to_int orientation)

let as_widget (paned : t) : Gtk.widget = Obj.magic paned
