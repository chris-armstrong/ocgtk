(** The integration point for media playback inside GTK.

    Its methods, signals and properties are on {!class-type-media_stream_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Media_stream}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [MediaStream].}

    Implements:
    - {{!Ocgdk.Paintable.class-type-paintable_t}Ocgdk.Paintable}

    The integration point for media playback inside GTK.

    GTK provides an implementation of the [GtkMediaStream] interface that is
    called {{!Ocgtk.Media_file.class-type-media_file_t}[Gtk.MediaFile]}.

    Apart from application-facing API for stream playback, [GtkMediaStream] has
    a number of APIs that are only useful for implementations and should not be
    used in applications: [Gtk.MediaStream.prepared],
    [Gtk.MediaStream.unprepared],
    {{!Ocgtk.Media_stream.class-type-media_stream_t.method-update}[Gtk.MediaStream.update]},
    [Gtk.MediaStream.ended],
    {{!Ocgtk.Media_stream.class-type-media_stream_t.method-seek_success}[Gtk.MediaStream.seek_success]},
    {{!Ocgtk.Media_stream.class-type-media_stream_t.method-seek_failed}[Gtk.MediaStream.seek_failed]},
    {{!Ocgtk.Media_stream.class-type-media_stream_t.method-gerror}[Gtk.MediaStream.gerror]},
    [Gtk.MediaStream.error], [Gtk.MediaStream.error_valist]. *)
class type media_stream_t = object
  inherit Ocgdk.Paintable.paintable_t

  (** {2:methods Methods} *)

  method gerror : GError.t -> unit
  (** Sets [self] into an error state.

      This will pause the stream (you can check for an error via
      [Gtk.MediaStream.get_error] in your GtkMediaStream.pause()
      implementation), abort pending seeks and mark the stream as prepared.

      if the stream is already in an error state, this call will be ignored and
      the existing error will be retained.

      To unset an error, the stream must be reset via a call to
      [Gtk.MediaStream.unprepared]. *)

  method get_duration : unit -> int64
  (** Gets the duration of the stream.

      If the duration is not known, 0 will be returned. *)

  method get_ended : unit -> bool
  (** Returns whether the streams playback is finished. *)

  method get_error : unit -> GError.t option
  (** If the stream is in an error state, returns the [GError] explaining that
      state.

      Any type of error can be reported here depending on the implementation of
      the media stream.

      A media stream in an error cannot be operated on, calls like
      [Gtk.MediaStream.play] or [Gtk.MediaStream.seek] will not have any effect.

      [GtkMediaStream] itself does not provide a way to unset an error, but
      implementations may provide options. For example, a [Gtk.MediaFile] will
      unset errors when a new source is set, e.g. with [Gtk.MediaFile.set_file].
  *)

  method get_loop : unit -> bool
  (** Returns whether the stream is set to loop.

      See [Gtk.MediaStream.set_loop] for details. *)

  method get_muted : unit -> bool
  (** Returns whether the audio for the stream is muted.

      See [Gtk.MediaStream.set_muted] for details. *)

  method get_playing : unit -> bool
  (** Return whether the stream is currently playing. *)

  method get_timestamp : unit -> int64
  (** Returns the current presentation timestamp in microseconds. *)

  method get_volume : unit -> float
  (** Returns the volume of the audio for the stream.

      See [Gtk.MediaStream.set_volume] for details. *)

  method has_audio : unit -> bool
  (** Returns whether the stream has audio. *)

  method has_video : unit -> bool
  (** Returns whether the stream has video. *)

  method is_prepared : unit -> bool
  (** Returns whether the stream has finished initializing.

      At this point the existence of audio and video is known. *)

  method is_seekable : unit -> bool
  (** Checks if a stream may be seekable.

      This is meant to be a hint. Streams may not allow seeking even if this
      function returns [true]. However, if this function returns [false],
      streams are guaranteed to not be seekable and user interfaces may hide
      controls that allow seeking.

      It is allowed to call [Gtk.MediaStream.seek] on a non-seekable stream,
      though it will not do anything. *)

  method is_seeking : unit -> bool
  (** Checks if there is currently a seek operation going on. *)

  method pause : unit -> unit
  (** Pauses playback of the stream.

      If the stream is not playing, do nothing. *)

  method play : unit -> unit
  (** Starts playing the stream.

      If the stream is in error or already playing, do nothing. *)

  method realize : Ocgdk.Surface.surface_t -> unit
  (** Called by users to attach the media stream to a [GdkSurface] they manage.

      The stream can then access the resources of [surface] for its rendering
      purposes. In particular, media streams might want to create a
      [GdkGLContext] or sync to the [GdkFrameClock].

      Whoever calls this function is responsible for calling
      [Gtk.MediaStream.unrealize] before either the stream or [surface] get
      destroyed.

      Multiple calls to this function may happen from different users of the
      video, even with the same [surface]. Each of these calls must be followed
      by its own call to [Gtk.MediaStream.unrealize].

      It is not required to call this function to make a media stream work. *)

  method seek : int64 -> unit
  (** Start a seek operation on [self] to [timestamp].

      If [timestamp] is out of range, it will be clamped.

      Seek operations may not finish instantly. While a seek operation is in
      process, the [Gtk.MediaStream:seeking] property will be set.

      When calling [gtk_media_stream_seek ()] during an ongoing seek operation,
      the new seek will override any pending seek. *)

  method seek_failed : unit -> unit
  (** Ends a seek operation started via GtkMediaStream.seek() as a failure.

      This will not cause an error on the stream and will assume that playback
      continues as if no seek had happened.

      See [Gtk.MediaStream.seek_success] for the other way of ending a seek. *)

  method seek_success : unit -> unit
  (** Ends a seek operation started via GtkMediaStream.seek() successfully.

      This function will unset the GtkMediaStream:ended property if it was set.

      See [Gtk.MediaStream.seek_failed] for the other way of ending a seek. *)

  method set_loop : bool -> unit
  (** Sets whether the stream should loop.

      In this case, it will attempt to restart playback from the beginning
      instead of stopping at the end.

      Not all streams may support looping, in particular non-seekable streams.
      Those streams will ignore the loop setting and just end. *)

  method set_muted : bool -> unit
  (** Sets whether the audio stream should be muted.

      Muting a stream will cause no audio to be played, but it does not modify
      the volume. This means that muting and then unmuting the stream will
      restore the volume settings.

      If the stream has no audio, calling this function will still work but it
      will not have an audible effect. *)

  method set_playing : bool -> unit
  (** Starts or pauses playback of the stream. *)

  method set_volume : float -> unit
  (** Sets the volume of the audio stream.

      This function call will work even if the stream is muted.

      The given [volume] should range from 0.0 for silence to 1.0 for as loud as
      possible. Values outside of this range will be clamped to the nearest
      value.

      If the stream has no audio or is muted, calling this function will still
      work but it will not have an immediate audible effect. When the stream is
      unmuted, the new volume setting will take effect. *)

  method stream_ended : unit -> unit
  (** Pauses the media stream and marks it as ended.

      This is a hint only, calls to [Gtk.MediaStream.play] may still happen.

      The media stream must be prepared when this function is called. *)

  method stream_prepared : bool -> bool -> bool -> int64 -> unit
  (** Called by [GtkMediaStream] implementations to advertise the stream being
      ready to play and providing details about the stream.

      Note that the arguments are hints. If the stream implementation cannot
      determine the correct values, it is better to err on the side of caution
      and return [true]. User interfaces will use those values to determine what
      controls to show.

      This function may not be called again until the stream has been reset via
      [Gtk.MediaStream.stream_unprepared]. *)

  method stream_unprepared : unit -> unit
  (** Resets a given media stream implementation.

      [Gtk.MediaStream.stream_prepared] can then be called again.

      This function will also reset any error state the stream was in. *)

  method unrealize : Ocgdk.Surface.surface_t -> unit
  (** Undoes a previous call to [gtk_media_stream_realize ()].

      This causes the stream to release all resources it had allocated from
      [surface]. *)

  method update : int64 -> unit
  (** Media stream implementations should regularly call this function to update
      the timestamp reported by the stream.

      It is up to implementations to call this at the frequency they deem
      appropriate.

      The media stream must be prepared when this function is called. *)

  (** {2:conversions Conversions} *)

  method as_media_stream : Raw.Media_stream.t
