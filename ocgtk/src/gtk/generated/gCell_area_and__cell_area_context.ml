(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type cell_area_t = object
    inherit Gcell_area_signals.cell_area_signals
    method activate : cell_area_context_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> Ocgtk_gdk.Gdk.rectangle_t -> Gtk_enums.cellrendererstate -> bool -> bool
    method activate_cell : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GCell_renderer.cell_renderer_t -> Ocgtk_gdk.Gdk.event_t -> Ocgtk_gdk.Gdk.rectangle_t -> Gtk_enums.cellrendererstate -> bool
    method add : GCell_renderer.cell_renderer_t -> unit
    method add_focus_sibling : GCell_renderer.cell_renderer_t -> GCell_renderer.cell_renderer_t -> unit
    method attribute_connect : GCell_renderer.cell_renderer_t -> string -> int -> unit
    method attribute_disconnect : GCell_renderer.cell_renderer_t -> string -> unit
    method attribute_get_column : GCell_renderer.cell_renderer_t -> string -> int
    method copy_context : cell_area_context_t -> cell_area_context_t
    method create_context : unit -> cell_area_context_t
    method event : cell_area_context_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> Ocgtk_gdk.Gdk.event_t -> Ocgtk_gdk.Gdk.rectangle_t -> Gtk_enums.cellrendererstate -> int
    method focus : Gtk_enums.directiontype -> bool
    method get_current_path_string : unit -> string
    method get_edit_widget : unit -> GCell_editable.cell_editable_t option
    method get_edited_cell : unit -> GCell_renderer.cell_renderer_t option
    method get_focus_cell : unit -> GCell_renderer.cell_renderer_t option
    method get_focus_from_sibling : GCell_renderer.cell_renderer_t -> GCell_renderer.cell_renderer_t option
    method get_request_mode : unit -> Gtk_enums.sizerequestmode
    method has_renderer : GCell_renderer.cell_renderer_t -> bool
    method is_activatable : unit -> bool
    method is_focus_sibling : GCell_renderer.cell_renderer_t -> GCell_renderer.cell_renderer_t -> bool
    method remove : GCell_renderer.cell_renderer_t -> unit
    method remove_focus_sibling : GCell_renderer.cell_renderer_t -> GCell_renderer.cell_renderer_t -> unit
    method set_focus_cell : GCell_renderer.cell_renderer_t option -> unit
    method snapshot : cell_area_context_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GSnapshot.snapshot_t -> Ocgtk_gdk.Gdk.rectangle_t -> Ocgtk_gdk.Gdk.rectangle_t -> Gtk_enums.cellrendererstate -> bool -> unit
    method stop_editing : bool -> unit
    method as_cell_area : Cell_area_and__cell_area_context.Cell_area.t
end

and cell_area_context_t = object
    method allocate : int -> int -> unit
    method get_area : unit -> cell_area_t
    method push_preferred_height : int -> int -> unit
    method push_preferred_width : int -> int -> unit
    method reset : unit -> unit
    method minimum_height : int
    method minimum_width : int
    method natural_height : int
    method natural_width : int
    method as_cell_area_context : Cell_area_and__cell_area_context.Cell_area_context.t
end


(* Signal class defined in gcell_area_signals.ml *)

class cell_area (obj : Cell_area_and__cell_area_context.Cell_area.t) : cell_area_t = object (self)
  inherit Gcell_area_signals.cell_area_signals obj

  method activate : cell_area_context_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> Ocgtk_gdk.Gdk.rectangle_t -> Gtk_enums.cellrendererstate -> bool -> bool =
    fun context widget cell_area flags edit_only ->
      let context = context#as_cell_area_context in
      let widget = widget#as_widget in
      let cell_area = cell_area#as_rectangle in
      (Cell_area_and__cell_area_context.Cell_area.activate obj context widget cell_area flags edit_only)

  method activate_cell : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GCell_renderer.cell_renderer_t -> Ocgtk_gdk.Gdk.event_t -> Ocgtk_gdk.Gdk.rectangle_t -> Gtk_enums.cellrendererstate -> bool =
    fun widget renderer event cell_area flags ->
      let widget = widget#as_widget in
      let renderer = renderer#as_cell_renderer in
      let event = event#as_event in
      let cell_area = cell_area#as_rectangle in
      (Cell_area_and__cell_area_context.Cell_area.activate_cell obj widget renderer event cell_area flags)

  method add : GCell_renderer.cell_renderer_t -> unit =
    fun renderer ->
      let renderer = renderer#as_cell_renderer in
      (Cell_area_and__cell_area_context.Cell_area.add obj renderer)

  method add_focus_sibling : GCell_renderer.cell_renderer_t -> GCell_renderer.cell_renderer_t -> unit =
    fun renderer sibling ->
      let renderer = renderer#as_cell_renderer in
      let sibling = sibling#as_cell_renderer in
      (Cell_area_and__cell_area_context.Cell_area.add_focus_sibling obj renderer sibling)

  method attribute_connect : GCell_renderer.cell_renderer_t -> string -> int -> unit =
    fun renderer attribute column ->
      let renderer = renderer#as_cell_renderer in
      (Cell_area_and__cell_area_context.Cell_area.attribute_connect obj renderer attribute column)

  method attribute_disconnect : GCell_renderer.cell_renderer_t -> string -> unit =
    fun renderer attribute ->
      let renderer = renderer#as_cell_renderer in
      (Cell_area_and__cell_area_context.Cell_area.attribute_disconnect obj renderer attribute)

  method attribute_get_column : GCell_renderer.cell_renderer_t -> string -> int =
    fun renderer attribute ->
      let renderer = renderer#as_cell_renderer in
      (Cell_area_and__cell_area_context.Cell_area.attribute_get_column obj renderer attribute)

  method copy_context : cell_area_context_t -> cell_area_context_t =
    fun context ->
      let context = context#as_cell_area_context in
      new  cell_area_context(Cell_area_and__cell_area_context.Cell_area.copy_context obj context)

  method create_context : unit -> cell_area_context_t =
    fun () ->
      new  cell_area_context(Cell_area_and__cell_area_context.Cell_area.create_context obj)

  method event : cell_area_context_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> Ocgtk_gdk.Gdk.event_t -> Ocgtk_gdk.Gdk.rectangle_t -> Gtk_enums.cellrendererstate -> int =
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

  method get_edit_widget : unit -> GCell_editable.cell_editable_t option =
    fun () ->
      Option.map (fun ret -> new GCell_editable.cell_editable ret) (Cell_area_and__cell_area_context.Cell_area.get_edit_widget obj)

  method get_edited_cell : unit -> GCell_renderer.cell_renderer_t option =
    fun () ->
      Option.map (fun ret -> new GCell_renderer.cell_renderer ret) (Cell_area_and__cell_area_context.Cell_area.get_edited_cell obj)

  method get_focus_cell : unit -> GCell_renderer.cell_renderer_t option =
    fun () ->
      Option.map (fun ret -> new GCell_renderer.cell_renderer ret) (Cell_area_and__cell_area_context.Cell_area.get_focus_cell obj)

  method get_focus_from_sibling : GCell_renderer.cell_renderer_t -> GCell_renderer.cell_renderer_t option =
    fun renderer ->
      let renderer = renderer#as_cell_renderer in
      Option.map (fun ret -> new GCell_renderer.cell_renderer ret) (Cell_area_and__cell_area_context.Cell_area.get_focus_from_sibling obj renderer)

  method get_request_mode : unit -> Gtk_enums.sizerequestmode =
    fun () ->
      (Cell_area_and__cell_area_context.Cell_area.get_request_mode obj)

  method has_renderer : GCell_renderer.cell_renderer_t -> bool =
    fun renderer ->
      let renderer = renderer#as_cell_renderer in
      (Cell_area_and__cell_area_context.Cell_area.has_renderer obj renderer)

  method is_activatable : unit -> bool =
    fun () ->
      (Cell_area_and__cell_area_context.Cell_area.is_activatable obj)

  method is_focus_sibling : GCell_renderer.cell_renderer_t -> GCell_renderer.cell_renderer_t -> bool =
    fun renderer sibling ->
      let renderer = renderer#as_cell_renderer in
      let sibling = sibling#as_cell_renderer in
      (Cell_area_and__cell_area_context.Cell_area.is_focus_sibling obj renderer sibling)

  method remove : GCell_renderer.cell_renderer_t -> unit =
    fun renderer ->
      let renderer = renderer#as_cell_renderer in
      (Cell_area_and__cell_area_context.Cell_area.remove obj renderer)

  method remove_focus_sibling : GCell_renderer.cell_renderer_t -> GCell_renderer.cell_renderer_t -> unit =
    fun renderer sibling ->
      let renderer = renderer#as_cell_renderer in
      let sibling = sibling#as_cell_renderer in
      (Cell_area_and__cell_area_context.Cell_area.remove_focus_sibling obj renderer sibling)

  method set_focus_cell : GCell_renderer.cell_renderer_t option -> unit =
    fun renderer ->
      let renderer = Option.map (fun (c) -> c#as_cell_renderer) renderer in
      (Cell_area_and__cell_area_context.Cell_area.set_focus_cell obj renderer)

  method snapshot : cell_area_context_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GSnapshot.snapshot_t -> Ocgtk_gdk.Gdk.rectangle_t -> Ocgtk_gdk.Gdk.rectangle_t -> Gtk_enums.cellrendererstate -> bool -> unit =
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

and cell_area_context (obj : Cell_area_and__cell_area_context.Cell_area_context.t) : cell_area_context_t = object (self)

  method allocate : int -> int -> unit =
    fun width height ->
      (Cell_area_and__cell_area_context.Cell_area_context.allocate obj width height)

  method get_area : unit -> cell_area_t =
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
