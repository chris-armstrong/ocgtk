(* GENERATED CODE - DO NOT EDIT *)
(* Top-level library module with direct references to all classes and enumerations *)

(** {1 Classes and Interfaces} *)

class type font_t = GFont.font_t
class type font_map_t = GFont_map.font_map_t

class font : Font.t -> font_t
class font_map : Font_map.t -> font_map_t

(** {1 Layer 1 Module Wrappers}
    
    This submodule provides aliases to the layer 1 (low-level) modules.
    These are the modules containing external declarations and basic bindings.
 *)
module Wrappers : sig
  module Font = Font
  module Font_map = Font_map
end

