(** Arranges three children in a row, keeping the middle child centered as well
    as possible.

    An example GtkCenterBox

    To add children to [GtkCenterBox], use [Gtk.CenterBox.set_start_widget],
    [Gtk.CenterBox.set_center_widget] and [Gtk.CenterBox.set_end_widget].

    The sizing and positioning of children can be influenced with the align and
    expand properties of the children.

    {b GtkCenterBox as GtkBuildable}

    The [GtkCenterBox] implementation of the [GtkBuildable] interface supports
    placing children in the 3 positions by specifying “start”, “center” or “end”
    as the “type” attribute of a [<child>] element.

    {b CSS nodes}

    [GtkCenterBox] uses a single CSS node with the name “box”,

    The first child of the [GtkCenterBox] will be allocated depending on the
    text direction, i.e. in left-to-right layouts it will be allocated on the
    left and in right-to-left layouts on the right.

    In vertical orientation, the nodes of the children are arranged from top to
    bottom.

    {b Accessibility}

    Until GTK 4.10, [GtkCenterBox] used the [Gtk.AccessibleRole.group] role.

    Starting from GTK 4.12, [GtkCenterBox] uses the [Gtk.AccessibleRole.generic]
    role.

    Its methods, signals and properties are on {!class-type-center_box_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Center_box}. *)

(** The methods, signals and properties of a [GtkCenterBox]. *)
class type center_box_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Orientable.orientable_t

  method get_baseline_position : unit -> Enums.baselineposition
  (** Gets the baseline position of the center box.

      See [Gtk.CenterBox.set_baseline_position]. *)

  method get_center_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the center widget. *)

  method get_end_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the end widget. *)

  method get_shrink_center_last : unit -> bool
  (** Gets whether the center widget shrinks after other children. *)

  method get_start_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the start widget. *)

  method set_baseline_position : Enums.baselineposition -> unit
  (** Sets the baseline position of a center box.

      This affects only horizontal boxes with at least one baseline aligned
      child. If there is more vertical space available than requested, and the
      baseline is not allocated by the parent then [position] is used to
      allocate the baseline with respect to the extra space available. *)

  method set_center_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the center widget.

      To remove the existing center widget, pass [NULL]. *)

  method set_end_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the end widget.

      To remove the existing end widget, pass [NULL]. *)

  method set_shrink_center_last : bool -> unit
  (** Sets whether to shrink the center widget after other children.

      By default, when there's no space to give all three children their natural
      widths, the start and end widgets start shrinking and the center child
      keeps natural width until they reach minimum width.

      If [shrink_center_last] is false, start and end widgets keep natural width
      and the center widget starts shrinking instead. *)

  method set_start_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the start widget.

      To remove the existing start widget, pass [NULL]. *)

  method as_center_box : Raw.Center_box.t
end

class center_box : Raw.Center_box.t -> center_box_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Center_box.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkCenterBox], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : unit -> center_box_t
(** Creates a new [GtkCenterBox]. *)
