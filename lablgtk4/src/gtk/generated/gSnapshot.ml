(* High-level class for Snapshot *)
class snapshot (obj : Snapshot.t) = object (self)

  method gl_shader_pop_texture : unit -> unit = fun () -> (Snapshot.gl_shader_pop_texture obj )

  method perspective : float -> unit = fun depth -> (Snapshot.perspective obj depth)

  method pop : unit -> unit = fun () -> (Snapshot.pop obj )

  method push_blend : Gsk_enums.blendmode -> unit = fun blend_mode -> (Snapshot.push_blend obj blend_mode)

  method push_blur : float -> unit = fun radius -> (Snapshot.push_blur obj radius)

  method push_cross_fade : float -> unit = fun progress -> (Snapshot.push_cross_fade obj progress)

  method push_mask : Gsk_enums.maskmode -> unit = fun mask_mode -> (Snapshot.push_mask obj mask_mode)

  method push_opacity : float -> unit = fun opacity -> (Snapshot.push_opacity obj opacity)

  method render_background : 'p1. (#GStyle_context.style_context as 'p1) -> float -> float -> float -> float -> unit = fun context x y width height -> (Snapshot.render_background obj ( context#as_style_context ) x y width height)

  method render_focus : 'p1. (#GStyle_context.style_context as 'p1) -> float -> float -> float -> float -> unit = fun context x y width height -> (Snapshot.render_focus obj ( context#as_style_context ) x y width height)

  method render_frame : 'p1. (#GStyle_context.style_context as 'p1) -> float -> float -> float -> float -> unit = fun context x y width height -> (Snapshot.render_frame obj ( context#as_style_context ) x y width height)

  method restore : unit -> unit = fun () -> (Snapshot.restore obj )

  method rotate : float -> unit = fun angle -> (Snapshot.rotate obj angle)

  method save : unit -> unit = fun () -> (Snapshot.save obj )

  method scale : float -> float -> unit = fun factor_x factor_y -> (Snapshot.scale obj factor_x factor_y)

  method scale_3d : float -> float -> float -> unit = fun factor_x factor_y factor_z -> (Snapshot.scale_3d obj factor_x factor_y factor_z)

    method as_snapshot = obj
end

