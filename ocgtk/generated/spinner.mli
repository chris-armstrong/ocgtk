(** Displays an icon-size spinning animation.

    It is often used as an alternative to a [Gtk.ProgressBar] for displaying
    indefinite activity, instead of actual progress.

    An example GtkSpinner

    To start the animation, use [Gtk.Spinner.start], to stop it use
    [Gtk.Spinner.stop].

    {b CSS nodes}

    [GtkSpinner] has a single CSS node with the name spinner. When the animation
    is active, the :checked pseudoclass is added to this node.

    {b Accessibility}

    [GtkSpinner] uses the [Gtk.AccessibleRole.progress_bar] role.

    Its methods, signals and properties are on {!class-type-spinner_t}. The
    functions it is built on are in {!Ocgtk.Raw.Spinner}. *)

(** The methods, signals and properties of a [GtkSpinner]. *)
class type spinner_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_spinning : unit -> bool
  method set_spinning : bool -> unit
  method start : unit -> unit
  method stop : unit -> unit
  method as_spinner : Raw.Spinner.t
end

class spinner : Raw.Spinner.t -> spinner_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Spinner.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkSpinner], give one already wrapped. *)

val new_ : unit -> spinner_t
