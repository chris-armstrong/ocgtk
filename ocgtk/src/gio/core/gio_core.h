/* Manually-maintained GIO core header.
   Add headers here that are not included via GIR auto-generation
   (e.g. UNIX-specific headers absent from older GIR versions). */

#pragma once

/* The following headers are Linux-only: they are present in gio-unix-2.0 on
   Linux but not in Homebrew's GLib on macOS or in FreeBSD's ports.
   The generated bindings for these types are guarded with (os "linux") in
   overrides/gio.sexp, so the C stubs are already wrapped in #ifdef __linux__.
   Guard the includes here too so the header is safe to include on all platforms. */
#ifdef __linux__
#include <gio/gunixconnection.h>
#include <gio/gunixcredentialsmessage.h>
#include <gio/gunixfdlist.h>
#include <gio/gunixfdmessage.h>
#include <gio/gunixinputstream.h>
#include <gio/gunixmounts.h>
#include <gio/gunixoutputstream.h>
#include <gio/gunixsocketaddress.h>
#endif /* __linux__ */
