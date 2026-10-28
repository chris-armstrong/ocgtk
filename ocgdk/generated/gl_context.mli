(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for GLContext from cyclic group App_launch_context_cycle_de440b34 *)

(** Represents a platform-specific OpenGL draw context.

    Its methods, signals and properties are on {!class-type-gl_context_t}. Its
    full description is under {!section-description}. The functions it is built
    on are in {!Ocgdk.Raw.Gl_context}. *)

(** {1:class Class} *)

class type gl_context_t = App_launch_context_cycle_de440b34.gl_context_t
  [@@ocaml.doc
    "{b The methods, signals and properties of a [GLContext].}\n\n\
     Represents a platform-specific OpenGL draw context.\n\n\
     [GdkGLContext]s are created for a surface using\n\
     [Gdk.Surface.create_gl_context], and the context will match\n\
     the characteristics of the surface.\n\n\
     A [GdkGLContext] is not tied to any particular normal framebuffer.\n\
     For instance, it cannot draw to the surface back buffer. The GDK\n\
     repaint system is in full control of the painting to that. Instead,\n\
     you can create render buffers or textures and use [cairo_draw_from_gl]\n\
     in the draw function of your widget to draw them. Then GDK will handle\n\
     the integration of your rendering with that of other widgets.\n\n\
     Support for [GdkGLContext] is platform-specific and context creation\n\
     can fail, returning [NULL] context.\n\n\
     A [GdkGLContext] has to be made \"current\" in order to start using\n\
     it, otherwise any OpenGL call will be ignored.\n\n\
     {b Creating a new OpenGL context}\n\n\
     In order to create a new [GdkGLContext] instance you need a [GdkSurface],\n\
     which you typically get during the realize call of a widget.\n\n\
     A [GdkGLContext] is not realized until either [Gdk.GLContext.make_current]\n\
     or [Gdk.GLContext.realize] is called. It is possible to specify\n\
     details of the GL context like the OpenGL version to be used, or whether\n\
     the GL context should have extra state validation enabled after calling\n\
     [Gdk.Surface.create_gl_context] by calling [Gdk.GLContext.realize].\n\
     If the realization fails you have the option to change the settings of\n\
     the [GdkGLContext] and try again.\n\n\
     {b Using a GdkGLContext}\n\n\
     You will need to make the [GdkGLContext] the current context before issuing\n\
     OpenGL calls; the system sends OpenGL commands to whichever context is \
     current.\n\
     It is possible to have multiple contexts, so you always need to ensure that\n\
     the one which you want to draw with is the current one before issuing \
     commands:\n\n\
     {[\n\
     gdk_gl_context_make_current (context);\n\
     ]}\n\n\
     You can now perform your drawing using OpenGL commands.\n\n\
     You can check which [GdkGLContext] is the current one by using\n\
     [Gdk.GLContext.get_current]; you can also unset any [GdkGLContext]\n\
     that is currently set by calling [Gdk.GLContext.clear_current]."]

class gl_context : Raw.Gl_context.t -> gl_context_t
(** Wraps a raw handle of {!Ocgdk.Raw.Gl_context.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 Represents a platform-specific OpenGL draw context.\n\n\
 [GdkGLContext]s are created for a surface using\n\
 [Gdk.Surface.create_gl_context], and the context will match\n\
 the characteristics of the surface.\n\n\
 A [GdkGLContext] is not tied to any particular normal framebuffer.\n\
 For instance, it cannot draw to the surface back buffer. The GDK\n\
 repaint system is in full control of the painting to that. Instead,\n\
 you can create render buffers or textures and use [cairo_draw_from_gl]\n\
 in the draw function of your widget to draw them. Then GDK will handle\n\
 the integration of your rendering with that of other widgets.\n\n\
 Support for [GdkGLContext] is platform-specific and context creation\n\
 can fail, returning [NULL] context.\n\n\
 A [GdkGLContext] has to be made \"current\" in order to start using\n\
 it, otherwise any OpenGL call will be ignored.\n\n\
 {b Creating a new OpenGL context}\n\n\
 In order to create a new [GdkGLContext] instance you need a [GdkSurface],\n\
 which you typically get during the realize call of a widget.\n\n\
 A [GdkGLContext] is not realized until either [Gdk.GLContext.make_current]\n\
 or [Gdk.GLContext.realize] is called. It is possible to specify\n\
 details of the GL context like the OpenGL version to be used, or whether\n\
 the GL context should have extra state validation enabled after calling\n\
 [Gdk.Surface.create_gl_context] by calling [Gdk.GLContext.realize].\n\
 If the realization fails you have the option to change the settings of\n\
 the [GdkGLContext] and try again.\n\n\
 {b Using a GdkGLContext}\n\n\
 You will need to make the [GdkGLContext] the current context before issuing\n\
 OpenGL calls; the system sends OpenGL commands to whichever context is current.\n\
 It is possible to have multiple contexts, so you always need to ensure that\n\
 the one which you want to draw with is the current one before issuing \
 commands:\n\n\
 {[\n\
 gdk_gl_context_make_current (context);\n\
 ]}\n\n\
 You can now perform your drawing using OpenGL commands.\n\n\
 You can check which [GdkGLContext] is the current one by using\n\
 [Gdk.GLContext.get_current]; you can also unset any [GdkGLContext]\n\
 that is currently set by calling [Gdk.GLContext.clear_current]."]
