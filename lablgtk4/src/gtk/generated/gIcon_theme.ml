(* Signal class defined in gicon_theme_signals.ml *)

(* High-level class for IconTheme *)
class icon_theme (obj : Icon_theme.t) = object (self)
  inherit Gicon_theme_signals.icon_theme_signals obj

  method theme_name = Icon_theme.get_theme_name obj
  method set_theme_name v = Icon_theme.set_theme_name obj v

  method add_resource_path : string -> unit = fun path -> (Icon_theme.add_resource_path obj path)

  method add_search_path : string -> unit = fun path -> (Icon_theme.add_search_path obj path)

  method get_icon_names : unit -> unit = fun () -> (Icon_theme.get_icon_names obj )

  method get_icon_sizes : string -> unit = fun icon_name -> (Icon_theme.get_icon_sizes obj icon_name)

  method get_resource_path : unit -> unit = fun () -> (Icon_theme.get_resource_path obj )

  method get_search_path : unit -> unit = fun () -> (Icon_theme.get_search_path obj )

  method has_icon : string -> bool = fun icon_name -> (Icon_theme.has_icon obj icon_name)

    method as_icon_theme = obj
end

