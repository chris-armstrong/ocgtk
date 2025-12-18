(* Signal class defined in gcell_renderer_signals.ml *)

(* High-level class for CellRenderer *)
class cell_renderer (obj : Cell_renderer.t) = object (self)
  inherit Gcell_renderer_signals.cell_renderer_signals obj

  method cell_background = Cell_renderer.get_cell_background obj
  method set_cell_background v = Cell_renderer.set_cell_background obj v

  method get_is_expanded : unit -> bool = fun () -> (Cell_renderer.get_is_expanded obj )

  method get_is_expander : unit -> bool = fun () -> (Cell_renderer.get_is_expander obj )

  method get_request_mode : unit -> Gtk_enums.sizerequestmode = fun () -> (Cell_renderer.get_request_mode obj )

  method get_sensitive : unit -> bool = fun () -> (Cell_renderer.get_sensitive obj )

  method get_state : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> Gtk_enums.cellrendererstate -> Gtk_enums.stateflags =
    fun widget cell_state ->
      let widget = Option.map (fun (c) -> c#as_widget) widget in
      (Cell_renderer.get_state obj widget cell_state)

  method get_visible : unit -> bool = fun () -> (Cell_renderer.get_visible obj )

  method is_activatable : unit -> bool = fun () -> (Cell_renderer.is_activatable obj )

  method set_alignment : float -> float -> unit = fun xalign yalign -> (Cell_renderer.set_alignment obj xalign yalign)

  method set_fixed_size : int -> int -> unit = fun width height -> (Cell_renderer.set_fixed_size obj width height)

  method set_is_expanded : bool -> unit = fun is_expanded -> (Cell_renderer.set_is_expanded obj is_expanded)

  method set_is_expander : bool -> unit = fun is_expander -> (Cell_renderer.set_is_expander obj is_expander)

  method set_padding : int -> int -> unit = fun xpad ypad -> (Cell_renderer.set_padding obj xpad ypad)

  method set_sensitive : bool -> unit = fun sensitive -> (Cell_renderer.set_sensitive obj sensitive)

  method set_visible : bool -> unit = fun visible -> (Cell_renderer.set_visible obj visible)

  method stop_editing : bool -> unit = fun canceled -> (Cell_renderer.stop_editing obj canceled)

    method as_cell_renderer = obj
end

