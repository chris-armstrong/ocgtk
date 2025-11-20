(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Snapshot *)

type t = Gtk.Widget.t

(** Create a new Snapshot *)
external new_ : unit -> t = "ml_gtk_snapshot_new"

external translate_3d : t -> unit -> unit = "ml_gtk_snapshot_translate_3d"

external translate : t -> unit -> unit = "ml_gtk_snapshot_translate"

external transform_matrix : t -> unit -> unit = "ml_gtk_snapshot_transform_matrix"

external transform : t -> unit -> unit = "ml_gtk_snapshot_transform"

external to_paintable : t -> unit -> unit = "ml_gtk_snapshot_to_paintable"

external to_node : t -> unit = "ml_gtk_snapshot_to_node"

external scale_3d : t -> float -> float -> float -> unit = "ml_gtk_snapshot_scale_3d"

external scale : t -> float -> float -> unit = "ml_gtk_snapshot_scale"

external save : t -> unit = "ml_gtk_snapshot_save"

external rotate_3d : t -> float -> unit -> unit = "ml_gtk_snapshot_rotate_3d"

external rotate : t -> float -> unit = "ml_gtk_snapshot_rotate"

external restore : t -> unit = "ml_gtk_snapshot_restore"

external render_layout : t -> Gtk.Widget.t -> float -> float -> unit -> unit = "ml_gtk_snapshot_render_layout"

external render_insertion_cursor : t -> Gtk.Widget.t -> float -> float -> unit -> int -> Pango.direction -> unit = "ml_gtk_snapshot_render_insertion_cursor_bytecode" "ml_gtk_snapshot_render_insertion_cursor_native"

external render_frame : t -> Gtk.Widget.t -> float -> float -> float -> float -> unit = "ml_gtk_snapshot_render_frame_bytecode" "ml_gtk_snapshot_render_frame_native"

external render_focus : t -> Gtk.Widget.t -> float -> float -> float -> float -> unit = "ml_gtk_snapshot_render_focus_bytecode" "ml_gtk_snapshot_render_focus_native"

external render_background : t -> Gtk.Widget.t -> float -> float -> float -> float -> unit = "ml_gtk_snapshot_render_background_bytecode" "ml_gtk_snapshot_render_background_native"

external push_stroke : t -> unit -> unit -> unit = "ml_gtk_snapshot_push_stroke"

external push_shadow : t -> unit -> unit -> unit = "ml_gtk_snapshot_push_shadow"

external push_rounded_clip : t -> unit -> unit = "ml_gtk_snapshot_push_rounded_clip"

external push_repeat : t -> unit -> unit -> unit = "ml_gtk_snapshot_push_repeat"

external push_opacity : t -> float -> unit = "ml_gtk_snapshot_push_opacity"

external push_mask : t -> unit -> unit = "ml_gtk_snapshot_push_mask"

external push_gl_shader : t -> unit -> unit -> unit -> unit = "ml_gtk_snapshot_push_gl_shader"

external push_fill : t -> unit -> unit -> unit = "ml_gtk_snapshot_push_fill"

external push_debug : t -> string -> unit -> unit = "ml_gtk_snapshot_push_debug"

external push_cross_fade : t -> float -> unit = "ml_gtk_snapshot_push_cross_fade"

external push_color_matrix : t -> unit -> unit -> unit = "ml_gtk_snapshot_push_color_matrix"

external push_clip : t -> unit -> unit = "ml_gtk_snapshot_push_clip"

external push_blur : t -> float -> unit = "ml_gtk_snapshot_push_blur"

external push_blend : t -> unit -> unit = "ml_gtk_snapshot_push_blend"

external pop : t -> unit = "ml_gtk_snapshot_pop"

external perspective : t -> float -> unit = "ml_gtk_snapshot_perspective"

external gl_shader_pop_texture : t -> unit = "ml_gtk_snapshot_gl_shader_pop_texture"

external free_to_paintable : t -> unit -> unit = "ml_gtk_snapshot_free_to_paintable"

external free_to_node : t -> unit = "ml_gtk_snapshot_free_to_node"

external append_texture : t -> unit -> unit -> unit = "ml_gtk_snapshot_append_texture"

external append_stroke : t -> unit -> unit -> unit -> unit = "ml_gtk_snapshot_append_stroke"

external append_scaled_texture : t -> unit -> unit -> unit -> unit = "ml_gtk_snapshot_append_scaled_texture"

external append_repeating_radial_gradient : t -> unit -> unit -> float -> float -> float -> float -> unit -> unit -> unit = "ml_gtk_snapshot_append_repeating_radial_gradient_bytecode" "ml_gtk_snapshot_append_repeating_radial_gradient_native"

external append_repeating_linear_gradient : t -> unit -> unit -> unit -> unit -> unit -> unit = "ml_gtk_snapshot_append_repeating_linear_gradient_bytecode" "ml_gtk_snapshot_append_repeating_linear_gradient_native"

external append_radial_gradient : t -> unit -> unit -> float -> float -> float -> float -> unit -> unit -> unit = "ml_gtk_snapshot_append_radial_gradient_bytecode" "ml_gtk_snapshot_append_radial_gradient_native"

external append_outset_shadow : t -> unit -> unit -> float -> float -> float -> float -> unit = "ml_gtk_snapshot_append_outset_shadow_bytecode" "ml_gtk_snapshot_append_outset_shadow_native"

external append_node : t -> unit -> unit = "ml_gtk_snapshot_append_node"

external append_linear_gradient : t -> unit -> unit -> unit -> unit -> unit -> unit = "ml_gtk_snapshot_append_linear_gradient_bytecode" "ml_gtk_snapshot_append_linear_gradient_native"

external append_layout : t -> unit -> unit -> unit = "ml_gtk_snapshot_append_layout"

external append_inset_shadow : t -> unit -> unit -> float -> float -> float -> float -> unit = "ml_gtk_snapshot_append_inset_shadow_bytecode" "ml_gtk_snapshot_append_inset_shadow_native"

external append_fill : t -> unit -> unit -> unit -> unit = "ml_gtk_snapshot_append_fill"

external append_conic_gradient : t -> unit -> unit -> float -> unit -> unit -> unit = "ml_gtk_snapshot_append_conic_gradient_bytecode" "ml_gtk_snapshot_append_conic_gradient_native"

external append_color : t -> unit -> unit -> unit = "ml_gtk_snapshot_append_color"

external append_cairo : t -> unit -> unit = "ml_gtk_snapshot_append_cairo"

external append_border : t -> unit -> unit -> unit -> unit = "ml_gtk_snapshot_append_border"

