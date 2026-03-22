(* Signal class defined in gcheck_button_signals.ml *)

class type check_button_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Gcheck_button_signals.check_button_signals
    method get_active : unit -> bool
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_inconsistent : unit -> bool
    method get_label : unit -> string option
    method get_use_underline : unit -> bool
    method set_active : bool -> unit
    method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_group : check_button_t option -> unit
    method set_inconsistent : bool -> unit
    method set_label : string option -> unit
    method set_use_underline : bool -> unit
    method as_check_button : Check_button.t
end

(* High-level class for CheckButton *)
class check_button (obj : Check_button.t) : check_button_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit Gcheck_button_signals.check_button_signals obj

  method get_active : unit -> bool =
    fun () ->
      (Check_button.get_active obj)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Check_button.get_child obj)

  method get_inconsistent : unit -> bool =
    fun () ->
      (Check_button.get_inconsistent obj)

  method get_label : unit -> string option =
    fun () ->
      (Check_button.get_label obj)

  method get_use_underline : unit -> bool =
    fun () ->
      (Check_button.get_use_underline obj)

  method set_active : bool -> unit =
    fun setting ->
      (Check_button.set_active obj setting)

  method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Check_button.set_child obj child)

  method set_group : check_button_t option -> unit =
    fun group ->
      let group = Option.map (fun (c) -> c#as_check_button) group in
      (Check_button.set_group obj group)

  method set_inconsistent : bool -> unit =
    fun inconsistent ->
      (Check_button.set_inconsistent obj inconsistent)

  method set_label : string option -> unit =
    fun label ->
      (Check_button.set_label obj label)

  method set_use_underline : bool -> unit =
    fun setting ->
      (Check_button.set_use_underline obj setting)

    method as_check_button = obj
end

let new_ () : check_button_t =
  new check_button (Check_button.new_ ())

let new_with_label (label : string option) : check_button_t =
  new check_button (Check_button.new_with_label label)

let new_with_mnemonic (label : string option) : check_button_t =
  new check_button (Check_button.new_with_mnemonic label)

