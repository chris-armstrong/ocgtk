class type print_operation_preview_t = object
  method on_got_page_size :
    ?after:bool ->
    callback:
      (context:GPrint_context.print_context_t option ->
      page_setup:GPage_setup.page_setup_t option ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_ready :
    ?after:bool ->
    callback:(context:GPrint_context.print_context_t option -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method end_preview : unit -> unit
  method is_selected : int -> bool
  method render_page : int -> unit
  method as_print_operation_preview : Print_operation_preview.t
end

class print_operation_preview :
  Print_operation_preview.t ->
  print_operation_preview_t
