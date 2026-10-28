(** An auxiliary object for printing that allows decoupling the setup from the
    printing.

    Its methods, signals and properties are on {!class-type-print_setup_t}. Its
    full description is under {!section-description}. The functions it is built
    on are in {!Ocgtk.Raw.Print_setup}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [PrintSetup].}

    An auxiliary object for printing that allows decoupling the setup from the
    printing.

    A print setup is obtained by calling [Gtk.PrintDialog.setup], and can later
    be passed to print functions such as [Gtk.PrintDialog.print].

    Print setups can be reused for multiple print calls.

    Applications may wish to store the page_setup and print_settings from the
    print setup and copy them to the PrintDialog if they want to keep using
    them. *)
class type print_setup_t = object
  (** {2:methods Methods} *)

  method get_page_setup : unit -> Page_setup.page_setup_t
  (** Returns the page setup of [setup].

      It may be different from the [GtkPrintDialog]'s page setup if the user
      changed it during the setup process. *)

  method get_print_settings : unit -> Print_settings.print_settings_t
  (** Returns the print settings of [setup].

      They may be different from the [GtkPrintDialog]'s settings if the user
      changed them during the setup process. *)

  method ref : unit -> Raw.Print_setup.t
  (** Increase the reference count of [setup]. *)

  (** {2:conversions Conversions} *)

  method as_print_setup : Raw.Print_setup.t
end

class print_setup : Raw.Print_setup.t -> print_setup_t
(** Wraps a raw handle of {!Ocgtk.Raw.Print_setup.t}. *)

(** {1:description Description}

    An auxiliary object for printing that allows decoupling the setup from the
    printing.

    A print setup is obtained by calling [Gtk.PrintDialog.setup], and can later
    be passed to print functions such as [Gtk.PrintDialog.print].

    Print setups can be reused for multiple print calls.

    Applications may wish to store the page_setup and print_settings from the
    print setup and copy them to the PrintDialog if they want to keep using
    them. *)
