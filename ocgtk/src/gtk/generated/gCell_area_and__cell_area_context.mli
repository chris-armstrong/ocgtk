
class cell_area : Cell_area_and__cell_area_context.Cell_area.t ->
  object
    inherit Gcell_area_signals.cell_area_signals
    method add : #GCell_renderer.cell_renderer -> unit
    method add_focus_sibling : #GCell_renderer.cell_renderer -> #GCell_renderer.cell_renderer -> unit
    method attribute_connect : #GCell_renderer.cell_renderer -> string -> int -> unit
    method attribute_disconnect : #GCell_renderer.cell_renderer -> string -> unit
    method attribute_get_column : #GCell_renderer.cell_renderer -> string -> int
    method copy_context : <as_cell_area_context: Cell_area_and__cell_area_context.Cell_area_context.t; ..> -> cell_area_context
    method create_context : unit -> cell_area_context
    method focus : Gtk_enums.directiontype -> bool
    method get_current_path_string : unit -> string
    method get_edit_widget : unit -> GCell_editable.cell_editable option
    method get_edited_cell : unit -> GCell_renderer.cell_renderer option
    method get_focus_cell : unit -> GCell_renderer.cell_renderer option
    method get_focus_from_sibling : #GCell_renderer.cell_renderer -> GCell_renderer.cell_renderer option
    method get_request_mode : unit -> Gtk_enums.sizerequestmode
    method has_renderer : #GCell_renderer.cell_renderer -> bool
    method is_activatable : unit -> bool
    method is_focus_sibling : #GCell_renderer.cell_renderer -> #GCell_renderer.cell_renderer -> bool
    method remove : #GCell_renderer.cell_renderer -> unit
    method remove_focus_sibling : #GCell_renderer.cell_renderer -> #GCell_renderer.cell_renderer -> unit
    method set_focus_cell : #GCell_renderer.cell_renderer option -> unit
    method stop_editing : bool -> unit
    method as_cell_area : Cell_area_and__cell_area_context.Cell_area.t
  end

and cell_area_context : Cell_area_and__cell_area_context.Cell_area_context.t ->
  object
    method allocate : int -> int -> unit
    method get_area : unit -> cell_area
    method push_preferred_height : int -> int -> unit
    method push_preferred_width : int -> int -> unit
    method reset : unit -> unit
    method minimum_height : int
    method minimum_width : int
    method natural_height : int
    method natural_width : int
    method as_cell_area_context : Cell_area_and__cell_area_context.Cell_area_context.t
  end
