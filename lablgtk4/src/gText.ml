(* Phase 5.3: High-Level Text Widget Wrappers - Implementation
 *
 * This provides OCaml-friendly class-based API for GTK text widgets.
 *)

(* ========================================================================= *)
(* Text Buffer *)
(* ========================================================================= *)

class buffer (buf : GtkTextBuffer.t) = object (self)
  method as_buffer = buf

  method text =
    GtkTextBuffer.get_text buf

  method set_text text =
    GtkTextBuffer.set_text buf text

  method line_count =
    GtkTextBuffer.get_line_count buf

  method char_count =
    GtkTextBuffer.get_char_count buf

  method modified =
    GtkTextBuffer.get_modified buf

  method set_modified flag =
    GtkTextBuffer.set_modified buf flag

  (* Iterator Access *)

  method start_iter =
    GtkTextBufferIter.get_start_iter buf

  method end_iter =
    GtkTextBufferIter.get_end_iter buf

  method iter_at_offset offset =
    GtkTextBufferIter.get_iter_at_offset buf offset

  method iter_at_line line =
    GtkTextBufferIter.get_iter_at_line buf line

  (* Text Operations *)

  method insert ~iter text =
    GtkTextBufferIter.insert buf iter text

  method delete ~start ~stop =
    GtkTextBufferIter.delete buf start stop

  method get_text ~start ~stop ~include_hidden =
    GtkTextBufferIter.get_text_range buf start stop include_hidden

  (* Tag Operations *)

  method apply_tag tag ~start ~stop =
    GtkTextBufferIter.apply_tag buf tag start stop

  method remove_tag tag ~start ~stop =
    GtkTextBufferIter.remove_tag buf tag start stop
end

let buffer ?text () =
  let buf = GtkTextBuffer.new_ () in
  (match text with
   | Some t -> GtkTextBuffer.set_text buf t
   | None -> ());
  new buffer buf

(* ========================================================================= *)
(* Text View *)
(* ========================================================================= *)

class view obj = object (self)
  inherit GObj.widget obj

  method buffer =
    new buffer (GtkTextView.get_buffer obj)

  method set_buffer (buf : buffer) =
    GtkTextView.set_buffer obj buf#as_buffer

  method editable =
    GtkTextView.get_editable obj

  method set_editable flag =
    GtkTextView.set_editable obj flag

  method cursor_visible =
    GtkTextView.get_cursor_visible obj

  method set_cursor_visible flag =
    GtkTextView.set_cursor_visible obj flag

  method set_wrap_mode mode =
    GtkTextView.set_wrap_mode obj mode

  method wrap_mode =
    GtkTextView.get_wrap_mode obj

  method set_left_margin margin =
    GtkTextView.set_left_margin obj margin

  method left_margin =
    GtkTextView.get_left_margin obj

  method set_right_margin margin =
    GtkTextView.set_right_margin obj margin

  method right_margin =
    GtkTextView.get_right_margin obj

  method set_monospace flag =
    GtkTextView.set_monospace obj flag

  method monospace =
    GtkTextView.get_monospace obj
end

let view ?buffer ?editable ?cursor_visible ?wrap_mode ?left_margin ?right_margin ?monospace ?packing ?show () =
  let tv = GtkTextView.new_ () in
  let widget = new view tv in

  (match buffer with Some b -> widget#set_buffer b | None -> ());
  (match editable with Some e -> widget#set_editable e | None -> ());
  (match cursor_visible with Some v -> widget#set_cursor_visible v | None -> ());
  (match wrap_mode with Some m -> widget#set_wrap_mode m | None -> ());
  (match left_margin with Some m -> widget#set_left_margin m | None -> ());
  (match right_margin with Some m -> widget#set_right_margin m | None -> ());
  (match monospace with Some m -> widget#set_monospace m | None -> ());
  (match packing with Some f -> f (widget :> GObj.widget) | None -> ());
  if show = Some true then widget#show ();
  widget

(* ========================================================================= *)
(* Text Tags *)
(* ========================================================================= *)

class tag (t : GtkTextTag.t) = object (self)
  method as_tag = t
end

let tag ?name () =
  let t = match name with
    | Some n -> GtkTextTag.new_with_name n
    | None -> GtkTextTag.new_ ()
  in
  new tag t

(* ========================================================================= *)
(* Text Tag Table *)
(* ========================================================================= *)

class tag_table (tt : GtkTextTagTable.t) = object (self)
  method as_tag_table = tt

  method add (tag : tag) =
    GtkTextTagTable.add tt tag#as_tag

  method remove (tag : tag) =
    GtkTextTagTable.remove tt tag#as_tag

  method lookup name =
    match GtkTextTagTable.lookup tt name with
    | Some t -> Some (new tag t)
    | None -> None

  method size =
    GtkTextTagTable.get_size tt
end

let tag_table () =
  let tt = GtkTextTagTable.new_ () in
  new tag_table tt
