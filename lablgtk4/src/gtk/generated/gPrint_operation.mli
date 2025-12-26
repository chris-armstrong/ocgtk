class print_operation : Print_operation.t ->
  object
    inherit Gprint_operation_signals.print_operation_signals
    method cancel : unit -> unit
    method draw_page_finish : unit -> unit
    method get_embed_page_setup : unit -> bool
    method get_error : unit -> (unit, GError.t) result
    method get_has_selection : unit -> bool
    method get_n_pages_to_print : unit -> int
    method get_status : unit -> Gtk_enums.printstatus
    method get_status_string : unit -> string
    method get_support_selection : unit -> bool
    method is_finished : unit -> bool
    method run : Gtk_enums.printoperationaction -> #GApplication_and__window_and__window_group.window option -> (Gtk_enums.printoperationresult, GError.t) result
    method set_allow_async : bool -> unit
    method set_current_page : int -> unit
    method set_custom_tab_label : string option -> unit
    method set_defer_drawing : unit -> unit
    method set_embed_page_setup : bool -> unit
    method set_export_filename : string -> unit
    method set_has_selection : bool -> unit
    method set_job_name : string -> unit
    method set_n_pages : int -> unit
    method set_show_progress : bool -> unit
    method set_support_selection : bool -> unit
    method set_track_print_status : bool -> unit
    method set_unit : Gtk_enums.unit -> unit
    method set_use_full_page : bool -> unit
    method as_print_operation : Print_operation.t
  end

