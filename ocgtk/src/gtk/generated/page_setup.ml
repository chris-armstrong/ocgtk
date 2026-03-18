(* GENERATED CODE - DO NOT EDIT *)
(* PageSetup: PageSetup *)

type t = [`page_setup | `object_] Gobject.obj

(** Create a new PageSetup *)
external new_ : unit -> t = "ml_gtk_page_setup_new"

(* Methods *)
(** This function saves the information from @setup to @file_name. *)
external to_file : t -> string -> (bool, GError.t) result = "ml_gtk_page_setup_to_file"

(** Sets the top margin of the `GtkPageSetup`. *)
external set_top_margin : t -> float -> Gtk_enums.unit -> unit = "ml_gtk_page_setup_set_top_margin"

(** Sets the right margin of the `GtkPageSetup`. *)
external set_right_margin : t -> float -> Gtk_enums.unit -> unit = "ml_gtk_page_setup_set_right_margin"

(** Sets the paper size of the `GtkPageSetup` and modifies
the margins according to the new paper size. *)
external set_paper_size_and_default_margins : t -> Paper_size.t -> unit = "ml_gtk_page_setup_set_paper_size_and_default_margins"

(** Sets the paper size of the `GtkPageSetup` without
changing the margins.

See [method@Gtk.PageSetup.set_paper_size_and_default_margins]. *)
external set_paper_size : t -> Paper_size.t -> unit = "ml_gtk_page_setup_set_paper_size"

(** Sets the page orientation of the `GtkPageSetup`. *)
external set_orientation : t -> Gtk_enums.pageorientation -> unit = "ml_gtk_page_setup_set_orientation"

(** Sets the left margin of the `GtkPageSetup`. *)
external set_left_margin : t -> float -> Gtk_enums.unit -> unit = "ml_gtk_page_setup_set_left_margin"

(** Sets the bottom margin of the `GtkPageSetup`. *)
external set_bottom_margin : t -> float -> Gtk_enums.unit -> unit = "ml_gtk_page_setup_set_bottom_margin"

(** Reads the page setup from the file @file_name.

See [method@Gtk.PageSetup.to_file]. *)
external load_file : t -> string -> (bool, GError.t) result = "ml_gtk_page_setup_load_file"

(** Gets the top margin in units of @unit. *)
external get_top_margin : t -> Gtk_enums.unit -> float = "ml_gtk_page_setup_get_top_margin"

(** Gets the right margin in units of @unit. *)
external get_right_margin : t -> Gtk_enums.unit -> float = "ml_gtk_page_setup_get_right_margin"

(** Returns the paper width in units of @unit.

Note that this function takes orientation,
but not margins into consideration.
See [method@Gtk.PageSetup.get_page_width]. *)
external get_paper_width : t -> Gtk_enums.unit -> float = "ml_gtk_page_setup_get_paper_width"

(** Gets the paper size of the `GtkPageSetup`. *)
external get_paper_size : t -> Paper_size.t = "ml_gtk_page_setup_get_paper_size"

(** Returns the paper height in units of @unit.

Note that this function takes orientation,
but not margins into consideration.
See [method@Gtk.PageSetup.get_page_height]. *)
external get_paper_height : t -> Gtk_enums.unit -> float = "ml_gtk_page_setup_get_paper_height"

(** Returns the page width in units of @unit.

Note that this function takes orientation
and margins into consideration.
See [method@Gtk.PageSetup.get_paper_width]. *)
external get_page_width : t -> Gtk_enums.unit -> float = "ml_gtk_page_setup_get_page_width"

(** Returns the page height in units of @unit.

Note that this function takes orientation
and margins into consideration.
See [method@Gtk.PageSetup.get_paper_height]. *)
external get_page_height : t -> Gtk_enums.unit -> float = "ml_gtk_page_setup_get_page_height"

(** Gets the page orientation of the `GtkPageSetup`. *)
external get_orientation : t -> Gtk_enums.pageorientation = "ml_gtk_page_setup_get_orientation"

(** Gets the left margin in units of @unit. *)
external get_left_margin : t -> Gtk_enums.unit -> float = "ml_gtk_page_setup_get_left_margin"

(** Gets the bottom margin in units of @unit. *)
external get_bottom_margin : t -> Gtk_enums.unit -> float = "ml_gtk_page_setup_get_bottom_margin"

