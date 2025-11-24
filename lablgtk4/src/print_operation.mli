(* GENERATED CODE - DO NOT EDIT *)
(* Widget: PrintOperation *)

type t = Gtk.widget

(** Create a new PrintOperation *)
external new_ : unit -> t = "ml_gtk_print_operation_new"

(* Properties *)

(** Get property: allow-async *)
external get_allow_async : t -> bool = "ml_gtk_print_operation_get_allow_async"

(** Set property: allow-async *)
external set_allow_async : t -> bool -> unit = "ml_gtk_print_operation_set_allow_async"

(** Get property: current-page *)
external get_current_page : t -> int = "ml_gtk_print_operation_get_current_page"

(** Set property: current-page *)
external set_current_page : t -> int -> unit = "ml_gtk_print_operation_set_current_page"

(** Get property: custom-tab-label *)
external get_custom_tab_label : t -> string = "ml_gtk_print_operation_get_custom_tab_label"

(** Set property: custom-tab-label *)
external set_custom_tab_label : t -> string -> unit = "ml_gtk_print_operation_set_custom_tab_label"

(** Get property: embed-page-setup *)
external get_embed_page_setup : t -> bool = "ml_gtk_print_operation_get_embed_page_setup"

(** Set property: embed-page-setup *)
external set_embed_page_setup : t -> bool -> unit = "ml_gtk_print_operation_set_embed_page_setup"

(** Get property: export-filename *)
external get_export_filename : t -> string = "ml_gtk_print_operation_get_export_filename"

(** Set property: export-filename *)
external set_export_filename : t -> string -> unit = "ml_gtk_print_operation_set_export_filename"

(** Get property: has-selection *)
external get_has_selection : t -> bool = "ml_gtk_print_operation_get_has_selection"

(** Set property: has-selection *)
external set_has_selection : t -> bool -> unit = "ml_gtk_print_operation_set_has_selection"

(** Get property: job-name *)
external get_job_name : t -> string = "ml_gtk_print_operation_get_job_name"

(** Set property: job-name *)
external set_job_name : t -> string -> unit = "ml_gtk_print_operation_set_job_name"

(** Get property: n-pages *)
external get_n_pages : t -> int = "ml_gtk_print_operation_get_n_pages"

(** Set property: n-pages *)
external set_n_pages : t -> int -> unit = "ml_gtk_print_operation_set_n_pages"

(** Get property: n-pages-to-print *)
external get_n_pages_to_print : t -> int = "ml_gtk_print_operation_get_n_pages_to_print"

(** Get property: show-progress *)
external get_show_progress : t -> bool = "ml_gtk_print_operation_get_show_progress"

(** Set property: show-progress *)
external set_show_progress : t -> bool -> unit = "ml_gtk_print_operation_set_show_progress"

(** Get property: status-string *)
external get_status_string : t -> string = "ml_gtk_print_operation_get_status_string"

(** Get property: support-selection *)
external get_support_selection : t -> bool = "ml_gtk_print_operation_get_support_selection"

(** Set property: support-selection *)
external set_support_selection : t -> bool -> unit = "ml_gtk_print_operation_set_support_selection"

(** Get property: track-print-status *)
external get_track_print_status : t -> bool = "ml_gtk_print_operation_get_track_print_status"

(** Set property: track-print-status *)
external set_track_print_status : t -> bool -> unit = "ml_gtk_print_operation_set_track_print_status"

(** Get property: use-full-page *)
external get_use_full_page : t -> bool = "ml_gtk_print_operation_get_use_full_page"

(** Set property: use-full-page *)
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

