(* GENERATED CODE - DO NOT EDIT *)
(* VolumeButton: VolumeButton *)

(** [GtkVolumeButton] is a [GtkScaleButton] subclass tailored for volume
    control.

    An example GtkVolumeButton

    The class built on this module is in {!Ocgtk.Volume_button}. *)

type t =
  [ `volume_button | `scale_button | `widget | `initially_unowned | `object_ ]
  Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_volume_button_get_type"

external new_ : unit -> t = "ml_gtk_volume_button_new"
(** Creates a [GtkVolumeButton].

    The button has a range between 0.0 and 1.0, with a stepping of 0.02. Volume
    values can be obtained and modified using the functions from
    [Gtk.ScaleButton]. *)

(* Methods *)
(* Properties *)

external get_use_symbolic : t -> bool = "ml_gtk_volume_button_get_use_symbolic"
(** Whether to use symbolic icons as the icons.

    Note that if the symbolic icons are not available in your installed theme,
    then the normal (potentially colorful) icons will be used. *)

external set_use_symbolic : t -> bool -> unit
  = "ml_gtk_volume_button_set_use_symbolic"
(** Whether to use symbolic icons as the icons.

    Note that if the symbolic icons are not available in your installed theme,
    then the normal (potentially colorful) icons will be used. *)
