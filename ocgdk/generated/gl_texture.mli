(** A [GdkTexture] representing a GL texture object.

    Its methods, signals and properties are on {!class-type-gl_texture_t}. The
    functions it is built on are in {!Ocgdk.Raw.Gl_texture}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [GLTexture].}

    A [GdkTexture] representing a GL texture object. *)
class type gl_texture_t = object
  inherit Texture.texture_t

  (** {2:methods Methods} *)

  method release : unit -> unit
  (** Releases the GL resources held by a [GdkGLTexture].

      The texture contents are still available via the [Gdk.Texture.download]
      function, after this function has been called. *)

  (** {2:conversions Conversions} *)

  method as_gl_texture : Raw.Gl_texture.t
end

class gl_texture : Raw.Gl_texture.t -> gl_texture_t
(** Wraps a raw handle of {!Ocgdk.Raw.Gl_texture.t}. *)
