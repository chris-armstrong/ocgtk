class type entry_completion_t = object
  inherit Buildable.buildable_t
  inherit Cell_layout.cell_layout_t

  (** {2:signals Signals} *)

  method on_insert_prefix :
    ?after:bool ->
    callback:(prefix:string -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the inline autocompletion is triggered.

      The default behaviour is to make the entry display the whole prefix and
      select the newly inserted part.

      Applications may connect to this signal in order to insert only a smaller
      part of the [prefix] into the entry - e.g. the entry used in the
      [GtkFileChooser] inserts only the part of the prefix up to the next '/'.
  *)

  method on_no_matches :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the filter model has zero number of rows in
      completion_complete method.

      In other words when [GtkEntryCompletion] is out of suggestions. *)

  (** {2:methods Methods} *)

  method complete : unit -> unit
  (** Requests a completion operation, or in other words a refiltering of the
      current list with completions, using the current key.

      The completion list view will be updated accordingly. *)

  method compute_prefix : string -> string option
  (** Computes the common prefix that is shared by all rows in [completion] that
      start with [key].

      If no row matches [key], [NULL] will be returned. Note that a text column
      must have been set for this function to work, see
      [Gtk.EntryCompletion.set_text_column] for details. *)

  method get_completion_prefix : unit -> string option
  (** Get the original text entered by the user that triggered the completion or
      [NULL] if there’s no completion ongoing. *)

  method get_entry : unit -> Widget.widget_t
  (** Gets the entry [completion] has been attached to. *)

  method get_inline_completion : unit -> bool
  (** Returns whether the common prefix of the possible completions should be
      automatically inserted in the entry. *)

  method get_inline_selection : unit -> bool
  (** Returns [TRUE] if inline-selection mode is turned on. *)

  method get_minimum_key_length : unit -> int
  (** Returns the minimum key length as set for [completion]. *)

  method get_model : unit -> Tree_model.tree_model_t option
  (** Returns the model the [GtkEntryCompletion] is using as data source.

      Returns [NULL] if the model is unset. *)

  method get_popup_completion : unit -> bool
  (** Returns whether the completions should be presented in a popup window. *)

  method get_popup_set_width : unit -> bool
  (** Returns whether the completion popup window will be resized to the width
      of the entry. *)

  method get_popup_single_match : unit -> bool
  (** Returns whether the completion popup window will appear even if there is
      only a single match. *)

  method get_text_column : unit -> int
  (** Returns the column in the model of [completion] to get strings from. *)

  method insert_prefix : unit -> unit
  (** Requests a prefix insertion. *)

  method set_inline_completion : bool -> unit
  (** Sets whether the common prefix of the possible completions should be
      automatically inserted in the entry. *)

  method set_inline_selection : bool -> unit
  (** Sets whether it is possible to cycle through the possible completions
      inside the entry. *)

  method set_minimum_key_length : int -> unit
  (** Requires the length of the search key for [completion] to be at least
      [length].

      This is useful for long lists, where completing using a small key takes a
      lot of time and will come up with meaningless results anyway (ie, a too
      large dataset). *)

  method set_model : Tree_model.tree_model_t option -> unit
  (** Sets the model for a [GtkEntryCompletion].

      If [completion] already has a model set, it will remove it before setting
      the new model. If model is [NULL], then it will unset the model. *)

  method set_popup_completion : bool -> unit
  (** Sets whether the completions should be presented in a popup window. *)

  method set_popup_set_width : bool -> unit
  (** Sets whether the completion popup window will be resized to be the same
      width as the entry. *)

  method set_popup_single_match : bool -> unit
  (** Sets whether the completion popup window will appear even if there is only
      a single match.

      You may want to set this to [FALSE] if you are using
      [Gtk.EntryCompletion:inline-completion]. *)

  method set_text_column : int -> unit
  (** Convenience function for setting up the most used case of this code: a
      completion list with just strings.

      This function will set up [completion] to have a list displaying all (and
      just) strings in the completion list, and to get those strings from
      [column] in the model of [completion].

      This functions creates and adds a [GtkCellRendererText] for the selected
      column. If you need to set the text column, but don't want the cell
      renderer, use g_object_set() to set the [Gtk.EntryCompletion:text-column]
      property directly. *)

  (** {2:properties Properties} *)

  method cell_area : Cell_area.cell_area_t
  (** The [GtkCellArea] used to layout cell renderers in the treeview column.

      If no area is specified when creating the entry completion with
      [Gtk.EntryCompletion.new_with_area], a horizontally oriented
      [Gtk.CellAreaBox] will be used. *)

  (** {2:conversions Conversions} *)

  method as_entry_completion : Raw.Entry_completion.t
