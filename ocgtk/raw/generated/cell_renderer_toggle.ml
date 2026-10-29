(* GENERATED CODE - DO NOT EDIT *)
(* CellRendererToggle: CellRendererToggle *)

(** Renders a toggle button in a cell

    [GtkCellRendererToggle] renders a toggle button in a cell. The button is
    drawn as a radio or a checkbutton, depending on the
    [GtkCellRendererToggle:radio] property. When activated, it emits the
    [GtkCellRendererToggle::toggled] signal.

    The class built on this module is in {!Ocgtk.Cell_renderer_toggle}. *)

type t =
  [ `cell_renderer_toggle | `cell_renderer | `initially_unowned | `object_ ]
  Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_cell_renderer_toggle_get_type"

external new_ : unit -> t = "ml_gtk_cell_renderer_toggle_new"
(** Creates a new [GtkCellRendererToggle]. Adjust rendering parameters using
    object properties. Object properties can be set globally (with
    [g_object_set ()]). Also, with [GtkTreeViewColumn], you can bind a property
    to a value in a [GtkTreeModel]. For example, you can bind the “active”
    property on the cell renderer to a boolean value in the model, thus causing
    the check button to reflect the state of the model. *)

(* Methods *)

external set_radio : t -> bool -> unit = "ml_gtk_cell_renderer_toggle_set_radio"
(** If [radio] is [true], the cell renderer renders a radio toggle (i.e. a
    toggle in a group of mutually-exclusive toggles). If [false], it renders a
    check toggle (a standalone boolean option). This can be set globally for the
    cell renderer, or changed just before rendering each cell in the model (for
    [GtkTreeView], you set up a per-row setting using [GtkTreeViewColumn] to
    associate model columns with cell renderer properties). *)

external set_active : t -> bool -> unit
  = "ml_gtk_cell_renderer_toggle_set_active"
(** Activates or deactivates a cell renderer. *)

external set_activatable : t -> bool -> unit
  = "ml_gtk_cell_renderer_toggle_set_activatable"
(** Makes the cell renderer activatable. *)

external get_radio : t -> bool = "ml_gtk_cell_renderer_toggle_get_radio"
(** Returns whether we’re rendering radio toggles rather than checkboxes. *)

external get_active : t -> bool = "ml_gtk_cell_renderer_toggle_get_active"
(** Returns whether the cell renderer is active. See
    {{!Ocgtk.Raw.Cell_renderer_toggle.val-set_active}[gtk_cell_renderer_toggle_set_active
                                                      ()]}. *)

external get_activatable : t -> bool
  = "ml_gtk_cell_renderer_toggle_get_activatable"
(** Returns whether the cell renderer is activatable. See
    {{!Ocgtk.Raw.Cell_renderer_toggle.val-set_activatable}[gtk_cell_renderer_toggle_set_activatable
                                                           ()]}. *)

(* Properties *)

external get_inconsistent : t -> bool
  = "ml_gtk_cell_renderer_toggle_get_inconsistent"
(** Get property: inconsistent *)

external set_inconsistent : t -> bool -> unit
  = "ml_gtk_cell_renderer_toggle_set_inconsistent"
(** Set property: inconsistent *)

let on_toggled ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let path =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_string v
        in
        callback ~path)
  in
  Gobject.Signal.connect obj ~name:"toggled" ~callback:closure
    ~after:(Option.value after ~default:false)
