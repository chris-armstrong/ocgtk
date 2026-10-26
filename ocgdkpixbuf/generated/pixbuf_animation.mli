class type pixbuf_animation_t = object
  method get_height : unit -> int
  method get_static_image : unit -> GPixbuf.pixbuf_t
  method get_width : unit -> int
  method is_static_image : unit -> bool
  method as_pixbuf_animation : Pixbuf_animation.t
end

class pixbuf_animation : Pixbuf_animation.t -> pixbuf_animation_t

val new_from_file : string -> (pixbuf_animation_t, GError.t) result
val new_from_resource : string -> (pixbuf_animation_t, GError.t) result

val new_from_stream :
  Ocgtk_gio.Gio.Input_stream.input_stream_t ->
  Ocgtk_gio.Gio.Cancellable.cancellable_t option ->
  (pixbuf_animation_t, GError.t) result

val new_from_stream_finish :
  Ocgtk_gio.Gio.Async_result.async_result_t ->
  (pixbuf_animation_t, GError.t) result
