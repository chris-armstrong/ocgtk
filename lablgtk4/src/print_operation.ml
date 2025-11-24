(* GENERATED CODE - DO NOT EDIT *)
(* Widget: PrintOperation *)

type t = Gtk.widget

external new_ : unit -> t = "ml_gtk_print_operation_new"

(* Properties *)

external get_allow_async : t -> bool = "ml_gtk_print_operation_get_allow_async"

external set_allow_async : t -> bool -> unit = "ml_gtk_print_operation_set_allow_async"

external get_current_page : t -> int = "ml_gtk_print_operation_get_current_page"

external set_current_page : t -> int -> unit = "ml_gtk_print_operation_set_current_page"

external get_custom_tab_label : t -> string = "ml_gtk_print_operation_get_custom_tab_label"

external set_custom_tab_label : t -> string -> unit = "ml_gtk_print_operation_set_custom_tab_label"

external get_embed_page_setup : t -> bool = "ml_gtk_print_operation_get_embed_page_setup"

external set_embed_page_setup : t -> bool -> unit = "ml_gtk_print_operation_set_embed_page_setup"

external get_export_filename : t -> string = "ml_gtk_print_operation_get_export_filename"

external set_export_filename : t -> string -> unit = "ml_gtk_print_operation_set_export_filename"

external get_has_selection : t -> bool = "ml_gtk_print_operation_get_has_selection"

external set_has_selection : t -> bool -> unit = "ml_gtk_print_operation_set_has_selection"

external get_job_name : t -> string = "ml_gtk_print_operation_get_job_name"

external set_job_name : t -> string -> unit = "ml_gtk_print_operation_set_job_name"

external get_n_pages : t -> int = "ml_gtk_print_operation_get_n_pages"

external set_n_pages : t -> int -> unit = "ml_gtk_print_operation_set_n_pages"

external get_n_pages_to_print : t -> int = "ml_gtk_print_operation_get_n_pages_to_print"

external get_show_progress : t -> bool = "ml_gtk_print_operation_get_show_progress"

external set_show_progress : t -> bool -> unit = "ml_gtk_print_operation_set_show_progress"

external get_status_string : t -> string = "ml_gtk_print_operation_get_status_string"

external get_support_selection : t -> bool = "ml_gtk_print_operation_get_support_selection"

external set_support_selection : t -> bool -> unit = "ml_gtk_print_operation_set_support_selection"

external get_track_print_status : t -> bool = "ml_gtk_print_operation_get_track_print_status"

external set_track_print_status : t -> bool -> unit = "ml_gtk_print_operation_set_track_print_status"

external get_use_full_page : t -> bool = "ml_gtk_print_operation_get_use_full_page"

external set_use_full_page : t -> bool -> unit = "ml_gtk_print_operation_set_use_full_page"

external set_unit : t -> unit -> unit = "ml_gtk_print_operation_set_unit"

external set_print_settings : t -> Gtk.widget option -> unit = "ml_gtk_print_operation_set_print_settings"

external set_defer_drawing : t -> unit = "ml_gtk_print_operation_set_defer_drawing"

external set_default_page_setup : t -> Gtk.widget option -> unit = "ml_gtk_print_operation_set_default_page_setup"

external run : t -> Gtk_enums.printoperationaction -> Gtk.widget option -> (Gtk_enums.printoperationresult, GError.t) result = "ml_gtk_print_operation_run"

external is_finished : t -> bool = "ml_gtk_print_operation_is_finished"

external get_status : t -> Gtk_enums.printstatus = "ml_gtk_print_operation_get_status"

external get_print_settings : t -> Gtk.widget = "ml_gtk_print_operation_get_print_settings"

external get_error : t -> (unit, GError.t) result = "ml_gtk_print_operation_get_error"

external get_default_page_setup : t -> Gtk.widget = "ml_gtk_print_operation_get_default_page_setup"

external draw_page_finish : t -> unit = "ml_gtk_print_operation_draw_page_finish"

external cancel : t -> unit = "ml_gtk_print_operation_cancel"

