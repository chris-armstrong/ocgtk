(** Animates the transition of its child from invisible to visible.

    Its methods, signals and properties are on {!class-type-revealer_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Revealer}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Revealer].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}

    Animates the transition of its child from invisible to visible.

    The style of transition can be controlled with
    [Gtk.Revealer.set_transition_type].

    These animations respect the [Gtk.Settings:gtk-enable-animations] setting.

    {b CSS nodes}

    [GtkRevealer] has a single CSS node with name revealer. When styling
    [GtkRevealer] using CSS, remember that it only hides its contents, not
    itself. That means applied margin, padding and borders will be visible even
    when the [Gtk.Revealer:reveal-child] property is set to [false].

    {b Accessibility}

    [GtkRevealer] uses the [Gtk.AccessibleRole.group] role.

    The child of [GtkRevealer], if set, is always available in the accessibility
    tree, regardless of the state of the revealer widget. *)
class type revealer_t = object
  inherit Widget.widget_t

  (** {2:methods Methods} *)

  method get_child : unit -> Widget.widget_t option
  (** Gets the child widget of [revealer]. *)

  method get_child_revealed : unit -> bool
  (** Returns whether the child is fully revealed.

      In other words, this returns whether the transition to the revealed state
      is completed. *)

  method get_reveal_child : unit -> bool
  (** Returns whether the child is currently revealed.

      This function returns [true] as soon as the transition is to the revealed
      state is started. To learn whether the child is fully revealed (ie the
      transition is completed), use [Gtk.Revealer.get_child_revealed]. *)

  method get_transition_duration : unit -> int
  (** Returns the amount of time (in milliseconds) that transitions will take.
  *)

  method get_transition_type : unit -> Enums.revealertransitiontype
  (** Gets the type of animation that will be used for transitions in
      [revealer]. *)

  method set_child : Widget.widget_t option -> unit
  (** Sets the child widget of [revealer]. *)

  method set_reveal_child : bool -> unit
  (** Tells the [GtkRevealer] to reveal or conceal its child.

      The transition will be animated with the current transition type of
      [revealer]. *)

  method set_transition_duration : int -> unit
  (** Sets the duration that transitions will take. *)

  method set_transition_type : Enums.revealertransitiontype -> unit
  (** Sets the type of animation that will be used for transitions in
      [revealer].

      Available types include various kinds of fades and slides. *)

  (** {2:conversions Conversions} *)

  method as_revealer : Raw.Revealer.t
end

class revealer : Raw.Revealer.t -> revealer_t
(** Wraps a raw handle of {!Ocgtk.Raw.Revealer.t}. *)

(** {1:description Description}

    Animates the transition of its child from invisible to visible.

    The style of transition can be controlled with
    [Gtk.Revealer.set_transition_type].

    These animations respect the [Gtk.Settings:gtk-enable-animations] setting.

    {b CSS nodes}

    [GtkRevealer] has a single CSS node with name revealer. When styling
    [GtkRevealer] using CSS, remember that it only hides its contents, not
    itself. That means applied margin, padding and borders will be visible even
    when the [Gtk.Revealer:reveal-child] property is set to [false].

    {b Accessibility}

    [GtkRevealer] uses the [Gtk.AccessibleRole.group] role.

    The child of [GtkRevealer], if set, is always available in the accessibility
    tree, regardless of the state of the revealer widget. *)

(** {1:constructors Constructors} *)

val new_ : unit -> revealer_t
(** Creates a new [GtkRevealer]. *)
