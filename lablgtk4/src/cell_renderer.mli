(* GENERATED CODE - DO NOT EDIT *)
(* Widget: CellRenderer *)

type t = Gtk.Widget.t

(* Properties *)

(** Get property: cell-background *)
external get_cell_background : t -> string = "ml_gtk_cell_renderer_get_cell_background"

(** Set property: cell-background *)
external set_cell_background : t -> string -> unit = "ml_gtk_cell_renderer_set_cell_background"

(** Get property: cell-background-set *)
external get_cell_background_set : t -> bool = "ml_gtk_cell_renderer_get_cell_background_set"

(** Set property: cell-background-set *)
external set_cell_background_set : t -> bool -> unit = "ml_gtk_cell_renderer_set_cell_background_set"

(** Get property: editing *)
external get_editing : t -> bool = "ml_gtk_cell_renderer_get_editing"

(** Get property: height *)
external get_height : t -> int = "ml_gtk_cell_renderer_get_height"

(** Set property: height *)
external set_height : t -> int -> unit = "ml_gtk_cell_renderer_set_height"

(** Get property: is-expanded *)
external get_is_expanded : t -> bool = "ml_gtk_cell_renderer_get_is_expanded"

(** Set property: is-expanded *)
external set_is_expanded : t -> bool -> unit = "ml_gtk_cell_renderer_set_is_expanded"

(** Get property: is-expander *)
external get_is_expander : t -> bool = "ml_gtk_cell_renderer_get_is_expander"

(** Set property: is-expander *)
external set_is_expander : t -> bool -> unit = "ml_gtk_cell_renderer_set_is_expander"

(** Get property: sensitive *)
external get_sensitive : t -> bool = "ml_gtk_cell_renderer_get_sensitive"

(** Set property: sensitive *)
external set_sensitive : t -> bool -> unit = "ml_gtk_cell_renderer_set_sensitive"

(** Get property: visible *)
external get_visible : t -> bool = "ml_gtk_cell_renderer_get_visible"

(** Set property: visible *)
external set_visible : t -> bool -> unit = "ml_gtk_cell_renderer_set_visible"

(** Get property: width *)
external get_width : t -> int = "ml_gtk_cell_renderer_get_width"

(** Set property: width *)
external set_width : t -> int -> unit = "ml_gtk_cell_renderer_set_width"

(** Get property: xalign *)
external get_xalign : t -> float = "ml_gtk_cell_renderer_get_xalign"

(** Set property: xalign *)
external set_xalign : t -> float -> unit = "ml_gtk_cell_renderer_set_xalign"

(** Get property: xpad *)
external get_xpad : t -> int = "ml_gtk_cell_renderer_get_xpad"

(** Set property: xpad *)
external set_xpad : t -> int -> unit = "ml_gtk_cell_renderer_set_xpad"

(** Get property: yalign *)
external get_yalign : t -> float = "ml_gtk_cell_renderer_get_yalign"

(** Set property: yalign *)
external set_yalign : t -> float -> unit = "ml_gtk_cell_renderer_set_yalign"

(** Get property: ypad *)
external get_ypad : t -> int = "ml_gtk_cell_renderer_get_ypad"

(** Set property: ypad *)
external set_ypad : t -> int -> unit = "ml_gtk_cell_renderer_set_ypad"

external stop_editing : t -> bool -> unit = "ml_gtk_cell_renderer_stop_editing"

external start_editing : t -> _ Gdk.event option -> Gtk.Widget.t -> string -> unit -> unit -> Gtk_enums.cellrendererstate -> Gtk.Widget.t = "ml_gtk_cell_renderer_start_editing_bytecode" "ml_gtk_cell_renderer_start_editing_native"

external snapshot : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit -> unit -> Gtk_enums.cellrendererstate -> unit = "ml_gtk_cell_renderer_snapshot_bytecode" "ml_gtk_cell_renderer_snapshot_native"

external set_padding : t -> int -> int -> unit = "ml_gtk_cell_renderer_set_padding"

external set_fixed_size : t -> int -> int -> unit = "ml_gtk_cell_renderer_set_fixed_size"

external set_alignment : t -> float -> float -> unit = "ml_gtk_cell_renderer_set_alignment"

external is_activatable : t -> bool = "ml_gtk_cell_renderer_is_activatable"

external get_state : t -> Gtk.Widget.t option -> Gtk_enums.cellrendererstate -> Gtk_enums.stateflags = "ml_gtk_cell_renderer_get_state"

external get_request_mode : t -> Gtk_enums.sizerequestmode = "ml_gtk_cell_renderer_get_request_mode"

external get_preferred_width_for_height : t -> Gtk.Widget.t -> int -> int -> int -> unit = "ml_gtk_cell_renderer_get_preferred_width_for_height"

external get_preferred_width : t -> Gtk.Widget.t -> int -> int -> unit = "ml_gtk_cell_renderer_get_preferred_width"

external get_preferred_size : t -> Gtk.Widget.t -> Gtk.Widget.t -> Gtk.Widget.t -> unit = "ml_gtk_cell_renderer_get_preferred_size"

external get_preferred_height_for_width : t -> Gtk.Widget.t -> int -> int -> int -> unit = "ml_gtk_cell_renderer_get_preferred_height_for_width"

external get_preferred_height : t -> Gtk.Widget.t -> int -> int -> unit = "ml_gtk_cell_renderer_get_preferred_height"

external get_padding : t -> int -> int -> unit = "ml_gtk_cell_renderer_get_padding"

external get_fixed_size : t -> int -> int -> unit = "ml_gtk_cell_renderer_get_fixed_size"

external get_alignment : t -> float -> float -> unit = "ml_gtk_cell_renderer_get_alignment"

external get_aligned_area : t -> Gtk.Widget.t -> Gtk_enums.cellrendererstate -> unit -> unit -> unit = "ml_gtk_cell_renderer_get_aligned_area"

external activate : t -> _ Gdk.event -> Gtk.Widget.t -> string -> unit -> unit -> Gtk_enums.cellrendererstate -> bool = "ml_gtk_cell_renderer_activate_bytecode" "ml_gtk_cell_renderer_activate_native"

