(** Shows controls for video playback.

    An example GtkMediaControls

    Usually, [GtkMediaControls] is used as part of [Gtk.Video].

    Its methods, signals and properties are on {!class-type-media_controls_t}.
    The functions it is built on are in {!Ocgtk.Raw.Media_controls}. *)

(** The methods, signals and properties of a [GtkMediaControls]. *)
class type media_controls_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_media_stream : unit -> Media_stream.media_stream_t option
  (** Gets the media stream managed by [controls] or [NULL] if none. *)

  method set_media_stream : Media_stream.media_stream_t option -> unit
  (** Sets the stream that is controlled by [controls]. *)

  method as_media_controls : Raw.Media_controls.t
end

class media_controls : Raw.Media_controls.t -> media_controls_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Media_controls.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkMediaControls], give one already wrapped. *)

val new_ : Media_stream.media_stream_t option -> media_controls_t
