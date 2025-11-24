(* GENERATED CODE - DO NOT EDIT *)
(* Widget: GLArea *)

type t = Gtk.widget

external gtk_gl_area_new : unit -> t = "ml_gtk_gl_area_new"

(* Properties *)

external get_auto_render : t -> bool = "ml_gtk_g_l_area_get_auto_render"

external set_auto_render : t -> bool -> unit = "ml_gtk_g_l_area_set_auto_render"

external get_has_depth_buffer : t -> bool = "ml_gtk_g_l_area_get_has_depth_buffer"

external set_has_depth_buffer : t -> bool -> unit = "ml_gtk_g_l_area_set_has_depth_buffer"

external get_has_stencil_buffer : t -> bool = "ml_gtk_g_l_area_get_has_stencil_buffer"

external set_has_stencil_buffer : t -> bool -> unit = "ml_gtk_g_l_area_set_has_stencil_buffer"

external get_use_es : t -> bool = "ml_gtk_g_l_area_get_use_es"

external set_use_es : t -> bool -> unit = "ml_gtk_g_l_area_set_use_es"

external gtk_gl_area_set_use_es : t -> bool -> unit = "ml_gtk_gl_area_set_use_es"

external gtk_gl_area_set_required_version : t -> int -> int -> unit = "ml_gtk_gl_area_set_required_version"

external gtk_gl_area_set_has_stencil_buffer : t -> bool -> unit = "ml_gtk_gl_area_set_has_stencil_buffer"

external gtk_gl_area_set_has_depth_buffer : t -> bool -> unit = "ml_gtk_gl_area_set_has_depth_buffer"

external gtk_gl_area_set_auto_render : t -> bool -> unit = "ml_gtk_gl_area_set_auto_render"

external gtk_gl_area_set_allowed_apis : t -> Gdk.glapi -> unit = "ml_gtk_gl_area_set_allowed_apis"

external gtk_gl_area_queue_render : t -> unit = "ml_gtk_gl_area_queue_render"

external gtk_gl_area_make_current : t -> unit = "ml_gtk_gl_area_make_current"

external gtk_gl_area_get_use_es : t -> bool = "ml_gtk_gl_area_get_use_es"

external gtk_gl_area_get_has_stencil_buffer : t -> bool = "ml_gtk_gl_area_get_has_stencil_buffer"

external gtk_gl_area_get_has_depth_buffer : t -> bool = "ml_gtk_gl_area_get_has_depth_buffer"

external gtk_gl_area_get_auto_render : t -> bool = "ml_gtk_gl_area_get_auto_render"

external gtk_gl_area_get_api : t -> Gdk.glapi = "ml_gtk_gl_area_get_api"

external gtk_gl_area_get_allowed_apis : t -> Gdk.glapi = "ml_gtk_gl_area_get_allowed_apis"

external gtk_gl_area_attach_buffers : t -> unit = "ml_gtk_gl_area_attach_buffers"

