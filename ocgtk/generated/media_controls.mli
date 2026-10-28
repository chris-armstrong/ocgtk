(** Shows controls for video playback.

    Its methods, signals and properties are on {!class-type-media_controls_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Media_controls}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [MediaControls].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}

    Shows controls for video playback.

    An example GtkMediaControls

    Usually, [GtkMediaControls] is used as part of [Gtk.Video]. *)
class type media_controls_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  (** {2:methods Methods} *)

  method get_media_stream : unit -> Media_stream.media_stream_t option
  (** Gets the media stream managed by [controls] or [NULL] if none. *)

  method set_media_stream : Media_stream.media_stream_t option -> unit
  (** Sets the stream that is controlled by [controls]. *)

  (** {2:conversions Conversions} *)

  method as_media_controls : Raw.Media_controls.t
end

class media_controls : Raw.Media_controls.t -> media_controls_t
(** Wraps a raw handle of {!Ocgtk.Raw.Media_controls.t}. *)

(** {1:description Description}

    Shows controls for video playback.

    An example GtkMediaControls

    Usually, [GtkMediaControls] is used as part of [Gtk.Video]. *)

(** {1:constructors Constructors} *)

val new_ : Media_stream.media_stream_t option -> media_controls_t
(** Creates a new [GtkMediaControls] managing the [stream] passed to it. *)
