(** Renders a toggle button in a cell

    [GtkCellRendererToggle] renders a toggle button in a cell. The button is
    drawn as a radio or a checkbutton, depending on the
    [GtkCellRendererToggle:radio] property. When activated, it emits the
    [GtkCellRendererToggle::toggled] signal.

    Its methods, signals and properties are on
    {!class-type-cell_renderer_toggle_t}. The functions it is built on are in
    {!Ocgtk.Raw.Cell_renderer_toggle}. *)

(** The methods, signals and properties of a [GtkCellRendererToggle]. *)
class type cell_renderer_toggle_t = object
  inherit Cell_renderer.cell_renderer_t

  method on_toggled :
    ?after:bool ->
    callback:(path:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_activatable : unit -> bool
  method get_active : unit -> bool
  method get_radio : unit -> bool
  method set_activatable : bool -> unit
  method set_active : bool -> unit
  method set_radio : bool -> unit
  method inconsistent : bool
  method set_inconsistent : bool -> unit
  method as_cell_renderer_toggle : Raw.Cell_renderer_toggle.t
end

class cell_renderer_toggle :
  Raw.Cell_renderer_toggle.t ->
  cell_renderer_toggle_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Cell_renderer_toggle.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkCellRendererToggle], give one already wrapped. *)

val new_ : unit -> cell_renderer_toggle_t
