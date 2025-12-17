(* High-level class for PrintContext *)
class print_context (obj : Print_context.t) = object (self)

  method get_dpi_x : unit -> float = fun () -> (Print_context.get_dpi_x obj )

  method get_dpi_y : unit -> float = fun () -> (Print_context.get_dpi_y obj )

  method get_height : unit -> float = fun () -> (Print_context.get_height obj )

  method get_width : unit -> float = fun () -> (Print_context.get_width obj )

    method as_print_context = obj
end

