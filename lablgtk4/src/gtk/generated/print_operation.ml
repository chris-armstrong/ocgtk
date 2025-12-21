(* GENERATED CODE - DO NOT EDIT *)
(* PrintOperation: PrintOperation *)

type t = [`print_operation | `object_] Gobject.obj

(** Create a new PrintOperation *)
external new_ : unit -> t = "ml_gtk_print_operation_new"

(* Methods *)
(** If @full_page is %TRUE, the transformation for the cairo context
obtained from `GtkPrintContext` puts the origin at the top left
corner of the page.

This may not be the top left corner of the sheet, depending on page
orientation and the number of pages per sheet). Otherwise, the origin
is at the top left corner of the imageable area (i.e. inside the margins). *)
external set_use_full_page : t -> bool -> unit = "ml_gtk_print_operation_set_use_full_page"

(** Sets up the transformation for the cairo context obtained from
`GtkPrintContext` in such a way that distances are measured in
units of @unit. *)
external set_unit : t -> Gtk_enums.unit -> unit = "ml_gtk_print_operation_set_unit"

(** If track_status is %TRUE, the print operation will try to continue
report on the status of the print job in the printer queues and printer.

This can allow your application to show things like “out of paper”
issues, and when the print job actually reaches the printer.

This function is often implemented using some form of polling,
so it should not be enabled unless needed. *)
external set_track_print_status : t -> bool -> unit = "ml_gtk_print_operation_set_track_print_status"

(** Sets whether selection is supported by `GtkPrintOperation`. *)
external set_support_selection : t -> bool -> unit = "ml_gtk_print_operation_set_support_selection"

(** If @show_progress is %TRUE, the print operation will show
a progress dialog during the print operation. *)
external set_show_progress : t -> bool -> unit = "ml_gtk_print_operation_set_show_progress"

(** Sets the print settings for @op.

This is typically used to re-establish print settings
from a previous print operation, see [method@Gtk.PrintOperation.run]. *)
external set_print_settings : t -> Print_settings.t option -> unit = "ml_gtk_print_operation_set_print_settings"

(** Sets the number of pages in the document.

This must be set to a positive number before the rendering
starts. It may be set in a [signal@Gtk.PrintOperation::begin-print]
signal handler.

Note that the page numbers passed to the
[signal@Gtk.PrintOperation::request-page-setup]
and [signal@Gtk.PrintOperation::draw-page] signals are 0-based, i.e.
if the user chooses to print all pages, the last ::draw-page signal
will be for page @n_pages - 1. *)
external set_n_pages : t -> int -> unit = "ml_gtk_print_operation_set_n_pages"

(** Sets the name of the print job.

The name is used to identify the job (e.g. in monitoring
applications like eggcups).

If you don’t set a job name, GTK picks a default one by
numbering successive print jobs. *)
external set_job_name : t -> string -> unit = "ml_gtk_print_operation_set_job_name"

(** Sets whether there is a selection to print.

Application has to set number of pages to which the selection
will draw by [method@Gtk.PrintOperation.set_n_pages] in a handler
for the [signal@Gtk.PrintOperation::begin-print] signal. *)
external set_has_selection : t -> bool -> unit = "ml_gtk_print_operation_set_has_selection"

(** Embed page size combo box and orientation combo box into page setup page.

Selected page setup is stored as default page setup in `GtkPrintOperation`. *)
external set_embed_page_setup : t -> bool -> unit = "ml_gtk_print_operation_set_embed_page_setup"

