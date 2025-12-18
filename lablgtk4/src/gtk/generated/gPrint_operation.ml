(* Signal class defined in gprint_operation_signals.ml *)

(* High-level class for PrintOperation *)
class print_operation (obj : Print_operation.t) = object (self)
  inherit Gprint_operation_signals.print_operation_signals obj

  method allow_async = Print_operation.get_allow_async obj
  method set_allow_async v = Print_operation.set_allow_async obj v

  method current_page = Print_operation.get_current_page obj
  method set_current_page v = Print_operation.set_current_page obj v

  method custom_tab_label = Print_operation.get_custom_tab_label obj
  method set_custom_tab_label v = Print_operation.set_custom_tab_label obj v

  method embed_page_setup = Print_operation.get_embed_page_setup obj
  method set_embed_page_setup v = Print_operation.set_embed_page_setup obj v

  method export_filename = Print_operation.get_export_filename obj
  method set_export_filename v = Print_operation.set_export_filename obj v

  method has_selection = Print_operation.get_has_selection obj
  method set_has_selection v = Print_operation.set_has_selection obj v

  method job_name = Print_operation.get_job_name obj
  method set_job_name v = Print_operation.set_job_name obj v

  method n_pages = Print_operation.get_n_pages obj
  method set_n_pages v = Print_operation.set_n_pages obj v

  method n_pages_to_print = Print_operation.get_n_pages_to_print obj

  method show_progress = Print_operation.get_show_progress obj
  method set_show_progress v = Print_operation.set_show_progress obj v

  method status_string = Print_operation.get_status_string obj

  method support_selection = Print_operation.get_support_selection obj
  method set_support_selection v = Print_operation.set_support_selection obj v

  method track_print_status = Print_operation.get_track_print_status obj
  method set_track_print_status v = Print_operation.set_track_print_status obj v

  method use_full_page = Print_operation.get_use_full_page obj
  method set_use_full_page v = Print_operation.set_use_full_page obj v

  method cancel : unit -> unit = fun () -> (Print_operation.cancel obj )

  method draw_page_finish : unit -> unit = fun () -> (Print_operation.draw_page_finish obj )

  method get_error : unit -> (unit, GError.t) result = fun () -> (Print_operation.get_error obj )

  method get_status : unit -> Gtk_enums.printstatus = fun () -> (Print_operation.get_status obj )

  method is_finished : unit -> bool = fun () -> (Print_operation.is_finished obj )

  method run : 'p1. Gtk_enums.printoperationaction -> (#GApplication_and__window_and__window_group.window as 'p1) option -> (Gtk_enums.printoperationresult, GError.t) result =
    fun action parent ->
      let parent = Option.map (fun (c) -> c#as_window) parent in
      (Print_operation.run obj action parent)

  method set_defer_drawing : unit -> unit = fun () -> (Print_operation.set_defer_drawing obj )

  method set_unit : unit -> unit = fun unit -> (Print_operation.set_unit obj unit)

    method as_print_operation = obj
end

