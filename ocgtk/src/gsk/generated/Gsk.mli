(* GENERATED CODE - DO NOT EDIT *)
(* Top-level library module with direct references to all classes and enumerations *)

(** {1 Classes and Interfaces} *)

class blend_node : Blend_node.t -> GBlend_node.blend_node
class blur_node : Blur_node.t -> GBlur_node.blur_node
class border_node : Border_node.t -> GBorder_node.border_node
class cairo_node : Cairo_node.t -> GCairo_node.cairo_node
class cairo_renderer : Cairo_renderer.t -> GCairo_renderer.cairo_renderer
class clip_node : Clip_node.t -> GClip_node.clip_node
class color_matrix_node : Color_matrix_node.t -> GColor_matrix_node.color_matrix_node
class color_node : Color_node.t -> GColor_node.color_node
class color_stop : Color_stop.t -> GColor_stop.color_stop
class conic_gradient_node : Conic_gradient_node.t -> GConic_gradient_node.conic_gradient_node
class container_node : Container_node.t -> GContainer_node.container_node
class cross_fade_node : Cross_fade_node.t -> GCross_fade_node.cross_fade_node
class debug_node : Debug_node.t -> GDebug_node.debug_node
class fill_node : Fill_node.t -> GFill_node.fill_node
class gl_renderer : Gl_renderer.t -> GGl_renderer.gl_renderer
class gl_shader : Gl_shader.t -> GGl_shader.gl_shader
class gl_shader_node : Gl_shader_node.t -> GGl_shader_node.gl_shader_node
class inset_shadow_node : Inset_shadow_node.t -> GInset_shadow_node.inset_shadow_node
class linear_gradient_node : Linear_gradient_node.t -> GLinear_gradient_node.linear_gradient_node
class mask_node : Mask_node.t -> GMask_node.mask_node
class opacity_node : Opacity_node.t -> GOpacity_node.opacity_node
class outset_shadow_node : Outset_shadow_node.t -> GOutset_shadow_node.outset_shadow_node
class parse_location : Parse_location.t -> GParse_location.parse_location
class path : Path_and__path_measure_and__path_point.Path.t -> GPath_and__path_measure_and__path_point.path
class path_builder : Path_builder.t -> GPath_builder.path_builder
class path_measure : Path_and__path_measure_and__path_point.Path_measure.t -> GPath_and__path_measure_and__path_point.path_measure
class path_point : Path_and__path_measure_and__path_point.Path_point.t -> GPath_and__path_measure_and__path_point.path_point
class radial_gradient_node : Radial_gradient_node.t -> GRadial_gradient_node.radial_gradient_node
class render_node : Render_node.t -> GRender_node.render_node
class renderer : Renderer.t -> GRenderer.renderer
class repeat_node : Repeat_node.t -> GRepeat_node.repeat_node
class repeating_linear_gradient_node : Repeating_linear_gradient_node.t -> GRepeating_linear_gradient_node.repeating_linear_gradient_node
class repeating_radial_gradient_node : Repeating_radial_gradient_node.t -> GRepeating_radial_gradient_node.repeating_radial_gradient_node
class rounded_clip_node : Rounded_clip_node.t -> GRounded_clip_node.rounded_clip_node
class rounded_rect : Rounded_rect.t -> GRounded_rect.rounded_rect
class shader_args_builder : Shader_args_builder.t -> GShader_args_builder.shader_args_builder
class shadow : Shadow.t -> GShadow.shadow
class shadow_node : Shadow_node.t -> GShadow_node.shadow_node
class stroke : Stroke.t -> GStroke.stroke
class stroke_node : Stroke_node.t -> GStroke_node.stroke_node
class subsurface_node : Subsurface_node.t -> GSubsurface_node.subsurface_node
class text_node : Text_node.t -> GText_node.text_node
class texture_node : Texture_node.t -> GTexture_node.texture_node
class texture_scale_node : Texture_scale_node.t -> GTexture_scale_node.texture_scale_node
class transform : Transform.t -> GTransform.transform
class transform_node : Transform_node.t -> GTransform_node.transform_node
class vulkan_renderer : Vulkan_renderer.t -> GVulkan_renderer.vulkan_renderer

(** {1 Layer 1 Module Wrappers}
    
    This submodule provides aliases to the layer 1 (low-level) modules.
    These are the modules containing external declarations and basic bindings.
 *)
module Wrappers : sig
  module Blend_node = Blend_node
  module Blur_node = Blur_node
  module Border_node = Border_node
  module Cairo_node = Cairo_node
  module Cairo_renderer = Cairo_renderer
  module Clip_node = Clip_node
  module Color_matrix_node = Color_matrix_node
  module Color_node = Color_node
  module Color_stop = Color_stop
  module Conic_gradient_node = Conic_gradient_node
  module Container_node = Container_node
  module Cross_fade_node = Cross_fade_node
  module Debug_node = Debug_node
  module Fill_node = Fill_node
  module Gl_renderer = Gl_renderer
  module Gl_shader = Gl_shader
  module Gl_shader_node = Gl_shader_node
  module Inset_shadow_node = Inset_shadow_node
  module Linear_gradient_node = Linear_gradient_node
  module Mask_node = Mask_node
  module Opacity_node = Opacity_node
  module Outset_shadow_node = Outset_shadow_node
  module Parse_location = Parse_location
  module Path = Path_and__path_measure_and__path_point.Path
  module Path_builder = Path_builder
  module Path_measure = Path_and__path_measure_and__path_point.Path_measure
  module Path_point = Path_and__path_measure_and__path_point.Path_point
  module Radial_gradient_node = Radial_gradient_node
  module Render_node = Render_node
  module Renderer = Renderer
  module Repeat_node = Repeat_node
  module Repeating_linear_gradient_node = Repeating_linear_gradient_node
  module Repeating_radial_gradient_node = Repeating_radial_gradient_node
  module Rounded_clip_node = Rounded_clip_node
  module Rounded_rect = Rounded_rect
  module Shader_args_builder = Shader_args_builder
  module Shadow = Shadow
  module Shadow_node = Shadow_node
  module Stroke = Stroke
  module Stroke_node = Stroke_node
  module Subsurface_node = Subsurface_node
  module Text_node = Text_node
  module Texture_node = Texture_node
  module Texture_scale_node = Texture_scale_node
  module Transform = Transform
  module Transform_node = Transform_node
  module Vulkan_renderer = Vulkan_renderer
end

(** {1 Enumerations and Bitfields} *)

type blendmode = Gsk_enums.blendmode
type corner = Gsk_enums.corner
type fillrule = Gsk_enums.fillrule
type gluniformtype = Gsk_enums.gluniformtype
type linecap = Gsk_enums.linecap
type linejoin = Gsk_enums.linejoin
type maskmode = Gsk_enums.maskmode
type pathdirection = Gsk_enums.pathdirection
type pathoperation = Gsk_enums.pathoperation
type rendernodetype = Gsk_enums.rendernodetype
type scalingfilter = Gsk_enums.scalingfilter
type serializationerror = Gsk_enums.serializationerror
type transformcategory = Gsk_enums.transformcategory
type pathforeachflags = Gsk_enums.pathforeachflags
