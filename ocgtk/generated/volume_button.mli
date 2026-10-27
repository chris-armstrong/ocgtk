(** [GtkVolumeButton] is a [GtkScaleButton] subclass tailored for volume
    control.

    An example GtkVolumeButton

    Its methods, signals and properties are on {!class-type-volume_button_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Volume_button}. *)

(** The methods, signals and properties of a [GtkVolumeButton]. *)
class type volume_button_t = object
  inherit Scale_button.scale_button_t
  method use_symbolic : bool
  method set_use_symbolic : bool -> unit
  method as_volume_button : Raw.Volume_button.t
end

class volume_button : Raw.Volume_button.t -> volume_button_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Volume_button.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkVolumeButton], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : unit -> volume_button_t
(** Creates a [GtkVolumeButton].

    The button has a range between 0.0 and 1.0, with a stepping of 0.02. Volume
    values can be obtained and modified using the functions from
    [Gtk.ScaleButton]. *)
