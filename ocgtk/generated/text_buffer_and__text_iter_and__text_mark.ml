(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type text_buffer_t = object
  (** {2:signals Signals} *)

  method on_begin_user_action :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted at the beginning of a single user-visible operation on a
      [GtkTextBuffer].

      See also: [Gtk.TextBuffer.begin_user_action],
      [Gtk.TextBuffer.insert_interactive],
      [Gtk.TextBuffer.insert_range_interactive],
      [Gtk.TextBuffer.delete_interactive], [Gtk.TextBuffer.backspace],
      [Gtk.TextBuffer.delete_selection]. *)

  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the content of a [GtkTextBuffer] has changed. *)

  method on_end_user_action :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted at the end of a single user-visible operation on the
      [GtkTextBuffer].

      See also: [Gtk.TextBuffer.end_user_action],
      [Gtk.TextBuffer.insert_interactive],
      [Gtk.TextBuffer.insert_range_interactive],
      [Gtk.TextBuffer.delete_interactive], [Gtk.TextBuffer.backspace],
      [Gtk.TextBuffer.delete_selection], [Gtk.TextBuffer.backspace]. *)

  method on_mark_deleted :
    ?after:bool ->
    callback:(mark:text_mark_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted as notification after a [GtkTextMark] is deleted.

      See also: [Gtk.TextBuffer.delete_mark]. *)

  method on_modified_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the modified bit of a [GtkTextBuffer] flips.

      See also: [Gtk.TextBuffer.set_modified]. *)

  method on_paste_done :
    ?after:bool ->
    callback:(clipboard:Ocgdk.Clipboard.clipboard_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted after paste operation has been completed.

      This is useful to properly scroll the view to the end of the pasted text.
      See [Gtk.TextBuffer.paste_clipboard] for more details. *)

  method on_redo :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when a request has been made to redo the previously undone
      operation. *)

  method on_undo :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when a request has been made to undo the previous operation or set
      of operations that have been grouped together. *)

  (** {2:methods Methods} *)

  method add_mark : text_mark_t -> Raw.Text_iter.t -> unit
  (** Adds the mark at position [where].

      The mark must not be added to another buffer, and if its name is not
      [NULL] then there must not be another mark in the buffer with the same
      name.

      Emits the [Gtk.TextBuffer::mark-set] signal as notification of the mark's
      initial placement. *)

  method add_selection_clipboard : Ocgdk.Clipboard.clipboard_t -> unit
  (** Adds [clipboard] to the list of clipboards in which the selection contents
      of [buffer] are available.

      In most cases, [clipboard] will be the [GdkClipboard] returned by
      [Gtk.Widget.get_primary_clipboard] for a view of [buffer]. *)

  method apply_tag :
    Text_tag.text_tag_t -> Raw.Text_iter.t -> Raw.Text_iter.t -> unit
  (** Emits the “apply-tag” signal on [buffer].

      The default handler for the signal applies [tag] to the given range.
      [start] and [end] do not have to be in order. *)

  method apply_tag_by_name :
    string -> Raw.Text_iter.t -> Raw.Text_iter.t -> unit
  (** Emits the “apply-tag” signal on [buffer].

      Calls [Gtk.TextTagTable.lookup] on the buffer’s tag table to get a
      [GtkTextTag], then calls [Gtk.TextBuffer.apply_tag]. *)

  method backspace : Raw.Text_iter.t -> bool -> bool -> bool
  (** Performs the appropriate action as if the user hit the delete key with the
      cursor at the position specified by [iter].

      In the normal case a single character will be deleted, but when combining
      accents are involved, more than one character can be deleted, and when
      precomposed character and accent combinations are involved, less than one
      character will be deleted.

      Because the buffer is modified, all outstanding iterators become invalid
      after calling this function; however, the [iter] will be re-initialized to
      point to the location where text was deleted. *)

  method begin_irreversible_action : unit -> unit
  (** Denotes the beginning of an action that may not be undone.

      This will cause any previous operations in the undo/redo queue to be
      cleared.

      This should be paired with a call to
      [Gtk.TextBuffer.end_irreversible_action] after the irreversible action has
      completed.

      You may nest calls to gtk_text_buffer_begin_irreversible_action() and
      gtk_text_buffer_end_irreversible_action() pairs. *)

  method begin_user_action : unit -> unit
  (** Called to indicate that the buffer operations between here and a call to
      gtk_text_buffer_end_user_action() are part of a single user-visible
      operation.

      The operations between gtk_text_buffer_begin_user_action() and
      gtk_text_buffer_end_user_action() can then be grouped when creating an
      undo stack. [GtkTextBuffer] maintains a count of calls to
      gtk_text_buffer_begin_user_action() that have not been closed with a call
      to gtk_text_buffer_end_user_action(), and emits the “begin-user-action”
      and “end-user-action” signals only for the outermost pair of calls. This
      allows you to build user actions from other user actions.

      The “interactive” buffer mutation functions, such as
      [Gtk.TextBuffer.insert_interactive], automatically call begin/end user
      action around the buffer operations they perform, so there's no need to
      add extra calls if you user action consists solely of a single call to one
      of those functions. *)

  method copy_clipboard : Ocgdk.Clipboard.clipboard_t -> unit
  (** Copies the currently-selected text to a clipboard. *)

  method create_child_anchor :
    Raw.Text_iter.t -> Text_child_anchor.text_child_anchor_t
  (** Creates and inserts a child anchor.

      This is a convenience function which simply creates a child anchor with
      [Gtk.TextChildAnchor.new] and inserts it into the buffer with
      [Gtk.TextBuffer.insert_child_anchor].

      The new anchor is owned by the buffer; no reference count is returned to
      the caller of this function. *)

  method create_mark : string option -> Raw.Text_iter.t -> bool -> text_mark_t
  (** Creates a mark at position [where].

      If [mark_name] is [NULL], the mark is anonymous; otherwise, the mark can
      be retrieved by name using [Gtk.TextBuffer.get_mark]. If a mark has left
      gravity, and text is inserted at the mark’s current location, the mark
      will be moved to the left of the newly-inserted text. If the mark has
      right gravity ([left_gravity] = [FALSE]), the mark will end up on the
      right of newly-inserted text. The standard left-to-right cursor is a mark
      with right gravity (when you type, the cursor stays on the right side of
      the text you’re typing).

      The caller of this function does not own a reference to the returned
      [GtkTextMark], so you can ignore the return value if you like. Marks are
      owned by the buffer and go away when the buffer does.

      Emits the [Gtk.TextBuffer::mark-set] signal as notification of the mark's
      initial placement. *)

  method cut_clipboard : Ocgdk.Clipboard.clipboard_t -> bool -> unit
  (** Copies the currently-selected text to a clipboard, then deletes said text
      if it’s editable. *)

  method delete : Raw.Text_iter.t -> Raw.Text_iter.t -> unit
  (** Deletes text between [start] and [end].

      The order of [start] and [end] is not actually relevant;
      gtk_text_buffer_delete() will reorder them.

      This function actually emits the “delete-range” signal, and the default
      handler of that signal deletes the text. Because the buffer is modified,
      all outstanding iterators become invalid after calling this function;
      however, the [start] and [end] will be re-initialized to point to the
      location where text was deleted. *)

  method delete_interactive : Raw.Text_iter.t -> Raw.Text_iter.t -> bool -> bool
  (** Deletes all editable text in the given range.

      Calls [Gtk.TextBuffer.delete] for each editable sub-range of
      \[[start],[end]). [start] and [end] are revalidated to point to the
      location of the last deleted range, or left untouched if no text was
      deleted. *)

  method delete_mark : text_mark_t -> unit
  (** Deletes [mark], so that it’s no longer located anywhere in the buffer.

      Removes the reference the buffer holds to the mark, so if you haven’t
      called g_object_ref() on the mark, it will be freed. Even if the mark
      isn’t freed, most operations on [mark] become invalid, until it gets added
      to a buffer again with [Gtk.TextBuffer.add_mark]. Use
      [Gtk.TextMark.get_deleted] to find out if a mark has been removed from its
      buffer.

      The [Gtk.TextBuffer::mark-deleted] signal will be emitted as notification
      after the mark is deleted. *)

  method delete_mark_by_name : string -> unit
  (** Deletes the mark named [name]; the mark must exist.

      See [Gtk.TextBuffer.delete_mark] for details. *)

  method delete_selection : bool -> bool -> bool
  (** Deletes the range between the “insert” and “selection_bound” marks, that
      is, the currently-selected text.

      If [interactive] is [TRUE], the editability of the selection will be
      considered (users can’t delete uneditable text). *)

  method end_irreversible_action : unit -> unit
  (** Denotes the end of an action that may not be undone.

      This will cause any previous operations in the undo/redo queue to be
      cleared.

      This should be called after completing modifications to the text buffer
      after [Gtk.TextBuffer.begin_irreversible_action] was called.

      You may nest calls to gtk_text_buffer_begin_irreversible_action() and
      gtk_text_buffer_end_irreversible_action() pairs. *)

  method end_user_action : unit -> unit
  (** Ends a user-visible operation.

      Should be paired with a call to [Gtk.TextBuffer.begin_user_action]. See
      that function for a full explanation. *)

  method get_can_redo : unit -> bool
  (** Gets whether there is a redoable action in the history. *)

  method get_can_undo : unit -> bool
  (** Gets whether there is an undoable action in the history. *)

  method get_char_count : unit -> int
  (** Gets the number of characters in the buffer.

      Note that characters and bytes are not the same, you can’t e.g. expect the
      contents of the buffer in string form to be this many bytes long.

      The character count is cached, so this function is very fast. *)

  method get_enable_undo : unit -> bool
  (** Gets whether the buffer is saving modifications to the buffer to allow for
      undo and redo actions.

      See [Gtk.TextBuffer.begin_irreversible_action] and
      [Gtk.TextBuffer.end_irreversible_action] to create changes to the buffer
      that cannot be undone. *)

  method get_has_selection : unit -> bool
  (** Indicates whether the buffer has some text currently selected. *)

  method get_insert : unit -> text_mark_t
  (** Returns the mark that represents the cursor (insertion point).

      Equivalent to calling [Gtk.TextBuffer.get_mark] to get the mark named
      “insert”, but very slightly more efficient, and involves less typing. *)

  method get_line_count : unit -> int
  (** Obtains the number of lines in the buffer.

      This value is cached, so the function is very fast. *)

  method get_mark : string -> text_mark_t option
  (** Returns the mark named [name] in buffer [buffer], or [NULL] if no such
      mark exists in the buffer. *)

  method get_max_undo_levels : unit -> int
  (** Gets the maximum number of undo levels to perform.

      If 0, unlimited undo actions may be performed. Note that this may have a
      memory usage impact as it requires storing an additional copy of the
      inserted or removed text within the text buffer. *)

  method get_modified : unit -> bool
  (** Indicates whether the buffer has been modified since the last call to
      [Gtk.TextBuffer.set_modified] set the modification flag to [FALSE].

      Used for example to enable a “save” function in a text editor. *)

  method get_selection_bound : unit -> text_mark_t
  (** Returns the mark that represents the selection bound.

      Equivalent to calling [Gtk.TextBuffer.get_mark] to get the mark named
      “selection_bound”, but very slightly more efficient, and involves less
      typing.

      The currently-selected text in [buffer] is the region between the
      “selection_bound” and “insert” marks. If “selection_bound” and “insert”
      are in the same place, then there is no current selection.
      [Gtk.TextBuffer.get_selection_bounds] is another convenient function for
      handling the selection, if you just want to know whether there’s a
      selection and what its bounds are. *)

  method get_selection_content :
    unit -> Ocgdk.Content_provider.content_provider_t
  (** Get a content provider for this buffer.

      It can be used to make the content of [buffer] available in a
      [GdkClipboard], see [Gdk.Clipboard.set_content]. *)

  method get_slice : Raw.Text_iter.t -> Raw.Text_iter.t -> bool -> string
  (** Returns the text in the range \[[start],[end]).

      Excludes undisplayed text (text marked with tags that set the invisibility
      attribute) if [include_hidden_chars] is [FALSE]. The returned string
      includes a 0xFFFC character whenever the buffer contains embedded images,
      so byte and character indexes into the returned string do correspond to
      byte and character indexes into the buffer. Contrast with
      [Gtk.TextBuffer.get_text]. Note that 0xFFFC can occur in normal text as
      well, so it is not a reliable indicator that a paintable or widget is in
      the buffer. *)

  method get_tag_table : unit -> Text_tag_table.text_tag_table_t
  (** Get the [GtkTextTagTable] associated with this buffer. *)

  method get_text : Raw.Text_iter.t -> Raw.Text_iter.t -> bool -> string
  (** Returns the text in the range \[[start],[end]).

      Excludes undisplayed text (text marked with tags that set the invisibility
      attribute) if [include_hidden_chars] is [FALSE]. Does not include
      characters representing embedded images, so byte and character indexes
      into the returned string do not correspond to byte and character indexes
      into the buffer. Contrast with [Gtk.TextBuffer.get_slice]. *)

  method insert : Raw.Text_iter.t -> string -> int -> unit
  (** Inserts [len] bytes of [text] at position [iter].

      If [len] is -1, [text] must be nul-terminated and will be inserted in its
      entirety. Emits the “insert-text” signal; insertion actually occurs in the
      default handler for the signal. [iter] is invalidated when insertion
      occurs (because the buffer contents change), but the default signal
      handler revalidates it to point to the end of the inserted text. *)

  method insert_at_cursor : string -> int -> unit
  (** Inserts [text] in [buffer].

      Simply calls [Gtk.TextBuffer.insert], using the current cursor position as
      the insertion point. *)

  method insert_child_anchor :
    Raw.Text_iter.t -> Text_child_anchor.text_child_anchor_t -> unit
  (** Inserts a child widget anchor into the text buffer at [iter].

      The anchor will be counted as one character in character counts, and when
      obtaining the buffer contents as a string, will be represented by the
      Unicode “object replacement character” 0xFFFC. Note that the “slice”
      variants for obtaining portions of the buffer as a string include this
      character for child anchors, but the “text” variants do not. E.g. see
      [Gtk.TextBuffer.get_slice] and [Gtk.TextBuffer.get_text].

      Consider [Gtk.TextBuffer.create_child_anchor] as a more convenient
      alternative to this function. The buffer will add a reference to the
      anchor, so you can unref it after insertion. *)

  method insert_interactive : Raw.Text_iter.t -> string -> int -> bool -> bool
  (** Inserts [text] in [buffer].

      Like [Gtk.TextBuffer.insert], but the insertion will not occur if [iter]
      is at a non-editable location in the buffer. Usually you want to prevent
      insertions at ineditable locations if the insertion results from a user
      action (is interactive).

      [default_editable] indicates the editability of text that doesn't have a
      tag affecting editability applied to it. Typically the result of
      [Gtk.TextView.get_editable] is appropriate here. *)

  method insert_interactive_at_cursor : string -> int -> bool -> bool
  (** Inserts [text] in [buffer].

      Calls [Gtk.TextBuffer.insert_interactive] at the cursor position.

      [default_editable] indicates the editability of text that doesn't have a
      tag affecting editability applied to it. Typically the result of
      [Gtk.TextView.get_editable] is appropriate here. *)

  method insert_markup : Raw.Text_iter.t -> string -> int -> unit
  (** Inserts the text in [markup] at position [iter].

      [markup] will be inserted in its entirety and must be nul-terminated and
      valid UTF-8. Emits the [Gtk.TextBuffer::insert-text] signal, possibly
      multiple times; insertion actually occurs in the default handler for the
      signal. [iter] will point to the end of the inserted text on return. *)

  method insert_paintable :
    Raw.Text_iter.t -> Ocgdk.Paintable.paintable_t -> unit
  (** Inserts an image into the text buffer at [iter].

      The image will be counted as one character in character counts, and when
      obtaining the buffer contents as a string, will be represented by the
      Unicode “object replacement character” 0xFFFC. Note that the “slice”
      variants for obtaining portions of the buffer as a string include this
      character for paintable, but the “text” variants do not. e.g. see
      [Gtk.TextBuffer.get_slice] and [Gtk.TextBuffer.get_text]. *)

  method insert_range :
    Raw.Text_iter.t -> Raw.Text_iter.t -> Raw.Text_iter.t -> unit
  (** Copies text, tags, and paintables between [start] and [end] and inserts
      the copy at [iter].

      The order of [start] and [end] doesn’t matter.

      Used instead of simply getting/inserting text because it preserves images
      and tags. If [start] and [end] are in a different buffer from [buffer],
      the two buffers must share the same tag table.

      Implemented via emissions of the ::insert-text and ::apply-tag signals, so
      expect those. *)

  method insert_range_interactive :
    Raw.Text_iter.t -> Raw.Text_iter.t -> Raw.Text_iter.t -> bool -> bool
  (** Copies text, tags, and paintables between [start] and [end] and inserts
      the copy at [iter].

      Same as [Gtk.TextBuffer.insert_range], but does nothing if the insertion
      point isn’t editable. The [default_editable] parameter indicates whether
      the text is editable at [iter] if no tags enclosing [iter] affect
      editability. Typically the result of [Gtk.TextView.get_editable] is
      appropriate here. *)

  method move_mark : text_mark_t -> Raw.Text_iter.t -> unit
  (** Moves [mark] to the new location [where].

      Emits the [Gtk.TextBuffer::mark-set] signal as notification of the move.
  *)

  method move_mark_by_name : string -> Raw.Text_iter.t -> unit
  (** Moves the mark named [name] (which must exist) to location [where].

      See [Gtk.TextBuffer.move_mark] for details. *)

  method paste_clipboard :
    Ocgdk.Clipboard.clipboard_t -> Raw.Text_iter.t option -> bool -> unit
  (** Pastes the contents of a clipboard.

      If [override_location] is [NULL], the pasted text will be inserted at the
      cursor position, or the buffer selection will be replaced if the selection
      is non-empty.

      Note: pasting is asynchronous, that is, we’ll ask for the paste data and
      return, and at some point later after the main loop runs, the paste data
      will be inserted. *)

  method place_cursor : Raw.Text_iter.t -> unit
  (** This function moves the “insert” and “selection_bound” marks
      simultaneously.

      If you move them to the same place in two steps with
      [Gtk.TextBuffer.move_mark], you will temporarily select a region in
      between their old and new locations, which can be pretty inefficient since
      the temporarily-selected region will force stuff to be recalculated. This
      function moves them as a unit, which can be optimized. *)

  method redo : unit -> unit
  (** Redoes the next redoable action on the buffer, if there is one. *)

  method remove_all_tags : Raw.Text_iter.t -> Raw.Text_iter.t -> unit
  (** Removes all tags in the range between [start] and [end].

      Be careful with this function; it could remove tags added in code
      unrelated to the code you’re currently writing. That is, using this
      function is probably a bad idea if you have two or more unrelated code
      sections that add tags. *)

  method remove_commit_notify : int -> unit
  (** Removes the [GtkTextBufferCommitNotify] handler previously registered with
      [Gtk.TextBuffer.add_commit_notify].

      This may result in the [user_data_destroy] being called that was passed
      when registering the commit notify functions. *)

  method remove_selection_clipboard : Ocgdk.Clipboard.clipboard_t -> unit
  (** Removes a [GdkClipboard] added with
      [Gtk.TextBuffer.add_selection_clipboard] *)

  method remove_tag :
    Text_tag.text_tag_t -> Raw.Text_iter.t -> Raw.Text_iter.t -> unit
  (** Emits the “remove-tag” signal.

      The default handler for the signal removes all occurrences of [tag] from
      the given range. [start] and [end] don’t have to be in order. *)

  method remove_tag_by_name :
    string -> Raw.Text_iter.t -> Raw.Text_iter.t -> unit
  (** Emits the “remove-tag” signal.

      Calls [Gtk.TextTagTable.lookup] on the buffer’s tag table to get a
      [GtkTextTag], then calls [Gtk.TextBuffer.remove_tag]. *)

  method select_range : Raw.Text_iter.t -> Raw.Text_iter.t -> unit
  (** This function moves the “insert” and “selection_bound” marks
      simultaneously.

      If you move them in two steps with [Gtk.TextBuffer.move_mark], you will
      temporarily select a region in between their old and new locations, which
      can be pretty inefficient since the temporarily-selected region will force
      stuff to be recalculated. This function moves them as a unit, which can be
      optimized. *)

  method set_enable_undo : bool -> unit
  (** Sets whether or not to enable undoable actions in the text buffer.

      Undoable actions in this context are changes to the text content of the
      buffer. Changes to tags and marks are not tracked.

      If enabled, the user will be able to undo the last number of actions up to
      [Gtk.TextBuffer.get_max_undo_levels].

      See [Gtk.TextBuffer.begin_irreversible_action] and
      [Gtk.TextBuffer.end_irreversible_action] to create changes to the buffer
      that cannot be undone. *)

  method set_max_undo_levels : int -> unit
  (** Sets the maximum number of undo levels to perform.

      If 0, unlimited undo actions may be performed. Note that this may have a
      memory usage impact as it requires storing an additional copy of the
      inserted or removed text within the text buffer. *)

  method set_modified : bool -> unit
  (** Used to keep track of whether the buffer has been modified since the last
      time it was saved.

      Whenever the buffer is saved to disk, call
      [gtk_text_buffer_set_modified (@buffer, FALSE)]. When the buffer is
      modified, it will automatically toggle on the modified bit again. When the
      modified bit flips, the buffer emits the
      [Gtk.TextBuffer::modified-changed] signal. *)

  method set_text : string -> int -> unit
  (** Deletes current contents of [buffer], and inserts [text] instead. This is
      automatically marked as an irreversible action in the undo stack. If you
      wish to mark this action as part of a larger undo operation, call
      [TextBuffer.delete] and [TextBuffer.insert] directly instead.

      If [len] is -1, [text] must be nul-terminated. [text] must be valid UTF-8.
  *)

  method undo : unit -> unit
  (** Undoes the last undoable action on the buffer, if there is one. *)

  (** {2:properties Properties} *)

  method cursor_position : int
  (** The position of the insert mark.

      This is an offset from the beginning of the buffer. It is useful for
      getting notified when the cursor moves. *)

  (** {2:conversions Conversions} *)

  method as_text_buffer : Raw.Text_buffer.t
