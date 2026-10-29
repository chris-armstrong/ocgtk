class type editable_t = object
  (** {2:signals Signals} *)

  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted at the end of a single user-visible operation on the contents.

      E.g., a paste operation that replaces the contents of the selection will
      cause only one signal emission (even though it is implemented by first
      deleting the selection, then inserting the new content, and may cause
      multiple ::notify::text signals to be emitted). *)

  method on_delete_text :
    ?after:bool ->
    callback:(start_pos:int -> end_pos:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when text is deleted from the widget by the user.

      The default handler for this signal will normally be responsible for
      deleting the text, so by connecting to this signal and then stopping the
      signal with g_signal_stop_emission(), it is possible to modify the range
      of deleted text, or prevent it from being deleted entirely.

      The [start_pos] and [end_pos] parameters are interpreted as for
      [Gtk.Editable.delete_text]. *)

  (** {2:methods Methods} *)

  method delegate_get_accessible_platform_state :
    Enums.accessibleplatformstate -> bool
  (** Retrieves the accessible platform state from the editable delegate.

      This is an helper function to retrieve the accessible state for
      [GtkEditable] interface implementations using a delegate pattern.

      You should call this function in your editable widget implementation of
      the [Gtk.Accessible.get_platform_state] virtual function, for instance:

      {[
      static void
      accessible_interface_init (GtkAccessibleInterface *iface)
      {
        iface->get_platform_state = your_editable_get_accessible_platform_state;
      }

      static gboolean
      your_editable_get_accessible_platform_state (GtkAccessible *accessible,
                                                   GtkAccessiblePlatformState state)
      {
        return gtk_editable_delegate_get_accessible_platform_state (GTK_EDITABLE (accessible), state);
      }
      ]}

      Note that the widget which is the delegate {i must} be a direct child of
      this widget, otherwise your implementation of
      [Gtk.Accessible.get_platform_state] might not even be called, as the
      platform change will originate from the parent of the delegate, and, as a
      result, will not work properly.

      So, if you can't ensure the direct child condition, you should give the
      delegate the [GTK_ACCESSIBLE_ROLE_TEXT_BOX] role, or you can change your
      tree to allow this function to work. *)

  method delete_selection : unit -> unit
  (** Deletes the currently selected text of the editable.

      This call doesn’t do anything if there is no selected text. *)

  method delete_text : int -> int -> unit
  (** Deletes a sequence of characters.

      The characters that are deleted are those characters at positions from
      [start_pos] up to, but not including [end_pos]. If [end_pos] is negative,
      then the characters deleted are those from [start_pos] to the end of the
      text.

      Note that the positions are specified in characters, not bytes. *)

  method finish_delegate : unit -> unit
  (** Undoes the setup done by [Gtk.Editable.init_delegate].

      This is a helper function that should be called from dispose, before
      removing the delegate object. *)

  method get_alignment : unit -> float
  (** Gets the alignment of the editable. *)

  method get_chars : int -> int -> string
  (** Retrieves a sequence of characters.

      The characters that are retrieved are those characters at positions from
      [start_pos] up to, but not including [end_pos]. If [end_pos] is negative,
      then the characters retrieved are those characters from [start_pos] to the
      end of the text.

      Note that positions are specified in characters, not bytes. *)

  method get_delegate : unit -> editable_t option
  (** Gets the [GtkEditable] that [editable] is delegating its implementation
      to.

      Typically, the delegate is a [Gtk.Text] widget. *)

  method get_editable : unit -> bool
  (** Retrieves whether [editable] is editable. *)

  method get_enable_undo : unit -> bool
  (** Gets if undo/redo actions are enabled for [editable] *)

  method get_max_width_chars : unit -> int
  (** Retrieves the desired maximum width of [editable], in characters. *)

  method get_position : unit -> int
  (** Retrieves the current position of the cursor relative to the start of the
      content of the editable.

      Note that this position is in characters, not in bytes. *)

  method get_text : unit -> string
  (** Retrieves the contents of [editable].

      The returned string is owned by GTK and must not be modified or freed. *)

  method get_width_chars : unit -> int
  (** Gets the number of characters of space reserved for the contents of the
      editable. *)

  method init_delegate : unit -> unit
  (** Sets up a delegate for [GtkEditable].

      This is assuming that the get_delegate vfunc in the [GtkEditable]
      interface has been set up for the [editable]'s type.

      This is a helper function that should be called in instance init, after
      creating the delegate object. *)

  method select_region : int -> int -> unit
  (** Selects a region of text.

      The characters that are selected are those characters at positions from
      [start_pos] up to, but not including [end_pos]. If [end_pos] is negative,
      then the characters selected are those characters from [start_pos] to the
      end of the text.

      Note that positions are specified in characters, not bytes. *)

  method set_alignment : float -> unit
  (** Sets the alignment for the contents of the editable.

      This controls the horizontal positioning of the contents when the
      displayed text is shorter than the width of the editable. *)

  method set_editable : bool -> unit
  (** Determines if the user can edit the text in the editable widget. *)

  method set_enable_undo : bool -> unit
  (** If enabled, changes to [editable] will be saved for undo/redo actions.

      This results in an additional copy of text changes and are not stored in
      secure memory. As such, undo is forcefully disabled when
      [Gtk.Text:visibility] is set to [false]. *)

  method set_max_width_chars : int -> unit
  (** Sets the desired maximum width in characters of [editable]. *)

  method set_position : int -> unit
  (** Sets the cursor position in the editable to the given value.

      The cursor is displayed before the character with the given (base 0) index
      in the contents of the editable. The value must be less than or equal to
      the number of characters in the editable. A value of -1 indicates that the
      position should be set after the last character of the editable. Note that
      [position] is in characters, not in bytes. *)

  method set_text : string -> unit
  (** Sets the text in the editable to the given value.

      This is replacing the current contents. *)

  method set_width_chars : int -> unit
  (** Changes the size request of the editable to be about the right size for
      [n_chars] characters.

      Note that it changes the size request, the size can still be affected by
      how you pack the widget into containers. If [n_chars] is -1, the size
      reverts to the default size. *)

  (** {2:properties Properties} *)

  method selection_bound : int
  (** The position of the opposite end of the selection from the cursor in
      chars. *)

  (** {2:conversions Conversions} *)

  method as_editable : Raw.Editable.t
