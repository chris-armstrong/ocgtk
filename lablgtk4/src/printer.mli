(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Printer *)

type t = Gtk.widget

(** Create a new Printer *)
external new_ : string -> Gtk.widget -> bool -> t = "ml_gtk_printer_new"

(* Properties *)

(** Get property: accepting-jobs *)
external get_accepting_jobs : t -> bool = "ml_gtk_printer_get_accepting_jobs"

(** Get property: accepts-pdf *)
external get_accepts_pdf : t -> bool = "ml_gtk_printer_get_accepts_pdf"

(** Get property: accepts-ps *)
external get_accepts_ps : t -> bool = "ml_gtk_printer_get_accepts_ps"

(** Get property: icon-name *)
external get_icon_name : t -> string = "ml_gtk_printer_get_icon_name"

(** Get property: is-virtual *)
external get_is_virtual : t -> bool = "ml_gtk_printer_get_is_virtual"

(** Get property: job-count *)
external get_job_count : t -> int = "ml_gtk_printer_get_job_count"

(** Get property: location *)
external get_location : t -> string = "ml_gtk_printer_get_location"

(** Get property: name *)
external get_name : t -> string = "ml_gtk_printer_get_name"

(** Get property: paused *)
external get_paused : t -> bool = "ml_gtk_printer_get_paused"

(** Get property: state-message *)
external get_state_message : t -> string = "ml_gtk_printer_get_state_message"

external request_details : t -> unit = "ml_gtk_printer_request_details"

external list_papers : t -> unit = "ml_gtk_printer_list_papers"

external is_virtual : t -> bool = "ml_gtk_printer_is_virtual"

external is_paused : t -> bool = "ml_gtk_printer_is_paused"

external is_default : t -> bool = "ml_gtk_printer_is_default"

external is_active : t -> bool = "ml_gtk_printer_is_active"

external is_accepting_jobs : t -> bool = "ml_gtk_printer_is_accepting_jobs"

external has_details : t -> bool = "ml_gtk_printer_has_details"

external get_hard_margins_for_paper_size : t -> Gtk.widget -> float -> float -> float -> float -> bool = "ml_gtk_printer_get_hard_margins_for_paper_size_bytecode" "ml_gtk_printer_get_hard_margins_for_paper_size_native"

external get_hard_margins : t -> float -> float -> float -> float -> bool = "ml_gtk_printer_get_hard_margins"

external get_description : t -> string = "ml_gtk_printer_get_description"

external get_default_page_size : t -> Gtk.widget = "ml_gtk_printer_get_default_page_size"

external get_capabilities : t -> unit = "ml_gtk_printer_get_capabilities"

external get_backend : t -> Gtk.widget = "ml_gtk_printer_get_backend"

external compare : t -> Gtk.widget -> int = "ml_gtk_printer_compare"

external accepts_ps : t -> bool = "ml_gtk_printer_accepts_ps"

external accepts_pdf : t -> bool = "ml_gtk_printer_accepts_pdf"

