(* GENERATED CODE - DO NOT EDIT *)
(* Widget: PageSetup *)

type t = Gtk.widget

(** Create a new PageSetup *)
external new_ : unit -> t = "ml_gtk_page_setup_new"

(** Create a new PageSetup *)
external new_from_gvariant : unit -> t = "ml_gtk_page_setup_new_from_gvariant"

external to_file : t -> string -> (bool, GError.t) result = "ml_gtk_page_setup_to_file"

external set_top_margin : t -> float -> unit -> unit = "ml_gtk_page_setup_set_top_margin"

external set_right_margin : t -> float -> unit -> unit = "ml_gtk_page_setup_set_right_margin"

external set_paper_size_and_default_margins : t -> Gtk.widget -> unit = "ml_gtk_page_setup_set_paper_size_and_default_margins"

external set_paper_size : t -> Gtk.widget -> unit = "ml_gtk_page_setup_set_paper_size"

external set_orientation : t -> Gtk_enums.pageorientation -> unit = "ml_gtk_page_setup_set_orientation"

external set_left_margin : t -> float -> unit -> unit = "ml_gtk_page_setup_set_left_margin"

external set_bottom_margin : t -> float -> unit -> unit = "ml_gtk_page_setup_set_bottom_margin"

external load_file : t -> string -> (bool, GError.t) result = "ml_gtk_page_setup_load_file"

external get_top_margin : t -> unit -> float = "ml_gtk_page_setup_get_top_margin"

external get_right_margin : t -> unit -> float = "ml_gtk_page_setup_get_right_margin"

external get_paper_width : t -> unit -> float = "ml_gtk_page_setup_get_paper_width"

external get_paper_size : t -> Gtk.widget = "ml_gtk_page_setup_get_paper_size"

external get_paper_height : t -> unit -> float = "ml_gtk_page_setup_get_paper_height"

external get_page_width : t -> unit -> float = "ml_gtk_page_setup_get_page_width"

external get_page_height : t -> unit -> float = "ml_gtk_page_setup_get_page_height"

external get_orientation : t -> Gtk_enums.pageorientation = "ml_gtk_page_setup_get_orientation"

external get_left_margin : t -> unit -> float = "ml_gtk_page_setup_get_left_margin"

external get_bottom_margin : t -> unit -> float = "ml_gtk_page_setup_get_bottom_margin"

external copy : t -> Gtk.widget = "ml_gtk_page_setup_copy"

