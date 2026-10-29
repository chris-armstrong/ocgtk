(* GENERATED CODE - DO NOT EDIT *)
(* AppInfo, a member of the cyclic module App_info_cycle_64c425a0 *)

[@@@ocaml.text
"Information about an installed application and methods to launch\n\
 it (with file arguments).\n\n\
 [GAppInfo] and [GAppLaunchContext] are used for describing and launching\n\
 applications installed on the system.\n\n\
 As of GLib 2.20, URIs will always be converted to POSIX paths\n\
 (using [Gio.File.get_path]) when using [Gio.AppInfo.launch]\n\
 even if the application requested an URI and not a POSIX path. For example\n\
 for a desktop-file based application with the following Exec key:\n\n\
 {[\n\
 Exec=totem %U\n\
 ]}\n\n\
 and a single URI, [sftp://foo/file.avi], then\n\
 [/home/user/.gvfs/sftp on foo/file.avi] will be passed. This will only work\n\
 if a set of suitable GIO extensions (such as GVfs 2.26 compiled with FUSE\n\
 support), is available and operational; if this is not the case, the URI\n\
 will be passed unmodified to the application. Some URIs, such as [mailto:],\n\
 of course cannot be mapped to a POSIX path (in GVfs there’s no FUSE mount\n\
 for it); such URIs will be passed unmodified to the application.\n\n\
 Specifically for GVfs 2.26 and later, the POSIX URI will be mapped\n\
 back to the GIO URI in the {{!Ocgio.Raw.File}[Gio.File]} constructors (since \
 GVfs\n\
 implements the GVfs extension point). As such, if the application\n\
 needs to examine the URI, it needs to use [Gio.File.get_uri]\n\
 or similar on {{!Ocgio.Raw.File}[Gio.File]}. In other words, an application \
 cannot\n\
 assume that the URI passed to e.g. [Gio.File.new_for_commandline_arg]\n\
 is equal to the result of [Gio.File.get_uri]. The following snippet\n\
 illustrates this:\n\n\
 {[\n\
 GFile *f;\n\
 char *uri;\n\n\
 file = g_file_new_for_commandline_arg (uri_from_commandline);\n\n\
 uri = g_file_get_uri (file);\n\
 strcmp (uri, uri_from_commandline) == 0;\n\
 g_free (uri);\n\n\
 if (g_file_has_uri_scheme (file, \"cdda\"))\n\
\  {\n\
\    // do something special with uri\n\
\  }\n\
 g_object_unref (file);\n\
 ]}\n\n\
 This code will work when both [cdda://sr0/Track 1.wav] and\n\
 [/home/user/.gvfs/cdda on sr0/Track 1.wav] is passed to the\n\
 application. It should be noted that it’s generally not safe\n\
 for applications to rely on the format of a particular URIs.\n\
 Different launcher applications (e.g. file managers) may have\n\
 different ideas of what a given URI means.\n\n\
 The class built on this module is in {!Ocgio.App_info}."]

include module type of struct
  include App_info_cycle_64c425a0.App_info
end
