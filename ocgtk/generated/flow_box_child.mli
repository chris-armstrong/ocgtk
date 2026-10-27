(** The kind of widget that can be added to a [GtkFlowBox].

    [Gtk.FlowBox] will automatically wrap its children in a [GtkFlowBoxChild]
    when necessary.

    Its methods, signals and properties are on {!class-type-flow_box_child_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Flow_box_child}. *)

(** The methods, signals and properties of a [GtkFlowBoxChild]. *)
class type flow_box_child_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method changed : unit -> unit
  (** Marks [child] as changed, causing any state that depends on this to be
      updated.

      This affects sorting and filtering.

      Note that calls to this method must be in sync with the data used for the
      sorting and filtering functions. For instance, if the list is mirroring
      some external data set, and {i two} children changed in the external data
      set when you call gtk_flow_box_child_changed() on the first child, the
      sort function must only read the new data for the first of the two changed
      children, otherwise the resorting of the children will be wrong.

      This generally means that if you don’t fully control the data model, you
      have to duplicate the data that affects the sorting and filtering
      functions into the widgets themselves.

      Another alternative is to call [Gtk.FlowBox.invalidate_sort] on any model
      change, but that is more expensive. *)

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the child widget of [self]. *)

  method get_index : unit -> int
  (** Gets the current index of the [child] in its [GtkFlowBox] container. *)

  method is_selected : unit -> bool
  (** Returns whether the [child] is currently selected in its [GtkFlowBox]
      container. *)

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the child widget of [self]. *)

  method as_flow_box_child : Raw.Flow_box_child.t
end

class flow_box_child : Raw.Flow_box_child.t -> flow_box_child_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Flow_box_child.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkFlowBoxChild], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : unit -> flow_box_child_t
(** Creates a new [GtkFlowBoxChild].

    This should only be used as a child of a [GtkFlowBox]. *)
