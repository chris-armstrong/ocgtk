(* GENERATED CODE - DO NOT EDIT *)
(* Top-level library module with direct references to all classes and enumerations *)

(** {1 Classes and Interfaces} *)

class type pixbuf_t = GPixbuf.pixbuf_t
class type pixbuf_animation_t = GPixbuf_animation.pixbuf_animation_t
class type pixbuf_animation_iter_t = GPixbuf_animation_iter.pixbuf_animation_iter_t
class type pixbuf_format_t = GPixbuf_format.pixbuf_format_t
class type pixbuf_loader_t = GPixbuf_loader.pixbuf_loader_t
class type pixbuf_simple_anim_t = GPixbuf_simple_anim.pixbuf_simple_anim_t
class type pixbuf_simple_anim_iter_t = GPixbuf_simple_anim_iter.pixbuf_simple_anim_iter_t

class pixbuf : Pixbuf.t -> pixbuf_t
class pixbuf_animation : Pixbuf_animation.t -> pixbuf_animation_t
class pixbuf_animation_iter : Pixbuf_animation_iter.t -> pixbuf_animation_iter_t
class pixbuf_format : Pixbuf_format.t -> pixbuf_format_t
class pixbuf_loader : Pixbuf_loader.t -> pixbuf_loader_t
class pixbuf_simple_anim : Pixbuf_simple_anim.t -> pixbuf_simple_anim_t
class pixbuf_simple_anim_iter : Pixbuf_simple_anim_iter.t -> pixbuf_simple_anim_iter_t

(** {1 Layer 1 Module Wrappers}
    
    This submodule provides aliases to the layer 1 (low-level) modules.
    These are the modules containing external declarations and basic bindings.
 *)
module Wrappers : sig
  module Pixbuf = Pixbuf
  module Pixbuf_animation = Pixbuf_animation
  module Pixbuf_animation_iter = Pixbuf_animation_iter
  module Pixbuf_format = Pixbuf_format
  module Pixbuf_loader = Pixbuf_loader
  module Pixbuf_simple_anim = Pixbuf_simple_anim
  module Pixbuf_simple_anim_iter = Pixbuf_simple_anim_iter
end

(** {1 Enumerations and Bitfields} *)

type colorspace = Gdkpixbuf_enums.colorspace
type interptype = Gdkpixbuf_enums.interptype
type pixbufalphamode = Gdkpixbuf_enums.pixbufalphamode
type pixbuferror = Gdkpixbuf_enums.pixbuferror
type pixbufrotation = Gdkpixbuf_enums.pixbufrotation
type pixbufformatflags = Gdkpixbuf_enums.pixbufformatflags
