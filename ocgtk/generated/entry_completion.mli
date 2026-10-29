(** [GtkEntryCompletion] is an auxiliary object to provide completion
    functionality for [GtkEntry].

    Its methods, signals and properties are on {!class-type-entry_completion_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Entry_completion}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [EntryCompletion].}

    Implements:
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Cell_layout.class-type-cell_layout_t}Ocgtk.Cell_layout}

    [GtkEntryCompletion] is an auxiliary object to provide completion
    functionality for [GtkEntry].

    It implements the
    {{!Ocgtk.Cell_layout.class-type-cell_layout_t}[Gtk.CellLayout]} interface,
    to allow the user to add extra cells to the [GtkTreeView] with completion
    matches.

    “Completion functionality” means that when the user modifies the text in the
    entry, [GtkEntryCompletion] checks which rows in the model match the current
    content of the entry, and displays a list of matches. By default, the
    matching is done by comparing the entry text case-insensitively against the
    text column of the model (see
    {{!Ocgtk.Entry_completion.class-type-entry_completion_t.method-set_text_column}
     [Gtk.EntryCompletion.set_text_column]}), but this can be overridden with a
    custom match function (see [Gtk.EntryCompletion.set_match_func]).

    When the user selects a completion, the content of the entry is updated. By
    default, the content of the entry is replaced by the text column of the
    model, but this can be overridden by connecting to the
    [Gtk.EntryCompletion::match-selected] signal and updating the entry in the
    signal handler. Note that you should return [true] from the signal handler
    to suppress the default behaviour.

    To add completion functionality to an entry, use
    {{!Ocgtk.Entry.class-type-entry_t.method-set_completion}[Gtk.Entry.set_completion]}.

    [GtkEntryCompletion] uses a
    {{!Ocgtk.Tree_model_filter.class-type-tree_model_filter_t}[Gtk.TreeModelFilter]}
    model to represent the subset of the entire model that is currently
    matching. While the [GtkEntryCompletion] signals
    [Gtk.EntryCompletion::match-selected] and
    [Gtk.EntryCompletion::cursor-on-match] take the original model and an iter
    pointing to that model as arguments, other callbacks and signals (such as
    [GtkCellLayoutDataFunc] or [Gtk.CellArea::apply-attributes)] will generally
    take the filter model as argument. As long as you are only calling
    [Gtk.TreeModel.get], this will make no difference to you. If for some
    reason, you need the original model, use
    {{!Ocgtk.Tree_model_filter.class-type-tree_model_filter_t.method-get_model}[Gtk.TreeModelFilter.get_model]}.
    Don’t forget to use [Gtk.TreeModelFilter.convert_iter_to_child_iter] to
    obtain a matching iter. *)
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

      If no row matches [key], [None] will be returned. Note that a text column
      must have been set for this function to work, see
      [Gtk.EntryCompletion.set_text_column] for details. *)

  method get_completion_prefix : unit -> string option
  (** Get the original text entered by the user that triggered the completion or
      [None] if there’s no completion ongoing. *)

  method get_entry : unit -> Widget.widget_t
  (** Gets the entry [completion] has been attached to. *)

  method get_inline_completion : unit -> bool
  (** Returns whether the common prefix of the possible completions should be
      automatically inserted in the entry. *)

  method get_inline_selection : unit -> bool
  (** Returns [true] if inline-selection mode is turned on. *)

  method get_minimum_key_length : unit -> int
  (** Returns the minimum key length as set for [completion]. *)

  method get_model : unit -> Tree_model.tree_model_t option
  (** Returns the model the [GtkEntryCompletion] is using as data source.

      Returns [None] if the model is unset. *)

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
      the new model. If model is [None], then it will unset the model. *)

  method set_popup_completion : bool -> unit
  (** Sets whether the completions should be presented in a popup window. *)

  method set_popup_set_width : bool -> unit
  (** Sets whether the completion popup window will be resized to be the same
      width as the entry. *)

  method set_popup_single_match : bool -> unit
  (** Sets whether the completion popup window will appear even if there is only
      a single match.

      You may want to set this to [false] if you are using
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

class entry_completion : Raw.Entry_completion.t -> entry_completion_t
(** Wraps a raw handle of {!Ocgtk.Raw.Entry_completion.t}. *)

(** {1:description Description}

    [GtkEntryCompletion] is an auxiliary object to provide completion
    functionality for [GtkEntry].

    It implements the
    {{!Ocgtk.Cell_layout.class-type-cell_layout_t}[Gtk.CellLayout]} interface,
    to allow the user to add extra cells to the [GtkTreeView] with completion
    matches.

    “Completion functionality” means that when the user modifies the text in the
    entry, [GtkEntryCompletion] checks which rows in the model match the current
    content of the entry, and displays a list of matches. By default, the
    matching is done by comparing the entry text case-insensitively against the
    text column of the model (see
    {{!Ocgtk.Entry_completion.class-type-entry_completion_t.method-set_text_column}
     [Gtk.EntryCompletion.set_text_column]}), but this can be overridden with a
    custom match function (see [Gtk.EntryCompletion.set_match_func]).

    When the user selects a completion, the content of the entry is updated. By
    default, the content of the entry is replaced by the text column of the
    model, but this can be overridden by connecting to the
    [Gtk.EntryCompletion::match-selected] signal and updating the entry in the
    signal handler. Note that you should return [true] from the signal handler
    to suppress the default behaviour.

    To add completion functionality to an entry, use
    {{!Ocgtk.Entry.class-type-entry_t.method-set_completion}[Gtk.Entry.set_completion]}.

    [GtkEntryCompletion] uses a
    {{!Ocgtk.Tree_model_filter.class-type-tree_model_filter_t}[Gtk.TreeModelFilter]}
    model to represent the subset of the entire model that is currently
    matching. While the [GtkEntryCompletion] signals
    [Gtk.EntryCompletion::match-selected] and
    [Gtk.EntryCompletion::cursor-on-match] take the original model and an iter
    pointing to that model as arguments, other callbacks and signals (such as
    [GtkCellLayoutDataFunc] or [Gtk.CellArea::apply-attributes)] will generally
    take the filter model as argument. As long as you are only calling
    [Gtk.TreeModel.get], this will make no difference to you. If for some
    reason, you need the original model, use
    {{!Ocgtk.Tree_model_filter.class-type-tree_model_filter_t.method-get_model}[Gtk.TreeModelFilter.get_model]}.
    Don’t forget to use [Gtk.TreeModelFilter.convert_iter_to_child_iter] to
    obtain a matching iter. *)

(** {1:constructors Constructors} *)

val new_ : unit -> entry_completion_t
(** Creates a new [GtkEntryCompletion] object. *)

val new_with_area : Cell_area.cell_area_t -> entry_completion_t
(** Creates a new [GtkEntryCompletion] object using the specified [area].

    The [GtkCellArea] is used to layout cells in the underlying
    [GtkTreeViewColumn] for the drop-down menu. *)
