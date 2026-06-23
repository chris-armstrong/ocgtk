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

(* High-level class for Analysis *)
class analysis (obj : Analysis.t) : analysis_t =
  object (self)
    method get_font : GContext_and__font_and__font_map_and__fontset.font_t =
      new GContext_and__font_and__font_map_and__fontset.font
        (Analysis.get_font obj)

    method set_font :
        GContext_and__font_and__font_map_and__fontset.font_t -> unit =
      fun v -> Analysis.set_font obj v#as_font

    method get_level : unit = Analysis.get_level obj
    method set_level : unit -> unit = fun v -> Analysis.set_level obj v
    method get_gravity : unit = Analysis.get_gravity obj
    method set_gravity : unit -> unit = fun v -> Analysis.set_gravity obj v
    method get_flags : unit = Analysis.get_flags obj
    method set_flags : unit -> unit = fun v -> Analysis.set_flags obj v
    method get_script : unit = Analysis.get_script obj
    method set_script : unit -> unit = fun v -> Analysis.set_script obj v
    method get_language : Language.t = Analysis.get_language obj

    method set_language : Language.t -> unit =
      fun v -> Analysis.set_language obj v

    method get_extra_attrs : unit = Analysis.get_extra_attrs obj

    method set_extra_attrs : unit -> unit =
      fun v -> Analysis.set_extra_attrs obj v

    method as_analysis = obj
  end

let make (font : GContext_and__font_and__font_map_and__fontset.font_t)
    (level : unit) (gravity : unit) (flags : unit) (script : unit)
    (language : Language.t) (extra_attrs : unit) : analysis_t =
  new analysis
    (Analysis.make font#as_font level gravity flags script language extra_attrs)
