(* Signal class defined in gscrolled_window_signals.ml *)

class type scrolled_window_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Gscrolled_window_signals.scrolled_window_signals
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_hadjustment : unit -> GAdjustment.adjustment_t
    method get_has_frame : unit -> bool
    method get_hscrollbar : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method get_kinetic_scrolling : unit -> bool
    method get_max_content_height : unit -> int
    method get_max_content_width : unit -> int
    method get_min_content_height : unit -> int
    method get_min_content_width : unit -> int
    method get_overlay_scrolling : unit -> bool
    method get_placement : unit -> Gtk_enums.cornertype
    method get_propagate_natural_height : unit -> bool
    method get_propagate_natural_width : unit -> bool
    method get_vadjustment : unit -> GAdjustment.adjustment_t
    method get_vscrollbar : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_hadjustment : GAdjustment.adjustment_t option -> unit
    method set_has_frame : bool -> unit
    method set_kinetic_scrolling : bool -> unit
    method set_max_content_height : int -> unit
    method set_max_content_width : int -> unit
    method set_min_content_height : int -> unit
    method set_min_content_width : int -> unit
    method set_overlay_scrolling : bool -> unit
    method set_placement : Gtk_enums.cornertype -> unit
    method set_policy : Gtk_enums.policytype -> Gtk_enums.policytype -> unit
    method set_propagate_natural_height : bool -> unit
    method set_propagate_natural_width : bool -> unit
    method set_vadjustment : GAdjustment.adjustment_t option -> unit
    method unset_placement : unit -> unit
    method hscrollbar_policy : Gtk_enums.policytype
    method set_hscrollbar_policy : Gtk_enums.policytype -> unit
    method vscrollbar_policy : Gtk_enums.policytype
    method set_vscrollbar_policy : Gtk_enums.policytype -> unit
    method window_placement : Gtk_enums.cornertype
    method set_window_placement : Gtk_enums.cornertype -> unit
    method as_scrolled_window : Scrolled_window.t
end

(* High-level class for ScrolledWindow *)
class scrolled_window (obj : Scrolled_window.t) : scrolled_window_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit Gscrolled_window_signals.scrolled_window_signals obj

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Scrolled_window.get_child obj)

  method get_hadjustment : unit -> GAdjustment.adjustment_t =
    fun () ->
      new  GAdjustment.adjustment(Scrolled_window.get_hadjustment obj)

  method get_has_frame : unit -> bool =
    fun () ->
      (Scrolled_window.get_has_frame obj)

  method get_hscrollbar : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t =
    fun () ->
      new  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget(Scrolled_window.get_hscrollbar obj)

  method get_kinetic_scrolling : unit -> bool =
    fun () ->
      (Scrolled_window.get_kinetic_scrolling obj)

  method get_max_content_height : unit -> int =
    fun () ->
      (Scrolled_window.get_max_content_height obj)

  method get_max_content_width : unit -> int =
    fun () ->
      (Scrolled_window.get_max_content_width obj)

  method get_min_content_height : unit -> int =
    fun () ->
      (Scrolled_window.get_min_content_height obj)

  method get_min_content_width : unit -> int =
    fun () ->
      (Scrolled_window.get_min_content_width obj)

  method get_overlay_scrolling : unit -> bool =
    fun () ->
      (Scrolled_window.get_overlay_scrolling obj)

  method get_placement : unit -> Gtk_enums.cornertype =
    fun () ->
      (Scrolled_window.get_placement obj)

  method get_propagate_natural_height : unit -> bool =
    fun () ->
      (Scrolled_window.get_propagate_natural_height obj)

  method get_propagate_natural_width : unit -> bool =
    fun () ->
      (Scrolled_window.get_propagate_natural_width obj)

  method get_vadjustment : unit -> GAdjustment.adjustment_t =
    fun () ->
      new  GAdjustment.adjustment(Scrolled_window.get_vadjustment obj)

  method get_vscrollbar : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t =
    fun () ->
      new  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget(Scrolled_window.get_vscrollbar obj)

  method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Scrolled_window.set_child obj child)

  method set_hadjustment : GAdjustment.adjustment_t option -> unit =
    fun hadjustment ->
      let hadjustment = Option.map (fun (c) -> c#as_adjustment) hadjustment in
      (Scrolled_window.set_hadjustment obj hadjustment)

  method set_has_frame : bool -> unit =
    fun has_frame ->
      (Scrolled_window.set_has_frame obj has_frame)

  method set_kinetic_scrolling : bool -> unit =
    fun kinetic_scrolling ->
      (Scrolled_window.set_kinetic_scrolling obj kinetic_scrolling)

  method set_max_content_height : int -> unit =
    fun height ->
      (Scrolled_window.set_max_content_height obj height)

  method set_max_content_width : int -> unit =
    fun width ->
      (Scrolled_window.set_max_content_width obj width)

  method set_min_content_height : int -> unit =
    fun height ->
      (Scrolled_window.set_min_content_height obj height)

  method set_min_content_width : int -> unit =
    fun width ->
      (Scrolled_window.set_min_content_width obj width)

  method set_overlay_scrolling : bool -> unit =
    fun overlay_scrolling ->
      (Scrolled_window.set_overlay_scrolling obj overlay_scrolling)

  method set_placement : Gtk_enums.cornertype -> unit =
    fun window_placement ->
      (Scrolled_window.set_placement obj window_placement)

  method set_policy : Gtk_enums.policytype -> Gtk_enums.policytype -> unit =
    fun hscrollbar_policy vscrollbar_policy ->
      (Scrolled_window.set_policy obj hscrollbar_policy vscrollbar_policy)

  method set_propagate_natural_height : bool -> unit =
    fun propagate ->
      (Scrolled_window.set_propagate_natural_height obj propagate)

  method set_propagate_natural_width : bool -> unit =
    fun propagate ->
      (Scrolled_window.set_propagate_natural_width obj propagate)

  method set_vadjustment : GAdjustment.adjustment_t option -> unit =
    fun vadjustment ->
      let vadjustment = Option.map (fun (c) -> c#as_adjustment) vadjustment in
      (Scrolled_window.set_vadjustment obj vadjustment)

  method unset_placement : unit -> unit =
    fun () ->
      (Scrolled_window.unset_placement obj)

  method hscrollbar_policy = Scrolled_window.get_hscrollbar_policy obj
  method set_hscrollbar_policy v =  Scrolled_window.set_hscrollbar_policy obj v

  method vscrollbar_policy = Scrolled_window.get_vscrollbar_policy obj
  method set_vscrollbar_policy v =  Scrolled_window.set_vscrollbar_policy obj v

  method window_placement = Scrolled_window.get_window_placement obj
  method set_window_placement v =  Scrolled_window.set_window_placement obj v

    method as_scrolled_window = obj
end

