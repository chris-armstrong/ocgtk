(* GENERATED CODE - DO NOT EDIT *)
(* PrintOperation: PrintOperation *)

type t = [`print_operation | `object_] Gobject.obj

(** Create a new PrintOperation *)
external new_ : unit -> t = "ml_gtk_print_operation_new"

(* Properties *)

(** Get property: allow-async *)
external get_allow_async : t -> bool = "ml_gtk_print_operation_get_allow_async"

(** Set property: allow-async *)
external set_allow_async : t -> bool -> unit = "ml_gtk_print_operation_set_allow_async"

(** Get property: current-page *)
external get_current_page : t -> int = "ml_gtk_print_operation_get_current_page"

(** Set property: current-page *)
external set_current_page : t -> int -> unit = "ml_gtk_print_operation_set_current_page"

(** Get property: custom-tab-label *)
external get_custom_tab_label : t -> string = "ml_gtk_print_operation_get_custom_tab_label"

(** Set property: custom-tab-label *)
external set_custom_tab_label : t -> string -> unit = "ml_gtk_print_operation_set_custom_tab_label"

(** Get property: embed-page-setup *)
external get_embed_page_setup : t -> bool = "ml_gtk_print_operation_get_embed_page_setup"

(** Set property: embed-page-setup *)
external set_embed_page_setup : t -> bool -> unit = "ml_gtk_print_operation_set_embed_page_setup"

(** Get property: export-filename *)
external get_export_filename : t -> string = "ml_gtk_print_operation_get_export_filename"

(** Set property: export-filename *)
external set_export_filename : t -> string -> unit = "ml_gtk_print_operation_set_export_filename"

(** Get property: has-selection *)
external get_has_selection : t -> bool = "ml_gtk_print_operation_get_has_selection"

(** Set property: has-selection *)
external set_has_selection : t -> bool -> unit = "ml_gtk_print_operation_set_has_selection"

(** Get property: job-name *)
external get_job_name : t -> string = "ml_gtk_print_operation_get_job_name"

(** Set property: job-name *)
external set_job_name : t -> string -> unit = "ml_gtk_print_operation_set_job_name"

(** Get property: n-pages *)
external get_n_pages : t -> int = "ml_gtk_print_operation_get_n_pages"

(** Set property: n-pages *)
external set_n_pages : t -> int -> unit = "ml_gtk_print_operation_set_n_pages"

(** Get property: n-pages-to-print *)
external get_n_pages_to_print : t -> int = "ml_gtk_print_operation_get_n_pages_to_print"

(** Get property: show-progress *)
external get_show_progress : t -> bool = "ml_gtk_print_operation_get_show_progress"

(** Set property: show-progress *)
external set_show_progress : t -> bool -> unit = "ml_gtk_print_operation_set_show_progress"

(** Get property: status-string *)
external get_status_string : t -> string = "ml_gtk_print_operation_get_status_string"

(** Get property: support-selection *)
external get_support_selection : t -> bool = "ml_gtk_print_operation_get_support_selection"

(** Set property: support-selection *)
external set_support_selection : t -> bool -> unit = "ml_gtk_print_operation_set_support_selection"

(** Get property: track-print-status *)
external get_track_print_status : t -> bool = "ml_gtk_print_operation_get_track_print_status"

(** Set property: track-print-status *)
external set_track_print_status : t -> bool -> unit = "ml_gtk_print_operation_set_track_print_status"

(** Get property: use-full-page *)
external get_use_full_page : t -> bool = "ml_gtk_print_operation_get_use_full_page"

(** Set property: use-full-page *)
external set_use_full_page : t -> bool -> unit = "ml_gtk_print_operation_set_use_full_page"

(** Sets up the transformation for the cairo context obtained from
`GtkPrintContext` in such a way that distances are measured in
units of @unit. *)
external set_unit : t -> unit -> unit = "ml_gtk_print_operation_set_unit"

(** Sets up the `GtkPrintOperation` to wait for calling of
[method@Gtk.PrintOperation.draw_page_finish from application.

This can be used for drawing page in another thread.

This function must be called in the callback of the
[signal@Gtk.PrintOperation::draw-page] signal. *)
external set_defer_drawing : t -> unit = "ml_gtk_print_operation_set_defer_drawing"

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

(** Returns the status of the print operation.

Also see [method@Gtk.PrintOperation.get_status_string]. *)
external get_status : t -> Gtk_enums.printstatus = "ml_gtk_print_operation_get_status"

(** Call this when the result of a print operation is
%GTK_PRINT_OPERATION_RESULT_ERROR.

It can be called either after [method@Gtk.PrintOperation.run]
returns, or in the [signal@Gtk.PrintOperation::done] signal
handler.

The returned `GError` will contain more details on what went wrong. *)
external get_error : t -> (unit, GError.t) result = "ml_gtk_print_operation_get_error"

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

