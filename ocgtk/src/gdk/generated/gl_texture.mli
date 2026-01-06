(* GENERATED CODE - DO NOT EDIT *)
(* GLTexture: GLTexture *)

type t = [`gl_texture | `texture | `object_] Gobject.obj

(** Create a new GLTexture *)
external new_ : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Gl_context.t -> int -> int -> int -> unit -> unit -> t = "ml_gdk_gl_texture_new_bytecode" "ml_gdk_gl_texture_new_native"

(* Methods *)
(** Releases the GL resources held by a `GdkGLTexture`.

The texture contents are still available via the
[method@Gdk.Texture.download] function, after this
function has been called. *)
external release : t -> unit = "ml_gdk_gl_texture_release"

