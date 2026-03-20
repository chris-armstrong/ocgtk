(* Signal class defined in gcell_renderer_signals.ml *)

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

(* High-level class for CellRenderer *)
class cell_renderer (obj : Cell_renderer.t) : cell_renderer_t = object (self)
  inherit Gcell_renderer_signals.cell_renderer_signals obj

  method activate : Ocgtk_gdk.Gdk.event_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> string -> Ocgtk_gdk.Gdk.rectangle_t -> Ocgtk_gdk.Gdk.rectangle_t -> Gtk_enums.cellrendererstate -> bool =
    fun event widget path background_area cell_area flags ->
      let event = event#as_event in
      let widget = widget#as_widget in
      let background_area = background_area#as_rectangle in
      let cell_area = cell_area#as_rectangle in
      (Cell_renderer.activate obj event widget path background_area cell_area flags)

  method get_is_expanded : unit -> bool =
    fun () ->
      (Cell_renderer.get_is_expanded obj)

  method get_is_expander : unit -> bool =
    fun () ->
      (Cell_renderer.get_is_expander obj)

  method get_request_mode : unit -> Gtk_enums.sizerequestmode =
    fun () ->
      (Cell_renderer.get_request_mode obj)

  method get_sensitive : unit -> bool =
    fun () ->
      (Cell_renderer.get_sensitive obj)

  method get_state : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> Gtk_enums.cellrendererstate -> Gtk_enums.stateflags =
    fun widget cell_state ->
      let widget = Option.map (fun (c) -> c#as_widget) widget in
      (Cell_renderer.get_state obj widget cell_state)

  method get_visible : unit -> bool =
    fun () ->
      (Cell_renderer.get_visible obj)

  method is_activatable : unit -> bool =
    fun () ->
      (Cell_renderer.is_activatable obj)

  method set_alignment : float -> float -> unit =
    fun xalign yalign ->
      (Cell_renderer.set_alignment obj xalign yalign)

  method set_fixed_size : int -> int -> unit =
    fun width height ->
      (Cell_renderer.set_fixed_size obj width height)

  method set_is_expanded : bool -> unit =
    fun is_expanded ->
      (Cell_renderer.set_is_expanded obj is_expanded)

  method set_is_expander : bool -> unit =
    fun is_expander ->
      (Cell_renderer.set_is_expander obj is_expander)

  method set_padding : int -> int -> unit =
    fun xpad ypad ->
      (Cell_renderer.set_padding obj xpad ypad)

  method set_sensitive : bool -> unit =
    fun sensitive ->
      (Cell_renderer.set_sensitive obj sensitive)

  method set_visible : bool -> unit =
    fun visible ->
      (Cell_renderer.set_visible obj visible)

  method snapshot : GSnapshot.snapshot_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> Ocgtk_gdk.Gdk.rectangle_t -> Ocgtk_gdk.Gdk.rectangle_t -> Gtk_enums.cellrendererstate -> unit =
    fun snapshot widget background_area cell_area flags ->
      let snapshot = snapshot#as_snapshot in
      let widget = widget#as_widget in
      let background_area = background_area#as_rectangle in
      let cell_area = cell_area#as_rectangle in
      (Cell_renderer.snapshot obj snapshot widget background_area cell_area flags)

  method start_editing : Ocgtk_gdk.Gdk.event_t option -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> string -> Ocgtk_gdk.Gdk.rectangle_t -> Ocgtk_gdk.Gdk.rectangle_t -> Gtk_enums.cellrendererstate -> GCell_editable.cell_editable_t option =
    fun event widget path background_area cell_area flags ->
      let event = Option.map (fun (c) -> c#as_event) event in
      let widget = widget#as_widget in
      let background_area = background_area#as_rectangle in
      let cell_area = cell_area#as_rectangle in
      Option.map (fun ret -> new GCell_editable.cell_editable ret) (Cell_renderer.start_editing obj event widget path background_area cell_area flags)

  method stop_editing : bool -> unit =
    fun canceled ->
      (Cell_renderer.stop_editing obj canceled)

  method cell_background = Cell_renderer.get_cell_background obj
  method set_cell_background v =  Cell_renderer.set_cell_background obj v

  method cell_background_rgba = new Ocgtk_gdk.Gdk.rgb_a (Cell_renderer.get_cell_background_rgba obj)
  method set_cell_background_rgba : Ocgtk_gdk.Gdk.rgb_a_t -> unit  = fun v ->  Cell_renderer.set_cell_background_rgba obj v#as_rgb_a

  method cell_background_set = Cell_renderer.get_cell_background_set obj
  method set_cell_background_set v =  Cell_renderer.set_cell_background_set obj v

  method editing = Cell_renderer.get_editing obj

  method height = Cell_renderer.get_height obj
  method set_height v =  Cell_renderer.set_height obj v

  method mode = Cell_renderer.get_mode obj
  method set_mode v =  Cell_renderer.set_mode obj v

  method width = Cell_renderer.get_width obj
  method set_width v =  Cell_renderer.set_width obj v

  method xalign = Cell_renderer.get_xalign obj
  method set_xalign v =  Cell_renderer.set_xalign obj v

  method xpad = Cell_renderer.get_xpad obj
  method set_xpad v =  Cell_renderer.set_xpad obj v

  method yalign = Cell_renderer.get_yalign obj
  method set_yalign v =  Cell_renderer.set_yalign obj v

  method ypad = Cell_renderer.get_ypad obj
  method set_ypad v =  Cell_renderer.set_ypad obj v

    method as_cell_renderer = obj
end

