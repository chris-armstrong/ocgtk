class type analysis_t = object
  method get_font : GContext_and__font_and__font_map_and__fontset.font_t
  method set_font : GContext_and__font_and__font_map_and__fontset.font_t -> unit
  method get_level : unit
  method set_level : unit -> unit
  method get_gravity : unit
  method set_gravity : unit -> unit
  method get_flags : unit
  method set_flags : unit -> unit
  method get_script : unit
  method set_script : unit -> unit
  method get_language : Language.t
  method set_language : Language.t -> unit
  method get_extra_attrs : unit
  method set_extra_attrs : unit -> unit
  method as_analysis : Analysis.t
end

class analysis : Analysis.t -> analysis_t

val make :
  GContext_and__font_and__font_map_and__fontset.font_t ->
  unit ->
  unit ->
  unit ->
  unit ->
  Language.t ->
  unit ->
  analysis_t
