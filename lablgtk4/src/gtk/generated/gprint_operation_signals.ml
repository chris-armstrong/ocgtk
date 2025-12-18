(* Signal handlers for PrintOperation *)
class print_operation_signals (obj : Print_operation.t) = object
  method on_begin_print ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"begin-print" ~callback ~after:false

  method on_create_custom_widget ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"create-custom-widget" ~callback ~after:false

  method on_custom_widget_apply ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"custom-widget-apply" ~callback ~after:false

  method on_done_ ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"done" ~callback ~after:false

  method on_draw_page ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"draw-page" ~callback ~after:false

  method on_end_print ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"end-print" ~callback ~after:false

  method on_paginate ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"paginate" ~callback ~after:false

  method on_preview ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"preview" ~callback ~after:false

  method on_request_page_setup ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"request-page-setup" ~callback ~after:false

  method on_status_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"status-changed" ~callback ~after:false

  method on_update_custom_widget ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"update-custom-widget" ~callback ~after:false

end
