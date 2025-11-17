(* Phase 5.3: High-Level Text Widget Wrappers
 *
 * This module provides OCaml-friendly class-based API for GTK text widgets.
 * It wraps the generated low-level bindings in GtkTextView, GtkTextBuffer, etc.
 *)

(** {2 Text Buffer} *)

(** Object-oriented wrapper for GtkTextBuffer *)
class buffer : GtkTextBuffer.t -> object
  method as_buffer : GtkTextBuffer.t

  (** Get all text in the buffer *)
  method text : string

  (** Set all text in the buffer *)
  method set_text : string -> unit

  (** Get number of lines in buffer *)
  method line_count : int

  (** Get number of characters in buffer *)
  method char_count : int

  (** Get modified flag *)
  method modified : bool

  (** Set modified flag *)
  method set_modified : bool -> unit

  (** {3 Iterator Access} *)

  (** Get iterator at start of buffer *)
  method start_iter : GtkTextIter.t

  (** Get iterator at end of buffer *)
  method end_iter : GtkTextIter.t

  (** Get iterator at character offset *)
  method iter_at_offset : int -> GtkTextIter.t

  (** Get iterator at line *)
  method iter_at_line : int -> GtkTextIter.t

  (** {3 Text Operations} *)

  (** Insert text at iterator *)
  method insert : iter:GtkTextIter.t -> string -> unit

  (** Delete text between iterators *)
  method delete : start:GtkTextIter.t -> stop:GtkTextIter.t -> unit

  (** Get text between iterators *)
  method get_text : start:GtkTextIter.t -> stop:GtkTextIter.t -> include_hidden:bool -> string

  (** {3 Tag Operations} *)

  (** Apply tag to range *)
  method apply_tag : GtkTextTag.t -> start:GtkTextIter.t -> stop:GtkTextIter.t -> unit

  (** Remove tag from range *)
  method remove_tag : GtkTextTag.t -> start:GtkTextIter.t -> stop:GtkTextIter.t -> unit
end

(** Create a text buffer *)
val buffer : ?text:string -> unit -> buffer

(** {2 Text View} *)

(** Object-oriented wrapper for GtkTextView *)
class view : Gtk.Widget.t -> object
  inherit GObj.widget

  (** Get the text buffer *)
  method buffer : buffer

  (** Set the text buffer *)
  method set_buffer : buffer -> unit

  (** Get editable flag *)
  method editable : bool

  (** Set editable flag *)
  method set_editable : bool -> unit

  (** Get cursor visible flag *)
  method cursor_visible : bool

  (** Set cursor visible flag *)
  method set_cursor_visible : bool -> unit

  (** Set wrap mode (0=none, 1=char, 2=word, 3=word_char) *)
  method set_wrap_mode : int -> unit

  (** Get wrap mode *)
  method wrap_mode : int

  (** Set left margin *)
  method set_left_margin : int -> unit

  (** Get left margin *)
  method left_margin : int

  (** Set right margin *)
  method set_right_margin : int -> unit

  (** Get right margin *)
  method right_margin : int

  (** Set monospace flag *)
  method set_monospace : bool -> unit

  (** Get monospace flag *)
  method monospace : bool
end

(** Create a text view *)
val view :
  ?buffer:buffer ->
  ?editable:bool ->
  ?cursor_visible:bool ->
  ?wrap_mode:int ->
  ?left_margin:int ->
  ?right_margin:int ->
  ?monospace:bool ->
  ?packing:(GObj.widget -> unit) ->
  ?show:bool ->
  unit ->
  view

(** {2 Text Tags} *)

(** Object-oriented wrapper for GtkTextTag *)
class tag : GtkTextTag.t -> object
  method as_tag : GtkTextTag.t
end

(** Create a text tag *)
val tag : ?name:string -> unit -> tag

(** {2 Text Tag Table} *)

(** Object-oriented wrapper for GtkTextTagTable *)
class tag_table : GtkTextTagTable.t -> object
  method as_tag_table : GtkTextTagTable.t

  (** Add a tag to the table *)
  method add : tag -> unit

  (** Remove a tag from the table *)
  method remove : tag -> unit

  (** Lookup a tag by name *)
  method lookup : string -> tag option

  (** Get number of tags in table *)
  method size : int
end

(** Create a text tag table *)
val tag_table : unit -> tag_table
