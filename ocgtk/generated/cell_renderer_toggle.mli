(** Renders a toggle button in a cell

    Its methods, signals and properties are on
    {!class-type-cell_renderer_toggle_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Cell_renderer_toggle}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [CellRendererToggle].}

    Renders a toggle button in a cell

    [GtkCellRendererToggle] renders a toggle button in a cell. The button is
    drawn as a radio or a checkbutton, depending on the
    [GtkCellRendererToggle:radio] property. When activated, it emits the
    [GtkCellRendererToggle::toggled] signal. *)
class type cell_renderer_toggle_t = object
  inherit Cell_renderer.cell_renderer_t

  method on_toggled :
    ?after:bool ->
    callback:(path:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** The ::toggled signal is emitted when the cell is toggled.

      It is the responsibility of the application to update the model with the
      correct value to store at [path]. Often this is simply the opposite of the
      value currently stored at [path]. *)

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
  (** Get property: inconsistent *)

  method set_inconsistent : bool -> unit
  (** Set property: inconsistent *)

  method as_cell_renderer_toggle : Raw.Cell_renderer_toggle.t
end

class cell_renderer_toggle :
  Raw.Cell_renderer_toggle.t ->
  cell_renderer_toggle_t
(** Wraps a raw handle of {!Ocgtk.Raw.Cell_renderer_toggle.t}. *)

(** {1:description Description}

    Renders a toggle button in a cell

    [GtkCellRendererToggle] renders a toggle button in a cell. The button is
    drawn as a radio or a checkbutton, depending on the
    [GtkCellRendererToggle:radio] property. When activated, it emits the
    [GtkCellRendererToggle::toggled] signal. *)

(** {1:constructors Constructors} *)

val new_ : unit -> cell_renderer_toggle_t
(** Creates a new [GtkCellRendererToggle]. Adjust rendering parameters using
    object properties. Object properties can be set globally (with
    g_object_set()). Also, with [GtkTreeViewColumn], you can bind a property to
    a value in a [GtkTreeModel]. For example, you can bind the “active” property
    on the cell renderer to a boolean value in the model, thus causing the check
    button to reflect the state of the model. *)