end

(* High-level class for Editable *)
class editable (obj : Raw.Editable.t) : editable_t =
  object (self)
    method on_changed ?(after = false) ~callback () =
      Raw.Editable.on_changed ~after self#as_editable ~callback

    method on_delete_text ?(after = false) ~callback () =
      Raw.Editable.on_delete_text ~after self#as_editable ~callback

    method delegate_get_accessible_platform_state :
        Enums.accessibleplatformstate -> bool =
      fun state -> Raw.Editable.delegate_get_accessible_platform_state obj state

    method delete_selection : unit -> unit =
      fun () -> Raw.Editable.delete_selection obj

    method delete_text : int -> int -> unit =
      fun start_pos end_pos -> Raw.Editable.delete_text obj start_pos end_pos

    method finish_delegate : unit -> unit =
      fun () -> Raw.Editable.finish_delegate obj

    method get_alignment : unit -> float =
      fun () -> Raw.Editable.get_alignment obj

    method get_chars : int -> int -> string =
      fun start_pos end_pos -> Raw.Editable.get_chars obj start_pos end_pos

    method get_delegate : unit -> editable_t option =
      fun () ->
        Option.map (fun ret -> new editable ret) (Raw.Editable.get_delegate obj)

    method get_editable : unit -> bool = fun () -> Raw.Editable.get_editable obj

    method get_enable_undo : unit -> bool =
      fun () -> Raw.Editable.get_enable_undo obj

    method get_max_width_chars : unit -> int =
      fun () -> Raw.Editable.get_max_width_chars obj

    method get_position : unit -> int = fun () -> Raw.Editable.get_position obj
    method get_text : unit -> string = fun () -> Raw.Editable.get_text obj

    method get_width_chars : unit -> int =
      fun () -> Raw.Editable.get_width_chars obj

    method init_delegate : unit -> unit =
      fun () -> Raw.Editable.init_delegate obj

    method select_region : int -> int -> unit =
      fun start_pos end_pos -> Raw.Editable.select_region obj start_pos end_pos

    method set_alignment : float -> unit =
      fun xalign -> Raw.Editable.set_alignment obj xalign

    method set_editable : bool -> unit =
      fun is_editable -> Raw.Editable.set_editable obj is_editable

    method set_enable_undo : bool -> unit =
      fun enable_undo -> Raw.Editable.set_enable_undo obj enable_undo

    method set_max_width_chars : int -> unit =
      fun n_chars -> Raw.Editable.set_max_width_chars obj n_chars

    method set_position : int -> unit =
      fun position -> Raw.Editable.set_position obj position

    method set_text : string -> unit =
      fun text -> Raw.Editable.set_text obj text

    method set_width_chars : int -> unit =
      fun n_chars -> Raw.Editable.set_width_chars obj n_chars

    method selection_bound = Raw.Editable.get_selection_bound obj
    method as_editable = obj
  end
