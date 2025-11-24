(* GENERATED CODE - DO NOT EDIT *)
(* Widget: PrintJob *)

type t = Gtk.Widget.t

(** Create a new PrintJob *)
external new_ : string -> Gtk.Widget.t -> Gtk.Widget.t -> Gtk.Widget.t -> t = "ml_gtk_print_job_new"

(* Properties *)

(** Get property: title *)
external get_title : t -> string = "ml_gtk_print_job_get_title"

(** Get property: track-print-status *)
external get_track_print_status : t -> bool = "ml_gtk_print_job_get_track_print_status"

(** Set property: track-print-status *)
external set_track_print_status : t -> bool -> unit = "ml_gtk_print_job_set_track_print_status"

external set_source_file : t -> string -> (bool, GError.t) result = "ml_gtk_print_job_set_source_file"

external set_source_fd : t -> int -> (bool, GError.t) result = "ml_gtk_print_job_set_source_fd"

external set_scale : t -> float -> unit = "ml_gtk_print_job_set_scale"

external set_rotate : t -> bool -> unit = "ml_gtk_print_job_set_rotate"

external set_reverse : t -> bool -> unit = "ml_gtk_print_job_set_reverse"

external set_pages : t -> Gtk_enums.printpages -> unit = "ml_gtk_print_job_set_pages"

external set_page_set : t -> Gtk_enums.pageset -> unit = "ml_gtk_print_job_set_page_set"

external set_page_ranges : t -> unit -> int -> unit = "ml_gtk_print_job_set_page_ranges"

external set_num_copies : t -> int -> unit = "ml_gtk_print_job_set_num_copies"

external set_n_up_layout : t -> Gtk_enums.numberuplayout -> unit = "ml_gtk_print_job_set_n_up_layout"

external set_n_up : t -> int -> unit = "ml_gtk_print_job_set_n_up"

external set_collate : t -> bool -> unit = "ml_gtk_print_job_set_collate"

external send : t -> unit -> unit -> unit -> unit = "ml_gtk_print_job_send"

external get_surface : t -> (unit, GError.t) result = "ml_gtk_print_job_get_surface"

external get_status : t -> Gtk_enums.printstatus = "ml_gtk_print_job_get_status"

external get_settings : t -> Gtk.Widget.t = "ml_gtk_print_job_get_settings"

external get_scale : t -> float = "ml_gtk_print_job_get_scale"

external get_rotate : t -> bool = "ml_gtk_print_job_get_rotate"

external get_reverse : t -> bool = "ml_gtk_print_job_get_reverse"

external get_printer : t -> Gtk.Widget.t = "ml_gtk_print_job_get_printer"

external get_pages : t -> Gtk_enums.printpages = "ml_gtk_print_job_get_pages"

external get_page_set : t -> Gtk_enums.pageset = "ml_gtk_print_job_get_page_set"

external get_page_ranges : t -> int -> unit = "ml_gtk_print_job_get_page_ranges"

external get_num_copies : t -> int = "ml_gtk_print_job_get_num_copies"

external get_n_up_layout : t -> Gtk_enums.numberuplayout = "ml_gtk_print_job_get_n_up_layout"

external get_n_up : t -> int = "ml_gtk_print_job_get_n_up"

external get_collate : t -> bool = "ml_gtk_print_job_get_collate"

