(** Meta-data to be passed to gtk_recent_manager_add_full() when registering a
    recently used resource.

    Its methods, signals and properties are on {!class-type-recent_data_t}. The
    functions it is built on are in {!Ocgtk.Raw.Recent_data}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [RecentData].}

    Meta-data to be passed to gtk_recent_manager_add_full() when registering a
    recently used resource. *)
class type recent_data_t = object
  method as_recent_data : Raw.Recent_data.t
end

class recent_data : Raw.Recent_data.t -> recent_data_t
(** Wraps a raw handle of {!Ocgtk.Raw.Recent_data.t}. *)
