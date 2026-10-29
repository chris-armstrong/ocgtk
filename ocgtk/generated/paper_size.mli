(** [GtkPaperSize] handles paper sizes.

    Its methods, signals and properties are on {!class-type-paper_size_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Paper_size}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [PaperSize].}

    [GtkPaperSize] handles paper sizes.

    It uses the standard called PWG 5101.1-2002 PWG: Standard for Media
    Standardized Names to name the paper sizes (and to get the data for the page
    sizes). In addition to standard paper sizes, [GtkPaperSize] allows to
    construct custom paper sizes with arbitrary dimensions.

    The [GtkPaperSize] object stores not only the dimensions (width and height)
    of a paper size and its name, it also provides default print margins. *)
class type paper_size_t = object
  (** {2:methods Methods} *)

  method get_default_bottom_margin : Enums.unit -> float
  (** Gets the default bottom margin for the [GtkPaperSize]. *)

  method get_default_left_margin : Enums.unit -> float
  (** Gets the default left margin for the [GtkPaperSize]. *)

  method get_default_right_margin : Enums.unit -> float
  (** Gets the default right margin for the [GtkPaperSize]. *)

  method get_default_top_margin : Enums.unit -> float
  (** Gets the default top margin for the [GtkPaperSize]. *)

  method get_display_name : unit -> string
  (** Gets the human-readable name of the [GtkPaperSize]. *)

  method get_height : Enums.unit -> float
  (** Gets the paper height of the [GtkPaperSize], in units of [unit]. *)

  method get_name : unit -> string
  (** Gets the name of the [GtkPaperSize]. *)

  method get_ppd_name : unit -> string
  (** Gets the PPD name of the [GtkPaperSize], which may be [None]. *)

  method get_width : Enums.unit -> float
  (** Gets the paper width of the [GtkPaperSize], in units of [unit]. *)

  method is_custom : unit -> bool
  (** Returns [true] if [size] is not a standard paper size. *)

  method is_equal : Raw.Paper_size.t -> bool
  (** Compares two [GtkPaperSize] objects. *)

  method is_ipp : unit -> bool
  (** Returns [true] if [size] is an IPP standard paper size. *)

  method set_size : float -> float -> Enums.unit -> unit
  (** Changes the dimensions of a [size] to [width] x [height]. *)

  method to_gvariant : unit -> Gvariant.t
  (** Serialize a paper size to an [a{sv}] variant. *)

  (** {2:conversions Conversions} *)

  method as_paper_size : Raw.Paper_size.t
end

class paper_size : Raw.Paper_size.t -> paper_size_t
(** Wraps a raw handle of {!Ocgtk.Raw.Paper_size.t}. *)

(** {1:description Description}

    [GtkPaperSize] handles paper sizes.

    It uses the standard called PWG 5101.1-2002 PWG: Standard for Media
    Standardized Names to name the paper sizes (and to get the data for the page
    sizes). In addition to standard paper sizes, [GtkPaperSize] allows to
    construct custom paper sizes with arbitrary dimensions.

    The [GtkPaperSize] object stores not only the dimensions (width and height)
    of a paper size and its name, it also provides default print margins. *)

(** {1:constructors Constructors} *)

val new_ : string option -> paper_size_t
(** Creates a new [GtkPaperSize] object by parsing a PWG 5101.1-2002 paper name.

    If [name] is [None], the default paper size is returned, see
    [Gtk.PaperSize.get_default]. *)

val new_custom :
  string -> string -> float -> float -> Enums.unit -> paper_size_t
(** Creates a new [GtkPaperSize] object with the given parameters. *)

val new_from_gvariant : Gvariant.t -> paper_size_t
(** Deserialize a paper size from a [GVariant].

    The `GVariant must be in the format produced by
    {{!Ocgtk.Paper_size.class-type-paper_size_t.method-to_gvariant}[Gtk.PaperSize.to_gvariant]}.
*)

val new_from_ipp : string -> float -> float -> paper_size_t
(** Creates a new [GtkPaperSize] object by using IPP information.

    If [ipp_name] is not a recognized paper name, [width] and [height] are used
    to construct a custom [GtkPaperSize] object. *)

val new_from_ppd : string -> string -> float -> float -> paper_size_t
(** Creates a new [GtkPaperSize] object by using PPD information.

    If [ppd_name] is not a recognized PPD paper name, [ppd_display_name],
    [width] and [height] are used to construct a custom [GtkPaperSize] object.
*)
