(** [GtkVolumeButton] is a [GtkScaleButton] subclass tailored for volume
    control.

    An example GtkVolumeButton

    Its methods, signals and properties are on {!class-type-volume_button_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Volume_button}. *)

(** The methods, signals and properties of a [VolumeButton]. *)
class type volume_button_t = object
  inherit Scale_button.scale_button_t
  method use_symbolic : bool
  method set_use_symbolic : bool -> unit
  method as_volume_button : Raw.Volume_button.t
end

class volume_button : Raw.Volume_button.t -> volume_button_t
(** Wraps a raw handle of {!Ocgtk.Raw.Volume_button.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> volume_button_t
(** Creates a [GtkVolumeButton].

    The button has a range between 0.0 and 1.0, with a stepping of 0.02. Volume
    values can be obtained and modified using the functions from
    [Gtk.ScaleButton]. *)
