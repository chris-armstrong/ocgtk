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

    Its methods, signals and properties are on {!class-type-progress_bar_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Progress_bar}. *)

(** {b The methods, signals and properties of a [ProgressBar].}

    Displays the progress of a long-running operation.

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
*)
class type progress_bar_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_range.accessible_range_t
  inherit Orientable.orientable_t

  method get_ellipsize : unit -> Ocpango.Enums.ellipsizemode
  (** Returns the ellipsizing position of the progress bar.

      See [Gtk.ProgressBar.set_ellipsize]. *)

  method get_fraction : unit -> float
  (** Returns the current fraction of the task that’s been completed. *)

  method get_inverted : unit -> bool
  (** Returns whether the progress bar is inverted. *)

  method get_pulse_step : unit -> float
  (** Retrieves the pulse step.

      See [Gtk.ProgressBar.set_pulse_step]. *)

  method get_show_text : unit -> bool
  (** Returns whether the [GtkProgressBar] shows text.

      See [Gtk.ProgressBar.set_show_text]. *)

  method get_text : unit -> string option
  (** Retrieves the text that is displayed with the progress bar.

      The return value is a reference to the text, not a copy of it, so will
      become invalid if you change the text in the progress bar. *)

  method pulse : unit -> unit
  (** Indicates that some progress has been made, but you don’t know how much.

      Causes the progress bar to enter “activity mode,” where a block bounces
      back and forth. Each call to [Gtk.ProgressBar.pulse] causes the block to
      move by a little bit (the amount of movement per pulse is determined by
      [Gtk.ProgressBar.set_pulse_step]). *)

  method set_ellipsize : Ocpango.Enums.ellipsizemode -> unit
  (** Sets the mode used to ellipsize the text.

      The text is ellipsized if there is not enough space to render the entire
      string. *)

  method set_fraction : float -> unit
  (** Causes the progress bar to “fill in” the given fraction of the bar.

      The fraction should be between 0.0 and 1.0, inclusive. *)

  method set_inverted : bool -> unit
  (** Sets whether the progress bar is inverted.

      Progress bars normally grow from top to bottom or left to right. Inverted
      progress bars grow in the opposite direction. *)

  method set_pulse_step : float -> unit
  (** Sets the fraction of total progress bar length to move the bouncing block.

      The bouncing block is moved when [Gtk.ProgressBar.pulse] is called. *)

  method set_show_text : bool -> unit
  (** Sets whether the progress bar will show text next to the bar.

      The shown text is either the value of the [Gtk.ProgressBar:text] property
      or, if that is [NULL], the [Gtk.ProgressBar:fraction] value, as a
      percentage.

      To make a progress bar that is styled and sized suitably for containing
      text (even if the actual text is blank), set [Gtk.ProgressBar:show-text]
      to [TRUE] and [Gtk.ProgressBar:text] to the empty string (not [NULL]). *)

  method set_text : string option -> unit
  (** Causes the given [text] to appear next to the progress bar.

      If [text] is [NULL] and [Gtk.ProgressBar:show-text] is [TRUE], the current
      value of [Gtk.ProgressBar:fraction] will be displayed as a percentage.

      If [text] is non-[NULL] and [Gtk.ProgressBar:show-text] is [TRUE], the
      text will be displayed. In this case, it will not display the progress
      percentage. If [text] is the empty string, the progress bar will still be
      styled and sized suitably for containing text, as long as
      [Gtk.ProgressBar:show-text] is [TRUE]. *)

  method as_progress_bar : Raw.Progress_bar.t
end

class progress_bar : Raw.Progress_bar.t -> progress_bar_t
(** Wraps a raw handle of {!Ocgtk.Raw.Progress_bar.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> progress_bar_t
(** Creates a new [GtkProgressBar]. *)
