(** Presents contextual actions.

    Its methods, signals and properties are on {!class-type-action_bar_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Action_bar}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ActionBar].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}

    Presents contextual actions.

    An example GtkActionBar

    [GtkActionBar] is expected to be displayed below the content and expand
    horizontally to fill the area.

    It allows placing children at the start or the end. In addition, it contains
    an internal centered box which is centered with respect to the full width of
    the box, even if the children at either side take up different amounts of
    space.

    {b GtkActionBar as GtkBuildable}

    The [GtkActionBar] implementation of the [GtkBuildable] interface supports
    adding children at the start or end sides by specifying “start” or “end” as
    the “type” attribute of a [<child>] element, or setting the center widget by
    specifying “center” value.

    {b CSS nodes}

    {[
    actionbar
    ╰── revealer
        ╰── box
            ├── box.start
            │   ╰── [start children]
            ├── [center widget]
            ╰── box.end
                ╰── [end children]
    ]}

    A [GtkActionBar]'s CSS node is called [actionbar]. It contains a [revealer]
    subnode, which contains a [box] subnode, which contains two [box] subnodes
    at the start and end of the action bar, with [start] and [end] style classes
    respectively, as well as a center node that represents the center child.

    Each of the boxes contains children packed for that side. *)
class type action_bar_t = object
  inherit Widget.widget_t

  (** {2:methods Methods} *)

  method get_center_widget : unit -> Widget.widget_t option
  (** Retrieves the center bar widget of the bar. *)

  method get_revealed : unit -> bool
  (** Gets whether the contents of the action bar are revealed. *)

  method pack_end : Widget.widget_t -> unit
  (** Adds a child to the action bar, packed with reference to the end of the
      action bar. *)

  method pack_start : Widget.widget_t -> unit
  (** Adds a child to the action, packed with reference to the start of the
      action bar. *)

  method remove : Widget.widget_t -> unit
  (** Removes a child from the action bar. *)

  method set_center_widget : Widget.widget_t option -> unit
  (** Sets the center widget for the action bar. *)

  method set_revealed : bool -> unit
  (** Reveals or conceals the content of the action bar.

      Note: this does not show or hide the action bar in the
      [Gtk.Widget:visible] sense, so revealing has no effect if the action bar
      is hidden. *)

  (** {2:conversions Conversions} *)

  method as_action_bar : Raw.Action_bar.t
end

class action_bar : Raw.Action_bar.t -> action_bar_t
(** Wraps a raw handle of {!Ocgtk.Raw.Action_bar.t}. *)

(** {1:description Description}

    Presents contextual actions.

    An example GtkActionBar

    [GtkActionBar] is expected to be displayed below the content and expand
    horizontally to fill the area.

    It allows placing children at the start or the end. In addition, it contains
    an internal centered box which is centered with respect to the full width of
    the box, even if the children at either side take up different amounts of
    space.

    {b GtkActionBar as GtkBuildable}

    The [GtkActionBar] implementation of the [GtkBuildable] interface supports
    adding children at the start or end sides by specifying “start” or “end” as
    the “type” attribute of a [<child>] element, or setting the center widget by
    specifying “center” value.

    {b CSS nodes}

    {[
    actionbar
    ╰── revealer
        ╰── box
            ├── box.start
            │   ╰── [start children]
            ├── [center widget]
            ╰── box.end
                ╰── [end children]
    ]}

    A [GtkActionBar]'s CSS node is called [actionbar]. It contains a [revealer]
    subnode, which contains a [box] subnode, which contains two [box] subnodes
    at the start and end of the action bar, with [start] and [end] style classes
    respectively, as well as a center node that represents the center child.

    Each of the boxes contains children packed for that side. *)

(** {1:constructors Constructors} *)

val new_ : unit -> action_bar_t
(** Creates a new action bar widget. *)
