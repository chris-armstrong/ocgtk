class type progress_bar_t = object
  inherit Widget.widget_t
  inherit Accessible_range.accessible_range_t
  inherit Orientable.orientable_t

  (** {2:methods Methods} *)

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
      or, if that is [None], the [Gtk.ProgressBar:fraction] value, as a
      percentage.

      To make a progress bar that is styled and sized suitably for containing
      text (even if the actual text is blank), set [Gtk.ProgressBar:show-text]
      to [true] and [Gtk.ProgressBar:text] to the empty string (not [None]). *)

  method set_text : string option -> unit
  (** Causes the given [text] to appear next to the progress bar.

      If [text] is [None] and [Gtk.ProgressBar:show-text] is [true], the current
      value of [Gtk.ProgressBar:fraction] will be displayed as a percentage.

      If [text] is non-[None] and [Gtk.ProgressBar:show-text] is [true], the
      text will be displayed. In this case, it will not display the progress
      percentage. If [text] is the empty string, the progress bar will still be
      styled and sized suitably for containing text, as long as
      [Gtk.ProgressBar:show-text] is [true]. *)

  (** {2:conversions Conversions} *)

  method as_progress_bar : Raw.Progress_bar.t
end

(* High-level class for ProgressBar *)
class progress_bar (obj : Raw.Progress_bar.t) : progress_bar_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)

    inherit
      Accessible_range.accessible_range (Raw.Accessible_range.from_gobject obj)

    inherit Orientable.orientable (Raw.Orientable.from_gobject obj)

    method get_ellipsize : unit -> Ocpango.Enums.ellipsizemode =
      fun () -> Raw.Progress_bar.get_ellipsize obj

    method get_fraction : unit -> float =
      fun () -> Raw.Progress_bar.get_fraction obj

    method get_inverted : unit -> bool =
      fun () -> Raw.Progress_bar.get_inverted obj

    method get_pulse_step : unit -> float =
      fun () -> Raw.Progress_bar.get_pulse_step obj

    method get_show_text : unit -> bool =
      fun () -> Raw.Progress_bar.get_show_text obj

    method get_text : unit -> string option =
      fun () -> Raw.Progress_bar.get_text obj

    method pulse : unit -> unit = fun () -> Raw.Progress_bar.pulse obj

    method set_ellipsize : Ocpango.Enums.ellipsizemode -> unit =
      fun mode -> Raw.Progress_bar.set_ellipsize obj mode

    method set_fraction : float -> unit =
      fun fraction -> Raw.Progress_bar.set_fraction obj fraction

    method set_inverted : bool -> unit =
      fun inverted -> Raw.Progress_bar.set_inverted obj inverted

    method set_pulse_step : float -> unit =
      fun fraction -> Raw.Progress_bar.set_pulse_step obj fraction

    method set_show_text : bool -> unit =
      fun show_text -> Raw.Progress_bar.set_show_text obj show_text

    method set_text : string option -> unit =
      fun text -> Raw.Progress_bar.set_text obj text

    method as_progress_bar = obj
  end

let new_ () : progress_bar_t = new progress_bar (Raw.Progress_bar.new_ ())
