(* GENERATED CODE - DO NOT EDIT *)
(* CellRendererAccel: CellRendererAccel *)

type t = [`cell_renderer_accel | `cell_renderer_text | `cell_renderer | `initially_unowned | `object_] Gobject.obj

(** Create a new CellRendererAccel *)
external new_ : unit -> t = "ml_gtk_cell_renderer_accel_new"

(* Methods *)
(* Properties *)

(** Get property: accel-key *)
external get_accel_key : t -> int = "ml_gtk_cell_renderer_accel_get_accel_key"

(** Set property: accel-key *)
external set_accel_key : t -> int -> unit = "ml_gtk_cell_renderer_accel_set_accel_key"

(** Get property: accel-mode *)
external get_accel_mode : t -> Gtk_enums.cellrendereraccelmode = "ml_gtk_cell_renderer_accel_get_accel_mode"

(** Set property: accel-mode *)
external set_accel_mode : t -> Gtk_enums.cellrendereraccelmode -> unit = "ml_gtk_cell_renderer_accel_set_accel_mode"

(** Get property: accel-mods *)
external get_accel_mods : t -> Ocgtk_gdk.Gdk.modifiertype = "ml_gtk_cell_renderer_accel_get_accel_mods"

(** Set property: accel-mods *)
external set_accel_mods : t -> Ocgtk_gdk.Gdk.modifiertype -> unit = "ml_gtk_cell_renderer_accel_set_accel_mods"

(** Get property: keycode *)
external get_keycode : t -> int = "ml_gtk_cell_renderer_accel_get_keycode"

(** Set property: keycode *)
external set_keycode : t -> int -> unit = "ml_gtk_cell_renderer_accel_set_keycode"