(** Sets up the `GtkPrintOperation` to wait for calling of
[method@Gtk.PrintOperation.draw_page_finish from application.

This can be used for drawing page in another thread.

This function must be called in the callback of the
[signal@Gtk.PrintOperation::draw-page] signal. *)
external set_defer_drawing : t -> unit = "ml_gtk_print_operation_set_defer_drawing"

(** Makes @default_page_setup the default page setup for @op.

This page setup will be used by [method@Gtk.PrintOperation.run],
but it can be overridden on a per-page basis by connecting
to the [signal@Gtk.PrintOperation::request-page-setup] signal. *)
external set_default_page_setup : t -> Page_setup.t option -> unit = "ml_gtk_print_operation_set_default_page_setup"

(** Sets the label for the tab holding custom widgets. *)
external set_custom_tab_label : t -> string option -> unit = "ml_gtk_print_operation_set_custom_tab_label"

(** Sets the current page.

If this is called before [method@Gtk.PrintOperation.run],
the user will be able to select to print only the current page.

Note that this only makes sense for pre-paginated documents. *)
external set_current_page : t -> int -> unit = "ml_gtk_print_operation_set_current_page"

(** Sets whether gtk_print_operation_run() may return
before the print operation is completed.

Note that some platforms may not allow asynchronous
operation. *)
external set_allow_async : t -> bool -> unit = "ml_gtk_print_operation_set_allow_async"

(** Runs the print operation.

Normally that this function does not return until the rendering
of all pages is complete. You can connect to the
[signal@Gtk.PrintOperation::status-changed] signal on @op to obtain
some information about the progress of the print operation.

Furthermore, it may use a recursive mainloop to show the print dialog.

If you set the [Gtk.PrintOperation:allow-async] property, the operation
will run asynchronously if this is supported on the platform. The
[signal@Gtk.PrintOperation::done] signal will be emitted with the result
of the operation when the it is done (i.e. when the dialog is canceled,
or when the print succeeds or fails).

```c
if (settings != NULL)
  gtk_print_operation_set_print_settings (print, settings);

if (page_setup != NULL)
  gtk_print_operation_set_default_page_setup (print, page_setup);

g_signal_connect (print, "begin-print",
                  G_CALLBACK (begin_print), &data);
g_signal_connect (print, "draw-page",
                  G_CALLBACK (draw_page), &data);

res = gtk_print_operation_run (print,
                               GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG,
                               parent,
                               &error);

if (res == GTK_PRINT_OPERATION_RESULT_ERROR)
 {
   error_dialog = gtk_message_dialog_new (GTK_WINDOW (parent),
  			                     GTK_DIALOG_DESTROY_WITH_PARENT,
					     GTK_MESSAGE_ERROR,
					     GTK_BUTTONS_CLOSE,
					     "Error printing file:\n%s",
					     error->message);
   g_signal_connect (error_dialog, "response",
                     G_CALLBACK (gtk_window_destroy), NULL);
   gtk_window_present (GTK_WINDOW (error_dialog));
   g_error_free (error);
 }
else if (res == GTK_PRINT_OPERATION_RESULT_APPLY)
 {
   if (settings != NULL)
g_object_unref (settings);
   settings = g_object_ref (gtk_print_operation_get_print_settings (print));
 }
```

Note that gtk_print_operation_run() can only be called once on a
given `GtkPrintOperation`. *)
external run : t -> Gtk_enums.printoperationaction -> Application_and__window_and__window_group.Window.t option -> (Gtk_enums.printoperationresult, GError.t) result = "ml_gtk_print_operation_run"

(** A convenience function to find out if the print operation
is finished.

a print operation is finished if its status is either
%GTK_PRINT_STATUS_FINISHED or %GTK_PRINT_STATUS_FINISHED_ABORTED.

Note: when you enable print status tracking the print operation
can be in a non-finished state even after done has been called, as
the operation status then tracks the print job status on the printer. *)
external is_finished : t -> bool = "ml_gtk_print_operation_is_finished"

(** Gets whether the application supports print of selection *)
external get_support_selection : t -> bool = "ml_gtk_print_operation_get_support_selection"

(** Returns a string representation of the status of the
print operation.

The string is translated and suitable for displaying
the print status e.g. in a `GtkStatusbar`.

Use [method@Gtk.PrintOperation.get_status] to obtain
a status value that is suitable for programmatic use. *)
external get_status_string : t -> string = "ml_gtk_print_operation_get_status_string"

(** Returns the status of the print operation.

Also see [method@Gtk.PrintOperation.get_status_string]. *)
external get_status : t -> Gtk_enums.printstatus = "ml_gtk_print_operation_get_status"

(** Returns the number of pages that will be printed.

Note that this value is set during print preparation phase
(%GTK_PRINT_STATUS_PREPARING), so this function should never be
called before the data generation phase (%GTK_PRINT_STATUS_GENERATING_DATA).
You can connect to the [signal@Gtk.PrintOperation::status-changed]
signal and call gtk_print_operation_get_n_pages_to_print() when
print status is %GTK_PRINT_STATUS_GENERATING_DATA.

This is typically used to track the progress of print operation. *)
external get_n_pages_to_print : t -> int = "ml_gtk_print_operation_get_n_pages_to_print"

(** Gets whether there is a selection. *)
external get_has_selection : t -> bool = "ml_gtk_print_operation_get_has_selection"

(** Call this when the result of a print operation is
%GTK_PRINT_OPERATION_RESULT_ERROR.

It can be called either after [method@Gtk.PrintOperation.run]
returns, or in the [signal@Gtk.PrintOperation::done] signal
handler.

The returned `GError` will contain more details on what went wrong. *)
external get_error : t -> (unit, GError.t) result = "ml_gtk_print_operation_get_error"

(** Gets whether page setup selection combos are embedded *)
external get_embed_page_setup : t -> bool = "ml_gtk_print_operation_get_embed_page_setup"

(** Signal that drawing of particular page is complete.

It is called after completion of page drawing (e.g. drawing
in another thread). If [method@Gtk.PrintOperation.set_defer_drawing]
was called before, then this function has to be called by application.
Otherwise it is called by GTK itself. *)
external draw_page_finish : t -> unit = "ml_gtk_print_operation_draw_page_finish"

(** Cancels a running print operation.

This function may be called from a [signal@Gtk.PrintOperation::begin-print],
[signal@Gtk.PrintOperation::paginate] or [signal@Gtk.PrintOperation::draw-page]
signal handler to stop the currently running print operation. *)
external cancel : t -> unit = "ml_gtk_print_operation_cancel"

(* Properties *)

