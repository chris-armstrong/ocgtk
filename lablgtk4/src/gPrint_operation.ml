(* Signal class defined in gprint_operation_signals.ml *)

(* High-level class for PrintOperation *)
class print_operation (obj : Print_operation.t) = object (self)
  inherit Gprint_operation_signals.print_operation_signals obj

  method cancel : unit -> unit = fun () -> (Print_operation.cancel obj )

  method draw_page_finish : unit -> unit = fun () -> (Print_operation.draw_page_finish obj )

  method get_embed_page_setup : unit -> bool = fun () -> (Print_operation.get_embed_page_setup obj )

  method get_error : unit -> (unit, GError.t) result = fun () -> (Print_operation.get_error obj )

  method get_has_selection : unit -> bool = fun () -> (Print_operation.get_has_selection obj )

  method get_n_pages_to_print : unit -> int = fun () -> (Print_operation.get_n_pages_to_print obj )

  method get_status : unit -> Gtk_enums.printstatus = fun () -> (Print_operation.get_status obj )

  method get_status_string : unit -> string = fun () -> (Print_operation.get_status_string obj )

  method get_support_selection : unit -> bool = fun () -> (Print_operation.get_support_selection obj )

  method is_finished : unit -> bool = fun () -> (Print_operation.is_finished obj )

  method run : 'p1. Gtk_enums.printoperationaction -> (#GApplication_and__window_and__window_group.window as 'p1) option -> (Gtk_enums.printoperationresult, GError.t) result =
    fun action parent ->
      let parent = Option.map (fun (c) -> c#as_window) parent in
      (Print_operation.run obj action parent)

  method set_allow_async : bool -> unit = fun allow_async -> (Print_operation.set_allow_async obj allow_async)

  method set_current_page : int -> unit = fun current_page -> (Print_operation.set_current_page obj current_page)

  method set_custom_tab_label : string option -> unit = fun label -> (Print_operation.set_custom_tab_label obj label)

  method set_defer_drawing : unit -> unit = fun () -> (Print_operation.set_defer_drawing obj )

  method set_embed_page_setup : bool -> unit = fun embed -> (Print_operation.set_embed_page_setup obj embed)

  method set_export_filename : string -> unit = fun filename -> (Print_operation.set_export_filename obj filename)

  method set_has_selection : bool -> unit = fun has_selection -> (Print_operation.set_has_selection obj has_selection)

  method set_job_name : string -> unit = fun job_name -> (Print_operation.set_job_name obj job_name)

  method set_n_pages : int -> unit = fun n_pages -> (Print_operation.set_n_pages obj n_pages)

  method set_show_progress : bool -> unit = fun show_progress -> (Print_operation.set_show_progress obj show_progress)

  method set_support_selection : bool -> unit = fun support_selection -> (Print_operation.set_support_selection obj support_selection)

  method set_track_print_status : bool -> unit = fun track_status -> (Print_operation.set_track_print_status obj track_status)

  method set_unit : unit -> unit = fun unit -> (Print_operation.set_unit obj unit)

  method set_use_full_page : bool -> unit = fun full_page -> (Print_operation.set_use_full_page obj full_page)

    method as_print_operation = obj
end

