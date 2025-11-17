(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Label *)

type t = Gtk.Widget.t

(** Create a new Label *)
external new_ : unit -> t = "ml_gtk_label_new"

(** Create a new Label *)
external new_ : unit -> t = "ml_gtk_label_new_with_mnemonic"

(* Properties *)

(** Get property: lines *)
external get_lines : t -> int = "ml_gtk_label_get_lines"

(** Set property: lines *)
external set_lines : t -> int -> unit = "ml_gtk_label_set_lines"

(** Get property: max-width-chars *)
external get_max_width_chars : t -> int = "ml_gtk_label_get_max_width_chars"

(** Set property: max-width-chars *)
external set_max_width_chars : t -> int -> unit = "ml_gtk_label_set_max_width_chars"

(** Get property: mnemonic-keyval *)
external get_mnemonic_keyval : t -> int = "ml_gtk_label_get_mnemonic_keyval"

(** Get property: selectable *)
external get_selectable : t -> bool = "ml_gtk_label_get_selectable"

(** Set property: selectable *)
external set_selectable : t -> bool -> unit = "ml_gtk_label_set_selectable"

(** Get property: single-line-mode *)
external get_single_line_mode : t -> bool = "ml_gtk_label_get_single_line_mode"

(** Set property: single-line-mode *)
external set_single_line_mode : t -> bool -> unit = "ml_gtk_label_set_single_line_mode"

(** Get property: use-markup *)
external get_use_markup : t -> bool = "ml_gtk_label_get_use_markup"

(** Set property: use-markup *)
external set_use_markup : t -> bool -> unit = "ml_gtk_label_set_use_markup"

(** Get property: use-underline *)
external get_use_underline : t -> bool = "ml_gtk_label_get_use_underline"

(** Set property: use-underline *)
external set_use_underline : t -> bool -> unit = "ml_gtk_label_set_use_underline"

(** Get property: width-chars *)
external get_width_chars : t -> int = "ml_gtk_label_get_width_chars"

(** Set property: width-chars *)
external set_width_chars : t -> int -> unit = "ml_gtk_label_set_width_chars"

(** Get property: wrap *)
external get_wrap : t -> bool = "ml_gtk_label_get_wrap"

(** Set property: wrap *)
external set_wrap : t -> bool -> unit = "ml_gtk_label_set_wrap"

(** Get property: xalign *)
external get_xalign : t -> float = "ml_gtk_label_get_xalign"

(** Set property: xalign *)
external set_xalign : t -> float -> unit = "ml_gtk_label_set_xalign"

(** Get property: yalign *)
external get_yalign : t -> float = "ml_gtk_label_get_yalign"

(** Set property: yalign *)
external set_yalign : t -> float -> unit = "ml_gtk_label_set_yalign"

external set_wrap_mode : t -> int -> unit = "ml_gtk_label_set_wrap_mode"

external set_text_with_mnemonic : t -> string -> unit = "ml_gtk_label_set_text_with_mnemonic"

external set_text : t -> string -> unit = "ml_gtk_label_set_text"

external set_tabs : t -> unit -> unit = "ml_gtk_label_set_tabs"

external set_natural_wrap_mode : t -> int -> unit = "ml_gtk_label_set_natural_wrap_mode"

external set_mnemonic_widget : t -> Gtk.Widget.t option -> unit = "ml_gtk_label_set_mnemonic_widget"

external set_markup_with_mnemonic : t -> string -> unit = "ml_gtk_label_set_markup_with_mnemonic"

external set_markup : t -> string -> unit = "ml_gtk_label_set_markup"

external set_label : t -> string -> unit = "ml_gtk_label_set_label"

external set_justify : t -> int -> unit = "ml_gtk_label_set_justify"

external set_extra_menu : t -> unit -> unit = "ml_gtk_label_set_extra_menu"

external set_ellipsize : t -> int -> unit = "ml_gtk_label_set_ellipsize"

external set_attributes : t -> unit -> unit = "ml_gtk_label_set_attributes"

external select_region : t -> unit -> unit -> unit = "ml_gtk_label_select_region"

external get_wrap_mode : t -> int = "ml_gtk_label_get_wrap_mode"

external get_text : t -> string = "ml_gtk_label_get_text"

external get_tabs : t -> unit = "ml_gtk_label_get_tabs"

external get_selection_bounds : t -> unit -> unit -> bool = "ml_gtk_label_get_selection_bounds"

external get_natural_wrap_mode : t -> int = "ml_gtk_label_get_natural_wrap_mode"

external get_mnemonic_widget : t -> Gtk.Widget.t = "ml_gtk_label_get_mnemonic_widget"

external get_layout_offsets : t -> unit -> unit -> unit = "ml_gtk_label_get_layout_offsets"

external get_layout : t -> unit = "ml_gtk_label_get_layout"

external get_label : t -> string = "ml_gtk_label_get_label"

external get_justify : t -> int = "ml_gtk_label_get_justify"

external get_extra_menu : t -> unit = "ml_gtk_label_get_extra_menu"

external get_ellipsize : t -> int = "ml_gtk_label_get_ellipsize"

external get_current_uri : t -> string = "ml_gtk_label_get_current_uri"

external get_attributes : t -> unit = "ml_gtk_label_get_attributes"

