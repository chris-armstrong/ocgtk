(* GENERATED CODE - DO NOT EDIT *)
(* Filter: Filter *)

(** Describes the filtering to be performed by a
    {{!Ocgtk.Raw.Filter_list_model}[Gtk.FilterListModel]}.

    The model will use the filter to determine if it should include items or not
    by calling {{!Ocgtk.Raw.Filter.val-match_}[Gtk.Filter.match]} for each item
    and only keeping the ones that the function returns true for.

    Filters may change what items they match through their lifetime. In that
    case, they will emit the
    {{!Ocgtk.Raw.Filter.val-on_changed}[Gtk.Filter::changed]} signal to notify
    that previous filter results are no longer valid and that items should be
    checked again via {{!Ocgtk.Raw.Filter.val-match_}[Gtk.Filter.match]}.

    GTK provides various pre-made filter implementations for common filtering
    operations. These filters often include properties that can be linked to
    various widgets to easily allow searches.

    However, in particular for large lists or complex search methods, it is also
    possible to subclass [GtkFilter] and provide one's own filter.

    The class built on this module is in {!Ocgtk.Filter}. *)

type t = [ `filter | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_filter_get_type"

(* Methods *)

external match_ : t -> [ `object_ ] Gobject.obj -> bool = "ml_gtk_filter_match"
(** Checks if the given [item] is matched by the filter or not. *)

external get_strictness : t -> Ocgtk_enums.filtermatch
  = "ml_gtk_filter_get_strictness"
(** Gets the known strictness of a filter.

    If the strictness is not known,
    {{!Ocgtk.Enums.type-filtermatch.constructor-SOME}[Gtk.FilterMatch.some]} is
    returned.

    This value may change after emission of the
    {{!Ocgtk.Raw.Filter.val-on_changed}[Gtk.Filter::changed]} signal.

    This function is meant purely for optimization purposes. Filters can choose
    to omit implementing it, but [GtkFilterListModel] uses it. *)

external changed : t -> Ocgtk_enums.filterchange -> unit
  = "ml_gtk_filter_changed"
(** Notifies all users of the filter that it has changed.

    This emits the {{!Ocgtk.Raw.Filter.val-on_changed}[Gtk.Filter::changed]}
    signal. Users of the filter should then check items again via
    {{!Ocgtk.Raw.Filter.val-match_}[Gtk.Filter.match]}.

    Depending on the [change] parameter, not all items need to be changed, but
    only some. Refer to the {{!Ocgtk.Enums.type-filterchange}[Gtk.FilterChange]}
    documentation for details.

    This function is intended for implementers of [GtkFilter] subclasses and
    should not be called from other functions. *)

let on_changed ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let change =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Ocgtk_enums.filterchange_of_int (Gobject.Value.get_enum_int v)
        in
        callback ~change)
  in
  Gobject.Signal.connect obj ~name:"changed" ~callback:closure
    ~after:(Option.value after ~default:false)
