(** Asynchronous API to present a print dialog to the user.

    [GtkPrintDialog] collects the arguments that are needed to present the
    dialog, such as a title for the dialog and whether it should be modal.

    The dialog is shown with the [Gtk.PrintDialog.setup] function.

    The actual printing can be done with [Gtk.PrintDialog.print] or
    [Gtk.PrintDialog.print_file]. These APIs follows the GIO async pattern, and
    the results can be obtained by calling the corresponding finish methods.

    Its methods, signals and properties are on {!class-type-print_dialog_t}. The
    functions it is built on are in {!Ocgtk.Raw.Print_dialog}. *)

(** The methods, signals and properties of a [GtkPrintDialog]. *)
class type print_dialog_t = object
  method get_accept_label : unit -> string
  method get_modal : unit -> bool
  method get_page_setup : unit -> Page_setup.page_setup_t option
  method get_print_settings : unit -> Print_settings.print_settings_t option
  method get_title : unit -> string

  method print_file_finish :
    Ocgio.Async_result.async_result_t -> (bool, GError.t) result

  method print_finish :
    Ocgio.Async_result.async_result_t ->
    (Ocgio.Output_stream.output_stream_t, GError.t) result

  method set_accept_label : string -> unit
  method set_modal : bool -> unit
  method set_page_setup : Page_setup.page_setup_t -> unit
  method set_print_settings : Print_settings.print_settings_t -> unit
  method set_title : string -> unit

  method setup_finish :
    Ocgio.Async_result.async_result_t -> (Raw.Print_setup.t, GError.t) result

  method as_print_dialog : Raw.Print_dialog.t
end

class print_dialog : Raw.Print_dialog.t -> print_dialog_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Print_dialog.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkPrintDialog], give one already wrapped. *)

val new_ : unit -> print_dialog_t
