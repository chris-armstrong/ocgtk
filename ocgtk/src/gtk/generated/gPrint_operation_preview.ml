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

(* High-level class for PrintOperationPreview *)
class print_operation_preview (obj : Print_operation_preview.t) :
  print_operation_preview_t =
  object (self)
    method on_got_page_size ~callback =
      Print_operation_preview.on_got_page_size self#as_print_operation_preview
        ~callback

    method on_ready ~callback =
      Print_operation_preview.on_ready self#as_print_operation_preview ~callback

    method end_preview : unit -> unit =
      fun () -> Print_operation_preview.end_preview obj

    method is_selected : int -> bool =
      fun page_nr -> Print_operation_preview.is_selected obj page_nr

    method render_page : int -> unit =
      fun page_nr -> Print_operation_preview.render_page obj page_nr

    method as_print_operation_preview = obj
  end
