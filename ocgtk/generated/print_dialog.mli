(** Asynchronous API to present a print dialog to the user.

    Its methods, signals and properties are on {!class-type-print_dialog_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Print_dialog}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [PrintDialog].}

    Asynchronous API to present a print dialog to the user.

    [GtkPrintDialog] collects the arguments that are needed to present the
    dialog, such as a title for the dialog and whether it should be modal.

    The dialog is shown with the [Gtk.PrintDialog.setup] function.

    The actual printing can be done with [Gtk.PrintDialog.print] or
    [Gtk.PrintDialog.print_file]. These APIs follows the GIO async pattern, and
    the results can be obtained by calling the corresponding finish methods. *)
class type print_dialog_t = object
  (** {2:methods Methods} *)

  method get_accept_label : unit -> string
  (** Returns the label that will be shown on the accept button of the print
      dialog. *)

  method get_modal : unit -> bool
  (** Returns whether the print dialog blocks interaction with the parent window
      while it is presented. *)

  method get_page_setup : unit -> Page_setup.page_setup_t option
  (** Returns the page setup. *)

  method get_print_settings : unit -> Print_settings.print_settings_t option
  (** Returns the print settings for the print dialog. *)

  method get_title : unit -> string
  (** Returns the title that will be shown on the print dialog. *)

  method print_file_finish :
    Ocgio.Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes the [Gtk.PrintDialog.print_file] call and returns the results.

      Note that this function returns a [Gtk.DialogError.DISMISSED] error if the
      user cancels the dialog. *)

  method print_finish :
    Ocgio.Async_result.async_result_t ->
    (Ocgio.Output_stream.output_stream_t, GError.t) result
  (** Finishes the [Gtk.PrintDialog.print] call and returns the results.

      If the call was successful, the content to be printed should be written to
      the returned output stream. Otherwise, [NULL] is returned.

      The overall results of the print operation will be returned in the
      [Gio.OutputStream.close] call, so if you are interested in the results,
      you need to explicitly close the output stream (it will be closed
      automatically if you just unref it). Be aware that the close call may not
      be instant as it operation will for the printer to finish printing.

      Note that this function returns a [Gtk.DialogError.DISMISSED] error if the
      user cancels the dialog. *)

  method set_accept_label : string -> unit
  (** Sets the label that will be shown on the accept button of the print dialog
      shown for [Gtk.PrintDialog.setup]. *)

  method set_modal : bool -> unit
  (** Sets whether the print dialog blocks interaction with the parent window
      while it is presented. *)

  method set_page_setup : Page_setup.page_setup_t -> unit
  (** Set the page setup for the print dialog. *)

  method set_print_settings : Print_settings.print_settings_t -> unit
  (** Sets the print settings for the print dialog. *)

  method set_title : string -> unit
  (** Sets the title that will be shown on the print dialog. *)

  method setup_finish :
    Ocgio.Async_result.async_result_t -> (Raw.Print_setup.t, GError.t) result
  (** Finishes the [Gtk.PrintDialog.setup] call.

      If the call was successful, it returns a [Gtk.PrintSetup] which contains
      the print settings and page setup information that will be used to print.

      Note that this function returns a [Gtk.DialogError.DISMISSED] error if the
      user cancels the dialog. *)

  (** {2:conversions Conversions} *)

  method as_print_dialog : Raw.Print_dialog.t
end

class print_dialog : Raw.Print_dialog.t -> print_dialog_t
(** Wraps a raw handle of {!Ocgtk.Raw.Print_dialog.t}. *)

(** {1:description Description}

    Asynchronous API to present a print dialog to the user.

    [GtkPrintDialog] collects the arguments that are needed to present the
    dialog, such as a title for the dialog and whether it should be modal.

    The dialog is shown with the [Gtk.PrintDialog.setup] function.

    The actual printing can be done with [Gtk.PrintDialog.print] or
    [Gtk.PrintDialog.print_file]. These APIs follows the GIO async pattern, and
    the results can be obtained by calling the corresponding finish methods. *)

(** {1:constructors Constructors} *)

val new_ : unit -> print_dialog_t
(** Creates a new [GtkPrintDialog] object. *)
