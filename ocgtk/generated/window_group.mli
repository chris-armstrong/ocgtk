(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for WindowGroup from cyclic group Application_and__window_and__window_group *)

(** Creates groups of windows that behave like separate applications.

    It achieves this by limiting the effect of GTK grabs and modality to windows
    in the same group.

    A window can be a member in at most one window group at a time. Windows that
    have not been explicitly assigned to a group are implicitly treated like
    windows of the default window group.

    [GtkWindowGroup] objects are referenced by each window in the group, so once
    you have added all windows to a [GtkWindowGroup], you can drop the initial
    reference to the window group with g_object_unref(). If the windows in the
    window group are subsequently destroyed, then they will be removed from the
    window group and drop their references on the window group; when all window
    have been removed, the window group will be freed.

    Its methods, signals and properties are on {!class-type-window_group_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Window_group}. *)

class type window_group_t =
  Application_and__window_and__window_group.window_group_t
(** The methods, signals and properties of a [WindowGroup]. *)

class window_group : Raw.Window_group.t -> window_group_t
(** Wraps a raw handle of {!Ocgtk.Raw.Window_group.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> window_group_t
(** Creates a new [GtkWindowGroup] object.

    Modality of windows only affects windows within the same [GtkWindowGroup].
*)
