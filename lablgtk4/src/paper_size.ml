(* GENERATED CODE - DO NOT EDIT *)
(* Record: PaperSize *)

(** `GtkPaperSize` handles paper sizes.

It uses the standard called
[PWG 5101.1-2002 PWG: Standard for Media Standardized Names](http://www.pwg.org/standards.html)
to name the paper sizes (and to get the data for the page sizes).
In addition to standard paper sizes, `GtkPaperSize` allows to
construct custom paper sizes with arbitrary dimensions.

The `GtkPaperSize` object stores not only the dimensions (width
and height) of a paper size and its name, it also provides
default print margins. *)
type t = Obj.t

(** Create a new PaperSize *)
external new_ : string option -> t = "ml_gtk_paper_size_new"

(** Create a new PaperSize *)
external new_custom : string -> string -> float -> float -> unit -> t = "ml_gtk_paper_size_new_custom"

(** Create a new PaperSize *)
external new_from_gvariant : unit -> t = "ml_gtk_paper_size_new_from_gvariant"

(** Create a new PaperSize *)
external new_from_ipp : string -> float -> float -> t = "ml_gtk_paper_size_new_from_ipp"

(** Create a new PaperSize *)
external new_from_ppd : string -> string -> float -> float -> t = "ml_gtk_paper_size_new_from_ppd"

(** Changes the dimensions of a @size to @width x @height. *)
external set_size : t -> float -> float -> unit -> unit = "ml_gtk_paper_size_set_size"

(** Returns %TRUE if @size is an IPP standard paper size. *)
external is_ipp : t -> bool = "ml_gtk_paper_size_is_ipp"

(** Compares two `GtkPaperSize` objects. *)
external is_equal : t -> Obj.t -> bool = "ml_gtk_paper_size_is_equal"

(** Returns %TRUE if @size is not a standard paper size. *)
external is_custom : t -> bool = "ml_gtk_paper_size_is_custom"

(** Gets the paper width of the `GtkPaperSize`, in
units of @unit. *)
external get_width : t -> unit -> float = "ml_gtk_paper_size_get_width"

(** Gets the PPD name of the `GtkPaperSize`, which
may be %NULL. *)
external get_ppd_name : t -> string = "ml_gtk_paper_size_get_ppd_name"

(** Gets the name of the `GtkPaperSize`. *)
external get_name : t -> string = "ml_gtk_paper_size_get_name"

(** Gets the paper height of the `GtkPaperSize`, in
units of @unit. *)
external get_height : t -> unit -> float = "ml_gtk_paper_size_get_height"

(** Gets the human-readable name of the `GtkPaperSize`. *)
external get_display_name : t -> string = "ml_gtk_paper_size_get_display_name"

(** Gets the default top margin for the `GtkPaperSize`. *)
external get_default_top_margin : t -> unit -> float = "ml_gtk_paper_size_get_default_top_margin"

(** Gets the default right margin for the `GtkPaperSize`. *)
external get_default_right_margin : t -> unit -> float = "ml_gtk_paper_size_get_default_right_margin"

(** Gets the default left margin for the `GtkPaperSize`. *)
external get_default_left_margin : t -> unit -> float = "ml_gtk_paper_size_get_default_left_margin"

(** Gets the default bottom margin for the `GtkPaperSize`. *)
external get_default_bottom_margin : t -> unit -> float = "ml_gtk_paper_size_get_default_bottom_margin"

