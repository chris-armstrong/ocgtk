class snapshot : Snapshot.t ->
  object
    method gl_shader_pop_texture : unit -> unit
    method perspective : float -> unit
    method pop : unit -> unit
    method push_blend : Gsk_enums.blendmode -> unit
    method push_blur : float -> unit
    method push_cross_fade : float -> unit
    method push_mask : Gsk_enums.maskmode -> unit
    method push_opacity : float -> unit
    method render_background : #GStyle_context.style_context -> float -> float -> float -> float -> unit
    method render_focus : #GStyle_context.style_context -> float -> float -> float -> float -> unit
    method render_frame : #GStyle_context.style_context -> float -> float -> float -> float -> unit
    method restore : unit -> unit
    method rotate : float -> unit
    method save : unit -> unit
    method scale : float -> float -> unit
    method scale_3d : float -> float -> float -> unit
    method as_snapshot : Snapshot.t
  end

