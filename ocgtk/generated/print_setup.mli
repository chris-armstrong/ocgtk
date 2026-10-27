(** An auxiliary object for printing that allows decoupling the setup from the
    printing.

    A print setup is obtained by calling [Gtk.PrintDialog.setup], and can later
    be passed to print functions such as [Gtk.PrintDialog.print].

    Print setups can be reused for multiple print calls.

    Applications may wish to store the page_setup and print_settings from the
    print setup and copy them to the PrintDialog if they want to keep using
    them.

    Its methods, signals and properties are on {!class-type-print_setup_t}. The
    functions it is built on are in {!Ocgtk.Raw.Print_setup}. *)

(** The methods, signals and properties of a [GtkPrintSetup]. *)
class type print_setup_t = object
  method get_page_setup : unit -> Page_setup.page_setup_t
  method get_print_settings : unit -> Print_settings.print_settings_t
  method ref : unit -> Raw.Print_setup.t
  method as_print_setup : Raw.Print_setup.t
end

class print_setup : Raw.Print_setup.t -> print_setup_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Print_setup.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkPrintSetup], give one already wrapped. *)
