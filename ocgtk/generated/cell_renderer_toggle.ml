class type cell_renderer_toggle_t = object
  inherit Cell_renderer.cell_renderer_t

  (** {2:signals Signals} *)

  method on_toggled :
    ?after:bool ->
    callback:(path:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** The ::toggled signal is emitted when the cell is toggled.

      It is the responsibility of the application to update the model with the
      correct value to store at [path]. Often this is simply the opposite of the
      value currently stored at [path]. *)

  (** {2:methods Methods} *)

  method get_activatable : unit -> bool
  (** Returns whether the cell renderer is activatable. See
      [gtk_cell_renderer_toggle_set_activatable ()]. *)

  method get_active : unit -> bool
  (** Returns whether the cell renderer is active. See
      [gtk_cell_renderer_toggle_set_active ()]. *)

  method get_radio : unit -> bool
  (** Returns whether we’re rendering radio toggles rather than checkboxes. *)

  method set_activatable : bool -> unit
  (** Makes the cell renderer activatable. *)

  method set_active : bool -> unit
  (** Activates or deactivates a cell renderer. *)

  method set_radio : bool -> unit
  (** If [radio] is [true], the cell renderer renders a radio toggle (i.e. a
      toggle in a group of mutually-exclusive toggles). If [false], it renders a
      check toggle (a standalone boolean option). This can be set globally for
      the cell renderer, or changed just before rendering each cell in the model
      (for [GtkTreeView], you set up a per-row setting using [GtkTreeViewColumn]
      to associate model columns with cell renderer properties). *)

  (** {2:properties Properties} *)

  method inconsistent : bool
  (** Get property: [inconsistent] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererToggle.inconsistent.html}upstream
       docs}. *)

  method set_inconsistent : bool -> unit
  (** Set property: [inconsistent] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererToggle.inconsistent.html}upstream
       docs}. *)

  (** {2:conversions Conversions} *)

  method as_cell_renderer_toggle : Raw.Cell_renderer_toggle.t
end

(* High-level class for CellRendererToggle *)
class cell_renderer_toggle (obj : Raw.Cell_renderer_toggle.t) :
  cell_renderer_toggle_t =
  object (self)
    inherit Cell_renderer.cell_renderer (obj :> Raw.Cell_renderer.t)

    method on_toggled ?(after = false) ~callback () =
      Raw.Cell_renderer_toggle.on_toggled ~after self#as_cell_renderer_toggle
        ~callback

    method get_activatable : unit -> bool =
      fun () -> Raw.Cell_renderer_toggle.get_activatable obj

    method get_active : unit -> bool =
      fun () -> Raw.Cell_renderer_toggle.get_active obj

    method get_radio : unit -> bool =
      fun () -> Raw.Cell_renderer_toggle.get_radio obj

    method set_activatable : bool -> unit =
      fun setting -> Raw.Cell_renderer_toggle.set_activatable obj setting

    method set_active : bool -> unit =
      fun setting -> Raw.Cell_renderer_toggle.set_active obj setting

    method set_radio : bool -> unit =
      fun radio -> Raw.Cell_renderer_toggle.set_radio obj radio

    method inconsistent = Raw.Cell_renderer_toggle.get_inconsistent obj
    method set_inconsistent v = Raw.Cell_renderer_toggle.set_inconsistent obj v
    method as_cell_renderer_toggle = obj
  end

let new_ () : cell_renderer_toggle_t =
  new cell_renderer_toggle (Raw.Cell_renderer_toggle.new_ ())
