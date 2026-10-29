class type combo_box_text_t = object
  inherit Combo_box.combo_box_t

  (** {2:methods Methods} *)

  method append : string option -> string -> unit
  (** Appends [text] to the list of strings stored in [combo_box].

      If [id] is non-[None] then it is used as the ID of the row.

      This is the same as calling [Gtk.ComboBoxText.insert] with a position of
      -1. *)

  method append_text : string -> unit
  (** Appends [text] to the list of strings stored in [combo_box].

      This is the same as calling [Gtk.ComboBoxText.insert_text] with a position
      of -1. *)

  method get_active_text : unit -> string option
  (** Returns the currently active string in [combo_box].

      If no row is currently selected, [None] is returned. If [combo_box]
      contains an entry, this function will return its contents (which will not
      necessarily be an item from the list). *)

  method insert : int -> string option -> string -> unit
  (** Inserts [text] at [position] in the list of strings stored in [combo_box].

      If [id] is non-[None] then it is used as the ID of the row. See
      [Gtk.ComboBox:id-column].

      If [position] is negative then [text] is appended. *)

  method insert_text : int -> string -> unit
  (** Inserts [text] at [position] in the list of strings stored in [combo_box].

      If [position] is negative then [text] is appended.

      This is the same as calling [Gtk.ComboBoxText.insert] with a [None] ID
      string. *)

  method prepend : string option -> string -> unit
  (** Prepends [text] to the list of strings stored in [combo_box].

      If [id] is non-[None] then it is used as the ID of the row.

      This is the same as calling [Gtk.ComboBoxText.insert] with a position of
      0. *)

  method prepend_text : string -> unit
  (** Prepends [text] to the list of strings stored in [combo_box].

      This is the same as calling [Gtk.ComboBoxText.insert_text] with a position
      of 0. *)

  method remove : int -> unit
  (** Removes the string at [position] from [combo_box]. *)

  method remove_all : unit -> unit
  (** Removes all the text entries from the combo box. *)

  (** {2:conversions Conversions} *)

  method as_combo_box_text : Raw.Combo_box_text.t
end

(* High-level class for ComboBoxText *)
class combo_box_text (obj : Raw.Combo_box_text.t) : combo_box_text_t =
  object (self)
    inherit Combo_box.combo_box (obj :> Raw.Combo_box.t)

    method append : string option -> string -> unit =
      fun id text -> Raw.Combo_box_text.append obj id text

    method append_text : string -> unit =
      fun text -> Raw.Combo_box_text.append_text obj text

    method get_active_text : unit -> string option =
      fun () -> Raw.Combo_box_text.get_active_text obj

    method insert : int -> string option -> string -> unit =
      fun position id text -> Raw.Combo_box_text.insert obj position id text

    method insert_text : int -> string -> unit =
      fun position text -> Raw.Combo_box_text.insert_text obj position text

    method prepend : string option -> string -> unit =
      fun id text -> Raw.Combo_box_text.prepend obj id text

    method prepend_text : string -> unit =
      fun text -> Raw.Combo_box_text.prepend_text obj text

    method remove : int -> unit =
      fun position -> Raw.Combo_box_text.remove obj position

    method remove_all : unit -> unit =
      fun () -> Raw.Combo_box_text.remove_all obj

    method as_combo_box_text = obj
  end

let new_ () : combo_box_text_t = new combo_box_text (Raw.Combo_box_text.new_ ())

let new_with_entry () : combo_box_text_t =
  new combo_box_text (Raw.Combo_box_text.new_with_entry ())