end

class media_stream : Raw.Media_stream.t -> media_stream_t
(** Wraps a raw handle of {!Ocgtk.Raw.Media_stream.t}. *)

(** {1:description Description}

    The integration point for media playback inside GTK.

    GTK provides an implementation of the [GtkMediaStream] interface that is
    called {{!Ocgtk.Media_file.class-type-media_file_t}[Gtk.MediaFile]}.

    Apart from application-facing API for stream playback, [GtkMediaStream] has
    a number of APIs that are only useful for implementations and should not be
    used in applications: [Gtk.MediaStream.prepared],
    [Gtk.MediaStream.unprepared],
    {{!Ocgtk.Media_stream.class-type-media_stream_t.method-update}[Gtk.MediaStream.update]},
    [Gtk.MediaStream.ended],
    {{!Ocgtk.Media_stream.class-type-media_stream_t.method-seek_success}[Gtk.MediaStream.seek_success]},
    {{!Ocgtk.Media_stream.class-type-media_stream_t.method-seek_failed}[Gtk.MediaStream.seek_failed]},
    {{!Ocgtk.Media_stream.class-type-media_stream_t.method-gerror}[Gtk.MediaStream.gerror]},
    [Gtk.MediaStream.error], [Gtk.MediaStream.error_valist]. *)

(** {1:constructors Constructors} *)

(** This is an abstract class that can't be instantiated directly. Refer to its
    subclasses for a concrete implementation. *)
