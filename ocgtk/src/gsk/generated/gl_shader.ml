(* GENERATED CODE - DO NOT EDIT *)
(* GLShader: GLShader *)

[@@@ocaml.text
"Implements a fragment shader using GLSL.\n\n\
 A fragment shader gets the coordinates being rendered as input and\n\
 produces the pixel values for that particular pixel. Additionally,\n\
 the shader can declare a set of other input arguments, called\n\
 uniforms (as they are uniform over all the calls to your shader in\n\
 each instance of use). A shader can also receive up to 4\n\
 textures that it can use as input when producing the pixel data.\n\n\
 [GskGLShader] is usually used with gtk_snapshot_push_gl_shader()\n\
 to produce a [Gsk.GLShaderNode] in the rendering hierarchy,\n\
 and then its input textures are constructed by rendering the child\n\
 nodes to textures before rendering the shader node itself. (You can\n\
 pass texture nodes as children if you want to directly use a texture\n\
 as input).\n\n\
 The actual shader code is GLSL code that gets combined with\n\
 some other code into the fragment shader. Since the exact\n\
 capabilities of the GPU driver differs between different OpenGL\n\
 drivers and hardware, GTK adds some defines that you can use\n\
 to ensure your GLSL code runs on as many drivers as it can.\n\n\
 If the OpenGL driver is GLES, then the shader language version\n\
 is set to 100, and GSK_GLES will be defined in the shader.\n\n\
 Otherwise, if the OpenGL driver does not support the 3.2 core profile,\n\
 then the shader will run with language version 110 for GL2 and 130 for GL3,\n\
 and GSK_LEGACY will be defined in the shader.\n\n\
 If the OpenGL driver supports the 3.2 code profile, it will be used,\n\
 the shader language version is set to 150, and GSK_GL3 will be defined\n\
 in the shader.\n\n\
 The main function the shader must implement is:\n\n\
 {[\n\
\ void mainImage(out vec4 fragColor,\n\
\                in vec2 fragCoord,\n\
\                in vec2 resolution,\n\
\                in vec2 uv)\n\
 ]}\n\n\
 Where the input [fragCoord] is the coordinate of the pixel we're\n\
 currently rendering, relative to the boundary rectangle that was\n\
 specified in the [GskGLShaderNode], and [resolution] is the width and\n\
 height of that rectangle. This is in the typical GTK coordinate\n\
 system with the origin in the top left. [uv] contains the u and v\n\
 coordinates that can be used to index a texture at the\n\
 corresponding point. These coordinates are in the \\[0..1\\]x\\[0..1\\]\n\
 region, with 0, 0 being in the lower left corder (which is typical\n\
 for OpenGL).\n\n\
 The output [fragColor] should be a RGBA color (with\n\
 premultiplied alpha) that will be used as the output for the\n\
 specified pixel location. Note that this output will be\n\
 automatically clipped to the clip region of the glshader node.\n\n\
 In addition to the function arguments the shader can define\n\
 up to 4 uniforms for textures which must be called u_textureN\n\
 (i.e. u_texture1 to u_texture4) as well as any custom uniforms\n\
 you want of types int, uint, bool, float, vec2, vec3 or vec4.\n\n\
 All textures sources contain premultiplied alpha colors, but if some\n\
 there are outer sources of colors there is a gsk_premultiply() helper\n\
 to compute premultiplication when needed.\n\n\
 Note that GTK parses the uniform declarations, so each uniform has to\n\
 be on a line by itself with no other code, like so:\n\n\
 {[\n\
 uniform float u_time;\n\
 uniform vec3 u_color;\n\
 uniform sampler2D u_texture1;\n\
 uniform sampler2D u_texture2;\n\
 ]}\n\n\
 GTK uses the \"gsk\" namespace in the symbols it uses in the\n\
 shader, so your code should not use any symbols with the prefix gsk\n\
 or GSK. There are some helper functions declared that you can use:\n\n\
 {[\n\
 vec4 GskTexture(sampler2D sampler, vec2 texCoords);\n\
 ]}\n\n\
 This samples a texture (e.g. u_texture1) at the specified\n\
 coordinates, and contains some helper ifdefs to ensure that\n\
 it works on all OpenGL versions.\n\n\
 You can compile the shader yourself using [Gsk.GLShader.compile],\n\
 otherwise the GSK renderer will do it when it handling the glshader\n\
 node. If errors occurs, the returned [error] will include the glsl\n\
 sources, so you can see what GSK was passing to the compiler. You\n\
 can also set GSK_DEBUG=shaders in the environment to see the sources\n\
 and other relevant information about all shaders that GSK is handling.\n\n\
 {b An example shader}\n\n\
 {[\n\
 uniform float position;\n\
 uniform sampler2D u_texture1;\n\
 uniform sampler2D u_texture2;\n\n\
 void mainImage(out vec4 fragColor,\n\
\               in vec2 fragCoord,\n\
\               in vec2 resolution,\n\
\               in vec2 uv) {\n\
\  vec4 source1 = GskTexture(u_texture1, uv);\n\
\  vec4 source2 = GskTexture(u_texture2, uv);\n\n\
\  fragColor = position * source1 + (1.0 - position) * source2;\n\
 }\n\
 ]}"]

