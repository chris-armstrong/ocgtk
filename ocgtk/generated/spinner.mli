(** Displays an icon-size spinning animation.

    Its methods, signals and properties are on {!class-type-spinner_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Spinner}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Spinner].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}

    Displays an icon-size spinning animation.

    It is often used as an alternative to a
    {{!Ocgtk.Progress_bar.class-type-progress_bar_t}[Gtk.ProgressBar]} for
    displaying indefinite activity, instead of actual progress.

    An example GtkSpinner

    To start the animation, use [Gtk.Spinner.start], to stop it use
    [Gtk.Spinner.stop].

    {b CSS nodes}

    [GtkSpinner] has a single CSS node with the name spinner. When the animation
    is active, the :checked pseudoclass is added to this node.

    {b Accessibility}

    [GtkSpinner] uses the [Gtk.AccessibleRole.progress_bar] role. *)
class type spinner_t = object
  inherit Widget.widget_t

  (** {2:methods Methods} *)

  method get_spinning : unit -> bool
  (** Returns whether the spinner is spinning. *)

  method set_spinning : bool -> unit
  (** Sets the activity of the spinner. *)

  method start : unit -> unit
  (** Starts the animation of the spinner. *)

  method stop : unit -> unit
  (** Stops the animation of the spinner. *)

  (** {2:conversions Conversions} *)

  method as_spinner : Raw.Spinner.t
end

class spinner : Raw.Spinner.t -> spinner_t
(** Wraps a raw handle of {!Ocgtk.Raw.Spinner.t}. *)

(** {1:description Description}

    Displays an icon-size spinning animation.

    It is often used as an alternative to a
    {{!Ocgtk.Progress_bar.class-type-progress_bar_t}[Gtk.ProgressBar]} for
    displaying indefinite activity, instead of actual progress.

    An example GtkSpinner

    To start the animation, use [Gtk.Spinner.start], to stop it use
    [Gtk.Spinner.stop].

    {b CSS nodes}

    [GtkSpinner] has a single CSS node with the name spinner. When the animation
    is active, the :checked pseudoclass is added to this node.

    {b Accessibility}

    [GtkSpinner] uses the [Gtk.AccessibleRole.progress_bar] role. *)

(** {1:constructors Constructors} *)

val new_ : unit -> spinner_t
(** Returns a new spinner widget. Not yet started. *)
