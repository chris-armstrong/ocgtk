(** Renders a keyboard accelerator in a cell

    [GtkCellRendererAccel] displays a keyboard accelerator (i.e. a key
    combination like [Control + a]). If the cell renderer is editable, the
    accelerator can be changed by simply typing the new combination.

    Its methods, signals and properties are on
    {!class-type-cell_renderer_accel_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Cell_renderer_accel}. *)

(** {b The methods, signals and properties of a [CellRendererAccel].}

    Renders a keyboard accelerator in a cell

    [GtkCellRendererAccel] displays a keyboard accelerator (i.e. a key
    combination like [Control + a]). If the cell renderer is editable, the
    accelerator can be changed by simply typing the new combination. *)
class type cell_renderer_accel_t = object
  inherit Cell_renderer_text.cell_renderer_text_t

  method on_accel_cleared :
    ?after:bool ->
    callback:(path_string:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Gets emitted when the user has removed the accelerator. *)

  method on_accel_edited :
    ?after:bool ->
    callback:
      (path_string:string ->
      accel_key:int ->
      accel_mods:Ocgdk.Enums.modifiertype ->
      hardware_keycode:int ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Gets emitted when the user has selected a new accelerator. *)

  method accel_key : int
  (** The keyval of the accelerator. *)

  method set_accel_key : int -> unit
  (** The keyval of the accelerator. *)

  method accel_mode : Enums.cellrendereraccelmode
  (** Determines if the edited accelerators are GTK accelerators. If they are,
      consumed modifiers are suppressed, only accelerators accepted by GTK are
      allowed, and the accelerators are rendered in the same way as they are in
      menus. *)

  method set_accel_mode : Enums.cellrendereraccelmode -> unit
  (** Determines if the edited accelerators are GTK accelerators. If they are,
      consumed modifiers are suppressed, only accelerators accepted by GTK are
      allowed, and the accelerators are rendered in the same way as they are in
      menus. *)

  method accel_mods : Ocgdk.Enums.modifiertype
  (** The modifier mask of the accelerator. *)

  method set_accel_mods : Ocgdk.Enums.modifiertype -> unit
  (** The modifier mask of the accelerator. *)

  method keycode : int
  (** The hardware keycode of the accelerator. Note that the hardware keycode is
      only relevant if the key does not have a keyval. Normally, the keyboard
      configuration should assign keyvals to all keys. *)

  method set_keycode : int -> unit
  (** The hardware keycode of the accelerator. Note that the hardware keycode is
      only relevant if the key does not have a keyval. Normally, the keyboard
      configuration should assign keyvals to all keys. *)

  method as_cell_renderer_accel : Raw.Cell_renderer_accel.t
end

class cell_renderer_accel : Raw.Cell_renderer_accel.t -> cell_renderer_accel_t
(** Wraps a raw handle of {!Ocgtk.Raw.Cell_renderer_accel.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> cell_renderer_accel_t
(** Creates a new [GtkCellRendererAccel]. *)