type t = [ `gl_shader | `object_ ] Gobject.obj

external new_from_bytes : Glib_bytes.t -> t = "ml_gsk_gl_shader_new_from_bytes"
(** Create a new GLShader *)

external new_from_resource : string -> t = "ml_gsk_gl_shader_new_from_resource"
(** Create a new GLShader *)

(* Methods *)

external get_uniform_type : t -> int -> Gsk_enums.gluniformtype
  = "ml_gsk_gl_shader_get_uniform_type"
(** Get the type of the declared uniform for this shader at index [idx]. *)

external get_uniform_offset : t -> int -> int
  = "ml_gsk_gl_shader_get_uniform_offset"
(** Get the offset into the data block where data for this uniforms is stored.
*)

external get_uniform_name : t -> int -> string
  = "ml_gsk_gl_shader_get_uniform_name"
(** Get the name of the declared uniform for this shader at index [idx]. *)

external get_source : t -> Glib_bytes.t = "ml_gsk_gl_shader_get_source"
(** Gets the GLSL sourcecode being used to render this shader. *)

external get_resource : t -> string option = "ml_gsk_gl_shader_get_resource"
(** Gets the resource path for the GLSL sourcecode being used to render this
    shader. *)

external get_n_uniforms : t -> int = "ml_gsk_gl_shader_get_n_uniforms"
(** Get the number of declared uniforms for this shader. *)

external get_n_textures : t -> int = "ml_gsk_gl_shader_get_n_textures"
(** Returns the number of textures that the shader requires.

    This can be used to check that the a passed shader works in your usecase. It
    is determined by looking at the highest u_textureN value that the shader
    defines. *)

external get_args_size : t -> Gsize.t = "ml_gsk_gl_shader_get_args_size"
(** Get the size of the data block used to specify arguments for this shader. *)

external get_arg_vec4 :
  t -> Glib_bytes.t -> int -> Ocgtk_graphene.Graphene.Wrappers.Vec4.t -> unit
  = "ml_gsk_gl_shader_get_arg_vec4"
(** Gets the value of the uniform [idx] in the [args] block.

    The uniform must be of vec4 type. *)

external get_arg_vec3 :
  t -> Glib_bytes.t -> int -> Ocgtk_graphene.Graphene.Wrappers.Vec3.t -> unit
  = "ml_gsk_gl_shader_get_arg_vec3"
(** Gets the value of the uniform [idx] in the [args] block.

    The uniform must be of vec3 type. *)

external get_arg_vec2 :
  t -> Glib_bytes.t -> int -> Ocgtk_graphene.Graphene.Wrappers.Vec2.t -> unit
  = "ml_gsk_gl_shader_get_arg_vec2"
(** Gets the value of the uniform [idx] in the [args] block.

    The uniform must be of vec2 type. *)

external get_arg_uint : t -> Glib_bytes.t -> int -> UInt32.t
  = "ml_gsk_gl_shader_get_arg_uint"
(** Gets the value of the uniform [idx] in the [args] block.

    The uniform must be of uint type. *)

external get_arg_int : t -> Glib_bytes.t -> int -> Int32.t
  = "ml_gsk_gl_shader_get_arg_int"
(** Gets the value of the uniform [idx] in the [args] block.

    The uniform must be of int type. *)

external get_arg_float : t -> Glib_bytes.t -> int -> float
  = "ml_gsk_gl_shader_get_arg_float"
(** Gets the value of the uniform [idx] in the [args] block.

    The uniform must be of float type. *)

external get_arg_bool : t -> Glib_bytes.t -> int -> bool
  = "ml_gsk_gl_shader_get_arg_bool"
(** Gets the value of the uniform [idx] in the [args] block.

    The uniform must be of bool type. *)

external find_uniform_by_name : t -> string -> int
  = "ml_gsk_gl_shader_find_uniform_by_name"
(** Looks for a uniform by the name [name], and returns the index of the
    uniform, or -1 if it was not found. *)

external compile : t -> Renderer.t -> (bool, GError.t) result
  = "ml_gsk_gl_shader_compile"
(** Tries to compile the [shader] for the given [renderer].

    If there is a problem, this function returns [FALSE] and reports an error.
    You should use this function before relying on the shader for rendering and
    use a fallback with a simpler shader or without shaders if it fails.

    Note that this will modify the rendering state (for example change the
    current GL context) and requires the renderer to be set up. This means that
    the widget has to be realized. Commonly you want to call this from the
    realize signal of a widget, or during widget snapshot. *)

(* Properties *)
