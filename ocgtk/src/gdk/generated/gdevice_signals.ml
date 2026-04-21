(* Signal handlers for Device *)
class device_signals (obj : App_launch_context_cycle_de440b34.Device.t) =
  object
    method on_changed ~callback =
      Gobject.Signal.connect_simple obj ~name:"changed" ~callback ~after:false
    (** Emitted either when the number of either axes or keys changes.

        On X11 this will normally happen when the physical device routing events
        through the logical device changes (for example, user switches from the
        USB mouse to a tablet); in that case the logical device will change to
        reflect the axes and keys on the new physical device. *)
  end
