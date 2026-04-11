(* Signal handlers for CellRenderer *)
class cell_renderer_signals (obj : Cell_renderer.t) =
  object
    method on_editing_canceled ~callback =
      Gobject.Signal.connect_simple obj ~name:"editing-canceled" ~callback
        ~after:false
    (** This signal gets emitted when the user cancels the process of editing a
        cell. For example, an editable cell renderer could be written to cancel
        editing when the user presses Escape.

        See also: gtk_cell_renderer_stop_editing(). *)
  end