end

and text_iter_t = object
  (** {2:methods Methods} *)

  method assign : Raw.Text_iter.t -> unit
  (** Assigns the value of [other] to [iter].

      This function is not useful in applications, because iterators can be
      assigned with [GtkTextIter i = j;].

      The function is used by language bindings. *)

  method backward_char : unit -> bool
  (** Moves backward by one character offset.

      Returns [TRUE] if movement was possible; if [iter] was the first in the
      buffer (character offset 0), this function returns [FALSE] for convenience
      when writing loops. *)

  method backward_chars : int -> bool
  (** Moves [count] characters backward, if possible.

      If [count] would move past the start or end of the buffer, moves to the
      start or end of the buffer.

      The return value indicates whether the iterator moved onto a
      dereferenceable position; if the iterator didn’t move, or moved onto the
      end iterator, then [FALSE] is returned. If [count] is 0, the function does
      nothing and returns [FALSE]. *)

  method backward_cursor_position : unit -> bool
  (** Like [Gtk.TextIter.forward_cursor_position], but moves backward. *)

  method backward_cursor_positions : int -> bool
  (** Moves up to [count] cursor positions.

      See [Gtk.TextIter.forward_cursor_position] for details. *)

  method backward_line : unit -> bool
  (** Moves [iter] to the start of the previous line.

      Returns [TRUE] if [iter] could be moved; i.e. if [iter] was at character
      offset 0, this function returns [FALSE]. Therefore, if [iter] was already
      on line 0, but not at the start of the line, [iter] is snapped to the
      start of the line and the function returns [TRUE]. (Note that this implies
      that in a loop calling this function, the line number may not change on
      every iteration, if your first iteration is on line 0.) *)

  method backward_lines : int -> bool
  (** Moves [count] lines backward, if possible.

      If [count] would move past the start or end of the buffer, moves to the
      start or end of the buffer.

      The return value indicates whether the iterator moved onto a
      dereferenceable position; if the iterator didn’t move, or moved onto the
      end iterator, then [FALSE] is returned. If [count] is 0, the function does
      nothing and returns [FALSE]. If [count] is negative, moves forward by 0 -
      [count] lines. *)

  method backward_sentence_start : unit -> bool
  (** Moves backward to the previous sentence start.

      If [iter] is already at the start of a sentence, moves backward to the
      next one.

      Sentence boundaries are determined by Pango and should be correct for
      nearly any language. *)

  method backward_sentence_starts : int -> bool
  (** Calls [Gtk.TextIter.backward_sentence_start] up to [count] times.

      If [count] is negative, moves forward instead of backward. *)

  method backward_to_tag_toggle : Text_tag.text_tag_t option -> bool
  (** Moves backward to the next toggle (on or off) of the [tag], or to the next
      toggle of any tag if [tag] is [NULL].

      If no matching tag toggles are found, returns [FALSE], otherwise [TRUE].
      Does not return toggles located at [iter], only toggles before [iter].
      Sets [iter] to the location of the toggle, or the start of the buffer if
      no toggle is found. *)

  method backward_visible_cursor_position : unit -> bool
  (** Moves [iter] backward to the previous visible cursor position.

      See [Gtk.TextIter.backward_cursor_position] for details. *)

  method backward_visible_cursor_positions : int -> bool
  (** Moves up to [count] visible cursor positions.

      See [Gtk.TextIter.backward_cursor_position] for details. *)

  method backward_visible_line : unit -> bool
  (** Moves [iter] to the start of the previous visible line.

      Returns [TRUE] if [iter] could be moved; i.e. if [iter] was at character
      offset 0, this function returns [FALSE]. Therefore if [iter] was already
      on line 0, but not at the start of the line, [iter] is snapped to the
      start of the line and the function returns [TRUE]. (Note that this implies
      that in a loop calling this function, the line number may not change on
      every iteration, if your first iteration is on line 0.) *)

  method backward_visible_lines : int -> bool
  (** Moves [count] visible lines backward, if possible.

      If [count] would move past the start or end of the buffer, moves to the
      start or end of the buffer.

      The return value indicates whether the iterator moved onto a
      dereferenceable position; if the iterator didn’t move, or moved onto the
      end iterator, then [FALSE] is returned. If [count] is 0, the function does
      nothing and returns [FALSE]. If [count] is negative, moves forward by 0 -
      [count] lines. *)

  method backward_visible_word_start : unit -> bool
  (** Moves backward to the previous visible word start.

      If [iter] is currently on a word start, moves backward to the next one
      after that.

      Word breaks are determined by Pango and should be correct for nearly any
      language. *)

  method backward_visible_word_starts : int -> bool
  (** Calls [Gtk.TextIter.backward_visible_word_start] up to [count] times. *)

  method backward_word_start : unit -> bool
  (** Moves backward to the previous word start.

      If [iter] is currently on a word start, moves backward to the next one
      after that.

      Word breaks are determined by Pango and should be correct for nearly any
      language *)

  method backward_word_starts : int -> bool
  (** Calls [Gtk.TextIter.backward_word_start] up to [count] times. *)

  method can_insert : bool -> bool
  (** Considering the default editability of the buffer, and tags that affect
      editability, determines whether text inserted at [iter] would be editable.

      If text inserted at [iter] would be editable then the user should be
      allowed to insert text at [iter]. [Gtk.TextBuffer.insert_interactive] uses
      this function to decide whether insertions are allowed at a given
      position. *)

  method compare : Raw.Text_iter.t -> int
  (** A qsort()-style function that returns negative if [lhs] is less than
      [rhs], positive if [lhs] is greater than [rhs], and 0 if they’re equal.

      Ordering is in character offset order, i.e. the first character in the
      buffer is less than the second character in the buffer. *)

  method editable : bool -> bool
  (** Returns whether the character at [iter] is within an editable region of
      text.

      Non-editable text is “locked” and can’t be changed by the user via
      [GtkTextView]. If no tags applied to this text affect editability,
      [default_setting] will be returned.

      You don’t want to use this function to decide whether text can be inserted
      at [iter], because for insertion you don’t want to know whether the char
      at [iter] is inside an editable range, you want to know whether a new
      character inserted at [iter] would be inside an editable range. Use
      [Gtk.TextIter.can_insert] to handle this case. *)

  method ends_line : unit -> bool
  (** Returns [TRUE] if [iter] points to the start of the paragraph delimiter
      characters for a line.

      Delimiters will be either a newline, a carriage return, a carriage return
      followed by a newline, or a Unicode paragraph separator character.

      Note that an iterator pointing to the \n of a \r\n pair will not be
      counted as the end of a line, the line ends before the \r. The end
      iterator is considered to be at the end of a line, even though there are
      no paragraph delimiter chars there. *)

  method ends_sentence : unit -> bool
  (** Determines whether [iter] ends a sentence.

      Sentence boundaries are determined by Pango and should be correct for
      nearly any language. *)

  method ends_tag : Text_tag.text_tag_t option -> bool
  (** Returns [TRUE] if [tag] is toggled off at exactly this point.

      If [tag] is [NULL], returns [TRUE] if any tag is toggled off at this
      point.

      Note that if this function returns [TRUE], it means that [iter] is at the
      end of the tagged range, but that the character at [iter] is outside the
      tagged range. In other words, unlike [Gtk.TextIter.starts_tag], if this
      function returns [TRUE], [Gtk.TextIter.has_tag] will return [FALSE] for
      the same parameters. *)

  method ends_word : unit -> bool
  (** Determines whether [iter] ends a natural-language word.

      Word breaks are determined by Pango and should be correct for nearly any
      language. *)

  method equal : Raw.Text_iter.t -> bool
  (** Tests whether two iterators are equal, using the fastest possible
      mechanism.

      This function is very fast; you can expect it to perform better than e.g.
      getting the character offset for each iterator and comparing the offsets
      yourself. Also, it’s a bit faster than [Gtk.TextIter.compare]. *)

  method forward_char : unit -> bool
  (** Moves [iter] forward by one character offset.

      Note that images embedded in the buffer occupy 1 character slot, so this
      function may actually move onto an image instead of a character, if you
      have images in your buffer. If [iter] is the end iterator or one character
      before it, [iter] will now point at the end iterator, and this function
      returns [FALSE] for convenience when writing loops. *)

  method forward_chars : int -> bool
  (** Moves [count] characters if possible.

      If [count] would move past the start or end of the buffer, moves to the
      start or end of the buffer.

      The return value indicates whether the new position of [iter] is different
      from its original position, and dereferenceable (the last iterator in the
      buffer is not dereferenceable). If [count] is 0, the function does nothing
      and returns [FALSE]. *)

  method forward_cursor_position : unit -> bool
  [@@ocaml.doc
    "Moves [iter] forward by a single cursor position.\n\n\
     Cursor positions are (unsurprisingly) positions where the\n\
     cursor can appear. Perhaps surprisingly, there may not be\n\
     a cursor position between all characters. The most common\n\
     example for European languages would be a carriage return/newline\n\
     sequence.\n\n\
     For some Unicode characters, the equivalent of say the letter “a”\n\
     with an accent mark will be represented as two characters, first\n\
     the letter then a \"combining mark\" that causes the accent to be\n\
     rendered; so the cursor can’t go between those two characters.\n\n\
     See also the [Pango.LogAttr] struct and the [Pango.break]\n\
     function."]

  method forward_cursor_positions : int -> bool
  (** Moves up to [count] cursor positions.

      See [Gtk.TextIter.forward_cursor_position] for details. *)

  method forward_line : unit -> bool
  (** Moves [iter] to the start of the next line.

      If the iter is already on the last line of the buffer, moves the iter to
      the end of the current line. If after the operation, the iter is at the
      end of the buffer and not dereferenceable, returns [FALSE]. Otherwise,
      returns [TRUE]. *)

  method forward_lines : int -> bool
  (** Moves [count] lines forward, if possible.

      If [count] would move past the start or end of the buffer, moves to the
      start or end of the buffer.

      The return value indicates whether the iterator moved onto a
      dereferenceable position; if the iterator didn’t move, or moved onto the
      end iterator, then [FALSE] is returned. If [count] is 0, the function does
      nothing and returns [FALSE]. If [count] is negative, moves backward by 0 -
      [count] lines. *)

  method forward_sentence_end : unit -> bool
  (** Moves forward to the next sentence end.

      If [iter] is at the end of a sentence, moves to the next end of sentence.

      Sentence boundaries are determined by Pango and should be correct for
      nearly any language. *)

  method forward_sentence_ends : int -> bool
  (** Calls [Gtk.TextIter.forward_sentence_end] [count] times.

      If [count] is negative, moves backward instead of forward. *)

  method forward_to_end : unit -> unit
  (** Moves [iter] forward to the “end iterator”, which points one past the last
      valid character in the buffer.

      [Gtk.TextIter.get_char] called on the end iterator returns 0, which is
      convenient for writing loops. *)

  method forward_to_line_end : unit -> bool
  (** Moves the iterator to point to the paragraph delimiter characters.

      The possible characters are either a newline, a carriage return, a
      carriage return/newline in sequence, or the Unicode paragraph separator
      character.

      If the iterator is already at the paragraph delimiter characters, moves to
      the paragraph delimiter characters for the next line. If [iter] is on the
      last line in the buffer, which does not end in paragraph delimiters, moves
      to the end iterator (end of the last line), and returns [FALSE]. *)

  method forward_to_tag_toggle : Text_tag.text_tag_t option -> bool
  (** Moves forward to the next toggle (on or off) of the [tag], or to the next
      toggle of any tag if [tag] is [NULL].

      If no matching tag toggles are found, returns [FALSE], otherwise [TRUE].
      Does not return toggles located at [iter], only toggles after [iter]. Sets
      [iter] to the location of the toggle, or to the end of the buffer if no
      toggle is found. *)

  method forward_visible_cursor_position : unit -> bool
  (** Moves [iter] forward to the next visible cursor position.

      See [Gtk.TextIter.forward_cursor_position] for details. *)

  method forward_visible_cursor_positions : int -> bool
  (** Moves up to [count] visible cursor positions.

      See [Gtk.TextIter.forward_cursor_position] for details. *)

  method forward_visible_line : unit -> bool
  (** Moves [iter] to the start of the next visible line.

      Returns [TRUE] if there was a next line to move to, and [FALSE] if [iter]
      was simply moved to the end of the buffer and is now not dereferenceable,
      or if [iter] was already at the end of the buffer. *)

  method forward_visible_lines : int -> bool
  (** Moves [count] visible lines forward, if possible.

      If [count] would move past the start or end of the buffer, moves to the
      start or end of the buffer.

      The return value indicates whether the iterator moved onto a
      dereferenceable position; if the iterator didn’t move, or moved onto the
      end iterator, then [FALSE] is returned. If [count] is 0, the function does
      nothing and returns [FALSE]. If [count] is negative, moves backward by 0 -
      [count] lines. *)

  method forward_visible_word_end : unit -> bool
  (** Moves forward to the next visible word end.

      If [iter] is currently on a word end, moves forward to the next one after
      that.

      Word breaks are determined by Pango and should be correct for nearly any
      language *)

  method forward_visible_word_ends : int -> bool
  (** Calls [Gtk.TextIter.forward_visible_word_end] up to [count] times. *)

  method forward_word_end : unit -> bool
  (** Moves forward to the next word end.

      If [iter] is currently on a word end, moves forward to the next one after
      that.

      Word breaks are determined by Pango and should be correct for nearly any
      language. *)

  method forward_word_ends : int -> bool
  (** Calls [Gtk.TextIter.forward_word_end] up to [count] times. *)

  method get_buffer : unit -> text_buffer_t
  (** Returns the [GtkTextBuffer] this iterator is associated with. *)

  method get_bytes_in_line : unit -> int
  (** Returns the number of bytes in the line containing [iter], including the
      paragraph delimiters. *)

  method get_char : unit -> int
  (** The Unicode character at this iterator is returned.

      Equivalent to operator* on a C++ iterator. If the element at this iterator
      is a non-character element, such as an image embedded in the buffer, the
      Unicode “unknown” character 0xFFFC is returned. If invoked on the end
      iterator, zero is returned; zero is not a valid Unicode character.

      So you can write a loop which ends when this function returns 0. *)

  method get_chars_in_line : unit -> int
  (** Returns the number of characters in the line containing [iter], including
      the paragraph delimiters. *)

  method get_child_anchor : unit -> Text_child_anchor.text_child_anchor_t option
  (** If the location at [iter] contains a child anchor, the anchor is returned.

      Otherwise, [NULL] is returned. *)

  method get_language : unit -> Ocpango.Language.language_t
  (** Returns the language in effect at [iter].

      If no tags affecting language apply to [iter], the return value is
      identical to that of [Gtk.get_default_language]. *)

  method get_line : unit -> int
  (** Returns the line number containing the iterator.

      Lines in a [GtkTextBuffer] are numbered beginning with 0 for the first
      line in the buffer. *)

  method get_line_index : unit -> int
  (** Returns the byte index of the iterator, counting from the start of a
      newline-terminated line.

      Remember that [GtkTextBuffer] encodes text in UTF-8, and that characters
      can require a variable number of bytes to represent. *)

  method get_line_offset : unit -> int
  (** Returns the character offset of the iterator, counting from the start of a
      newline-terminated line.

      The first character on the line has offset 0. *)

  method get_marks : unit -> text_mark_t list
  [@@ocaml.doc
    "Returns a list of all [GtkTextMark] at this location.\n\n\
     Because marks are not iterable (they don’t take up any \"space\"\n\
     in the buffer, they are just marks in between iterable locations),\n\
     multiple marks can exist in the same place.\n\n\
     The returned list is not in any meaningful order."]

  method get_offset : unit -> int
  (** Returns the character offset of an iterator.

      Each character in a [GtkTextBuffer] has an offset, starting with 0 for the
      first character in the buffer. Use [Gtk.TextBuffer.get_iter_at_offset] to
      convert an offset back into an iterator. *)

  method get_paintable : unit -> Ocgdk.Paintable.paintable_t option
  (** If the element at [iter] is a paintable, the paintable is returned.

      Otherwise, [NULL] is returned. *)

  method get_slice : Raw.Text_iter.t -> string
  (** Returns the text in the given range.

      A “slice” is an array of characters encoded in UTF-8 format, including the
      Unicode “unknown” character 0xFFFC for iterable non-character elements in
      the buffer, such as images. Because images are encoded in the slice, byte
      and character offsets in the returned array will correspond to byte
      offsets in the text buffer. Note that 0xFFFC can occur in normal text as
      well, so it is not a reliable indicator that a paintable or widget is in
      the buffer. *)

  method get_tags : unit -> Text_tag.text_tag_t list
  (** Returns a list of tags that apply to [iter], in ascending order of
      priority.

      The highest-priority tags are last.

      The [GtkTextTag]s in the list don’t have a reference added, but you have
      to free the list itself. *)

  method get_text : Raw.Text_iter.t -> string
  (** Returns text in the given range.

      If the range contains non-text elements such as images, the character and
      byte offsets in the returned string will not correspond to character and
      byte offsets in the buffer. If you want offsets to correspond, see
      [Gtk.TextIter.get_slice]. *)

  method get_toggled_tags : bool -> Text_tag.text_tag_t list
  (** Returns a list of [GtkTextTag] that are toggled on or off at this point.

      If [toggled_on] is [TRUE], the list contains tags that are toggled on. If
      a tag is toggled on at [iter], then some non-empty range of characters
      following [iter] has that tag applied to it. If a tag is toggled off, then
      some non-empty range following [iter] does not have the tag applied to it.
  *)

  method get_visible_line_index : unit -> int
  (** Returns the number of bytes from the start of the line to the given
      [iter], not counting bytes that are invisible due to tags with the
      “invisible” flag toggled on. *)

  method get_visible_line_offset : unit -> int
  (** Returns the offset in characters from the start of the line to the given
      [iter], not counting characters that are invisible due to tags with the
      “invisible” flag toggled on. *)

  method get_visible_slice : Raw.Text_iter.t -> string
  (** Returns visible text in the given range.

      Like [Gtk.TextIter.get_slice], but invisible text is not included.
      Invisible text is usually invisible because a [GtkTextTag] with the
      “invisible” attribute turned on has been applied to it. *)

  method get_visible_text : Raw.Text_iter.t -> string
  (** Returns visible text in the given range.

      Like [Gtk.TextIter.get_text], but invisible text is not included.
      Invisible text is usually invisible because a [GtkTextTag] with the
      “invisible” attribute turned on has been applied to it. *)

  method has_tag : Text_tag.text_tag_t -> bool
  (** Returns [TRUE] if [iter] points to a character that is part of a range
      tagged with [tag].

      See also [Gtk.TextIter.starts_tag] and [Gtk.TextIter.ends_tag]. *)

  method in_range : Raw.Text_iter.t -> Raw.Text_iter.t -> bool
  (** Checks whether [iter] falls in the range \[[start], [end]).

      [start] and [end] must be in ascending order. *)

  method inside_sentence : unit -> bool
  (** Determines whether [iter] is inside a sentence (as opposed to in between
      two sentences, e.g. after a period and before the first letter of the next
      sentence).

      Sentence boundaries are determined by Pango and should be correct for
      nearly any language. *)

  method inside_word : unit -> bool
  (** Determines whether the character pointed by [iter] is part of a
      natural-language word (as opposed to say inside some whitespace).

      Word breaks are determined by Pango and should be correct for nearly any
      language.

      Note that if [Gtk.TextIter.starts_word] returns [TRUE], then this function
      returns [TRUE] too, since [iter] points to the first character of the
      word. *)

  method is_cursor_position : unit -> bool
  (** Determine if [iter] is at a cursor position.

      See [Gtk.TextIter.forward_cursor_position] or [Pango.LogAttr] or
      [Pango.break] for details on what a cursor position is. *)

  method is_end : unit -> bool
  (** Returns [TRUE] if [iter] is the end iterator.

      This means it is one past the last dereferenceable iterator in the buffer.
      [Gtk.TextIter.is_end] is the most efficient way to check whether an
      iterator is the end iterator. *)

  method is_start : unit -> bool
  (** Returns [TRUE] if [iter] is the first iterator in the buffer. *)

  method order : Raw.Text_iter.t -> unit
  (** Swaps the value of [first] and [second] if [second] comes before [first]
      in the buffer.

      That is, ensures that [first] and [second] are in sequence. Most text
      buffer functions that take a range call this automatically on your behalf,
      so there’s no real reason to call it yourself in those cases. There are
      some exceptions, such as [Gtk.TextIter.in_range], that expect a pre-sorted
      range. *)

  method set_line : int -> unit
  (** Moves iterator [iter] to the start of the line [line_number].

      If [line_number] is negative or larger than or equal to the number of
      lines in the buffer, moves [iter] to the start of the last line in the
      buffer. *)

  method set_line_index : int -> unit
  (** Same as [Gtk.TextIter.set_line_offset], but works with a byte index. The
      given byte index must be at the start of a character, it can’t be in the
      middle of a UTF-8 encoded character. *)

  method set_line_offset : int -> unit
  (** Moves [iter] within a line, to a new character (not byte) offset.

      The given character offset must be less than or equal to the number of
      characters in the line; if equal, [iter] moves to the start of the next
      line. See [Gtk.TextIter.set_line_index] if you have a byte index rather
      than a character offset. *)

  method set_offset : int -> unit
  (** Sets [iter] to point to [char_offset].

      [char_offset] counts from the start of the entire text buffer, starting
      with 0. *)

  method set_visible_line_index : int -> unit
  (** Like [Gtk.TextIter.set_line_index], but the index is in visible bytes,
      i.e. text with a tag making it invisible is not counted in the index. *)

  method set_visible_line_offset : int -> unit
  (** Like [Gtk.TextIter.set_line_offset], but the offset is in visible
      characters, i.e. text with a tag making it invisible is not counted in the
      offset. *)

  method starts_line : unit -> bool
  (** Returns [TRUE] if [iter] begins a paragraph.

      This is the case if [Gtk.TextIter.get_line_offset] would return 0. However
      this function is potentially more efficient than
      [Gtk.TextIter.get_line_offset], because it doesn’t have to compute the
      offset, it just has to see whether it’s 0. *)

  method starts_sentence : unit -> bool
  (** Determines whether [iter] begins a sentence.

      Sentence boundaries are determined by Pango and should be correct for
      nearly any language. *)

  method starts_tag : Text_tag.text_tag_t option -> bool
  (** Returns [TRUE] if [tag] is toggled on at exactly this point.

      If [tag] is [NULL], returns [TRUE] if any tag is toggled on at this point.

      Note that if this function returns [TRUE], it means that [iter] is at the
      beginning of the tagged range, and that the character at [iter] is inside
      the tagged range. In other words, unlike [Gtk.TextIter.ends_tag], if this
      function returns [TRUE], [Gtk.TextIter.has_tag] will also return [TRUE]
      for the same parameters. *)

  method starts_word : unit -> bool
  (** Determines whether [iter] begins a natural-language word.

      Word breaks are determined by Pango and should be correct for nearly any
      language. *)

  method toggles_tag : Text_tag.text_tag_t option -> bool
  (** Gets whether a range with [tag] applied to it begins or ends at [iter].

      This is equivalent to (gtk_text_iter_starts_tag() ||
      gtk_text_iter_ends_tag()) *)

  (** {2:conversions Conversions} *)

  method as_text_iter : Raw.Text_iter.t
