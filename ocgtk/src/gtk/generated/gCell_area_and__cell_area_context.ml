(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)
(* Signal class defined in gcell_area_signals.ml *)

class cell_area (obj : Cell_area_and__cell_area_context.Cell_area.t) = object (self)
  inherit Gcell_area_signals.cell_area_signals obj

  method activate : 'p1 'p2 'p3. (<as_cell_area_context: Cell_area_and__cell_area_context.Cell_area_context.t; ..> as 'p1) -> (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p2) -> (#Ocgtk_gdk.Gdk.rectangle as 'p3) -> Gtk_enums.cellrendererstate -> bool -> bool =
    fun context widget cell_area flags edit_only ->
      let context = context#as_cell_area_context in
      let widget = widget#as_widget in
      let cell_area = cell_area#as_rectangle in
      (Cell_area_and__cell_area_context.Cell_area.activate obj context widget cell_area flags edit_only)

  method activate_cell : 'p1 'p2 'p3 'p4. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> (#GCell_renderer.cell_renderer as 'p2) -> (#Ocgtk_gdk.Gdk.event as 'p3) -> (#Ocgtk_gdk.Gdk.rectangle as 'p4) -> Gtk_enums.cellrendererstate -> bool =
    fun widget renderer event cell_area flags ->
      let widget = widget#as_widget in
      let renderer = renderer#as_cell_renderer in
      let event = event#as_event in
      let cell_area = cell_area#as_rectangle in
      (Cell_area_and__cell_area_context.Cell_area.activate_cell obj widget renderer event cell_area flags)

  method add : 'p1. (#GCell_renderer.cell_renderer as 'p1) -> unit =
    fun renderer ->
      let renderer = renderer#as_cell_renderer in
      (Cell_area_and__cell_area_context.Cell_area.add obj renderer)

  method add_focus_sibling : 'p1 'p2. (#GCell_renderer.cell_renderer as 'p1) -> (#GCell_renderer.cell_renderer as 'p2) -> unit =
    fun renderer sibling ->
      let renderer = renderer#as_cell_renderer in
      let sibling = sibling#as_cell_renderer in
      (Cell_area_and__cell_area_context.Cell_area.add_focus_sibling obj renderer sibling)

  method attribute_connect : 'p1. (#GCell_renderer.cell_renderer as 'p1) -> string -> int -> unit =
    fun renderer attribute column ->
      let renderer = renderer#as_cell_renderer in
      (Cell_area_and__cell_area_context.Cell_area.attribute_connect obj renderer attribute column)

  method attribute_disconnect : 'p1. (#GCell_renderer.cell_renderer as 'p1) -> string -> unit =
    fun renderer attribute ->
      let renderer = renderer#as_cell_renderer in
      (Cell_area_and__cell_area_context.Cell_area.attribute_disconnect obj renderer attribute)

  method attribute_get_column : 'p1. (#GCell_renderer.cell_renderer as 'p1) -> string -> int =
    fun renderer attribute ->
      let renderer = renderer#as_cell_renderer in
      (Cell_area_and__cell_area_context.Cell_area.attribute_get_column obj renderer attribute)

  method copy_context : 'p1. (<as_cell_area_context: Cell_area_and__cell_area_context.Cell_area_context.t; ..> as 'p1) -> cell_area_context =
    fun context ->
      let context = context#as_cell_area_context in
      new  cell_area_context(Cell_area_and__cell_area_context.Cell_area.copy_context obj context)

  method create_context : unit -> cell_area_context =
    fun () ->
      new  cell_area_context(Cell_area_and__cell_area_context.Cell_area.create_context obj)

  method event : 'p1 'p2 'p3 'p4. (<as_cell_area_context: Cell_area_and__cell_area_context.Cell_area_context.t; ..> as 'p1) -> (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p2) -> (#Ocgtk_gdk.Gdk.event as 'p3) -> (#Ocgtk_gdk.Gdk.rectangle as 'p4) -> Gtk_enums.cellrendererstate -> int =
    fun context widget event cell_area flags ->
      let context = context#as_cell_area_context in
      let widget = widget#as_widget in
      let event = event#as_event in
      let cell_area = cell_area#as_rectangle in
      (Cell_area_and__cell_area_context.Cell_area.event obj context widget event cell_area flags)

  method focus : Gtk_enums.directiontype -> bool =
    fun direction ->
      (Cell_area_and__cell_area_context.Cell_area.focus obj direction)

  method get_current_path_string : unit -> string =
    fun () ->
      (Cell_area_and__cell_area_context.Cell_area.get_current_path_string obj)

  method get_edit_widget : unit -> GCell_editable.cell_editable option =
    fun () ->
      Option.map (fun ret -> new GCell_editable.cell_editable ret) (Cell_area_and__cell_area_context.Cell_area.get_edit_widget obj)

  method get_edited_cell : unit -> GCell_renderer.cell_renderer option =
    fun () ->
      Option.map (fun ret -> new GCell_renderer.cell_renderer ret) (Cell_area_and__cell_area_context.Cell_area.get_edited_cell obj)

  method get_focus_cell : unit -> GCell_renderer.cell_renderer option =
    fun () ->
      Option.map (fun ret -> new GCell_renderer.cell_renderer ret) (Cell_area_and__cell_area_context.Cell_area.get_focus_cell obj)

  method get_focus_from_sibling : 'p1. (#GCell_renderer.cell_renderer as 'p1) -> GCell_renderer.cell_renderer option =
    fun renderer ->
      let renderer = renderer#as_cell_renderer in
      Option.map (fun ret -> new GCell_renderer.cell_renderer ret) (Cell_area_and__cell_area_context.Cell_area.get_focus_from_sibling obj renderer)

  method get_request_mode : unit -> Gtk_enums.sizerequestmode =
    fun () ->
      (Cell_area_and__cell_area_context.Cell_area.get_request_mode obj)

  method has_renderer : 'p1. (#GCell_renderer.cell_renderer as 'p1) -> bool =
    fun renderer ->
      let renderer = renderer#as_cell_renderer in
      (Cell_area_and__cell_area_context.Cell_area.has_renderer obj renderer)

  method is_activatable : unit -> bool =
    fun () ->
      (Cell_area_and__cell_area_context.Cell_area.is_activatable obj)

  method is_focus_sibling : 'p1 'p2. (#GCell_renderer.cell_renderer as 'p1) -> (#GCell_renderer.cell_renderer as 'p2) -> bool =
    fun renderer sibling ->
      let renderer = renderer#as_cell_renderer in
      let sibling = sibling#as_cell_renderer in
      (Cell_area_and__cell_area_context.Cell_area.is_focus_sibling obj renderer sibling)

  method remove : 'p1. (#GCell_renderer.cell_renderer as 'p1) -> unit =
    fun renderer ->
      let renderer = renderer#as_cell_renderer in
      (Cell_area_and__cell_area_context.Cell_area.remove obj renderer)

  method remove_focus_sibling : 'p1 'p2. (#GCell_renderer.cell_renderer as 'p1) -> (#GCell_renderer.cell_renderer as 'p2) -> unit =
    fun renderer sibling ->
      let renderer = renderer#as_cell_renderer in
      let sibling = sibling#as_cell_renderer in
      (Cell_area_and__cell_area_context.Cell_area.remove_focus_sibling obj renderer sibling)

  method set_focus_cell : 'p1. (#GCell_renderer.cell_renderer as 'p1) option -> unit =
    fun renderer ->
      let renderer = Option.map (fun (c) -> c#as_cell_renderer) renderer in
      (Cell_area_and__cell_area_context.Cell_area.set_focus_cell obj renderer)

  method snapshot : 'p1 'p2 'p3 'p4 'p5. (<as_cell_area_context: Cell_area_and__cell_area_context.Cell_area_context.t; ..> as 'p1) -> (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p2) -> (#GSnapshot.snapshot as 'p3) -> (#Ocgtk_gdk.Gdk.rectangle as 'p4) -> (#Ocgtk_gdk.Gdk.rectangle as 'p5) -> Gtk_enums.cellrendererstate -> bool -> unit =
    fun context widget snapshot background_area cell_area flags paint_focus ->
      let context = context#as_cell_area_context in
      let widget = widget#as_widget in
      let snapshot = snapshot#as_snapshot in
      let background_area = background_area#as_rectangle in
      let cell_area = cell_area#as_rectangle in
      (Cell_area_and__cell_area_context.Cell_area.snapshot obj context widget snapshot background_area cell_area flags paint_focus)

  method stop_editing : bool -> unit =
    fun canceled ->
      (Cell_area_and__cell_area_context.Cell_area.stop_editing obj canceled)

    method as_cell_area = obj
end

and cell_area_context (obj : Cell_area_and__cell_area_context.Cell_area_context.t) = object (self)

  method allocate : int -> int -> unit =
    fun width height ->
      (Cell_area_and__cell_area_context.Cell_area_context.allocate obj width height)

  method get_area : unit -> cell_area =
    fun () ->
      new  cell_area(Cell_area_and__cell_area_context.Cell_area_context.get_area obj)

  method push_preferred_height : int -> int -> unit =
    fun minimum_height natural_height ->
      (Cell_area_and__cell_area_context.Cell_area_context.push_preferred_height obj minimum_height natural_height)

  method push_preferred_width : int -> int -> unit =
    fun minimum_width natural_width ->
      (Cell_area_and__cell_area_context.Cell_area_context.push_preferred_width obj minimum_width natural_width)

  method reset : unit -> unit =
    fun () ->
      (Cell_area_and__cell_area_context.Cell_area_context.reset obj)

  method minimum_height = Cell_area_and__cell_area_context.Cell_area_context.get_minimum_height obj

  method minimum_width = Cell_area_and__cell_area_context.Cell_area_context.get_minimum_width obj

  method natural_height = Cell_area_and__cell_area_context.Cell_area_context.get_natural_height obj

  method natural_width = Cell_area_and__cell_area_context.Cell_area_context.get_natural_width obj

    method as_cell_area_context = obj
end
