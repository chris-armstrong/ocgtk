class type recent_data_t = object
  method set_display_name : string -> unit
  method set_description : string -> unit
  method set_mime_type : string -> unit
  method set_app_name : string -> unit
  method set_app_exec : string -> unit
  method set_groups : string array -> unit
  method set_is_private : bool -> unit
  method as_recent_data : Recent_data.t
end

class recent_data : Recent_data.t -> recent_data_t

val make :
  string ->
  string ->
  string ->
  string ->
  string ->
  string array ->
  bool ->
  recent_data_t
