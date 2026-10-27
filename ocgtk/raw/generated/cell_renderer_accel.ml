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

let on_accel_cleared ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let path_string =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_string v
        in
        callback ~path_string)
  in
  Gobject.Signal.connect obj ~name:"accel-cleared" ~callback:closure
    ~after:(Option.value after ~default:false)

let on_accel_edited ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let path_string =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_string v
        in
        let accel_key =
          let v = Gobject.Closure.nth argv ~pos:2 in
          Gobject.Value.get_uint v
        in
        let accel_mods =
          let v = Gobject.Closure.nth argv ~pos:3 in
          Ocgdk_enums.modifiertype_of_int (Gobject.Value.get_flags_int v)
        in
        let hardware_keycode =
          let v = Gobject.Closure.nth argv ~pos:4 in
          Gobject.Value.get_uint v
        in
        callback ~path_string ~accel_key ~accel_mods ~hardware_keycode)
  in
  Gobject.Signal.connect obj ~name:"accel-edited" ~callback:closure
    ~after:(Option.value after ~default:false)
