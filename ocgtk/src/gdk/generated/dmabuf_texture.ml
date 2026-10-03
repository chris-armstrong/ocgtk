(* GENERATED CODE - DO NOT EDIT *)
(* DmabufTexture: DmabufTexture *)

(** A [GdkTexture] representing a DMA buffer.

    To create a [GdkDmabufTexture], use the auxiliary [Gdk.DmabufTextureBuilder]
    object.

    Dma-buf textures can only be created on Linux. *)

type t = [ `dmabuf_texture | `texture | `object_ ] Gobject.obj

(* Methods *)
