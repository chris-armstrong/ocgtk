(* GENERATED CODE - DO NOT EDIT *)
(* Top-level library module with direct references to all classes and enumerations *)

(** {1 Classes and Interfaces} *)

class type blend_node_t = GBlend_node.blend_node_t
class type blur_node_t = GBlur_node.blur_node_t
class type border_node_t = GBorder_node.border_node_t
class type cairo_node_t = GCairo_node.cairo_node_t
class type cairo_renderer_t = GCairo_renderer.cairo_renderer_t
class type clip_node_t = GClip_node.clip_node_t
class type color_matrix_node_t = GColor_matrix_node.color_matrix_node_t
class type color_node_t = GColor_node.color_node_t
class type color_stop_t = GColor_stop.color_stop_t
class type conic_gradient_node_t = GConic_gradient_node.conic_gradient_node_t
class type container_node_t = GContainer_node.container_node_t
class type cross_fade_node_t = GCross_fade_node.cross_fade_node_t
class type debug_node_t = GDebug_node.debug_node_t
class type fill_node_t = GFill_node.fill_node_t
class type gl_renderer_t = GGl_renderer.gl_renderer_t
class type gl_shader_t = GGl_shader.gl_shader_t
class type gl_shader_node_t = GGl_shader_node.gl_shader_node_t
class type inset_shadow_node_t = GInset_shadow_node.inset_shadow_node_t
class type linear_gradient_node_t = GLinear_gradient_node.linear_gradient_node_t
class type mask_node_t = GMask_node.mask_node_t
class type opacity_node_t = GOpacity_node.opacity_node_t
class type outset_shadow_node_t = GOutset_shadow_node.outset_shadow_node_t
class type parse_location_t = GParse_location.parse_location_t
class type path_t = GPath_and__path_measure_and__path_point.path_t
class type path_builder_t = GPath_builder.path_builder_t
class type path_measure_t = GPath_and__path_measure_and__path_point.path_measure_t
class type path_point_t = GPath_and__path_measure_and__path_point.path_point_t
class type radial_gradient_node_t = GRadial_gradient_node.radial_gradient_node_t
class type render_node_t = GRender_node.render_node_t
class type renderer_t = GRenderer.renderer_t
class type repeat_node_t = GRepeat_node.repeat_node_t
class type repeating_linear_gradient_node_t = GRepeating_linear_gradient_node.repeating_linear_gradient_node_t
class type repeating_radial_gradient_node_t = GRepeating_radial_gradient_node.repeating_radial_gradient_node_t
class type rounded_clip_node_t = GRounded_clip_node.rounded_clip_node_t
class type rounded_rect_t = GRounded_rect.rounded_rect_t
class type shader_args_builder_t = GShader_args_builder.shader_args_builder_t
class type shadow_t = GShadow.shadow_t
class type shadow_node_t = GShadow_node.shadow_node_t
class type stroke_t = GStroke.stroke_t
class type stroke_node_t = GStroke_node.stroke_node_t
class type subsurface_node_t = GSubsurface_node.subsurface_node_t
class type text_node_t = GText_node.text_node_t
class type texture_node_t = GTexture_node.texture_node_t
class type texture_scale_node_t = GTexture_scale_node.texture_scale_node_t
class type transform_t = GTransform.transform_t
class type transform_node_t = GTransform_node.transform_node_t
class type vulkan_renderer_t = GVulkan_renderer.vulkan_renderer_t

class blend_node : Blend_node.t -> blend_node_t
class blur_node : Blur_node.t -> blur_node_t
class border_node : Border_node.t -> border_node_t
class cairo_node : Cairo_node.t -> cairo_node_t
class cairo_renderer : Cairo_renderer.t -> cairo_renderer_t
class clip_node : Clip_node.t -> clip_node_t
class color_matrix_node : Color_matrix_node.t -> color_matrix_node_t
class color_node : Color_node.t -> color_node_t
class color_stop : Color_stop.t -> color_stop_t
class conic_gradient_node : Conic_gradient_node.t -> conic_gradient_node_t
class container_node : Container_node.t -> container_node_t
class cross_fade_node : Cross_fade_node.t -> cross_fade_node_t
class debug_node : Debug_node.t -> debug_node_t
class fill_node : Fill_node.t -> fill_node_t
class gl_renderer : Gl_renderer.t -> gl_renderer_t
class gl_shader : Gl_shader.t -> gl_shader_t
class gl_shader_node : Gl_shader_node.t -> gl_shader_node_t
class inset_shadow_node : Inset_shadow_node.t -> inset_shadow_node_t
class linear_gradient_node : Linear_gradient_node.t -> linear_gradient_node_t
class mask_node : Mask_node.t -> mask_node_t
class opacity_node : Opacity_node.t -> opacity_node_t
class outset_shadow_node : Outset_shadow_node.t -> outset_shadow_node_t
class parse_location : Parse_location.t -> parse_location_t
class path : Path_and__path_measure_and__path_point.Path.t -> path_t
class path_builder : Path_builder.t -> path_builder_t
class path_measure : Path_and__path_measure_and__path_point.Path_measure.t -> path_measure_t
class path_point : Path_and__path_measure_and__path_point.Path_point.t -> path_point_t
class radial_gradient_node : Radial_gradient_node.t -> radial_gradient_node_t
class render_node : Render_node.t -> render_node_t
class renderer : Renderer.t -> renderer_t
class repeat_node : Repeat_node.t -> repeat_node_t
class repeating_linear_gradient_node : Repeating_linear_gradient_node.t -> repeating_linear_gradient_node_t
class repeating_radial_gradient_node : Repeating_radial_gradient_node.t -> repeating_radial_gradient_node_t
class rounded_clip_node : Rounded_clip_node.t -> rounded_clip_node_t
class rounded_rect : Rounded_rect.t -> rounded_rect_t
class shader_args_builder : Shader_args_builder.t -> shader_args_builder_t
class shadow : Shadow.t -> shadow_t
class shadow_node : Shadow_node.t -> shadow_node_t
class stroke : Stroke.t -> stroke_t
class stroke_node : Stroke_node.t -> stroke_node_t
class subsurface_node : Subsurface_node.t -> subsurface_node_t
class text_node : Text_node.t -> text_node_t
class texture_node : Texture_node.t -> texture_node_t
class texture_scale_node : Texture_scale_node.t -> texture_scale_node_t
class transform : Transform.t -> transform_t
class transform_node : Transform_node.t -> transform_node_t
class vulkan_renderer : Vulkan_renderer.t -> vulkan_renderer_t

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
