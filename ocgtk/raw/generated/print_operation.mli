(* GENERATED CODE - DO NOT EDIT *)
(* PrintOperation: PrintOperation *)

[@@@ocaml.text
"High-level, portable printing API.\n\n\
 It looks a bit different than other GTK dialogs such as the\n\
 [GtkFileChooser], since some platforms don’t expose enough\n\
 infrastructure to implement a good print dialog. On such\n\
 platforms, [GtkPrintOperation] uses the native print dialog.\n\
 On platforms which do not provide a native print dialog, GTK\n\
 uses its own, see [Gtk.PrintUnixDialog].\n\n\
 The typical way to use the high-level printing API is to create\n\
 a [GtkPrintOperation] object with \
 {{!Ocgtk.Raw.Print_operation.val-new_}[Gtk.PrintOperation.new]}\n\
 when the user selects to print. Then you set some properties on it,\n\
 e.g. the page size, any {{!Ocgtk.Raw.Print_settings}[Gtk.PrintSettings]} from \
 previous print\n\
 operations, the number of pages, the current page, etc.\n\n\
 Then you start the print operation by calling \
 {{!Ocgtk.Raw.Print_operation.val-run}[Gtk.PrintOperation.run]}.\n\
 It will then show a dialog, let the user select a printer and options.\n\
 When the user finished the dialog, various signals will be emitted on\n\
 the [GtkPrintOperation], the main one being\n\
 {{!Ocgtk.Raw.Print_operation.val-on_draw_page}[Gtk.PrintOperation::draw-page]}, \
 which you are supposed to handle\n\
 and render the page on the provided \
 {{!Ocgtk.Raw.Print_context}[Gtk.PrintContext]} using Cairo.\n\n\
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
 {{!Ocgtk.Raw.Print_operation_preview.val-render_page}[Gtk.PrintOperationPreview.render_page]},\n\
 {{!Ocgtk.Raw.Print_operation_preview.val-end_preview}[Gtk.PrintOperationPreview.end_preview]} \
 and\n\
 {{!Ocgtk.Raw.Print_operation_preview.val-is_selected}[Gtk.PrintOperationPreview.is_selected]}\n\
 are useful when implementing a print preview.\n\n\
 The class built on this module is in {!Ocgtk.Print_operation}."]

type t = [ `print_operation | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_print_operation_get_type"

external new_ : unit -> t = "ml_gtk_print_operation_new"
(** Creates a new [GtkPrintOperation]. *)

(* Methods *)

external set_use_full_page : t -> bool -> unit
  = "ml_gtk_print_operation_set_use_full_page"
(** If [full_page] is [true], the transformation for the cairo context obtained
    from [GtkPrintContext] puts the origin at the top left corner of the page.

    This may not be the top left corner of the sheet, depending on page
    orientation and the number of pages per sheet). Otherwise, the origin is at
    the top left corner of the imageable area (i.e. inside the margins). *)

external set_unit : t -> Ocgtk_enums.unit -> unit
  = "ml_gtk_print_operation_set_unit"
(** Sets up the transformation for the cairo context obtained from
    [GtkPrintContext] in such a way that distances are measured in units of
    [unit]. *)

external set_track_print_status : t -> bool -> unit
  = "ml_gtk_print_operation_set_track_print_status"
(** If track_status is [true], the print operation will try to continue report
    on the status of the print job in the printer queues and printer.

    This can allow your application to show things like “out of paper” issues,
    and when the print job actually reaches the printer.

    This function is often implemented using some form of polling, so it should
    not be enabled unless needed. *)

external set_support_selection : t -> bool -> unit
  = "ml_gtk_print_operation_set_support_selection"
(** Sets whether selection is supported by [GtkPrintOperation]. *)

external set_show_progress : t -> bool -> unit
  = "ml_gtk_print_operation_set_show_progress"
(** If [show_progress] is [true], the print operation will show a progress
    dialog during the print operation. *)

external set_print_settings : t -> Print_settings.t option -> unit
  = "ml_gtk_print_operation_set_print_settings"
(** Sets the print settings for [op].

    This is typically used to re-establish print settings from a previous print
    operation, see
    {{!Ocgtk.Raw.Print_operation.val-run}[Gtk.PrintOperation.run]}. *)

external set_n_pages : t -> int -> unit = "ml_gtk_print_operation_set_n_pages"
(** Sets the number of pages in the document.

    This must be set to a positive number before the rendering starts. It may be
    set in a
    {{!Ocgtk.Raw.Print_operation.val-on_begin_print}[Gtk.PrintOperation::begin-print]}
    signal handler.

    Note that the page numbers passed to the
    {{!Ocgtk.Raw.Print_operation.val-on_request_page_setup}[Gtk.PrintOperation::request-page-setup]}
    and
    {{!Ocgtk.Raw.Print_operation.val-on_draw_page}[Gtk.PrintOperation::draw-page]}
    signals are 0-based, i.e. if the user chooses to print all pages, the last
    ::draw-page signal will be for page [n_pages] - 1. *)

external set_job_name : t -> string -> unit
  = "ml_gtk_print_operation_set_job_name"
(** Sets the name of the print job.

    The name is used to identify the job (e.g. in monitoring applications like
    eggcups).

    If you don’t set a job name, GTK picks a default one by numbering successive
    print jobs. *)

external set_has_selection : t -> bool -> unit
  = "ml_gtk_print_operation_set_has_selection"
(** Sets whether there is a selection to print.

    Application has to set number of pages to which the selection will draw by
    {{!Ocgtk.Raw.Print_operation.val-set_n_pages}[Gtk.PrintOperation.set_n_pages]}
    in a handler for the
    {{!Ocgtk.Raw.Print_operation.val-on_begin_print}[Gtk.PrintOperation::begin-print]}
    signal. *)

external set_export_filename : t -> string -> unit
  = "ml_gtk_print_operation_set_export_filename"
(** Sets up the [GtkPrintOperation] to generate a file instead of showing the
    print dialog.

    The intended use of this function is for implementing “Export to PDF”
    actions. Currently, PDF is the only supported format.

    “Print to PDF” support is independent of this and is done by letting the
    user pick the “Print to PDF” item from the list of printers in the print
    dialog. *)

external set_embed_page_setup : t -> bool -> unit
  = "ml_gtk_print_operation_set_embed_page_setup"
(** Embed page size combo box and orientation combo box into page setup page.

    Selected page setup is stored as default page setup in [GtkPrintOperation].
*)

external set_defer_drawing : t -> unit
  = "ml_gtk_print_operation_set_defer_drawing"
(** Sets up the [GtkPrintOperation] to wait for calling of
    \[method@Gtk.PrintOperation.draw_page_finish from application.

    This can be used for drawing page in another thread.

    This function must be called in the callback of the
    {{!Ocgtk.Raw.Print_operation.val-on_draw_page}[Gtk.PrintOperation::draw-page]}
    signal. *)

external set_default_page_setup : t -> Page_setup.t option -> unit
  = "ml_gtk_print_operation_set_default_page_setup"
(** Makes [default_page_setup] the default page setup for [op].

    This page setup will be used by
    {{!Ocgtk.Raw.Print_operation.val-run}[Gtk.PrintOperation.run]}, but it can
    be overridden on a per-page basis by connecting to the
    {{!Ocgtk.Raw.Print_operation.val-on_request_page_setup}[Gtk.PrintOperation::request-page-setup]}
    signal. *)

external set_custom_tab_label : t -> string option -> unit
  = "ml_gtk_print_operation_set_custom_tab_label"
(** Sets the label for the tab holding custom widgets. *)

external set_current_page : t -> int -> unit
  = "ml_gtk_print_operation_set_current_page"
(** Sets the current page.

    If this is called before
    {{!Ocgtk.Raw.Print_operation.val-run}[Gtk.PrintOperation.run]}, the user
    will be able to select to print only the current page.

    Note that this only makes sense for pre-paginated documents. *)

external set_allow_async : t -> bool -> unit
  = "ml_gtk_print_operation_set_allow_async"
(** Sets whether
    {{!Ocgtk.Raw.Print_operation.val-run}[gtk_print_operation_run ()]} may
    return before the print operation is completed.

    Note that some platforms may not allow asynchronous operation. *)

external run :
  t ->
  Ocgtk_enums.printoperationaction ->
  Application_and__window_and__window_group.Window.t option ->
  (Ocgtk_enums.printoperationresult, GError.t) result
  = "ml_gtk_print_operation_run"
[@@ocaml.doc
  "Runs the print operation.\n\n\
   Normally that this function does not return until the rendering\n\
   of all pages is complete. You can connect to the\n\
   {{!Ocgtk.Raw.Print_operation.val-on_status_changed}[Gtk.PrintOperation::status-changed]} \
   signal on [op] to obtain\n\
   some information about the progress of the print operation.\n\n\
   Furthermore, it may use a recursive mainloop to show the print dialog.\n\n\
   If you set the \\[Gtk.PrintOperation:allow-async\\] property, the operation\n\
   will run asynchronously if this is supported on the platform. The\n\
   {{!Ocgtk.Raw.Print_operation.val-on_done_}[Gtk.PrintOperation::done]} \
   signal will be emitted with the result\n\
   of the operation when the it is done (i.e. when the dialog is canceled,\n\
   or when the print succeeds or fails).\n\n\
   {[\n\
   if (settings != NULL)\n\
  \  gtk_print_operation_set_print_settings (print, settings);\n\n\
   if (page_setup != NULL)\n\
  \  gtk_print_operation_set_default_page_setup (print, page_setup);\n\n\
   g_signal_connect (print, \"begin-print\",\n\
  \                  G_CALLBACK (begin_print), &data);\n\
   g_signal_connect (print, \"draw-page\",\n\
  \                  G_CALLBACK (draw_page), &data);\n\n\
   res = gtk_print_operation_run (print,\n\
  \                               GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG,\n\
  \                               parent,\n\
  \                               &error);\n\n\
   if (res == GTK_PRINT_OPERATION_RESULT_ERROR)\n\
  \ {\n\
  \   error_dialog = gtk_message_dialog_new (GTK_WINDOW (parent),\n\
  \  \t\t\t                     GTK_DIALOG_DESTROY_WITH_PARENT,\n\
   \t\t\t\t\t     GTK_MESSAGE_ERROR,\n\
   \t\t\t\t\t     GTK_BUTTONS_CLOSE,\n\
   \t\t\t\t\t     \"Error printing file:\\n%s\",\n\
   \t\t\t\t\t     error->message);\n\
  \   g_signal_connect (error_dialog, \"response\",\n\
  \                     G_CALLBACK (gtk_window_destroy), NULL);\n\
  \   gtk_window_present (GTK_WINDOW (error_dialog));\n\
  \   g_error_free (error);\n\
  \ }\n\
   else if (res == GTK_PRINT_OPERATION_RESULT_APPLY)\n\
  \ {\n\
  \   if (settings != NULL)\n\
   g_object_unref (settings);\n\
  \   settings = g_object_ref (gtk_print_operation_get_print_settings (print));\n\
  \ }\n\
   ]}\n\n\
   Note that {{!Ocgtk.Raw.Print_operation.val-run}[gtk_print_operation_run \
   ()]} can only be called once on a\n\
   given [GtkPrintOperation]."]

external is_finished : t -> bool = "ml_gtk_print_operation_is_finished"
(** A convenience function to find out if the print operation is finished.

    a print operation is finished if its status is either
    {{!Ocgtk.Enums.type-printstatus.constructor-FINISHED}[GTK_PRINT_STATUS_FINISHED]}
    or
    {{!Ocgtk.Enums.type-printstatus.constructor-FINISHED_ABORTED}[GTK_PRINT_STATUS_FINISHED_ABORTED]}.

    Note: when you enable print status tracking the print operation can be in a
    non-finished state even after done has been called, as the operation status
    then tracks the print job status on the printer. *)

external get_support_selection : t -> bool
  = "ml_gtk_print_operation_get_support_selection"
(** Gets whether the application supports print of selection *)

external get_status_string : t -> string
  = "ml_gtk_print_operation_get_status_string"
(** Returns a string representation of the status of the print operation.

    The string is translated and suitable for displaying the print status e.g.
    in a [GtkStatusbar].

    Use
    {{!Ocgtk.Raw.Print_operation.val-get_status}[Gtk.PrintOperation.get_status]}
    to obtain a status value that is suitable for programmatic use. *)

external get_status : t -> Ocgtk_enums.printstatus
  = "ml_gtk_print_operation_get_status"
(** Returns the status of the print operation.

    Also see
    {{!Ocgtk.Raw.Print_operation.val-get_status_string}[Gtk.PrintOperation.get_status_string]}.
*)

external get_print_settings : t -> Print_settings.t option
  = "ml_gtk_print_operation_get_print_settings"
(** Returns the current print settings.

    Note that the return value is [None] until either
    {{!Ocgtk.Raw.Print_operation.val-set_print_settings}[Gtk.PrintOperation.set_print_settings]}
    or {{!Ocgtk.Raw.Print_operation.val-run}[Gtk.PrintOperation.run]} have been
    called. *)

external get_n_pages_to_print : t -> int
  = "ml_gtk_print_operation_get_n_pages_to_print"
(** Returns the number of pages that will be printed.

    Note that this value is set during print preparation phase
    ({{!Ocgtk.Enums.type-printstatus.constructor-PREPARING}[GTK_PRINT_STATUS_PREPARING]}),
    so this function should never be called before the data generation phase
    ({{!Ocgtk.Enums.type-printstatus.constructor-GENERATING_DATA}[GTK_PRINT_STATUS_GENERATING_DATA]}).
    You can connect to the
    {{!Ocgtk.Raw.Print_operation.val-on_status_changed}[Gtk.PrintOperation::status-changed]}
    signal and call
    {{!Ocgtk.Raw.Print_operation.val-get_n_pages_to_print}[gtk_print_operation_get_n_pages_to_print
                                                           ()]} when print
    status is
    {{!Ocgtk.Enums.type-printstatus.constructor-GENERATING_DATA}[GTK_PRINT_STATUS_GENERATING_DATA]}.

    This is typically used to track the progress of print operation. *)

external get_has_selection : t -> bool
  = "ml_gtk_print_operation_get_has_selection"
(** Gets whether there is a selection. *)

external get_error : t -> (unit, GError.t) result
  = "ml_gtk_print_operation_get_error"
(** Call this when the result of a print operation is
    {{!Ocgtk.Enums.type-printoperationresult.constructor-ERROR}[GTK_PRINT_OPERATION_RESULT_ERROR]}.

    It can be called either after
    {{!Ocgtk.Raw.Print_operation.val-run}[Gtk.PrintOperation.run]} returns, or
    in the {{!Ocgtk.Raw.Print_operation.val-on_done_}[Gtk.PrintOperation::done]}
    signal handler.

    The returned [GError] will contain more details on what went wrong. *)

external get_embed_page_setup : t -> bool
  = "ml_gtk_print_operation_get_embed_page_setup"
(** Gets whether page setup selection combos are embedded *)

external get_default_page_setup : t -> Page_setup.t
  = "ml_gtk_print_operation_get_default_page_setup"
(** Returns the default page setup. *)

external draw_page_finish : t -> unit
  = "ml_gtk_print_operation_draw_page_finish"
(** Signal that drawing of particular page is complete.

    It is called after completion of page drawing (e.g. drawing in another
    thread). If
    {{!Ocgtk.Raw.Print_operation.val-set_defer_drawing}[Gtk.PrintOperation.set_defer_drawing]}
    was called before, then this function has to be called by application.
    Otherwise it is called by GTK itself. *)

external cancel : t -> unit = "ml_gtk_print_operation_cancel"
(** Cancels a running print operation.

    This function may be called from a
    {{!Ocgtk.Raw.Print_operation.val-on_begin_print}[Gtk.PrintOperation::begin-print]},
    {{!Ocgtk.Raw.Print_operation.val-on_paginate}[Gtk.PrintOperation::paginate]}
    or
    {{!Ocgtk.Raw.Print_operation.val-on_draw_page}[Gtk.PrintOperation::draw-page]}
    signal handler to stop the currently running print operation. *)

(* Properties *)

val on_begin_print :
  ?after:bool ->
  t ->
  callback:(context:Print_context.t -> unit) ->
  Gobject.Signal.handler_id
(** Emitted after the user has finished changing print settings in the dialog,
    before the actual rendering starts.

    A typical use for ::begin-print is to use the parameters from the
    {{!Ocgtk.Raw.Print_context}[Gtk.PrintContext]} and paginate the document
    accordingly, and then set the number of pages with
    {{!Ocgtk.Raw.Print_operation.val-set_n_pages}[Gtk.PrintOperation.set_n_pages]}.
*)

val on_custom_widget_apply :
  ?after:bool ->
  t ->
  callback:
    (widget:
       Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
       .Widget
       .t ->
    unit) ->
  Gobject.Signal.handler_id
(** Emitted right before ::begin-print if you added a custom widget in the
    ::create-custom-widget handler.

    When you get this signal you should read the information from the custom
    widgets, as the widgets are not guaranteed to be around at a later time. *)

val on_done_ :
  ?after:bool ->
  t ->
  callback:(result:Ocgtk_enums.printoperationresult -> unit) ->
  Gobject.Signal.handler_id
(** Emitted when the print operation run has finished doing everything required
    for printing.

    [result] gives you information about what happened during the run. If
    [result] is
    {{!Ocgtk.Enums.type-printoperationresult.constructor-ERROR}[GTK_PRINT_OPERATION_RESULT_ERROR]}
    then you can call
    {{!Ocgtk.Raw.Print_operation.val-get_error}[Gtk.PrintOperation.get_error]}
    for more information.

    If you enabled print status tracking then
    {{!Ocgtk.Raw.Print_operation.val-is_finished}[Gtk.PrintOperation.is_finished]}
    may still return [false] after the ::done signal was emitted. *)

val on_draw_page :
  ?after:bool ->
  t ->
  callback:(context:Print_context.t -> page_nr:int -> unit) ->
  Gobject.Signal.handler_id
[@@ocaml.doc
  "Emitted for every page that is printed.\n\n\
   The signal handler must render the [page_nr]'s page onto the cairo\n\
   context obtained from [context] using\n\
   {{!Ocgtk.Raw.Print_context.val-get_cairo_context}[Gtk.PrintContext.get_cairo_context]}.\n\n\
   {[\n\
   static void\n\
   draw_page (GtkPrintOperation *operation,\n\
  \           GtkPrintContext   *context,\n\
  \           int                page_nr,\n\
  \           gpointer           user_data)\n\
   {\n\
  \  cairo_t *cr;\n\
  \  PangoLayout *layout;\n\
  \  double width, text_height;\n\
  \  int layout_height;\n\
  \  PangoFontDescription *desc;\n\
  \  \n\
  \  cr = gtk_print_context_get_cairo_context (context);\n\
  \  width = gtk_print_context_get_width (context);\n\
  \  \n\
  \  cairo_rectangle (cr, 0, 0, width, HEADER_HEIGHT);\n\
  \  \n\
  \  cairo_set_source_rgb (cr, 0.8, 0.8, 0.8);\n\
  \  cairo_fill (cr);\n\
  \  \n\
  \  layout = gtk_print_context_create_pango_layout (context);\n\
  \  \n\
  \  desc = pango_font_description_from_string (\"sans 14\");\n\
  \  pango_layout_set_font_description (layout, desc);\n\
  \  pango_font_description_free (desc);\n\
  \  \n\
  \  pango_layout_set_text (layout, \"some text\", -1);\n\
  \  pango_layout_set_width (layout, width * PANGO_SCALE);\n\
  \  pango_layout_set_alignment (layout, PANGO_ALIGN_CENTER);\n\
  \     \t\t      \n\
  \  pango_layout_get_size (layout, NULL, &layout_height);\n\
  \  text_height = (double)layout_height / PANGO_SCALE;\n\
  \  \n\
  \  cairo_move_to (cr, width / 2,  (HEADER_HEIGHT - text_height) / 2);\n\
  \  pango_cairo_show_layout (cr, layout);\n\
  \  \n\
  \  g_object_unref (layout);\n\
   }\n\
   ]}\n\n\
   Use \
   {{!Ocgtk.Raw.Print_operation.val-set_use_full_page}[Gtk.PrintOperation.set_use_full_page]} \
   and\n\
   {{!Ocgtk.Raw.Print_operation.val-set_unit}[Gtk.PrintOperation.set_unit]} \
   before starting the print\n\
   operation to set up the transformation of the cairo context\n\
   according to your needs."]

val on_end_print :
  ?after:bool ->
  t ->
  callback:(context:Print_context.t -> unit) ->
  Gobject.Signal.handler_id
(** Emitted after all pages have been rendered.

    A handler for this signal can clean up any resources that have been
    allocated in the
    {{!Ocgtk.Raw.Print_operation.val-on_begin_print}[Gtk.PrintOperation::begin-print]}
    handler. *)

val on_paginate :
  ?after:bool ->
  t ->
  callback:(context:Print_context.t -> bool) ->
  Gobject.Signal.handler_id
(** Emitted after the ::begin-print signal, but before the actual rendering
    starts.

    It keeps getting emitted until a connected signal handler returns [true].

    The ::paginate signal is intended to be used for paginating a document in
    small chunks, to avoid blocking the user interface for a long time. The
    signal handler should update the number of pages using
    {{!Ocgtk.Raw.Print_operation.val-set_n_pages}[Gtk.PrintOperation.set_n_pages]},
    and return [true] if the document has been completely paginated.

    If you don't need to do pagination in chunks, you can simply do it all in
    the ::begin-print handler, and set the number of pages from there. *)

val on_preview :
  ?after:bool ->
  t ->
  callback:
    (preview:Print_operation_preview.t ->
    context:Print_context.t ->
    parent:Application_and__window_and__window_group.Window.t option ->
    bool) ->
  Gobject.Signal.handler_id
(** Gets emitted when a preview is requested from the native dialog.

    The default handler for this signal uses an external viewer application to
    preview.

    To implement a custom print preview, an application must return [true] from
    its handler for this signal. In order to use the provided [context] for the
    preview implementation, it must be given a suitable cairo context with
    {{!Ocgtk.Raw.Print_context.val-set_cairo_context}[Gtk.PrintContext.set_cairo_context]}.

    The custom preview implementation can use
    {{!Ocgtk.Raw.Print_operation_preview.val-is_selected}[Gtk.PrintOperationPreview.is_selected]}
    and
    {{!Ocgtk.Raw.Print_operation_preview.val-render_page}[Gtk.PrintOperationPreview.render_page]}
    to find pages which are selected for print and render them. The preview must
    be finished by calling
    {{!Ocgtk.Raw.Print_operation_preview.val-end_preview}[Gtk.PrintOperationPreview.end_preview]}
    (typically in response to the user clicking a close button). *)

val on_request_page_setup :
  ?after:bool ->
  t ->
  callback:
    (context:Print_context.t -> page_nr:int -> setup:Page_setup.t -> unit) ->
  Gobject.Signal.handler_id
(** Emitted once for every page that is printed.

    This gives the application a chance to modify the page setup. Any changes
    done to [setup] will be in force only for printing this page. *)

val on_status_changed :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** Emitted at between the various phases of the print operation.

    See {{!Ocgtk.Enums.type-printstatus}[Gtk.PrintStatus]} for the phases that
    are being discriminated. Use
    {{!Ocgtk.Raw.Print_operation.val-get_status}[Gtk.PrintOperation.get_status]}
    to find out the current status. *)

val on_update_custom_widget :
  ?after:bool ->
  t ->
  callback:
    (widget:
       Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
       .Widget
       .t ->
    setup:Page_setup.t ->
    settings:Print_settings.t ->
    unit) ->
  Gobject.Signal.handler_id
(** Emitted after change of selected printer.

    The actual page setup and print settings are passed to the custom widget,
    which can actualize itself according to this change. *)
