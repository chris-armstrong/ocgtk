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

    Its methods, signals and properties are on {!class-type-spinner_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Spinner}. *)

(** {b The methods, signals and properties of a [Spinner].}

    Displays an icon-size spinning animation.

    It is often used as an alternative to a [Gtk.ProgressBar] for displaying
    indefinite activity, instead of actual progress.

    An example GtkSpinner

    To start the animation, use [Gtk.Spinner.start], to stop it use
    [Gtk.Spinner.stop].

    {b CSS nodes}

    [GtkSpinner] has a single CSS node with the name spinner. When the animation
    is active, the :checked pseudoclass is added to this node.

    {b Accessibility}

    [GtkSpinner] uses the [Gtk.AccessibleRole.progress_bar] role. *)
class type spinner_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_spinning : unit -> bool
  (** Returns whether the spinner is spinning. *)

  method set_spinning : bool -> unit
  (** Sets the activity of the spinner. *)

  method start : unit -> unit
  (** Starts the animation of the spinner. *)

  method stop : unit -> unit
  (** Stops the animation of the spinner. *)

  method as_spinner : Raw.Spinner.t
end

class spinner : Raw.Spinner.t -> spinner_t
(** Wraps a raw handle of {!Ocgtk.Raw.Spinner.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> spinner_t
(** Returns a new spinner widget. Not yet started. *)
