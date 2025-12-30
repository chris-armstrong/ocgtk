(* Signal handlers for Assistant *)
class assistant_signals (obj : Assistant.t) = object
  (** Emitted when the apply button is clicked.

The default behavior of the `GtkAssistant` is to switch to the page
after the current page, unless the current page is the last one.

A handler for the ::apply signal should carry out the actions for
which the wizard has collected data. If the action takes a long time
to complete, you might consider putting a page of type
%GTK_ASSISTANT_PAGE_PROGRESS after the confirmation page and handle
this operation within the [signal@Gtk.Assistant::prepare] signal of
the progress page. *)
  method on_apply ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"apply" ~callback ~after:false

  (** Emitted when then the cancel button is clicked. *)
  method on_cancel ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"cancel" ~callback ~after:false

  (** Emitted either when the close button of a summary page is clicked,
or when the apply button in the last page in the flow (of type
%GTK_ASSISTANT_PAGE_CONFIRM) is clicked. *)
  method on_close ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"close" ~callback ~after:false

  (** The action signal for the Escape binding. *)
  method on_escape ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"escape" ~callback ~after:false

end
