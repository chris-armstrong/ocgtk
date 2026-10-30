class type recent_data_t = object
  (** {2:conversions Conversions} *)

  method as_recent_data : Raw.Recent_data.t
end

(* High-level class for RecentData *)
class recent_data (obj : Raw.Recent_data.t) : recent_data_t =
  object (self)
    method as_recent_data = obj
  end
