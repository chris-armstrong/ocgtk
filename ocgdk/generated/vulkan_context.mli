(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for VulkanContext from cyclic group App_launch_context_cycle_de440b34 *)

(** Represents the platform-specific Vulkan draw context.

    [GdkVulkanContext]s are created for a surface using
    [Gdk.Surface.create_vulkan_context], and the context will match the
    characteristics of the surface.

    Support for [GdkVulkanContext] is platform-specific and context creation can
    fail, returning [NULL] context.

    Its methods, signals and properties are on {!class-type-vulkan_context_t}.
    The functions it is built on are in {!Ocgdk.Raw.Vulkan_context}. *)

class type vulkan_context_t = App_launch_context_cycle_de440b34.vulkan_context_t
(** The methods, signals and properties of a [GdkVulkanContext]. *)

class vulkan_context : Raw.Vulkan_context.t -> vulkan_context_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Vulkan_context.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GdkVulkanContext], give one already wrapped. *)
