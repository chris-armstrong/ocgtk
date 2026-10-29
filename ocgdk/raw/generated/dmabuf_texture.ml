(* GENERATED CODE - DO NOT EDIT *)
(* DmabufTexture: DmabufTexture *)

(** A [GdkTexture] representing a DMA buffer.

    To create a [GdkDmabufTexture], use the auxiliary
    {{!Ocgdk.Raw.Dmabuf_texture_builder}[Gdk.DmabufTextureBuilder]} object.

    Dma-buf textures can only be created on Linux.

    The class built on this module is in {!Ocgdk.Dmabuf_texture}. *)

type t = [ `dmabuf_texture | `texture | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gdk_dmabuf_texture_get_type"

(* Methods *)
