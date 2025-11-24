(* GENERATED CODE - DO NOT EDIT *)
(* Widget: LayoutManager *)

type t = Gtk.widget

external layout_changed : t -> unit = "ml_gtk_layout_manager_layout_changed"

external get_widget : t -> Gtk.widget = "ml_gtk_layout_manager_get_widget"

external get_request_mode : t -> Gtk_enums.sizerequestmode = "ml_gtk_layout_manager_get_request_mode"

external get_layout_child : t -> Gtk.widget -> Gtk.widget = "ml_gtk_layout_manager_get_layout_child"

external allocate : t -> Gtk.widget -> int -> int -> int -> unit = "ml_gtk_layout_manager_allocate"

