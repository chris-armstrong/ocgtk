(* GENERATED CODE - DO NOT EDIT *)
(* TabArray: TabArray *)

(** A `PangoTabArray` contains an array of tab stops.

`PangoTabArray` can be used to set tab stops in a `PangoLayout`.
Each tab stop has an alignment, a position, and optionally
a character to use as decimal point. *)
type t = [`tab_array] Gobject.obj

(** Create a new TabArray *)
external new_ : int -> bool -> t = "ml_pango_tab_array_new"

(** Create a new TabArray *)
external new_with_positions : int -> bool -> Pango_enums.tabalign -> int -> unit -> t = "ml_pango_tab_array_new_with_positions"

(* Methods *)
(** Serializes a `PangoTabArray` to a string.

No guarantees are made about the format of the string,
it may change between Pango versions.

The intended use of this function is testing and
debugging. The format is not meant as a permanent
storage format. *)
external to_string : t -> string = "ml_pango_tab_array_to_string"

(** Utility function to ensure that the tab stops are in increasing order. *)
external sort : t -> unit = "ml_pango_tab_array_sort"

(** Sets the alignment and location of a tab stop. *)
external set_tab : t -> int -> Pango_enums.tabalign -> int -> unit = "ml_pango_tab_array_set_tab"

(** Sets whether positions in this array are specified in
pixels. *)
external set_positions_in_pixels : t -> bool -> unit = "ml_pango_tab_array_set_positions_in_pixels"

(** Resizes a tab array.

You must subsequently initialize any tabs
that were added as a result of growing the array. *)
external resize : t -> int -> unit = "ml_pango_tab_array_resize"

(** If non-%NULL, @alignments and @locations are filled with allocated
arrays.

The arrays are of length [method@Pango.TabArray.get_size].
You must free the returned array. *)
external get_tabs : t -> Pango_enums.tabalign * int array = "ml_pango_tab_array_get_tabs"

(** Gets the alignment and position of a tab stop. *)
external get_tab : t -> int -> Pango_enums.tabalign * int = "ml_pango_tab_array_get_tab"

(** Gets the number of tab stops in @tab_array. *)
external get_size : t -> int = "ml_pango_tab_array_get_size"

(** Returns %TRUE if the tab positions are in pixels,
%FALSE if they are in Pango units. *)
external get_positions_in_pixels : t -> bool = "ml_pango_tab_array_get_positions_in_pixels"

(** Frees a tab array and associated resources. *)
external free : t -> unit = "ml_pango_tab_array_free"

(** Copies a `PangoTabArray`. *)
external copy : t -> t = "ml_pango_tab_array_copy"

