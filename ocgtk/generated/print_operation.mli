[@@@ocaml.text
"High-level, portable printing API.\n\n\
 It looks a bit different than other GTK dialogs such as the\n\
 [GtkFileChooser], since some platforms don’t expose enough\n\
 infrastructure to implement a good print dialog. On such\n\
 platforms, [GtkPrintOperation] uses the native print dialog.\n\
 On platforms which do not provide a native print dialog, GTK\n\
 uses its own, see [Gtk.PrintUnixDialog].\n\n\
 The typical way to use the high-level printing API is to create\n\
 a [GtkPrintOperation] object with [Gtk.PrintOperation.new]\n\
 when the user selects to print. Then you set some properties on it,\n\
 e.g. the page size, any [Gtk.PrintSettings] from previous print\n\
 operations, the number of pages, the current page, etc.\n\n\
 Then you start the print operation by calling [Gtk.PrintOperation.run].\n\
 It will then show a dialog, let the user select a printer and options.\n\
 When the user finished the dialog, various signals will be emitted on\n\
 the [GtkPrintOperation], the main one being\n\
 [Gtk.PrintOperation::draw-page], which you are supposed to handle\n\
 and render the page on the provided [Gtk.PrintContext] using Cairo.\n\n\
 {b The high-level printing API}\n\n\
 {[\n\
 static GtkPrintSettings *settings = NULL;\n\n\
 static void\n\
 do_print (void)\n\
 {\n\
\  GtkPrintOperation *print;\n\
\  GtkPrintOperationResult res;\n\n\
\  print = gtk_print_operation_new ();\n\n\
\  if (settings != NULL)\n\
\    gtk_print_operation_set_print_settings (print, settings);\n\n\
\  g_signal_connect (print, \"begin_print\", G_CALLBACK (begin_print), NULL);\n\
\  g_signal_connect (print, \"draw_page\", G_CALLBACK (draw_page), NULL);\n\n\
\  res = gtk_print_operation_run (print, \
 GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG,\n\
\                                 GTK_WINDOW (main_window), NULL);\n\n\
\  if (res == GTK_PRINT_OPERATION_RESULT_APPLY)\n\
\    {\n\
\      if (settings != NULL)\n\
\        g_object_unref (settings);\n\
\      settings = g_object_ref (gtk_print_operation_get_print_settings (print));\n\
\    }\n\n\
\  g_object_unref (print);\n\
 }\n\
 ]}\n\n\
 By default [GtkPrintOperation] uses an external application to do\n\
 print preview. To implement a custom print preview, an application\n\
 must connect to the preview signal. The functions\n\
 [Gtk.PrintOperationPreview.render_page],\n\
 [Gtk.PrintOperationPreview.end_preview] and\n\
 [Gtk.PrintOperationPreview.is_selected]\n\
 are useful when implementing a print preview.\n\n\
 Its methods, signals and properties are on {!class-type-print_operation_t}. \
 The functions it is built on are in {!Ocgtk.Raw.Print_operation}."]

(** The methods, signals and properties of a [GtkPrintOperation]. *)
class type print_operation_t = object
  inherit Print_operation_preview.print_operation_preview_t

  method on_begin_print :
    ?after:bool ->
    callback:(context:Print_context.print_context_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_custom_widget_apply :
    ?after:bool ->
    callback:
      (widget:
         Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
         .widget_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_done_ :
    ?after:bool ->
    callback:(result:Enums.printoperationresult -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_draw_page :
    ?after:bool ->
    callback:(context:Print_context.print_context_t -> page_nr:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_end_print :
    ?after:bool ->
    callback:(context:Print_context.print_context_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_paginate :
    ?after:bool ->
    callback:(context:Print_context.print_context_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_preview :
    ?after:bool ->
    callback:
      (preview:Print_operation_preview.print_operation_preview_t ->
      context:Print_context.print_context_t ->
      parent:Application_and__window_and__window_group.window_t option ->
      bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_request_page_setup :
    ?after:bool ->
    callback:
      (context:Print_context.print_context_t ->
      page_nr:int ->
      setup:Page_setup.page_setup_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_status_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_update_custom_widget :
    ?after:bool ->
    callback:
      (widget:
         Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
         .widget_t ->
      setup:Page_setup.page_setup_t ->
      settings:Print_settings.print_settings_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method cancel : unit -> unit
  method draw_page_finish : unit -> unit
  method get_default_page_setup : unit -> Page_setup.page_setup_t
  method get_embed_page_setup : unit -> bool
  method get_error : unit -> (unit, GError.t) result
  method get_has_selection : unit -> bool
  method get_n_pages_to_print : unit -> int
  method get_print_settings : unit -> Print_settings.print_settings_t option
  method get_status : unit -> Enums.printstatus
  method get_status_string : unit -> string
  method get_support_selection : unit -> bool
  method is_finished : unit -> bool

  method run :
    Enums.printoperationaction ->
    Application_and__window_and__window_group.window_t option ->
    (Enums.printoperationresult, GError.t) result

  method set_allow_async : bool -> unit
  method set_current_page : int -> unit
  method set_custom_tab_label : string option -> unit
  method set_default_page_setup : Page_setup.page_setup_t option -> unit
  method set_defer_drawing : unit -> unit
  method set_embed_page_setup : bool -> unit
  method set_export_filename : string -> unit
  method set_has_selection : bool -> unit
  method set_job_name : string -> unit
  method set_n_pages : int -> unit
  method set_print_settings : Print_settings.print_settings_t option -> unit
  method set_show_progress : bool -> unit
  method set_support_selection : bool -> unit
  method set_track_print_status : bool -> unit
  method set_unit : Enums.unit -> unit
  method set_use_full_page : bool -> unit
  method as_print_operation : Raw.Print_operation.t
end

class print_operation : Raw.Print_operation.t -> print_operation_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Print_operation.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkPrintOperation], give one already wrapped. *)

val new_ : unit -> print_operation_t
