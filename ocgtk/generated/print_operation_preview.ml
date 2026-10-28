class type print_operation_preview_t = object
  method on_got_page_size :
    ?after:bool ->
    callback:
      (context:Print_context.print_context_t ->
      page_setup:Page_setup.page_setup_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted once for each page that gets rendered to the preview.

      A handler for this signal should update the [context] according to
      [page_setup] and set up a suitable cairo context, using
      [Gtk.PrintContext.set_cairo_context]. *)

  method on_ready :
    ?after:bool ->
    callback:(context:Print_context.print_context_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** The ::ready signal gets emitted once per preview operation, before the
      first page is rendered.

      A handler for this signal can be used for setup tasks. *)

  method end_preview : unit -> unit
  (** Ends a preview.

      This function must be called to finish a custom print preview. *)

  method is_selected : int -> bool
  (** Returns whether the given page is included in the set of pages that have
      been selected for printing. *)

  method render_page : int -> unit
  (** Renders a page to the preview.

      This is using the print context that was passed to the
      [Gtk.PrintOperation::preview] handler together with [preview].

      A custom print preview should use this function to render the currently
      selected page.

      Note that this function requires a suitable cairo context to be associated
      with the print context. *)

  method as_print_operation_preview : Raw.Print_operation_preview.t
end

(* High-level class for PrintOperationPreview *)
class print_operation_preview (obj : Raw.Print_operation_preview.t) :
  print_operation_preview_t =
  object (self)
    method on_got_page_size ?(after = false) ~callback () =
      Raw.Print_operation_preview.on_got_page_size ~after
        self#as_print_operation_preview ~callback:(fun ~context ~page_setup ->
          callback
            ~context:(new Print_context.print_context context)
            ~page_setup:(new Page_setup.page_setup page_setup))

    method on_ready ?(after = false) ~callback () =
      Raw.Print_operation_preview.on_ready ~after
        self#as_print_operation_preview ~callback:(fun ~context ->
          callback ~context:(new Print_context.print_context context))

    method end_preview : unit -> unit =
      fun () -> Raw.Print_operation_preview.end_preview obj

    method is_selected : int -> bool =
      fun page_nr -> Raw.Print_operation_preview.is_selected obj page_nr

    method render_page : int -> unit =
      fun page_nr -> Raw.Print_operation_preview.render_page obj page_nr

    method as_print_operation_preview = obj
  end
