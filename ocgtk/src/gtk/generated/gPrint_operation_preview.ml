(* Signal class defined in gprint_operation_preview_signals.ml *)

(* High-level class for PrintOperationPreview *)
class print_operation_preview (obj : Print_operation_preview.t) = object (self)
  inherit Gprint_operation_preview_signals.print_operation_preview_signals obj

  method end_preview : unit -> unit =
    fun () ->
      (Print_operation_preview.end_preview obj)

  method is_selected : int -> bool =
    fun page_nr ->
      (Print_operation_preview.is_selected obj page_nr)

  method render_page : int -> unit =
    fun page_nr ->
      (Print_operation_preview.render_page obj page_nr)

    method as_print_operation_preview = obj
end

