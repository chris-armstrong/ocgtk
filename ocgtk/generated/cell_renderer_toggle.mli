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
  (** Returns whether the cell renderer is activatable. See
      gtk_cell_renderer_toggle_set_activatable(). *)

  method get_active : unit -> bool
  (** Returns whether the cell renderer is active. See
      gtk_cell_renderer_toggle_set_active(). *)

  method get_radio : unit -> bool
  (** Returns whether we’re rendering radio toggles rather than checkboxes. *)

  method set_activatable : bool -> unit
  (** Makes the cell renderer activatable. *)

  method set_active : bool -> unit
  (** Activates or deactivates a cell renderer. *)

  method set_radio : bool -> unit
  (** If [radio] is [TRUE], the cell renderer renders a radio toggle (i.e. a
      toggle in a group of mutually-exclusive toggles). If [FALSE], it renders a
      check toggle (a standalone boolean option). This can be set globally for
      the cell renderer, or changed just before rendering each cell in the model
      (for [GtkTreeView], you set up a per-row setting using [GtkTreeViewColumn]
      to associate model columns with cell renderer properties). *)

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
