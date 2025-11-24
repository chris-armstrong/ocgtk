(* GTK4 Fixed Container - Manually Created *)

type t = [`fixed | `widget] Gobject.obj

(** {2 External C bindings} *)

external create : unit -> t = "ml_gtk_fixed_new"
external put_impl : t -> Gtk.widget -> float -> float -> unit = "ml_gtk_fixed_put"
external remove : t -> Gtk.widget -> unit = "ml_gtk_fixed_remove"
external move_impl : t -> Gtk.widget -> float -> float -> unit = "ml_gtk_fixed_move"
external get_child_position_impl : t -> Gtk.widget -> float * float = "ml_gtk_fixed_get_child_position"

(** {2 Wrapped functions} *)

let put fixed widget ~x ~y =
  put_impl fixed widget x y

let move fixed widget ~x ~y =
  move_impl fixed widget x y

let get_child_position fixed widget =
  get_child_position_impl fixed widget

let as_widget (fixed : t) : Gtk.widget = Obj.magic fixed
