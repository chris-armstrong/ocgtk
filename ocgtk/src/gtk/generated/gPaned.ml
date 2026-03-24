(* Signal class defined in gpaned_signals.ml *)

class type paned_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Gpaned_signals.paned_signals
    method get_end_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_position : unit -> int
    method get_resize_end_child : unit -> bool
    method get_resize_start_child : unit -> bool
    method get_shrink_end_child : unit -> bool
    method get_shrink_start_child : unit -> bool
    method get_start_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_wide_handle : unit -> bool
    method set_end_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_position : int -> unit
    method set_resize_end_child : bool -> unit
    method set_resize_start_child : bool -> unit
    method set_shrink_end_child : bool -> unit
    method set_shrink_start_child : bool -> unit
    method set_start_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_wide_handle : bool -> unit
    method max_position : int
    method min_position : int
    method position_set : bool
    method set_position_set : bool -> unit
    method as_paned : Paned.t
end

(* High-level class for Paned *)
class paned (obj : Paned.t) : paned_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit Gpaned_signals.paned_signals obj

  method get_end_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Paned.get_end_child obj)

  method get_position : unit -> int =
    fun () ->
      (Paned.get_position obj)

  method get_resize_end_child : unit -> bool =
    fun () ->
      (Paned.get_resize_end_child obj)

  method get_resize_start_child : unit -> bool =
    fun () ->
      (Paned.get_resize_start_child obj)

  method get_shrink_end_child : unit -> bool =
    fun () ->
      (Paned.get_shrink_end_child obj)

  method get_shrink_start_child : unit -> bool =
    fun () ->
      (Paned.get_shrink_start_child obj)

  method get_start_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Paned.get_start_child obj)

  method get_wide_handle : unit -> bool =
    fun () ->
      (Paned.get_wide_handle obj)

  method set_end_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Paned.set_end_child obj child)

  method set_position : int -> unit =
    fun position ->
      (Paned.set_position obj position)

  method set_resize_end_child : bool -> unit =
    fun resize ->
      (Paned.set_resize_end_child obj resize)

  method set_resize_start_child : bool -> unit =
    fun resize ->
      (Paned.set_resize_start_child obj resize)

  method set_shrink_end_child : bool -> unit =
    fun resize ->
      (Paned.set_shrink_end_child obj resize)

  method set_shrink_start_child : bool -> unit =
    fun resize ->
      (Paned.set_shrink_start_child obj resize)

  method set_start_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Paned.set_start_child obj child)

  method set_wide_handle : bool -> unit =
    fun wide ->
      (Paned.set_wide_handle obj wide)

  method max_position = Paned.get_max_position obj

  method min_position = Paned.get_min_position obj

  method position_set = Paned.get_position_set obj
  method set_position_set v =  Paned.set_position_set obj v

    method as_paned = obj
end

let new_ (orientation : Gtk_enums.orientation) : paned_t =
  new paned (Paned.new_ orientation)

