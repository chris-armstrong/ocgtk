(* GENERATED CODE - DO NOT EDIT *)
(* Spinner: Spinner *)

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

    [GtkSpinner] uses the [Gtk.AccessibleRole.progress_bar] role. *)

type t = [ `spinner | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_spinner_new"
(** Create a new Spinner *)

(* Methods *)

external stop : t -> unit = "ml_gtk_spinner_stop"
(** Stops the animation of the spinner. *)

external start : t -> unit = "ml_gtk_spinner_start"
(** Starts the animation of the spinner. *)

external set_spinning : t -> bool -> unit = "ml_gtk_spinner_set_spinning"
(** Sets the activity of the spinner. *)

external get_spinning : t -> bool = "ml_gtk_spinner_get_spinning"
(** Returns whether the spinner is spinning. *)

(* Properties *)
