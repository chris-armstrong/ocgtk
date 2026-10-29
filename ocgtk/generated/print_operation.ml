class type print_operation_t = object
  inherit Print_operation_preview.print_operation_preview_t

  (** {2:signals Signals} *)

  method on_begin_print :
    ?after:bool ->
    callback:(context:Print_context.print_context_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted after the user has finished changing print settings in the dialog,
      before the actual rendering starts.

      A typical use for ::begin-print is to use the parameters from the
      [Gtk.PrintContext] and paginate the document accordingly, and then set the
      number of pages with [Gtk.PrintOperation.set_n_pages]. *)

  method on_custom_widget_apply :
    ?after:bool ->
    callback:(widget:Widget.widget_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted right before ::begin-print if you added a custom widget in the
      ::create-custom-widget handler.

      When you get this signal you should read the information from the custom
      widgets, as the widgets are not guaranteed to be around at a later time.
  *)

  method on_done_ :
    ?after:bool ->
    callback:(result:Enums.printoperationresult -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the print operation run has finished doing everything
      required for printing.

      [result] gives you information about what happened during the run. If
      [result] is [GTK_PRINT_OPERATION_RESULT_ERROR] then you can call
      [Gtk.PrintOperation.get_error] for more information.

      If you enabled print status tracking then [Gtk.PrintOperation.is_finished]
      may still return [FALSE] after the ::done signal was emitted. *)

  method on_draw_page :
    ?after:bool ->
    callback:(context:Print_context.print_context_t -> page_nr:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  [@@ocaml.doc
    "Emitted for every page that is printed.\n\n\
     The signal handler must render the [page_nr]'s page onto the cairo\n\
     context obtained from [context] using\n\
     [Gtk.PrintContext.get_cairo_context].\n\n\
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
     Use [Gtk.PrintOperation.set_use_full_page] and\n\
     [Gtk.PrintOperation.set_unit] before starting the print\n\
     operation to set up the transformation of the cairo context\n\
     according to your needs."]

  method on_end_print :
    ?after:bool ->
    callback:(context:Print_context.print_context_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted after all pages have been rendered.

      A handler for this signal can clean up any resources that have been
      allocated in the [Gtk.PrintOperation::begin-print] handler. *)

  method on_paginate :
    ?after:bool ->
    callback:(context:Print_context.print_context_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted after the ::begin-print signal, but before the actual rendering
      starts.

      It keeps getting emitted until a connected signal handler returns [TRUE].

      The ::paginate signal is intended to be used for paginating a document in
      small chunks, to avoid blocking the user interface for a long time. The
      signal handler should update the number of pages using
      [Gtk.PrintOperation.set_n_pages], and return [TRUE] if the document has
      been completely paginated.

      If you don't need to do pagination in chunks, you can simply do it all in
      the ::begin-print handler, and set the number of pages from there. *)

  method on_preview :
    ?after:bool ->
    callback:
      (preview:Print_operation_preview.print_operation_preview_t ->
      context:Print_context.print_context_t ->
      parent:Window.window_t option ->
      bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Gets emitted when a preview is requested from the native dialog.

      The default handler for this signal uses an external viewer application to
      preview.

      To implement a custom print preview, an application must return [TRUE]
      from its handler for this signal. In order to use the provided [context]
      for the preview implementation, it must be given a suitable cairo context
      with [Gtk.PrintContext.set_cairo_context].

      The custom preview implementation can use
      [Gtk.PrintOperationPreview.is_selected] and
      [Gtk.PrintOperationPreview.render_page] to find pages which are selected
      for print and render them. The preview must be finished by calling
      [Gtk.PrintOperationPreview.end_preview] (typically in response to the user
      clicking a close button). *)

  method on_request_page_setup :
    ?after:bool ->
    callback:
      (context:Print_context.print_context_t ->
      page_nr:int ->
      setup:Page_setup.page_setup_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted once for every page that is printed.

      This gives the application a chance to modify the page setup. Any changes
      done to [setup] will be in force only for printing this page. *)

  method on_status_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted at between the various phases of the print operation.

      See [Gtk.PrintStatus] for the phases that are being discriminated. Use
      [Gtk.PrintOperation.get_status] to find out the current status. *)

  method on_update_custom_widget :
    ?after:bool ->
    callback:
      (widget:Widget.widget_t ->
      setup:Page_setup.page_setup_t ->
      settings:Print_settings.print_settings_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted after change of selected printer.

      The actual page setup and print settings are passed to the custom widget,
      which can actualize itself according to this change. *)

  (** {2:methods Methods} *)

  method cancel : unit -> unit
  (** Cancels a running print operation.

      This function may be called from a [Gtk.PrintOperation::begin-print],
      [Gtk.PrintOperation::paginate] or [Gtk.PrintOperation::draw-page] signal
      handler to stop the currently running print operation. *)

  method draw_page_finish : unit -> unit
  (** Signal that drawing of particular page is complete.

      It is called after completion of page drawing (e.g. drawing in another
      thread). If [Gtk.PrintOperation.set_defer_drawing] was called before, then
      this function has to be called by application. Otherwise it is called by
      GTK itself. *)

  method get_default_page_setup : unit -> Page_setup.page_setup_t
  (** Returns the default page setup. *)

  method get_embed_page_setup : unit -> bool
  (** Gets whether page setup selection combos are embedded *)

  method get_error : unit -> (unit, GError.t) result
  (** Call this when the result of a print operation is
      [GTK_PRINT_OPERATION_RESULT_ERROR].

      It can be called either after [Gtk.PrintOperation.run] returns, or in the
      [Gtk.PrintOperation::done] signal handler.

      The returned [GError] will contain more details on what went wrong. *)

  method get_has_selection : unit -> bool
  (** Gets whether there is a selection. *)

  method get_n_pages_to_print : unit -> int
  (** Returns the number of pages that will be printed.

      Note that this value is set during print preparation phase
      ([GTK_PRINT_STATUS_PREPARING]), so this function should never be called
      before the data generation phase ([GTK_PRINT_STATUS_GENERATING_DATA]). You
      can connect to the [Gtk.PrintOperation::status-changed] signal and call
      gtk_print_operation_get_n_pages_to_print() when print status is
      [GTK_PRINT_STATUS_GENERATING_DATA].

      This is typically used to track the progress of print operation. *)

  method get_print_settings : unit -> Print_settings.print_settings_t option
  (** Returns the current print settings.

      Note that the return value is [NULL] until either
      [Gtk.PrintOperation.set_print_settings] or [Gtk.PrintOperation.run] have
      been called. *)

  method get_status : unit -> Enums.printstatus
  (** Returns the status of the print operation.

      Also see [Gtk.PrintOperation.get_status_string]. *)

  method get_status_string : unit -> string
  (** Returns a string representation of the status of the print operation.

      The string is translated and suitable for displaying the print status e.g.
      in a [GtkStatusbar].

      Use [Gtk.PrintOperation.get_status] to obtain a status value that is
      suitable for programmatic use. *)

  method get_support_selection : unit -> bool
  (** Gets whether the application supports print of selection *)

  method is_finished : unit -> bool
  (** A convenience function to find out if the print operation is finished.

      a print operation is finished if its status is either
      [GTK_PRINT_STATUS_FINISHED] or [GTK_PRINT_STATUS_FINISHED_ABORTED].

      Note: when you enable print status tracking the print operation can be in
      a non-finished state even after done has been called, as the operation
      status then tracks the print job status on the printer. *)

  method run :
    Enums.printoperationaction ->
    Window.window_t option ->
    (Enums.printoperationresult, GError.t) result
  [@@ocaml.doc
    "Runs the print operation.\n\n\
     Normally that this function does not return until the rendering\n\
     of all pages is complete. You can connect to the\n\
     [Gtk.PrintOperation::status-changed] signal on [op] to obtain\n\
     some information about the progress of the print operation.\n\n\
     Furthermore, it may use a recursive mainloop to show the print dialog.\n\n\
     If you set the \\[Gtk.PrintOperation:allow-async\\] property, the operation\n\
     will run asynchronously if this is supported on the platform. The\n\
     [Gtk.PrintOperation::done] signal will be emitted with the result\n\
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
    \   settings = g_object_ref (gtk_print_operation_get_print_settings \
     (print));\n\
    \ }\n\
     ]}\n\n\
     Note that gtk_print_operation_run() can only be called once on a\n\
     given [GtkPrintOperation]."]

  method set_allow_async : bool -> unit
  (** Sets whether gtk_print_operation_run() may return before the print
      operation is completed.

      Note that some platforms may not allow asynchronous operation. *)

  method set_current_page : int -> unit
  (** Sets the current page.

      If this is called before [Gtk.PrintOperation.run], the user will be able
      to select to print only the current page.

      Note that this only makes sense for pre-paginated documents. *)

  method set_custom_tab_label : string option -> unit
  (** Sets the label for the tab holding custom widgets. *)

  method set_default_page_setup : Page_setup.page_setup_t option -> unit
  (** Makes [default_page_setup] the default page setup for [op].

      This page setup will be used by [Gtk.PrintOperation.run], but it can be
      overridden on a per-page basis by connecting to the
      [Gtk.PrintOperation::request-page-setup] signal. *)

  method set_defer_drawing : unit -> unit
  (** Sets up the [GtkPrintOperation] to wait for calling of
      \[method@Gtk.PrintOperation.draw_page_finish from application.

      This can be used for drawing page in another thread.

      This function must be called in the callback of the
      [Gtk.PrintOperation::draw-page] signal. *)

  method set_embed_page_setup : bool -> unit
  (** Embed page size combo box and orientation combo box into page setup page.

      Selected page setup is stored as default page setup in
      [GtkPrintOperation]. *)

  method set_export_filename : string -> unit
  (** Sets up the [GtkPrintOperation] to generate a file instead of showing the
      print dialog.

      The intended use of this function is for implementing “Export to PDF”
      actions. Currently, PDF is the only supported format.

      “Print to PDF” support is independent of this and is done by letting the
      user pick the “Print to PDF” item from the list of printers in the print
      dialog. *)

  method set_has_selection : bool -> unit
  (** Sets whether there is a selection to print.

      Application has to set number of pages to which the selection will draw by
      [Gtk.PrintOperation.set_n_pages] in a handler for the
      [Gtk.PrintOperation::begin-print] signal. *)

  method set_job_name : string -> unit
  (** Sets the name of the print job.

      The name is used to identify the job (e.g. in monitoring applications like
      eggcups).

      If you don’t set a job name, GTK picks a default one by numbering
      successive print jobs. *)

  method set_n_pages : int -> unit
  (** Sets the number of pages in the document.

      This must be set to a positive number before the rendering starts. It may
      be set in a [Gtk.PrintOperation::begin-print] signal handler.

      Note that the page numbers passed to the
      [Gtk.PrintOperation::request-page-setup] and
      [Gtk.PrintOperation::draw-page] signals are 0-based, i.e. if the user
      chooses to print all pages, the last ::draw-page signal will be for page
      [n_pages] - 1. *)

  method set_print_settings : Print_settings.print_settings_t option -> unit
  (** Sets the print settings for [op].

      This is typically used to re-establish print settings from a previous
      print operation, see [Gtk.PrintOperation.run]. *)

  method set_show_progress : bool -> unit
  (** If [show_progress] is [TRUE], the print operation will show a progress
      dialog during the print operation. *)

  method set_support_selection : bool -> unit
  (** Sets whether selection is supported by [GtkPrintOperation]. *)

  method set_track_print_status : bool -> unit
  (** If track_status is [TRUE], the print operation will try to continue report
      on the status of the print job in the printer queues and printer.

      This can allow your application to show things like “out of paper” issues,
      and when the print job actually reaches the printer.

      This function is often implemented using some form of polling, so it
      should not be enabled unless needed. *)

  method set_unit : Enums.unit -> unit
  (** Sets up the transformation for the cairo context obtained from
      [GtkPrintContext] in such a way that distances are measured in units of
      [unit]. *)

  method set_use_full_page : bool -> unit
  (** If [full_page] is [TRUE], the transformation for the cairo context
      obtained from [GtkPrintContext] puts the origin at the top left corner of
      the page.

      This may not be the top left corner of the sheet, depending on page
      orientation and the number of pages per sheet). Otherwise, the origin is
      at the top left corner of the imageable area (i.e. inside the margins). *)

  (** {2:conversions Conversions} *)

  method as_print_operation : Raw.Print_operation.t
