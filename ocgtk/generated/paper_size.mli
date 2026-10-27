(** [GtkPaperSize] handles paper sizes.

    It uses the standard called PWG 5101.1-2002 PWG: Standard for Media
    Standardized Names to name the paper sizes (and to get the data for the page
    sizes). In addition to standard paper sizes, [GtkPaperSize] allows to
    construct custom paper sizes with arbitrary dimensions.

    The [GtkPaperSize] object stores not only the dimensions (width and height)
    of a paper size and its name, it also provides default print margins.

    Its methods, signals and properties are on {!class-type-paper_size_t}. The
    functions it is built on are in {!Ocgtk.Raw.Paper_size}. *)

(** The methods, signals and properties of a [GtkPaperSize]. *)
class type paper_size_t = object
  method get_default_bottom_margin : Enums.unit -> float
  method get_default_left_margin : Enums.unit -> float
  method get_default_right_margin : Enums.unit -> float
  method get_default_top_margin : Enums.unit -> float
  method get_display_name : unit -> string
  method get_height : Enums.unit -> float
  method get_name : unit -> string
  method get_ppd_name : unit -> string
  method get_width : Enums.unit -> float
  method is_custom : unit -> bool
  method is_equal : Raw.Paper_size.t -> bool
  method is_ipp : unit -> bool
  method set_size : float -> float -> Enums.unit -> unit
  method to_gvariant : unit -> Gvariant.t
  method as_paper_size : Raw.Paper_size.t
end

class paper_size : Raw.Paper_size.t -> paper_size_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Paper_size.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkPaperSize], give one already wrapped. *)

val new_ : string option -> paper_size_t

val new_custom :
  string -> string -> float -> float -> Enums.unit -> paper_size_t

val new_from_gvariant : Gvariant.t -> paper_size_t
val new_from_ipp : string -> float -> float -> paper_size_t
val new_from_ppd : string -> string -> float -> float -> paper_size_t
