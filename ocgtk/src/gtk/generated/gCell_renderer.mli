class type cell_renderer_t = object
    inherit Gcell_renderer_signals.cell_renderer_signals
    method activate : Ocgtk_gdk.Gdk.event_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> string -> Ocgtk_gdk.Gdk.rectangle_t -> Ocgtk_gdk.Gdk.rectangle_t -> Gtk_enums.cellrendererstate -> bool
    method get_is_expanded : unit -> bool
    method get_is_expander : unit -> bool
    method get_request_mode : unit -> Gtk_enums.sizerequestmode
    method get_sensitive : unit -> bool
    method get_state : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> Gtk_enums.cellrendererstate -> Gtk_enums.stateflags
    method get_visible : unit -> bool
    method is_activatable : unit -> bool
    method set_alignment : float -> float -> unit
    method set_fixed_size : int -> int -> unit
    method set_is_expanded : bool -> unit
    method set_is_expander : bool -> unit
    method set_padding : int -> int -> unit
    method set_sensitive : bool -> unit
    method set_visible : bool -> unit
    method snapshot : GSnapshot.snapshot_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> Ocgtk_gdk.Gdk.rectangle_t -> Ocgtk_gdk.Gdk.rectangle_t -> Gtk_enums.cellrendererstate -> unit
    method start_editing : Ocgtk_gdk.Gdk.event_t option -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> string -> Ocgtk_gdk.Gdk.rectangle_t -> Ocgtk_gdk.Gdk.rectangle_t -> Gtk_enums.cellrendererstate -> GCell_editable.cell_editable_t option
    method stop_editing : bool -> unit
    method cell_background : string
    method set_cell_background : string -> unit
    method cell_background_rgba : Ocgtk_gdk.Gdk.rgb_a_t
    method set_cell_background_rgba : Ocgtk_gdk.Gdk.rgb_a_t -> unit
    method cell_background_set : bool
    method set_cell_background_set : bool -> unit
    method editing : bool
    method height : int
    method set_height : int -> unit
    method mode : Gtk_enums.cellrenderermode
    method set_mode : Gtk_enums.cellrenderermode -> unit
    method width : int
    method set_width : int -> unit
    method xalign : float
    method set_xalign : float -> unit
    method xpad : int
    method set_xpad : int -> unit
    method yalign : float
    method set_yalign : float -> unit
    method ypad : int
    method set_ypad : int -> unit
    method as_cell_renderer : Cell_renderer.t
end

class cell_renderer : Cell_renderer.t -> cell_renderer_t