end

(* High-level class for PrintOperation *)
class print_operation (obj : Raw.Print_operation.t) : print_operation_t =
  object (self)
    inherit
      Print_operation_preview.print_operation_preview
        (Raw.Print_operation_preview.from_gobject obj)

    method on_begin_print ?(after = false) ~callback () =
      Raw.Print_operation.on_begin_print ~after self#as_print_operation
        ~callback:(fun ~context ->
          callback ~context:(new Print_context.print_context context))

    method on_custom_widget_apply ?(after = false) ~callback () =
      Raw.Print_operation.on_custom_widget_apply ~after self#as_print_operation
        ~callback:(fun ~widget -> callback ~widget:(new Widget.widget widget))

    method on_done_ ?(after = false) ~callback () =
      Raw.Print_operation.on_done_ ~after self#as_print_operation ~callback

    method on_draw_page ?(after = false) ~callback () =
      Raw.Print_operation.on_draw_page ~after self#as_print_operation
        ~callback:(fun ~context ~page_nr ->
          callback ~context:(new Print_context.print_context context) ~page_nr)

    method on_end_print ?(after = false) ~callback () =
      Raw.Print_operation.on_end_print ~after self#as_print_operation
        ~callback:(fun ~context ->
          callback ~context:(new Print_context.print_context context))

    method on_paginate ?(after = false) ~callback () =
      Raw.Print_operation.on_paginate ~after self#as_print_operation
        ~callback:(fun ~context ->
          callback ~context:(new Print_context.print_context context))

    method on_preview ?(after = false) ~callback () =
      Raw.Print_operation.on_preview ~after self#as_print_operation
        ~callback:(fun ~preview ~context ~parent ->
          callback
            ~preview:
              (new Print_operation_preview.print_operation_preview preview)
            ~context:(new Print_context.print_context context)
            ~parent:(Option.map (fun w -> new Window.window w) parent))

    method on_request_page_setup ?(after = false) ~callback () =
      Raw.Print_operation.on_request_page_setup ~after self#as_print_operation
        ~callback:(fun ~context ~page_nr ~setup ->
          callback
            ~context:(new Print_context.print_context context)
            ~page_nr
            ~setup:(new Page_setup.page_setup setup))

    method on_status_changed ?(after = false) ~callback () =
      Raw.Print_operation.on_status_changed ~after self#as_print_operation
        ~callback

    method on_update_custom_widget ?(after = false) ~callback () =
      Raw.Print_operation.on_update_custom_widget ~after self#as_print_operation
        ~callback:(fun ~widget ~setup ~settings ->
          callback
            ~widget:(new Widget.widget widget)
            ~setup:(new Page_setup.page_setup setup)
            ~settings:(new Print_settings.print_settings settings))

    method cancel : unit -> unit = fun () -> Raw.Print_operation.cancel obj

    method draw_page_finish : unit -> unit =
      fun () -> Raw.Print_operation.draw_page_finish obj

    method get_default_page_setup : unit -> Page_setup.page_setup_t =
      fun () ->
        new Page_setup.page_setup
          (Raw.Print_operation.get_default_page_setup obj)

    method get_embed_page_setup : unit -> bool =
      fun () -> Raw.Print_operation.get_embed_page_setup obj

    method get_error : unit -> (unit, GError.t) result =
      fun () -> Raw.Print_operation.get_error obj

    method get_has_selection : unit -> bool =
      fun () -> Raw.Print_operation.get_has_selection obj

    method get_n_pages_to_print : unit -> int =
      fun () -> Raw.Print_operation.get_n_pages_to_print obj

    method get_print_settings : unit -> Print_settings.print_settings_t option =
      fun () ->
        Option.map
          (fun ret -> new Print_settings.print_settings ret)
          (Raw.Print_operation.get_print_settings obj)

    method get_status : unit -> Enums.printstatus =
      fun () -> Raw.Print_operation.get_status obj

    method get_status_string : unit -> string =
      fun () -> Raw.Print_operation.get_status_string obj

    method get_support_selection : unit -> bool =
      fun () -> Raw.Print_operation.get_support_selection obj

    method is_finished : unit -> bool =
      fun () -> Raw.Print_operation.is_finished obj

    method run :
        Enums.printoperationaction ->
        Window.window_t option ->
        (Enums.printoperationresult, GError.t) result =
      fun action parent ->
        let parent = Option.map (fun c -> c#as_window) parent in
        Raw.Print_operation.run obj action parent

    method set_allow_async : bool -> unit =
      fun allow_async -> Raw.Print_operation.set_allow_async obj allow_async

    method set_current_page : int -> unit =
      fun current_page -> Raw.Print_operation.set_current_page obj current_page

    method set_custom_tab_label : string option -> unit =
      fun label -> Raw.Print_operation.set_custom_tab_label obj label

    method set_default_page_setup : Page_setup.page_setup_t option -> unit =
      fun default_page_setup ->
        let default_page_setup =
          Option.map (fun c -> c#as_page_setup) default_page_setup
        in
        Raw.Print_operation.set_default_page_setup obj default_page_setup

    method set_defer_drawing : unit -> unit =
      fun () -> Raw.Print_operation.set_defer_drawing obj

    method set_embed_page_setup : bool -> unit =
      fun embed -> Raw.Print_operation.set_embed_page_setup obj embed

    method set_export_filename : string -> unit =
      fun filename -> Raw.Print_operation.set_export_filename obj filename

    method set_has_selection : bool -> unit =
      fun has_selection ->
        Raw.Print_operation.set_has_selection obj has_selection

    method set_job_name : string -> unit =
      fun job_name -> Raw.Print_operation.set_job_name obj job_name

    method set_n_pages : int -> unit =
      fun n_pages -> Raw.Print_operation.set_n_pages obj n_pages

    method set_print_settings : Print_settings.print_settings_t option -> unit =
      fun print_settings ->
        let print_settings =
          Option.map (fun c -> c#as_print_settings) print_settings
        in
        Raw.Print_operation.set_print_settings obj print_settings

    method set_show_progress : bool -> unit =
      fun show_progress ->
        Raw.Print_operation.set_show_progress obj show_progress

    method set_support_selection : bool -> unit =
      fun support_selection ->
        Raw.Print_operation.set_support_selection obj support_selection

    method set_track_print_status : bool -> unit =
      fun track_status ->
        Raw.Print_operation.set_track_print_status obj track_status

    method set_unit : Enums.unit -> unit =
      fun unit -> Raw.Print_operation.set_unit obj unit

    method set_use_full_page : bool -> unit =
      fun full_page -> Raw.Print_operation.set_use_full_page obj full_page

    method as_print_operation = obj
  end

let new_ () : print_operation_t =
  new print_operation (Raw.Print_operation.new_ ())
