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

(* High-level class for PrintOperationPreview *)
class print_operation_preview (obj : Print_operation_preview.t) :
  print_operation_preview_t =
  object (self)
    method on_got_page_size ?(after = false) ~callback () =
      Print_operation_preview.on_got_page_size ~after
        self#as_print_operation_preview ~callback:(fun ~context ~page_setup ->
          callback
            ~context:
              (Option.map (fun w -> new GPrint_context.print_context w) context)
            ~page_setup:
              (Option.map (fun w -> new GPage_setup.page_setup w) page_setup))

    method on_ready ?(after = false) ~callback () =
      Print_operation_preview.on_ready ~after self#as_print_operation_preview
        ~callback:(fun ~context ->
          callback
            ~context:
              (Option.map (fun w -> new GPrint_context.print_context w) context))

    method end_preview : unit -> unit =
      fun () -> Print_operation_preview.end_preview obj

    method is_selected : int -> bool =
      fun page_nr -> Print_operation_preview.is_selected obj page_nr

    method render_page : int -> unit =
      fun page_nr -> Print_operation_preview.render_page obj page_nr

    method as_print_operation_preview = obj
  end
