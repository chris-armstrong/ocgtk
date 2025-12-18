(* Signal class defined in gcell_renderer_signals.ml *)

(* High-level class for CellRenderer *)
class cell_renderer (obj : Cell_renderer.t) = object (self)
  inherit Gcell_renderer_signals.cell_renderer_signals obj

  method cell_background = Cell_renderer.get_cell_background obj
  method set_cell_background v = Cell_renderer.set_cell_background obj v

  method cell_background_set = Cell_renderer.get_cell_background_set obj
  method set_cell_background_set v = Cell_renderer.set_cell_background_set obj v

  method editing = Cell_renderer.get_editing obj

  method height = Cell_renderer.get_height obj
  method set_height v = Cell_renderer.set_height obj v

  method is_expanded = Cell_renderer.get_is_expanded obj
  method set_is_expanded v = Cell_renderer.set_is_expanded obj v

  method is_expander = Cell_renderer.get_is_expander obj
  method set_is_expander v = Cell_renderer.set_is_expander obj v

  method sensitive = Cell_renderer.get_sensitive obj
  method set_sensitive v = Cell_renderer.set_sensitive obj v

  method visible = Cell_renderer.get_visible obj
  method set_visible v = Cell_renderer.set_visible obj v

  method width = Cell_renderer.get_width obj
  method set_width v = Cell_renderer.set_width obj v

  method xalign = Cell_renderer.get_xalign obj
  method set_xalign v = Cell_renderer.set_xalign obj v

  method xpad = Cell_renderer.get_xpad obj
  method set_xpad v = Cell_renderer.set_xpad obj v

  method yalign = Cell_renderer.get_yalign obj
  method set_yalign v = Cell_renderer.set_yalign obj v

  method ypad = Cell_renderer.get_ypad obj
  method set_ypad v = Cell_renderer.set_ypad obj v

  method get_request_mode : unit -> Gtk_enums.sizerequestmode = fun () -> (Cell_renderer.get_request_mode obj )

  method get_state : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> Gtk_enums.cellrendererstate -> Gtk_enums.stateflags =
    fun widget cell_state ->
      let widget = Option.map (fun (c) -> c#as_widget) widget in
      (Cell_renderer.get_state obj widget cell_state)

  method is_activatable : unit -> bool = fun () -> (Cell_renderer.is_activatable obj )

  method set_alignment : float -> float -> unit = fun xalign yalign -> (Cell_renderer.set_alignment obj xalign yalign)

  method set_fixed_size : int -> int -> unit = fun width height -> (Cell_renderer.set_fixed_size obj width height)

  method set_padding : int -> int -> unit = fun xpad ypad -> (Cell_renderer.set_padding obj xpad ypad)

  method stop_editing : bool -> unit = fun canceled -> (Cell_renderer.stop_editing obj canceled)

    method as_cell_renderer = obj
end

