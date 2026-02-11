(* GENERATED CODE - DO NOT EDIT *)
(* Top-level library module with direct references to all classes and enumerations *)

(** {1 Classes and Interfaces} *)

class pixbuf : Pixbuf.t -> GPixbuf.pixbuf
class pixbuf_animation : Pixbuf_animation.t -> GPixbuf_animation.pixbuf_animation
class pixbuf_animation_iter : Pixbuf_animation_iter.t -> GPixbuf_animation_iter.pixbuf_animation_iter
class pixbuf_loader : Pixbuf_loader.t -> GPixbuf_loader.pixbuf_loader
class pixbuf_non_anim : Pixbuf_non_anim.t -> GPixbuf_non_anim.pixbuf_non_anim
class pixbuf_simple_anim : Pixbuf_simple_anim.t -> GPixbuf_simple_anim.pixbuf_simple_anim
class pixbuf_simple_anim_iter : Pixbuf_simple_anim_iter.t -> GPixbuf_simple_anim_iter.pixbuf_simple_anim_iter

(** {1 Layer 1 Module Wrappers}
    
    This submodule provides aliases to the layer 1 (low-level) modules.
    These are the modules containing external declarations and basic bindings.
 *)
module Wrappers : sig
  module Pixbuf = Pixbuf
  module Pixbuf_animation = Pixbuf_animation
  module Pixbuf_animation_iter = Pixbuf_animation_iter
  module Pixbuf_loader = Pixbuf_loader
  module Pixbuf_non_anim = Pixbuf_non_anim
  module Pixbuf_simple_anim = Pixbuf_simple_anim
  module Pixbuf_simple_anim_iter = Pixbuf_simple_anim_iter
end

(** {1 Enumerations and Bitfields} *)

type colorspace = GdkPixbuf_enums.colorspace
type interptype = GdkPixbuf_enums.interptype
type pixbufalphamode = GdkPixbuf_enums.pixbufalphamode
type pixbuferror = GdkPixbuf_enums.pixbuferror
type pixbufrotation = GdkPixbuf_enums.pixbufrotation
type pixbufformatflags = GdkPixbuf_enums.pixbufformatflags
