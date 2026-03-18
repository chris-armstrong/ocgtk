(* GENERATED CODE - DO NOT EDIT *)
(* PrintDialog: PrintDialog *)

type t = [`print_dialog | `object_] Gobject.obj

(** Create a new PrintDialog *)
external new_ : unit -> t = "ml_gtk_print_dialog_new"

(* Methods *)
(** Finishes the [method@Gtk.PrintDialog.setup] call.

If the call was successful, it returns a [struct@Gtk.PrintSetup]
which contains the print settings and page setup information that
will be used to print. *)
external setup_finish : t -> Ocgtk_gio.Gio.Wrappers.Async_result.t -> (Print_setup.t option, GError.t) result = "ml_gtk_print_dialog_setup_finish"

(** Sets the title that will be shown on the print dialog. *)
external set_title : t -> string -> unit = "ml_gtk_print_dialog_set_title"

(** Sets the print settings for the print dialog. *)
external set_print_settings : t -> Print_settings.t -> unit = "ml_gtk_print_dialog_set_print_settings"

(** Set the page setup for the print dialog. *)
external set_page_setup : t -> Page_setup.t -> unit = "ml_gtk_print_dialog_set_page_setup"

(** Sets whether the print dialog blocks
interaction with the parent window while
it is presented. *)
external set_modal : t -> bool -> unit = "ml_gtk_print_dialog_set_modal"

(** Sets the label that will be shown on the
accept button of the print dialog shown for
[method@Gtk.PrintDialog.setup]. *)
external set_accept_label : t -> string -> unit = "ml_gtk_print_dialog_set_accept_label"

(** Finishes the [method@Gtk.PrintDialog.print] call and
returns the results.

If the call was successful, the content to be printed should be
written to the returned output stream. Otherwise, `NULL` is returned.

The overall results of the print operation will be returned in the
[method@Gio.OutputStream.close] call, so if you are interested in the
results, you need to explicitly close the output stream (it will be
closed automatically if you just unref it). Be aware that the close
call may not be instant as it operation will for the printer to finish
printing. *)
external print_finish : t -> Ocgtk_gio.Gio.Wrappers.Async_result.t -> (Ocgtk_gio.Gio.Wrappers.Output_stream.t option, GError.t) result = "ml_gtk_print_dialog_print_finish"

(** Finishes the [method@Gtk.PrintDialog.print_file] call and
returns the results. *)
external print_file_finish : t -> Ocgtk_gio.Gio.Wrappers.Async_result.t -> (bool, GError.t) result = "ml_gtk_print_dialog_print_file_finish"

(** Returns the title that will be shown on the
print dialog. *)
external get_title : t -> string = "ml_gtk_print_dialog_get_title"

(** Returns whether the print dialog blocks
interaction with the parent window while
it is presented. *)
external get_modal : t -> bool = "ml_gtk_print_dialog_get_modal"

(** Returns the label that will be shown on the
accept button of the print dialog. *)
external get_accept_label : t -> string = "ml_gtk_print_dialog_get_accept_label"

(* Properties *)

