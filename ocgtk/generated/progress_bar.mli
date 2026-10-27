(** Displays the progress of a long-running operation.

    [GtkProgressBar] provides a visual clue that processing is underway. It can
    be used in two different modes: percentage mode and activity mode.

    An example GtkProgressBar

    When an application can determine how much work needs to take place (e.g.
    read a fixed number of bytes from a file) and can monitor its progress, it
    can use the [GtkProgressBar] in percentage mode and the user sees a growing
    bar indicating the percentage of the work that has been completed. In this
    mode, the application is required to call [Gtk.ProgressBar.set_fraction]
    periodically to update the progress bar.

    When an application has no accurate way of knowing the amount of work to do,
    it can use the [GtkProgressBar] in activity mode, which shows activity by a
    block moving back and forth within the progress area. In this mode, the
    application is required to call [Gtk.ProgressBar.pulse] periodically to
    update the progress bar.

    There is quite a bit of flexibility provided to control the appearance of
    the [GtkProgressBar]. Functions are provided to control the orientation of
    the bar, optional text can be displayed along with the bar, and the step
    size used in activity mode can be set.

    {b CSS nodes}

    {[
    progressbar[.osd]
    ├── [text]
    ╰── trough[.empty][.full]
        ╰── progress[.pulse]
    ]}

    [GtkProgressBar] has a main CSS node with name progressbar and subnodes with
    names text and trough, of which the latter has a subnode named progress. The
    text subnode is only present if text is shown. The progress subnode has the
    style class .pulse when in activity mode. It gets the style classes .left,
    .right, .top or .bottom added when the progress 'touches' the corresponding
    end of the GtkProgressBar. The .osd class on the progressbar node is for use
    in overlays like the one Epiphany has for page loading progress.

    {b Accessibility}

    [GtkProgressBar] uses the [Gtk.AccessibleRole.progress_bar] role and sets
    the [Gtk.AccessibleProperty.value_min], [Gtk.AccessibleProperty.value_max]
    and [Gtk.AccessibleProperty.value_now] properties to reflect the progress.

    Its methods, signals and properties are on {!class-type-progress_bar_t}. The
    functions it is built on are in {!Ocgtk.Raw.Progress_bar}. *)

(** The methods, signals and properties of a [GtkProgressBar]. *)
class type progress_bar_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_range.accessible_range_t
  inherit Orientable.orientable_t
  method get_ellipsize : unit -> Ocpango.Enums.ellipsizemode
  method get_fraction : unit -> float
  method get_inverted : unit -> bool
  method get_pulse_step : unit -> float
  method get_show_text : unit -> bool
  method get_text : unit -> string option
  method pulse : unit -> unit
  method set_ellipsize : Ocpango.Enums.ellipsizemode -> unit
  method set_fraction : float -> unit
  method set_inverted : bool -> unit
  method set_pulse_step : float -> unit
  method set_show_text : bool -> unit
  method set_text : string option -> unit
  method as_progress_bar : Raw.Progress_bar.t
end

class progress_bar : Raw.Progress_bar.t -> progress_bar_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Progress_bar.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkProgressBar], give one already wrapped. *)

val new_ : unit -> progress_bar_t