end

(* High-level class for EntryCompletion *)
class entry_completion (obj : Raw.Entry_completion.t) : entry_completion_t =
  object (self)
    inherit Buildable.buildable (Raw.Buildable.from_gobject obj)
    inherit Cell_layout.cell_layout (Raw.Cell_layout.from_gobject obj)

    method on_insert_prefix ?(after = false) ~callback () =
      Raw.Entry_completion.on_insert_prefix ~after self#as_entry_completion
        ~callback

    method on_no_matches ?(after = false) ~callback () =
      Raw.Entry_completion.on_no_matches ~after self#as_entry_completion
        ~callback

    method complete : unit -> unit = fun () -> Raw.Entry_completion.complete obj

    method compute_prefix : string -> string option =
      fun key -> Raw.Entry_completion.compute_prefix obj key

    method get_completion_prefix : unit -> string option =
      fun () -> Raw.Entry_completion.get_completion_prefix obj

    method get_entry : unit -> Widget.widget_t =
      fun () -> new Widget.widget (Raw.Entry_completion.get_entry obj)

    method get_inline_completion : unit -> bool =
      fun () -> Raw.Entry_completion.get_inline_completion obj

    method get_inline_selection : unit -> bool =
      fun () -> Raw.Entry_completion.get_inline_selection obj

    method get_minimum_key_length : unit -> int =
      fun () -> Raw.Entry_completion.get_minimum_key_length obj

    method get_model : unit -> Tree_model.tree_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Tree_model.tree_model ret)
          (Raw.Entry_completion.get_model obj)

    method get_popup_completion : unit -> bool =
      fun () -> Raw.Entry_completion.get_popup_completion obj

    method get_popup_set_width : unit -> bool =
      fun () -> Raw.Entry_completion.get_popup_set_width obj

    method get_popup_single_match : unit -> bool =
      fun () -> Raw.Entry_completion.get_popup_single_match obj

    method get_text_column : unit -> int =
      fun () -> Raw.Entry_completion.get_text_column obj

    method insert_prefix : unit -> unit =
      fun () -> Raw.Entry_completion.insert_prefix obj

    method set_inline_completion : bool -> unit =
      fun inline_completion ->
        Raw.Entry_completion.set_inline_completion obj inline_completion

    method set_inline_selection : bool -> unit =
      fun inline_selection ->
        Raw.Entry_completion.set_inline_selection obj inline_selection

    method set_minimum_key_length : int -> unit =
      fun length -> Raw.Entry_completion.set_minimum_key_length obj length

    method set_model : Tree_model.tree_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_tree_model) model in
        Raw.Entry_completion.set_model obj model

    method set_popup_completion : bool -> unit =
      fun popup_completion ->
        Raw.Entry_completion.set_popup_completion obj popup_completion

    method set_popup_set_width : bool -> unit =
      fun popup_set_width ->
        Raw.Entry_completion.set_popup_set_width obj popup_set_width

    method set_popup_single_match : bool -> unit =
      fun popup_single_match ->
        Raw.Entry_completion.set_popup_single_match obj popup_single_match

    method set_text_column : int -> unit =
      fun column -> Raw.Entry_completion.set_text_column obj column

    method cell_area =
      new Cell_area.cell_area (Raw.Entry_completion.get_cell_area obj)

    method as_entry_completion = obj
  end

let new_ () : entry_completion_t =
  new entry_completion (Raw.Entry_completion.new_ ())

let new_with_area (area : Cell_area.cell_area_t) : entry_completion_t =
  let area = area#as_cell_area in
  let obj_ = Raw.Entry_completion.new_with_area area in
  new entry_completion obj_
