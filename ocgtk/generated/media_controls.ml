class type media_controls_t = object
  inherit Widget.widget_t

  (** {2:methods Methods} *)

  method get_media_stream : unit -> Media_stream.media_stream_t option
  (** Gets the media stream managed by [controls] or [NULL] if none. *)

  method set_media_stream : Media_stream.media_stream_t option -> unit
  (** Sets the stream that is controlled by [controls]. *)

  (** {2:conversions Conversions} *)

  method as_media_controls : Raw.Media_controls.t
end

(* High-level class for MediaControls *)
class media_controls (obj : Raw.Media_controls.t) : media_controls_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)

    method get_media_stream : unit -> Media_stream.media_stream_t option =
      fun () ->
        Option.map
          (fun ret -> new Media_stream.media_stream ret)
          (Raw.Media_controls.get_media_stream obj)

    method set_media_stream : Media_stream.media_stream_t option -> unit =
      fun stream ->
        let stream = Option.map (fun c -> c#as_media_stream) stream in
        Raw.Media_controls.set_media_stream obj stream

    method as_media_controls = obj
  end

let new_ (stream : Media_stream.media_stream_t option) : media_controls_t =
  let stream = Option.map (fun c -> c#as_media_stream) stream in
  let obj_ = Raw.Media_controls.new_ stream in
  new media_controls obj_
