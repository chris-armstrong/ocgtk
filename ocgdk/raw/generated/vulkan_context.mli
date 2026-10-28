(* GENERATED CODE - DO NOT EDIT *)
(* VulkanContext, a member of the cyclic module App_launch_context_cycle_de440b34 *)

(** Represents the platform-specific Vulkan draw context.

    [GdkVulkanContext]s are created for a surface using
    [Gdk.Surface.create_vulkan_context], and the context will match the
    characteristics of the surface.

    Support for [GdkVulkanContext] is platform-specific and context creation can
    fail, returning [None] context.

    The class built on this module is in {!Ocgdk.Vulkan_context}. *)

include module type of struct
  include App_launch_context_cycle_de440b34.Vulkan_context
end
