(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Editable *)

type t = Gtk.Widget.t

(* Properties *)

(** Get property: cursor-position *)
external get_cursor_position : t -> int = "ml_gtk_editable_get_cursor_position"

(** Get property: editable *)
external get_editable : t -> bool = "ml_gtk_editable_get_editable"

(** Set property: editable *)
external set_editable : t -> bool -> unit = "ml_gtk_editable_set_editable"

(** Get property: enable-undo *)
external get_enable_undo : t -> bool = "ml_gtk_editable_get_enable_undo"

(** Set property: enable-undo *)
external set_enable_undo : t -> bool -> unit = "ml_gtk_editable_set_enable_undo"

(** Get property: max-width-chars *)
external get_max_width_chars : t -> int = "ml_gtk_editable_get_max_width_chars"

(** Set property: max-width-chars *)
external set_max_width_chars : t -> int -> unit = "ml_gtk_editable_set_max_width_chars"

(** Get property: selection-bound *)
external get_selection_bound : t -> int = "ml_gtk_editable_get_selection_bound"

(** Get property: text *)
external get_text : t -> string = "ml_gtk_editable_get_text"

(** Set property: text *)
external set_text : t -> string -> unit = "ml_gtk_editable_set_text"

(** Get property: width-chars *)
external get_width_chars : t -> int = "ml_gtk_editable_get_width_chars"

(** Set property: width-chars *)
external set_width_chars : t -> int -> unit = "ml_gtk_editable_set_width_chars"

(** Get property: xalign *)
external get_xalign : t -> float = "ml_gtk_editable_get_xalign"

(** Set property: xalign *)
external set_xalign : t -> float -> unit = "ml_gtk_editable_set_xalign"

external set_position : t -> int -> unit = "ml_gtk_editable_set_position"

external set_alignment : t -> float -> unit = "ml_gtk_editable_set_alignment"

external select_region : t -> int -> int -> unit = "ml_gtk_editable_select_region"

external insert_text : t -> string -> int -> int -> unit = "ml_gtk_editable_insert_text"

external init_delegate : t -> unit = "ml_gtk_editable_init_delegate"

external get_selection_bounds : t -> int -> int -> bool = "ml_gtk_editable_get_selection_bounds"

external get_position : t -> int = "ml_gtk_editable_get_position"

external get_delegate : t -> Gtk.Widget.t = "ml_gtk_editable_get_delegate"

external get_alignment : t -> float = "ml_gtk_editable_get_alignment"

external finish_delegate : t -> unit = "ml_gtk_editable_finish_delegate"

external delete_text : t -> int -> int -> unit = "ml_gtk_editable_delete_text"

external delete_selection : t -> unit = "ml_gtk_editable_delete_selection"

external delegate_get_accessible_platform_state : t -> Gtk_enums.accessibleplatformstate -> bool = "ml_gtk_editable_delegate_get_accessible_platform_state"

