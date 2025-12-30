class print_operation_preview : Print_operation_preview.t ->
  object
    inherit Gprint_operation_preview_signals.print_operation_preview_signals
    method end_preview : unit -> unit
    method is_selected : int -> bool
    method render_page : int -> unit
    method as_print_operation_preview : Print_operation_preview.t
  end

