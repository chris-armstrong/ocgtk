(* GENERATED CODE - DO NOT EDIT *)
(* CellRendererAccel: CellRendererAccel *)

(** Renders a keyboard accelerator in a cell

    [GtkCellRendererAccel] displays a keyboard accelerator (i.e. a key
    combination like [Control + a]). If the cell renderer is editable, the
    accelerator can be changed by simply typing the new combination.

    The class built on this module is in {!Ocgtk.Cell_renderer_accel}. *)

type t =
  [ `cell_renderer_accel
  | `cell_renderer_text
  | `cell_renderer
  | `initially_unowned
  | `object_ ]
  Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_cell_renderer_accel_get_type"

external new_ : unit -> t = "ml_gtk_cell_renderer_accel_new"
(** Creates a new [GtkCellRendererAccel]. *)

(* Methods *)
(* Properties *)

external get_accel_key : t -> int = "ml_gtk_cell_renderer_accel_get_accel_key"
(** The keyval of the accelerator. *)

external set_accel_key : t -> int -> unit
  = "ml_gtk_cell_renderer_accel_set_accel_key"
(** The keyval of the accelerator. *)

external get_accel_mode : t -> Ocgtk_enums.cellrendereraccelmode
  = "ml_gtk_cell_renderer_accel_get_accel_mode"
(** Determines if the edited accelerators are GTK accelerators. If they are,
    consumed modifiers are suppressed, only accelerators accepted by GTK are
    allowed, and the accelerators are rendered in the same way as they are in
    menus. *)

external set_accel_mode : t -> Ocgtk_enums.cellrendereraccelmode -> unit
  = "ml_gtk_cell_renderer_accel_set_accel_mode"
(** Determines if the edited accelerators are GTK accelerators. If they are,
    consumed modifiers are suppressed, only accelerators accepted by GTK are
    allowed, and the accelerators are rendered in the same way as they are in
    menus. *)

external get_accel_mods : t -> Ocgdk_enums.modifiertype
  = "ml_gtk_cell_renderer_accel_get_accel_mods"
(** The modifier mask of the accelerator. *)

external set_accel_mods : t -> Ocgdk_enums.modifiertype -> unit
  = "ml_gtk_cell_renderer_accel_set_accel_mods"
(** The modifier mask of the accelerator. *)

external get_keycode : t -> int = "ml_gtk_cell_renderer_accel_get_keycode"
(** The hardware keycode of the accelerator. Note that the hardware keycode is
    only relevant if the key does not have a keyval. Normally, the keyboard
    configuration should assign keyvals to all keys. *)

external set_keycode : t -> int -> unit
  = "ml_gtk_cell_renderer_accel_set_keycode"
(** The hardware keycode of the accelerator. Note that the hardware keycode is
    only relevant if the key does not have a keyval. Normally, the keyboard
    configuration should assign keyvals to all keys. *)

val on_accel_cleared :
  ?after:bool ->
  t ->
  callback:(path_string:string -> unit) ->
  Gobject.Signal.handler_id
(** Gets emitted when the user has removed the accelerator. *)

val on_accel_edited :
  ?after:bool ->
  t ->
  callback:
    (path_string:string ->
    accel_key:int ->
    accel_mods:Ocgdk_enums.modifiertype ->
    hardware_keycode:int ->
    unit) ->
  Gobject.Signal.handler_id
(** Gets emitted when the user has selected a new accelerator. *)
