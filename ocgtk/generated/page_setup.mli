(** Stores page size, orientation and margins for printing.

    The idea is that you can get one of these from the page setup dialog and
    then pass it to the [GtkPrintOperation] when printing. The benefit of
    splitting this out of the [GtkPrintSettings] is that these affect the actual
    layout of the page, and thus need to be set long before user prints.

    {b Margins}

    The margins specified in this object are the “print margins”, i.e. the parts
    of the page that the printer cannot print on. These are different from the
    layout margins that a word processor uses; they are typically used to
    determine the minimal size for the layout margins.

    To obtain a [GtkPageSetup] use [Gtk.PageSetup.new] to get the defaults, or
    use [Gtk.print_run_page_setup_dialog] to show the page setup dialog and
    receive the resulting page setup.

    {b A page setup dialog}

    {[
    static GtkPrintSettings *settings = NULL;
    static GtkPageSetup *page_setup = NULL;

    static void
    do_page_setup (void)
    {
      GtkPageSetup *new_page_setup;

      if (settings == NULL)
        settings = gtk_print_settings_new ();

      new_page_setup = gtk_print_run_page_setup_dialog (GTK_WINDOW (main_window),
                                                        page_setup, settings);

      if (page_setup)
        g_object_unref (page_setup);

      page_setup = new_page_setup;
    }
    ]}

    Its methods, signals and properties are on {!class-type-page_setup_t}. The
    functions it is built on are in {!Ocgtk.Raw.Page_setup}. *)

(** The methods, signals and properties of a [GtkPageSetup]. *)
class type page_setup_t = object
  method copy : unit -> page_setup_t
  (** Copies a [GtkPageSetup]. *)

  method get_bottom_margin : Enums.unit -> float
  (** Gets the bottom margin in units of [unit]. *)

  method get_left_margin : Enums.unit -> float
  (** Gets the left margin in units of [unit]. *)

  method get_orientation : unit -> Enums.pageorientation
  (** Gets the page orientation of the [GtkPageSetup]. *)

  method get_page_height : Enums.unit -> float
  (** Returns the page height in units of [unit].

      Note that this function takes orientation and margins into consideration.
      See [Gtk.PageSetup.get_paper_height]. *)

  method get_page_width : Enums.unit -> float
  (** Returns the page width in units of [unit].

      Note that this function takes orientation and margins into consideration.
      See [Gtk.PageSetup.get_paper_width]. *)

  method get_paper_height : Enums.unit -> float
  (** Returns the paper height in units of [unit].

      Note that this function takes orientation, but not margins into
      consideration. See [Gtk.PageSetup.get_page_height]. *)

  method get_paper_size : unit -> Raw.Paper_size.t
  (** Gets the paper size of the [GtkPageSetup]. *)

  method get_paper_width : Enums.unit -> float
  (** Returns the paper width in units of [unit].

      Note that this function takes orientation, but not margins into
      consideration. See [Gtk.PageSetup.get_page_width]. *)

  method get_right_margin : Enums.unit -> float
  (** Gets the right margin in units of [unit]. *)

  method get_top_margin : Enums.unit -> float
  (** Gets the top margin in units of [unit]. *)

  method load_file : string -> (bool, GError.t) result
  (** Reads the page setup from the file [file_name].

      See [Gtk.PageSetup.to_file]. *)

  method set_bottom_margin : float -> Enums.unit -> unit
  (** Sets the bottom margin of the [GtkPageSetup]. *)

  method set_left_margin : float -> Enums.unit -> unit
  (** Sets the left margin of the [GtkPageSetup]. *)

  method set_orientation : Enums.pageorientation -> unit
  (** Sets the page orientation of the [GtkPageSetup]. *)

  method set_paper_size : Raw.Paper_size.t -> unit
  (** Sets the paper size of the [GtkPageSetup] without changing the margins.

      See [Gtk.PageSetup.set_paper_size_and_default_margins]. *)

  method set_paper_size_and_default_margins : Raw.Paper_size.t -> unit
  (** Sets the paper size of the [GtkPageSetup] and modifies the margins
      according to the new paper size. *)

  method set_right_margin : float -> Enums.unit -> unit
  (** Sets the right margin of the [GtkPageSetup]. *)

  method set_top_margin : float -> Enums.unit -> unit
  (** Sets the top margin of the [GtkPageSetup]. *)

  method to_file : string -> (bool, GError.t) result
  (** This function saves the information from [setup] to [file_name]. *)

  method to_gvariant : unit -> Gvariant.t
  (** Serialize page setup to an a\{sv\} variant. *)

  method as_page_setup : Raw.Page_setup.t
end

class page_setup : Raw.Page_setup.t -> page_setup_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Page_setup.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkPageSetup], give one already wrapped. *)

val new_ : unit -> page_setup_t
val new_from_file : string -> (page_setup_t, GError.t) result
val new_from_gvariant : Gvariant.t -> page_setup_t
