(* GENERATED CODE - DO NOT EDIT *)
(* Widget: PrintSettings *)

type t = Gtk.widget

(** Create a new PrintSettings *)
external new_ : unit -> t = "ml_gtk_print_settings_new"

(** Create a new PrintSettings *)
external new_from_gvariant : unit -> t = "ml_gtk_print_settings_new_from_gvariant"

external unset : t -> string -> unit = "ml_gtk_print_settings_unset"

external to_file : t -> string -> (bool, GError.t) result = "ml_gtk_print_settings_to_file"

external set_use_color : t -> bool -> unit = "ml_gtk_print_settings_set_use_color"

external set_scale : t -> float -> unit = "ml_gtk_print_settings_set_scale"

external set_reverse : t -> bool -> unit = "ml_gtk_print_settings_set_reverse"

external set_resolution_xy : t -> int -> int -> unit = "ml_gtk_print_settings_set_resolution_xy"

external set_resolution : t -> int -> unit = "ml_gtk_print_settings_set_resolution"

external set_quality : t -> Gtk_enums.printquality -> unit = "ml_gtk_print_settings_set_quality"

external set_printer_lpi : t -> float -> unit = "ml_gtk_print_settings_set_printer_lpi"

external set_printer : t -> string -> unit = "ml_gtk_print_settings_set_printer"

external set_print_pages : t -> Gtk_enums.printpages -> unit = "ml_gtk_print_settings_set_print_pages"

external set_paper_width : t -> float -> unit -> unit = "ml_gtk_print_settings_set_paper_width"

external set_paper_size : t -> Gtk.widget -> unit = "ml_gtk_print_settings_set_paper_size"

external set_paper_height : t -> float -> unit -> unit = "ml_gtk_print_settings_set_paper_height"

external set_page_set : t -> Gtk_enums.pageset -> unit = "ml_gtk_print_settings_set_page_set"

external set_output_bin : t -> string -> unit = "ml_gtk_print_settings_set_output_bin"

external set_orientation : t -> Gtk_enums.pageorientation -> unit = "ml_gtk_print_settings_set_orientation"

external set_number_up_layout : t -> Gtk_enums.numberuplayout -> unit = "ml_gtk_print_settings_set_number_up_layout"

external set_number_up : t -> int -> unit = "ml_gtk_print_settings_set_number_up"

external set_n_copies : t -> int -> unit = "ml_gtk_print_settings_set_n_copies"

external set_media_type : t -> string -> unit = "ml_gtk_print_settings_set_media_type"

external set_length : t -> string -> float -> unit -> unit = "ml_gtk_print_settings_set_length"

external set_int : t -> string -> int -> unit = "ml_gtk_print_settings_set_int"

external set_finishings : t -> string -> unit = "ml_gtk_print_settings_set_finishings"

external set_duplex : t -> Gtk_enums.printduplex -> unit = "ml_gtk_print_settings_set_duplex"

external set_double : t -> string -> float -> unit = "ml_gtk_print_settings_set_double"

external set_dither : t -> string -> unit = "ml_gtk_print_settings_set_dither"

external set_default_source : t -> string -> unit = "ml_gtk_print_settings_set_default_source"

external set_collate : t -> bool -> unit = "ml_gtk_print_settings_set_collate"

external set_bool : t -> string -> bool -> unit = "ml_gtk_print_settings_set_bool"

external set : t -> string -> string option -> unit = "ml_gtk_print_settings_set"

external load_file : t -> string -> (bool, GError.t) result = "ml_gtk_print_settings_load_file"

external has_key : t -> string -> bool = "ml_gtk_print_settings_has_key"

external get_use_color : t -> bool = "ml_gtk_print_settings_get_use_color"

external get_scale : t -> float = "ml_gtk_print_settings_get_scale"

external get_reverse : t -> bool = "ml_gtk_print_settings_get_reverse"

external get_resolution_y : t -> int = "ml_gtk_print_settings_get_resolution_y"

external get_resolution_x : t -> int = "ml_gtk_print_settings_get_resolution_x"

external get_resolution : t -> int = "ml_gtk_print_settings_get_resolution"

external get_quality : t -> Gtk_enums.printquality = "ml_gtk_print_settings_get_quality"

external get_printer_lpi : t -> float = "ml_gtk_print_settings_get_printer_lpi"

external get_printer : t -> string = "ml_gtk_print_settings_get_printer"

external get_print_pages : t -> Gtk_enums.printpages = "ml_gtk_print_settings_get_print_pages"

external get_paper_width : t -> unit -> float = "ml_gtk_print_settings_get_paper_width"

external get_paper_size : t -> Gtk.widget = "ml_gtk_print_settings_get_paper_size"

external get_paper_height : t -> unit -> float = "ml_gtk_print_settings_get_paper_height"

external get_page_set : t -> Gtk_enums.pageset = "ml_gtk_print_settings_get_page_set"

external get_output_bin : t -> string = "ml_gtk_print_settings_get_output_bin"

external get_orientation : t -> Gtk_enums.pageorientation = "ml_gtk_print_settings_get_orientation"

external get_number_up_layout : t -> Gtk_enums.numberuplayout = "ml_gtk_print_settings_get_number_up_layout"

external get_number_up : t -> int = "ml_gtk_print_settings_get_number_up"

external get_n_copies : t -> int = "ml_gtk_print_settings_get_n_copies"

external get_media_type : t -> string = "ml_gtk_print_settings_get_media_type"

external get_length : t -> string -> unit -> float = "ml_gtk_print_settings_get_length"

external get_int_with_default : t -> string -> int -> int = "ml_gtk_print_settings_get_int_with_default"

external get_int : t -> string -> int = "ml_gtk_print_settings_get_int"

external get_finishings : t -> string = "ml_gtk_print_settings_get_finishings"

external get_duplex : t -> Gtk_enums.printduplex = "ml_gtk_print_settings_get_duplex"

external get_double_with_default : t -> string -> float -> float = "ml_gtk_print_settings_get_double_with_default"

external get_double : t -> string -> float = "ml_gtk_print_settings_get_double"

external get_dither : t -> string = "ml_gtk_print_settings_get_dither"

external get_default_source : t -> string = "ml_gtk_print_settings_get_default_source"

external get_collate : t -> bool = "ml_gtk_print_settings_get_collate"

external get_bool : t -> string -> bool = "ml_gtk_print_settings_get_bool"

external get : t -> string -> string = "ml_gtk_print_settings_get"

external copy : t -> Gtk.widget = "ml_gtk_print_settings_copy"

