(** Manages up to three children.

    The start widget is allocated at the start of the layout (left in
    left-to-right locales and right in right-to-left ones), and the end widget
    at the end.

    The center widget is centered regarding the full width of the layout's.

    Its methods, signals and properties are on {!class-type-center_layout_t}.
    The functions it is built on are in {!Ocgtk.Raw.Center_layout}. *)

(** The methods, signals and properties of a [GtkCenterLayout]. *)
class type center_layout_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .layout_manager_t

  method get_baseline_position : unit -> Enums.baselineposition

  method get_center_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_end_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_orientation : unit -> Enums.orientation
  method get_shrink_center_last : unit -> bool

  method get_start_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method set_baseline_position : Enums.baselineposition -> unit

  method set_center_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_end_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_orientation : Enums.orientation -> unit
  method set_shrink_center_last : bool -> unit

  method set_start_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method as_center_layout : Raw.Center_layout.t
end

class center_layout : Raw.Center_layout.t -> center_layout_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Center_layout.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkCenterLayout], give one already wrapped. *)

val new_ : unit -> center_layout_t
