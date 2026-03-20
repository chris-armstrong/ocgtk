class type single_selection_t = object
    method get_autoselect : unit -> bool
    method get_can_unselect : unit -> bool
    method get_model : unit -> Ocgtk_gio.Gio.list_model_t option
    method get_selected : unit -> int
    method set_autoselect : bool -> unit
    method set_can_unselect : bool -> unit
    method set_model : Ocgtk_gio.Gio.list_model_t option -> unit
    method set_selected : int -> unit
    method n_items : int
    method as_single_selection : Single_selection.t
end

class single_selection : Single_selection.t -> single_selection_t

