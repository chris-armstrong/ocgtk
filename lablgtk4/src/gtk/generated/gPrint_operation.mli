class print_operation : Print_operation.t ->
  object
    inherit Gprint_operation_signals.print_operation_signals
    method allow_async : bool
    method set_allow_async : bool -> unit
    method current_page : int
    method set_current_page : int -> unit
    method custom_tab_label : string
    method set_custom_tab_label : string -> unit
    method embed_page_setup : bool
    method set_embed_page_setup : bool -> unit
    method export_filename : string
    method set_export_filename : string -> unit
    method has_selection : bool
    method set_has_selection : bool -> unit
    method job_name : string
    method set_job_name : string -> unit
    method n_pages : int
    method set_n_pages : int -> unit
    method n_pages_to_print : int
    method show_progress : bool
    method set_show_progress : bool -> unit
    method status_string : string
    method support_selection : bool
    method set_support_selection : bool -> unit
    method track_print_status : bool
    method set_track_print_status : bool -> unit
    method use_full_page : bool
    method set_use_full_page : bool -> unit
    method cancel : unit -> unit
    method draw_page_finish : unit -> unit
    method get_error : unit -> (unit, GError.t) result
    method get_status : unit -> Gtk_enums.printstatus
    method is_finished : unit -> bool
    method run : Gtk_enums.printoperationaction -> #GApplication_and__window_and__window_group.window option -> (Gtk_enums.printoperationresult, GError.t) result
    method set_defer_drawing : unit -> unit
    method set_unit : unit -> unit
    method as_print_operation : Print_operation.t
  end

