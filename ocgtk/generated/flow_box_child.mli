(** The kind of widget that can be added to a [GtkFlowBox].

    Its methods, signals and properties are on {!class-type-flow_box_child_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Flow_box_child}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FlowBoxChild].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}

    The kind of widget that can be added to a [GtkFlowBox].

    [Gtk.FlowBox] will automatically wrap its children in a [GtkFlowBoxChild]
    when necessary. *)
class type flow_box_child_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  (** {2:signals Signals} *)

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user activates a child widget in a [GtkFlowBox].

      This can happen either by clicking or double-clicking, or via a
      keybinding.

      This is a keybinding signal, but it can be used by applications for their
      own purposes.

      The default bindings are <kbd>Space</kbd> and <kbd>Enter</kbd>. *)

  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_flow_box_child : Raw.Flow_box_child.t
end

class flow_box_child : Raw.Flow_box_child.t -> flow_box_child_t
(** Wraps a raw handle of {!Ocgtk.Raw.Flow_box_child.t}. *)

(** {1:description Description}

    The kind of widget that can be added to a [GtkFlowBox].

    [Gtk.FlowBox] will automatically wrap its children in a [GtkFlowBoxChild]
    when necessary. *)

(** {1:constructors Constructors} *)

val new_ : unit -> flow_box_child_t
(** Creates a new [GtkFlowBoxChild].

    This should only be used as a child of a [GtkFlowBox]. *)
