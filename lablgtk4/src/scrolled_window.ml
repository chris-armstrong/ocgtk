(* GTK4 Scrolled_window - Manually Created *)

type t = [`scrolled_window | `widget] Gobject.obj

type policy_type = [
  | `ALWAYS
  | `AUTOMATIC
  | `NEVER
  | `EXTERNAL
]

external create : unit -> t = "ml_gtk_scrolled_window_new"
external set_child : t -> Gtk.widget option -> unit = "ml_gtk_scrolled_window_set_child"
external get_child : t -> Gtk.widget option = "ml_gtk_scrolled_window_get_child"

external set_policy_impl : t -> int -> int -> unit = "ml_gtk_scrolled_window_set_policy"
external get_policy_impl : t -> int * int = "ml_gtk_scrolled_window_get_policy"

external get_hscrollbar : t -> Gtk.widget option = "ml_gtk_scrolled_window_get_hscrollbar"
external get_vscrollbar : t -> Gtk.widget option = "ml_gtk_scrolled_window_get_vscrollbar"
external set_min_content_width : t -> int -> unit = "ml_gtk_scrolled_window_set_min_content_width"
external get_min_content_width : t -> int = "ml_gtk_scrolled_window_get_min_content_width"
external set_min_content_height : t -> int -> unit = "ml_gtk_scrolled_window_set_min_content_height"
external get_min_content_height : t -> int = "ml_gtk_scrolled_window_get_min_content_height"

let policy_type_to_int : policy_type -> int = function
  | `ALWAYS -> 0
  | `AUTOMATIC -> 1
  | `NEVER -> 2
  | `EXTERNAL -> 3

let int_to_policy_type : int -> policy_type = function
  | 0 -> `ALWAYS
  | 1 -> `AUTOMATIC
  | 2 -> `NEVER
  | 3 -> `EXTERNAL
  | _ -> `AUTOMATIC

let set_policy t ~(hpolicy : policy_type) ~(vpolicy : policy_type) =
  set_policy_impl t (policy_type_to_int hpolicy) (policy_type_to_int vpolicy)

let get_policy t : policy_type * policy_type =
  let (h, v) = get_policy_impl t in
  (int_to_policy_type h, int_to_policy_type v)

let as_widget (sw : t) : Gtk.widget = Obj.magic sw
