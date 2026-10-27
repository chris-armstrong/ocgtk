(** The interface that is used to implement print preview.

    A [GtkPrintOperationPreview] object is passed to the
    [Gtk.PrintOperation::preview] signal by [Gtk.PrintOperation].

    Its methods, signals and properties are on
    {!class-type-print_operation_preview_t}. The functions it is built on are in
    {!Ocgtk.Raw.Print_operation_preview}. *)

(** The methods, signals and properties of a [GtkPrintOperationPreview]. *)
class type print_operation_preview_t = object
  method on_got_page_size :
    ?after:bool ->
    callback:
      (context:Print_context.print_context_t ->
      page_setup:Page_setup.page_setup_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_ready :
    ?after:bool ->
    callback:(context:Print_context.print_context_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method end_preview : unit -> unit
  method is_selected : int -> bool
  method render_page : int -> unit
  method as_print_operation_preview : Raw.Print_operation_preview.t
end

class print_operation_preview :
  Raw.Print_operation_preview.t ->
  print_operation_preview_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Print_operation_preview.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkPrintOperationPreview], give one already wrapped.
*)
