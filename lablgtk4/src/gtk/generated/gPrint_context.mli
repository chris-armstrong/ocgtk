class print_context : Print_context.t ->
  object
    method get_dpi_x : unit -> float
    method get_dpi_y : unit -> float
    method get_height : unit -> float
    method get_width : unit -> float
    method as_print_context : Print_context.t
  end

