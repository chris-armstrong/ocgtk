(** Mouse motion event controller *)

type t = EventController.t

(** Create a new motion event controller *)
val new_ : unit -> t

(** {2 Signals} *)

(** Emitted when pointer enters widget.
    @param x X coordinate
    @param y Y coordinate *)
val connect_enter :
  t ->
  callback:(x:float -> y:float -> unit) ->
  Gobject.handler_id

(** Emitted when pointer leaves widget *)
val connect_leave :
  t ->
  callback:(unit -> unit) ->
  Gobject.handler_id

(** Emitted when pointer moves within widget.
    @param x X coordinate
    @param y Y coordinate *)
val connect_motion :
  t ->
  callback:(x:float -> y:float -> unit) ->
  Gobject.handler_id

(** {2 Methods} *)

(** Check if pointer is currently in widget *)
val contains_pointer : t -> bool

(** Check if this widget is receiving motion events *)
val is_pointer : t -> bool