end

and text_mark_t = object
  (** {2:methods Methods} *)

  method get_buffer : unit -> text_buffer_t option
  (** Gets the buffer this mark is located inside.

      Returns [NULL] if the mark is deleted. *)

  method get_deleted : unit -> bool
  (** Returns [TRUE] if the mark has been removed from its buffer.

      See [Gtk.TextBuffer.add_mark] for a way to add it to a buffer again. *)

  method get_left_gravity : unit -> bool
  (** Determines whether the mark has left gravity. *)

  method get_name : unit -> string option
  (** Returns the mark name.

      Returns [NULL] for anonymous marks. *)

  method get_visible : unit -> bool
  (** Returns [TRUE] if the mark is visible.

      A cursor is displayed for visible marks. *)

  method set_visible : bool -> unit
  (** Sets the visibility of [mark].

      The insertion point is normally visible, i.e. you can see it as a vertical
      bar. Also, the text widget uses a visible mark to indicate where a drop
      will occur when dragging-and-dropping text. Most other marks are not
      visible.

      Marks are not visible by default. *)

  (** {2:conversions Conversions} *)

  method as_text_mark : Raw.Text_mark.t
end

class text_buffer (obj : Raw.Text_buffer.t) : text_buffer_t =
  object (self)
    method on_begin_user_action ?(after = false) ~callback () =
      Raw.Text_buffer.on_begin_user_action ~after self#as_text_buffer ~callback

    method on_changed ?(after = false) ~callback () =
      Raw.Text_buffer.on_changed ~after self#as_text_buffer ~callback

    method on_end_user_action ?(after = false) ~callback () =
      Raw.Text_buffer.on_end_user_action ~after self#as_text_buffer ~callback

    method on_mark_deleted ?(after = false) ~callback () =
      Raw.Text_buffer.on_mark_deleted ~after self#as_text_buffer
        ~callback:(fun ~mark -> callback ~mark:(new text_mark mark))

    method on_modified_changed ?(after = false) ~callback () =
      Raw.Text_buffer.on_modified_changed ~after self#as_text_buffer ~callback

    method on_paste_done ?(after = false) ~callback () =
      Raw.Text_buffer.on_paste_done ~after self#as_text_buffer
        ~callback:(fun ~clipboard ->
          callback ~clipboard:(new Ocgdk.Clipboard.clipboard clipboard))

    method on_redo ?(after = false) ~callback () =
      Raw.Text_buffer.on_redo ~after self#as_text_buffer ~callback

    method on_undo ?(after = false) ~callback () =
      Raw.Text_buffer.on_undo ~after self#as_text_buffer ~callback

    method add_mark : text_mark_t -> Raw.Text_iter.t -> unit =
      fun mark where ->
        let mark = mark#as_text_mark in
        Raw.Text_buffer.add_mark obj mark where

    method add_selection_clipboard : Ocgdk.Clipboard.clipboard_t -> unit =
      fun clipboard ->
        let clipboard = clipboard#as_clipboard in
        Raw.Text_buffer.add_selection_clipboard obj clipboard

    method apply_tag :
        Text_tag.text_tag_t -> Raw.Text_iter.t -> Raw.Text_iter.t -> unit =
      fun tag start end_ ->
        let tag = tag#as_text_tag in
        Raw.Text_buffer.apply_tag obj tag start end_

    method apply_tag_by_name :
        string -> Raw.Text_iter.t -> Raw.Text_iter.t -> unit =
      fun name start end_ ->
        Raw.Text_buffer.apply_tag_by_name obj name start end_

    method backspace : Raw.Text_iter.t -> bool -> bool -> bool =
      fun iter interactive default_editable ->
        Raw.Text_buffer.backspace obj iter interactive default_editable

    method begin_irreversible_action : unit -> unit =
      fun () -> Raw.Text_buffer.begin_irreversible_action obj

    method begin_user_action : unit -> unit =
      fun () -> Raw.Text_buffer.begin_user_action obj

    method copy_clipboard : Ocgdk.Clipboard.clipboard_t -> unit =
      fun clipboard ->
        let clipboard = clipboard#as_clipboard in
        Raw.Text_buffer.copy_clipboard obj clipboard

    method create_child_anchor :
        Raw.Text_iter.t -> Text_child_anchor.text_child_anchor_t =
      fun iter ->
        new Text_child_anchor.text_child_anchor
          (Raw.Text_buffer.create_child_anchor obj iter)

    method create_mark : string option -> Raw.Text_iter.t -> bool -> text_mark_t
        =
      fun mark_name where left_gravity ->
        new text_mark
          (Raw.Text_buffer.create_mark obj mark_name where left_gravity)

    method cut_clipboard : Ocgdk.Clipboard.clipboard_t -> bool -> unit =
      fun clipboard default_editable ->
        let clipboard = clipboard#as_clipboard in
        Raw.Text_buffer.cut_clipboard obj clipboard default_editable

    method delete : Raw.Text_iter.t -> Raw.Text_iter.t -> unit =
      fun start end_ -> Raw.Text_buffer.delete obj start end_

    method delete_interactive :
        Raw.Text_iter.t -> Raw.Text_iter.t -> bool -> bool =
      fun start_iter end_iter default_editable ->
        Raw.Text_buffer.delete_interactive obj start_iter end_iter
          default_editable

    method delete_mark : text_mark_t -> unit =
      fun mark ->
        let mark = mark#as_text_mark in
        Raw.Text_buffer.delete_mark obj mark

    method delete_mark_by_name : string -> unit =
      fun name -> Raw.Text_buffer.delete_mark_by_name obj name

    method delete_selection : bool -> bool -> bool =
      fun interactive default_editable ->
        Raw.Text_buffer.delete_selection obj interactive default_editable

    method end_irreversible_action : unit -> unit =
      fun () -> Raw.Text_buffer.end_irreversible_action obj

    method end_user_action : unit -> unit =
      fun () -> Raw.Text_buffer.end_user_action obj

    method get_can_redo : unit -> bool =
      fun () -> Raw.Text_buffer.get_can_redo obj

    method get_can_undo : unit -> bool =
      fun () -> Raw.Text_buffer.get_can_undo obj

    method get_char_count : unit -> int =
      fun () -> Raw.Text_buffer.get_char_count obj

    method get_enable_undo : unit -> bool =
      fun () -> Raw.Text_buffer.get_enable_undo obj

    method get_has_selection : unit -> bool =
      fun () -> Raw.Text_buffer.get_has_selection obj

    method get_insert : unit -> text_mark_t =
      fun () -> new text_mark (Raw.Text_buffer.get_insert obj)

    method get_line_count : unit -> int =
      fun () -> Raw.Text_buffer.get_line_count obj

    method get_mark : string -> text_mark_t option =
      fun name ->
        Option.map
          (fun ret -> new text_mark ret)
          (Raw.Text_buffer.get_mark obj name)

    method get_max_undo_levels : unit -> int =
      fun () -> Raw.Text_buffer.get_max_undo_levels obj

    method get_modified : unit -> bool =
      fun () -> Raw.Text_buffer.get_modified obj

    method get_selection_bound : unit -> text_mark_t =
      fun () -> new text_mark (Raw.Text_buffer.get_selection_bound obj)

    method get_selection_content :
        unit -> Ocgdk.Content_provider.content_provider_t =
      fun () ->
        new Ocgdk.Content_provider.content_provider
          (Raw.Text_buffer.get_selection_content obj)

    method get_slice : Raw.Text_iter.t -> Raw.Text_iter.t -> bool -> string =
      fun start end_ include_hidden_chars ->
        Raw.Text_buffer.get_slice obj start end_ include_hidden_chars

    method get_tag_table : unit -> Text_tag_table.text_tag_table_t =
      fun () ->
        new Text_tag_table.text_tag_table (Raw.Text_buffer.get_tag_table obj)

    method get_text : Raw.Text_iter.t -> Raw.Text_iter.t -> bool -> string =
      fun start end_ include_hidden_chars ->
        Raw.Text_buffer.get_text obj start end_ include_hidden_chars

    method insert : Raw.Text_iter.t -> string -> int -> unit =
      fun iter text len -> Raw.Text_buffer.insert obj iter text len

    method insert_at_cursor : string -> int -> unit =
      fun text len -> Raw.Text_buffer.insert_at_cursor obj text len

    method insert_child_anchor :
        Raw.Text_iter.t -> Text_child_anchor.text_child_anchor_t -> unit =
      fun iter anchor ->
        let anchor = anchor#as_text_child_anchor in
        Raw.Text_buffer.insert_child_anchor obj iter anchor

    method insert_interactive : Raw.Text_iter.t -> string -> int -> bool -> bool
        =
      fun iter text len default_editable ->
        Raw.Text_buffer.insert_interactive obj iter text len default_editable

    method insert_interactive_at_cursor : string -> int -> bool -> bool =
      fun text len default_editable ->
        Raw.Text_buffer.insert_interactive_at_cursor obj text len
          default_editable

    method insert_markup : Raw.Text_iter.t -> string -> int -> unit =
      fun iter markup len -> Raw.Text_buffer.insert_markup obj iter markup len

    method insert_paintable :
        Raw.Text_iter.t -> Ocgdk.Paintable.paintable_t -> unit =
      fun iter paintable ->
        let paintable = paintable#as_paintable in
        Raw.Text_buffer.insert_paintable obj iter paintable

    method insert_range :
        Raw.Text_iter.t -> Raw.Text_iter.t -> Raw.Text_iter.t -> unit =
      fun iter start end_ -> Raw.Text_buffer.insert_range obj iter start end_

    method insert_range_interactive :
        Raw.Text_iter.t -> Raw.Text_iter.t -> Raw.Text_iter.t -> bool -> bool =
      fun iter start end_ default_editable ->
        Raw.Text_buffer.insert_range_interactive obj iter start end_
          default_editable

    method move_mark : text_mark_t -> Raw.Text_iter.t -> unit =
      fun mark where ->
        let mark = mark#as_text_mark in
        Raw.Text_buffer.move_mark obj mark where

    method move_mark_by_name : string -> Raw.Text_iter.t -> unit =
      fun name where -> Raw.Text_buffer.move_mark_by_name obj name where

    method paste_clipboard :
        Ocgdk.Clipboard.clipboard_t -> Raw.Text_iter.t option -> bool -> unit =
      fun clipboard override_location default_editable ->
        let clipboard = clipboard#as_clipboard in
        Raw.Text_buffer.paste_clipboard obj clipboard override_location
          default_editable

    method place_cursor : Raw.Text_iter.t -> unit =
      fun where -> Raw.Text_buffer.place_cursor obj where

    method redo : unit -> unit = fun () -> Raw.Text_buffer.redo obj

    method remove_all_tags : Raw.Text_iter.t -> Raw.Text_iter.t -> unit =
      fun start end_ -> Raw.Text_buffer.remove_all_tags obj start end_

    method remove_commit_notify : int -> unit =
      fun commit_notify_handler ->
        Raw.Text_buffer.remove_commit_notify obj commit_notify_handler

    method remove_selection_clipboard : Ocgdk.Clipboard.clipboard_t -> unit =
      fun clipboard ->
        let clipboard = clipboard#as_clipboard in
        Raw.Text_buffer.remove_selection_clipboard obj clipboard

    method remove_tag :
        Text_tag.text_tag_t -> Raw.Text_iter.t -> Raw.Text_iter.t -> unit =
      fun tag start end_ ->
        let tag = tag#as_text_tag in
        Raw.Text_buffer.remove_tag obj tag start end_

    method remove_tag_by_name :
        string -> Raw.Text_iter.t -> Raw.Text_iter.t -> unit =
      fun name start end_ ->
        Raw.Text_buffer.remove_tag_by_name obj name start end_

    method select_range : Raw.Text_iter.t -> Raw.Text_iter.t -> unit =
      fun ins bound -> Raw.Text_buffer.select_range obj ins bound

    method set_enable_undo : bool -> unit =
      fun enable_undo -> Raw.Text_buffer.set_enable_undo obj enable_undo

    method set_max_undo_levels : int -> unit =
      fun max_undo_levels ->
        Raw.Text_buffer.set_max_undo_levels obj max_undo_levels

    method set_modified : bool -> unit =
      fun setting -> Raw.Text_buffer.set_modified obj setting

    method set_text : string -> int -> unit =
      fun text len -> Raw.Text_buffer.set_text obj text len

    method undo : unit -> unit = fun () -> Raw.Text_buffer.undo obj
    method cursor_position = Raw.Text_buffer.get_cursor_position obj
    method as_text_buffer = obj
  end

