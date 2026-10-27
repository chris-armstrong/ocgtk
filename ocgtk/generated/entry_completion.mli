(** [GtkEntryCompletion] is an auxiliary object to provide completion
    functionality for [GtkEntry].

    It implements the [Gtk.CellLayout] interface, to allow the user to add extra
    cells to the [GtkTreeView] with completion matches.

    “Completion functionality” means that when the user modifies the text in the
    entry, [GtkEntryCompletion] checks which rows in the model match the current
    content of the entry, and displays a list of matches. By default, the
    matching is done by comparing the entry text case-insensitively against the
    text column of the model (see [Gtk.EntryCompletion.set_text_column]), but
    this can be overridden with a custom match function (see
    [Gtk.EntryCompletion.set_match_func]).

    When the user selects a completion, the content of the entry is updated. By
    default, the content of the entry is replaced by the text column of the
    model, but this can be overridden by connecting to the
    [Gtk.EntryCompletion::match-selected] signal and updating the entry in the
    signal handler. Note that you should return [TRUE] from the signal handler
    to suppress the default behaviour.

    To add completion functionality to an entry, use [Gtk.Entry.set_completion].

    [GtkEntryCompletion] uses a [Gtk.TreeModelFilter] model to represent the
    subset of the entire model that is currently matching. While the
    [GtkEntryCompletion] signals [Gtk.EntryCompletion::match-selected] and
    [Gtk.EntryCompletion::cursor-on-match] take the original model and an iter
    pointing to that model as arguments, other callbacks and signals (such as
    [GtkCellLayoutDataFunc] or [Gtk.CellArea::apply-attributes)] will generally
    take the filter model as argument. As long as you are only calling
    [Gtk.TreeModel.get], this will make no difference to you. If for some
    reason, you need the original model, use [Gtk.TreeModelFilter.get_model].
    Don’t forget to use [Gtk.TreeModelFilter.convert_iter_to_child_iter] to
    obtain a matching iter.

    Its methods, signals and properties are on {!class-type-entry_completion_t}.
    The functions it is built on are in {!Ocgtk.Raw.Entry_completion}. *)

(** The methods, signals and properties of a [GtkEntryCompletion]. *)
class type entry_completion_t = object
  inherit Buildable.buildable_t
  inherit Cell_area_and__cell_area_context_and__cell_layout.cell_layout_t

  method on_insert_prefix :
    ?after:bool ->
    callback:(prefix:string -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_no_matches :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method complete : unit -> unit
  method compute_prefix : string -> string option
  method get_completion_prefix : unit -> string option

  method get_entry :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_inline_completion : unit -> bool
  method get_inline_selection : unit -> bool
  method get_minimum_key_length : unit -> int
  method get_model : unit -> Tree_model.tree_model_t option
  method get_popup_completion : unit -> bool
  method get_popup_set_width : unit -> bool
  method get_popup_single_match : unit -> bool
  method get_text_column : unit -> int
  method insert_prefix : unit -> unit
  method set_inline_completion : bool -> unit
  method set_inline_selection : bool -> unit
  method set_minimum_key_length : int -> unit
  method set_model : Tree_model.tree_model_t option -> unit
  method set_popup_completion : bool -> unit
  method set_popup_set_width : bool -> unit
  method set_popup_single_match : bool -> unit
  method set_text_column : int -> unit

  method cell_area :
    Cell_area_and__cell_area_context_and__cell_layout.cell_area_t

  method as_entry_completion : Raw.Entry_completion.t
end

class entry_completion : Raw.Entry_completion.t -> entry_completion_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Entry_completion.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkEntryCompletion], give one already wrapped. *)

val new_ : unit -> entry_completion_t

val new_with_area :
  Cell_area_and__cell_area_context_and__cell_layout.cell_area_t ->
  entry_completion_t
