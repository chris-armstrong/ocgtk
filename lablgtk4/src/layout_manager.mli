(* GENERATED CODE - DO NOT EDIT *)
(* Widget: LayoutManager *)

type t = Gtk.Widget.t

external layout_changed : t -> unit = "ml_gtk_layout_manager_layout_changed"

external get_widget : t -> Gtk.Widget.t = "ml_gtk_layout_manager_get_widget"

external get_request_mode : t -> Gtk_enums.sizerequestmode = "ml_gtk_layout_manager_get_request_mode"

external get_layout_child : t -> Gtk.Widget.t -> Gtk.Widget.t = "ml_gtk_layout_manager_get_layout_child"

external allocate : t -> Gtk.Widget.t -> int -> int -> int -> unit = "ml_gtk_layout_manager_allocate"

