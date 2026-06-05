class type print_operation_preview_t = object
  method on_got_page_size :
    callback:
      (context:Print_context.t Gobject.obj option ->
      page_setup:Page_setup.t Gobject.obj option ->
      unit) ->
    Gobject.Signal.handler_id

  method on_ready :
    callback:(context:Print_context.t Gobject.obj option -> unit) ->
    Gobject.Signal.handler_id

  method end_preview : unit -> unit
  method is_selected : int -> bool
  method render_page : int -> unit
  method as_print_operation_preview : Print_operation_preview.t
end

class print_operation_preview :
  Print_operation_preview.t ->
  print_operation_preview_t
