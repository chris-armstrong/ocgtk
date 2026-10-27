(** Animates the transition of its child from invisible to visible.

    The style of transition can be controlled with
    [Gtk.Revealer.set_transition_type].

    These animations respect the [Gtk.Settings:gtk-enable-animations] setting.

    {b CSS nodes}

    [GtkRevealer] has a single CSS node with name revealer. When styling
    [GtkRevealer] using CSS, remember that it only hides its contents, not
    itself. That means applied margin, padding and borders will be visible even
    when the [Gtk.Revealer:reveal-child] property is set to [FALSE].

    {b Accessibility}

    [GtkRevealer] uses the [Gtk.AccessibleRole.group] role.

    The child of [GtkRevealer], if set, is always available in the accessibility
    tree, regardless of the state of the revealer widget.

    Its methods, signals and properties are on {!class-type-revealer_t}. The
    functions it is built on are in {!Ocgtk.Raw.Revealer}. *)

(** The methods, signals and properties of a [GtkRevealer]. *)
class type revealer_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_child_revealed : unit -> bool
  method get_reveal_child : unit -> bool
  method get_transition_duration : unit -> int
  method get_transition_type : unit -> Enums.revealertransitiontype

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_reveal_child : bool -> unit
  method set_transition_duration : int -> unit
  method set_transition_type : Enums.revealertransitiontype -> unit
  method as_revealer : Raw.Revealer.t
end

class revealer : Raw.Revealer.t -> revealer_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Revealer.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkRevealer], give one already wrapped. *)

val new_ : unit -> revealer_t