and text_iter (obj : Raw.Text_iter.t) : text_iter_t =
  object (self)
    method assign : Raw.Text_iter.t -> unit =
      fun other -> Raw.Text_iter.assign obj other

    method backward_char : unit -> bool =
      fun () -> Raw.Text_iter.backward_char obj

    method backward_chars : int -> bool =
      fun count -> Raw.Text_iter.backward_chars obj count

    method backward_cursor_position : unit -> bool =
      fun () -> Raw.Text_iter.backward_cursor_position obj

    method backward_cursor_positions : int -> bool =
      fun count -> Raw.Text_iter.backward_cursor_positions obj count

    method backward_line : unit -> bool =
      fun () -> Raw.Text_iter.backward_line obj

    method backward_lines : int -> bool =
      fun count -> Raw.Text_iter.backward_lines obj count

    method backward_sentence_start : unit -> bool =
      fun () -> Raw.Text_iter.backward_sentence_start obj

    method backward_sentence_starts : int -> bool =
      fun count -> Raw.Text_iter.backward_sentence_starts obj count

    method backward_to_tag_toggle : Text_tag.text_tag_t option -> bool =
      fun tag ->
        let tag = Option.map (fun c -> c#as_text_tag) tag in
        Raw.Text_iter.backward_to_tag_toggle obj tag

    method backward_visible_cursor_position : unit -> bool =
      fun () -> Raw.Text_iter.backward_visible_cursor_position obj

    method backward_visible_cursor_positions : int -> bool =
      fun count -> Raw.Text_iter.backward_visible_cursor_positions obj count

    method backward_visible_line : unit -> bool =
      fun () -> Raw.Text_iter.backward_visible_line obj

    method backward_visible_lines : int -> bool =
      fun count -> Raw.Text_iter.backward_visible_lines obj count

    method backward_visible_word_start : unit -> bool =
      fun () -> Raw.Text_iter.backward_visible_word_start obj

    method backward_visible_word_starts : int -> bool =
      fun count -> Raw.Text_iter.backward_visible_word_starts obj count

    method backward_word_start : unit -> bool =
      fun () -> Raw.Text_iter.backward_word_start obj

    method backward_word_starts : int -> bool =
      fun count -> Raw.Text_iter.backward_word_starts obj count

    method can_insert : bool -> bool =
      fun default_editability ->
        Raw.Text_iter.can_insert obj default_editability

    method compare : Raw.Text_iter.t -> int =
      fun rhs -> Raw.Text_iter.compare obj rhs

    method editable : bool -> bool =
      fun default_setting -> Raw.Text_iter.editable obj default_setting

    method ends_line : unit -> bool = fun () -> Raw.Text_iter.ends_line obj

    method ends_sentence : unit -> bool =
      fun () -> Raw.Text_iter.ends_sentence obj

    method ends_tag : Text_tag.text_tag_t option -> bool =
      fun tag ->
        let tag = Option.map (fun c -> c#as_text_tag) tag in
        Raw.Text_iter.ends_tag obj tag

    method ends_word : unit -> bool = fun () -> Raw.Text_iter.ends_word obj

    method equal : Raw.Text_iter.t -> bool =
      fun rhs -> Raw.Text_iter.equal obj rhs

    method forward_char : unit -> bool =
      fun () -> Raw.Text_iter.forward_char obj

    method forward_chars : int -> bool =
      fun count -> Raw.Text_iter.forward_chars obj count

    method forward_cursor_position : unit -> bool =
      fun () -> Raw.Text_iter.forward_cursor_position obj

    method forward_cursor_positions : int -> bool =
      fun count -> Raw.Text_iter.forward_cursor_positions obj count

    method forward_line : unit -> bool =
      fun () -> Raw.Text_iter.forward_line obj

    method forward_lines : int -> bool =
      fun count -> Raw.Text_iter.forward_lines obj count

    method forward_sentence_end : unit -> bool =
      fun () -> Raw.Text_iter.forward_sentence_end obj

    method forward_sentence_ends : int -> bool =
      fun count -> Raw.Text_iter.forward_sentence_ends obj count

    method forward_to_end : unit -> unit =
      fun () -> Raw.Text_iter.forward_to_end obj

    method forward_to_line_end : unit -> bool =
      fun () -> Raw.Text_iter.forward_to_line_end obj

    method forward_to_tag_toggle : Text_tag.text_tag_t option -> bool =
      fun tag ->
        let tag = Option.map (fun c -> c#as_text_tag) tag in
        Raw.Text_iter.forward_to_tag_toggle obj tag

    method forward_visible_cursor_position : unit -> bool =
      fun () -> Raw.Text_iter.forward_visible_cursor_position obj

    method forward_visible_cursor_positions : int -> bool =
      fun count -> Raw.Text_iter.forward_visible_cursor_positions obj count

    method forward_visible_line : unit -> bool =
      fun () -> Raw.Text_iter.forward_visible_line obj

    method forward_visible_lines : int -> bool =
      fun count -> Raw.Text_iter.forward_visible_lines obj count

    method forward_visible_word_end : unit -> bool =
      fun () -> Raw.Text_iter.forward_visible_word_end obj

    method forward_visible_word_ends : int -> bool =
      fun count -> Raw.Text_iter.forward_visible_word_ends obj count

    method forward_word_end : unit -> bool =
      fun () -> Raw.Text_iter.forward_word_end obj

    method forward_word_ends : int -> bool =
      fun count -> Raw.Text_iter.forward_word_ends obj count

    method get_buffer : unit -> text_buffer_t =
      fun () -> new text_buffer (Raw.Text_iter.get_buffer obj)

    method get_bytes_in_line : unit -> int =
      fun () -> Raw.Text_iter.get_bytes_in_line obj

    method get_char : unit -> int = fun () -> Raw.Text_iter.get_char obj

    method get_chars_in_line : unit -> int =
      fun () -> Raw.Text_iter.get_chars_in_line obj

    method get_child_anchor :
        unit -> Text_child_anchor.text_child_anchor_t option =
      fun () ->
        Option.map
          (fun ret -> new Text_child_anchor.text_child_anchor ret)
          (Raw.Text_iter.get_child_anchor obj)

    method get_language : unit -> Ocpango.Language.language_t =
      fun () -> new Ocpango.Language.language (Raw.Text_iter.get_language obj)

    method get_line : unit -> int = fun () -> Raw.Text_iter.get_line obj

    method get_line_index : unit -> int =
      fun () -> Raw.Text_iter.get_line_index obj

    method get_line_offset : unit -> int =
      fun () -> Raw.Text_iter.get_line_offset obj

    method get_marks : unit -> text_mark_t list =
      fun () ->
        (List.map (fun ret -> new text_mark ret)) (Raw.Text_iter.get_marks obj)

    method get_offset : unit -> int = fun () -> Raw.Text_iter.get_offset obj

    method get_paintable : unit -> Ocgdk.Paintable.paintable_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Paintable.paintable ret)
          (Raw.Text_iter.get_paintable obj)

    method get_slice : Raw.Text_iter.t -> string =
      fun end_ -> Raw.Text_iter.get_slice obj end_

    method get_tags : unit -> Text_tag.text_tag_t list =
      fun () ->
        (List.map (fun ret -> new Text_tag.text_tag ret))
          (Raw.Text_iter.get_tags obj)

    method get_text : Raw.Text_iter.t -> string =
      fun end_ -> Raw.Text_iter.get_text obj end_

    method get_toggled_tags : bool -> Text_tag.text_tag_t list =
      fun toggled_on ->
        (List.map (fun ret -> new Text_tag.text_tag ret))
          (Raw.Text_iter.get_toggled_tags obj toggled_on)

    method get_visible_line_index : unit -> int =
      fun () -> Raw.Text_iter.get_visible_line_index obj

    method get_visible_line_offset : unit -> int =
      fun () -> Raw.Text_iter.get_visible_line_offset obj

    method get_visible_slice : Raw.Text_iter.t -> string =
      fun end_ -> Raw.Text_iter.get_visible_slice obj end_

    method get_visible_text : Raw.Text_iter.t -> string =
      fun end_ -> Raw.Text_iter.get_visible_text obj end_

    method has_tag : Text_tag.text_tag_t -> bool =
      fun tag ->
        let tag = tag#as_text_tag in
        Raw.Text_iter.has_tag obj tag

    method in_range : Raw.Text_iter.t -> Raw.Text_iter.t -> bool =
      fun start end_ -> Raw.Text_iter.in_range obj start end_

    method inside_sentence : unit -> bool =
      fun () -> Raw.Text_iter.inside_sentence obj

    method inside_word : unit -> bool = fun () -> Raw.Text_iter.inside_word obj

    method is_cursor_position : unit -> bool =
      fun () -> Raw.Text_iter.is_cursor_position obj

    method is_end : unit -> bool = fun () -> Raw.Text_iter.is_end obj
    method is_start : unit -> bool = fun () -> Raw.Text_iter.is_start obj

    method order : Raw.Text_iter.t -> unit =
      fun second -> Raw.Text_iter.order obj second

    method set_line : int -> unit =
      fun line_number -> Raw.Text_iter.set_line obj line_number

    method set_line_index : int -> unit =
      fun byte_on_line -> Raw.Text_iter.set_line_index obj byte_on_line

    method set_line_offset : int -> unit =
      fun char_on_line -> Raw.Text_iter.set_line_offset obj char_on_line

    method set_offset : int -> unit =
      fun char_offset -> Raw.Text_iter.set_offset obj char_offset

    method set_visible_line_index : int -> unit =
      fun byte_on_line -> Raw.Text_iter.set_visible_line_index obj byte_on_line

    method set_visible_line_offset : int -> unit =
      fun char_on_line -> Raw.Text_iter.set_visible_line_offset obj char_on_line

    method starts_line : unit -> bool = fun () -> Raw.Text_iter.starts_line obj

    method starts_sentence : unit -> bool =
      fun () -> Raw.Text_iter.starts_sentence obj

    method starts_tag : Text_tag.text_tag_t option -> bool =
      fun tag ->
        let tag = Option.map (fun c -> c#as_text_tag) tag in
        Raw.Text_iter.starts_tag obj tag

    method starts_word : unit -> bool = fun () -> Raw.Text_iter.starts_word obj

    method toggles_tag : Text_tag.text_tag_t option -> bool =
      fun tag ->
        let tag = Option.map (fun c -> c#as_text_tag) tag in
        Raw.Text_iter.toggles_tag obj tag

    method as_text_iter = obj
  end

and text_mark (obj : Raw.Text_mark.t) : text_mark_t =
  object (self)
    method get_buffer : unit -> text_buffer_t option =
      fun () ->
        Option.map
          (fun ret -> new text_buffer ret)
          (Raw.Text_mark.get_buffer obj)

    method get_deleted : unit -> bool = fun () -> Raw.Text_mark.get_deleted obj

    method get_left_gravity : unit -> bool =
      fun () -> Raw.Text_mark.get_left_gravity obj

    method get_name : unit -> string option =
      fun () -> Raw.Text_mark.get_name obj

    method get_visible : unit -> bool = fun () -> Raw.Text_mark.get_visible obj

    method set_visible : bool -> unit =
      fun setting -> Raw.Text_mark.set_visible obj setting

    method as_text_mark = obj
  end

let new_ (table : Text_tag_table.text_tag_table_t option) : text_buffer_t =
  let table = Option.map (fun c -> c#as_text_tag_table) table in
  let obj_ = Raw.Text_buffer.new_ table in
  new text_buffer obj_

let new_ (name : string option) (left_gravity : bool) : text_mark_t =
  let obj_ = Raw.Text_mark.new_ name left_gravity in
  new text_mark obj_
