
class type cell_area_t = object
    inherit Gcell_area_signals.cell_area_signals
    method activate : cell_area_context_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> Ocgtk_gdk.Gdk.Rectangle.rectangle_t -> Gtk_enums.cellrendererstate -> bool -> bool
    method activate_cell : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GCell_renderer.cell_renderer_t -> Ocgtk_gdk.Gdk.Event.event_t -> Ocgtk_gdk.Gdk.Rectangle.rectangle_t -> Gtk_enums.cellrendererstate -> bool
    method add : GCell_renderer.cell_renderer_t -> unit
    method add_focus_sibling : GCell_renderer.cell_renderer_t -> GCell_renderer.cell_renderer_t -> unit
    method attribute_connect : GCell_renderer.cell_renderer_t -> string -> int -> unit
    method attribute_disconnect : GCell_renderer.cell_renderer_t -> string -> unit
    method attribute_get_column : GCell_renderer.cell_renderer_t -> string -> int
    method copy_context : cell_area_context_t -> cell_area_context_t
    method create_context : unit -> cell_area_context_t
    method event : cell_area_context_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> Ocgtk_gdk.Gdk.Event.event_t -> Ocgtk_gdk.Gdk.Rectangle.rectangle_t -> Gtk_enums.cellrendererstate -> int
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
    method snapshot : cell_area_context_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GSnapshot.snapshot_t -> Ocgtk_gdk.Gdk.Rectangle.rectangle_t -> Ocgtk_gdk.Gdk.Rectangle.rectangle_t -> Gtk_enums.cellrendererstate -> bool -> unit
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


class cell_area : Cell_area_and__cell_area_context.Cell_area.t -> cell_area_t

and cell_area_context : Cell_area_and__cell_area_context.Cell_area_context.t -> cell_area_context_t
