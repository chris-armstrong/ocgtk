(* GENERATED CODE - DO NOT EDIT *)
(* Gio Enumeration and Bitfield Types *)

(* BusType - enumeration *)
type bustype = [
  | `STARTER (** An alias for the message bus that activated the process, if any. *)
  | `NONE (** Not a message bus. *)
  | `SYSTEM (** The system-wide message bus. *)
  | `SESSION (** The login session message bus. *)
]

val bustype_of_int : int -> bustype
val bustype_to_int : bustype -> int

(* ConverterResult - enumeration *)
type converterresult = [
  | `ERROR (** There was an error during conversion. *)
  | `CONVERTED (** Some data was consumed or produced *)
  | `FINISHED (** The conversion is finished *)
  | `FLUSHED (** Flushing is finished *)
]

val converterresult_of_int : int -> converterresult
val converterresult_to_int : converterresult -> int

(* CredentialsType - enumeration *)
type credentialstype = [
  | `INVALID (** Indicates an invalid native credential type. *)
  | `LINUX_UCRED (** The native credentials type is a [struct ucred]. *)
  | `FREEBSD_CMSGCRED (** The native credentials type is a [struct cmsgcred]. *)
  | `OPENBSD_SOCKPEERCRED (** The native credentials type is a [struct sockpeercred]. Added in 2.30. *)
  | `SOLARIS_UCRED (** The native credentials type is a [ucred_t]. Added in 2.40. *)
  | `NETBSD_UNPCBID (** The native credentials type is a [struct unpcbid]. Added in 2.42. *)
  | `APPLE_XUCRED (** The native credentials type is a [struct xucred]. Added in 2.66. *)
  | `WIN32_PID (** The native credentials type is a PID [DWORD]. Added in 2.72. *)
]

val credentialstype_of_int : int -> credentialstype
val credentialstype_to_int : credentialstype -> int

(* DBusError - enumeration *)
type dbuserror = [
  | `FAILED (** A generic error; "something went wrong" - see the error message for
more. *)
  | `NO_MEMORY (** There was not enough memory to complete an operation. *)
  | `SERVICE_UNKNOWN (** The bus doesn't know how to launch a service to supply the bus name
you wanted. *)
  | `NAME_HAS_NO_OWNER (** The bus name you referenced doesn't exist (i.e. no application owns
it). *)
  | `NO_REPLY (** No reply to a message expecting one, usually means a timeout occurred. *)
  | `IO_ERROR (** Something went wrong reading or writing to a socket, for example. *)
  | `BAD_ADDRESS (** A D-Bus bus address was malformed. *)
  | `NOT_SUPPORTED (** Requested operation isn't supported (like ENOSYS on UNIX). *)
  | `LIMITS_EXCEEDED (** Some limited resource is exhausted. *)
  | `ACCESS_DENIED (** Security restrictions don't allow doing what you're trying to do. *)
  | `AUTH_FAILED (** Authentication didn't work. *)
  | `NO_SERVER (** Unable to connect to server (probably caused by ECONNREFUSED on a
socket). *)
  | `TIMEOUT (** Certain timeout errors, possibly ETIMEDOUT on a socket.  Note that
[G_DBUS_ERROR_NO_REPLY] is used for message reply timeouts. Warning:
this is confusingly-named given that [G_DBUS_ERROR_TIMED_OUT] also
exists. We can't fix it for compatibility reasons so just be
careful. *)
  | `NO_NETWORK (** No network access (probably ENETUNREACH on a socket). *)
  | `ADDRESS_IN_USE (** Can't bind a socket since its address is in use (i.e. EADDRINUSE). *)
  | `DISCONNECTED (** The connection is disconnected and you're trying to use it. *)
  | `INVALID_ARGS (** Invalid arguments passed to a method call. *)
  | `FILE_NOT_FOUND (** Missing file. *)
  | `FILE_EXISTS (** Existing file and the operation you're using does not silently overwrite. *)
  | `UNKNOWN_METHOD (** Method name you invoked isn't known by the object you invoked it on. *)
  | `TIMED_OUT (** Certain timeout errors, e.g. while starting a service. Warning: this is
confusingly-named given that [G_DBUS_ERROR_TIMEOUT] also exists. We
can't fix it for compatibility reasons so just be careful. *)
  | `MATCH_RULE_NOT_FOUND (** Tried to remove or modify a match rule that didn't exist. *)
  | `MATCH_RULE_INVALID (** The match rule isn't syntactically valid. *)
  | `SPAWN_EXEC_FAILED (** While starting a new process, the exec() call failed. *)
  | `SPAWN_FORK_FAILED (** While starting a new process, the fork() call failed. *)
  | `SPAWN_CHILD_EXITED (** While starting a new process, the child exited with a status code. *)
  | `SPAWN_CHILD_SIGNALED (** While starting a new process, the child exited on a signal. *)
  | `SPAWN_FAILED (** While starting a new process, something went wrong. *)
  | `SPAWN_SETUP_FAILED (** We failed to setup the environment correctly. *)
  | `SPAWN_CONFIG_INVALID (** We failed to setup the config parser correctly. *)
  | `SPAWN_SERVICE_INVALID (** Bus name was not valid. *)
  | `SPAWN_SERVICE_NOT_FOUND (** Service file not found in system-services directory. *)
  | `SPAWN_PERMISSIONS_INVALID (** Permissions are incorrect on the setuid helper. *)
  | `SPAWN_FILE_INVALID (** Service file invalid (Name, User or Exec missing). *)
  | `SPAWN_NO_MEMORY (** Tried to get a UNIX process ID and it wasn't available. *)
  | `UNIX_PROCESS_ID_UNKNOWN (** Tried to get a UNIX process ID and it wasn't available. *)
  | `INVALID_SIGNATURE (** A type signature is not valid. *)
  | `INVALID_FILE_CONTENT (** A file contains invalid syntax or is otherwise broken. *)
  | `SELINUX_SECURITY_CONTEXT_UNKNOWN (** Asked for SELinux security context and it wasn't available. *)
  | `ADT_AUDIT_DATA_UNKNOWN (** Asked for ADT audit data and it wasn't available. *)
  | `OBJECT_PATH_IN_USE (** There's already an object with the requested object path. *)
  | `UNKNOWN_OBJECT (** Object you invoked a method on isn't known. Since 2.42 *)
  | `UNKNOWN_INTERFACE (** Interface you invoked a method on isn't known by the object. Since 2.42 *)
  | `UNKNOWN_PROPERTY (** Property you tried to access isn't known by the object. Since 2.42 *)
  | `PROPERTY_READ_ONLY (** Property you tried to set is read-only. Since 2.42 *)
]

val dbuserror_of_int : int -> dbuserror
val dbuserror_to_int : dbuserror -> int

(* DBusMessageByteOrder - enumeration *)
type dbusmessagebyteorder = [
  | `BIG_ENDIAN (** The byte order is big endian. *)
  | `LITTLE_ENDIAN (** The byte order is little endian. *)
]

val dbusmessagebyteorder_of_int : int -> dbusmessagebyteorder
val dbusmessagebyteorder_to_int : dbusmessagebyteorder -> int

(* DBusMessageHeaderField - enumeration *)
type dbusmessageheaderfield = [
  | `INVALID (** Not a valid header field. *)
  | `PATH (** The object path. *)
  | `INTERFACE (** The interface name. *)
  | `MEMBER (** The method or signal name. *)
  | `ERROR_NAME (** The name of the error that occurred. *)
  | `REPLY_SERIAL (** The serial number the message is a reply to. *)
  | `DESTINATION (** The name the message is intended for. *)
  | `SENDER (** Unique name of the sender of the message (filled in by the bus). *)
  | `SIGNATURE (** The signature of the message body. *)
  | `NUM_UNIX_FDS (** The number of UNIX file descriptors that accompany the message. *)
]

val dbusmessageheaderfield_of_int : int -> dbusmessageheaderfield
val dbusmessageheaderfield_to_int : dbusmessageheaderfield -> int

(* DBusMessageType - enumeration *)
type dbusmessagetype = [
  | `INVALID (** Message is of invalid type. *)
  | `METHOD_CALL (** Method call. *)
  | `METHOD_RETURN (** Method reply. *)
  | `ERROR (** Error reply. *)
  | `SIGNAL (** Signal emission. *)
]

val dbusmessagetype_of_int : int -> dbusmessagetype
val dbusmessagetype_to_int : dbusmessagetype -> int

(* DataStreamByteOrder - enumeration *)
type datastreambyteorder = [
  | `BIG_ENDIAN (** Selects Big Endian byte order. *)
  | `LITTLE_ENDIAN (** Selects Little Endian byte order. *)
  | `HOST_ENDIAN (** Selects endianness based on host machine's architecture. *)
]

val datastreambyteorder_of_int : int -> datastreambyteorder
val datastreambyteorder_to_int : datastreambyteorder -> int

(* DataStreamNewlineType - enumeration *)
type datastreamnewlinetype = [
  | `LF (** Selects "LF" line endings, common on most modern UNIX platforms. *)
  | `CR (** Selects "CR" line endings. *)
  | `CR_LF (** Selects "CR, LF" line ending, common on Microsoft Windows. *)
  | `ANY (** Automatically try to handle any line ending type. *)
]

val datastreamnewlinetype_of_int : int -> datastreamnewlinetype
val datastreamnewlinetype_to_int : datastreamnewlinetype -> int

(* DriveStartStopType - enumeration *)
type drivestartstoptype = [
  | `UNKNOWN (** Unknown or drive doesn't support
start/stop. *)
  | `SHUTDOWN (** The stop method will physically
shut down the drive and e.g. power down the port the drive is
attached to. *)
  | `NETWORK (** The start/stop methods are used
for connecting/disconnect to the drive over the network. *)
  | `MULTIDISK (** The start/stop methods will
assemble/disassemble a virtual drive from several physical
drives. *)
  | `PASSWORD (** The start/stop methods will
unlock/lock the disk (for example using the ATA [SECURITY UNLOCK
DEVICE] command) *)
]

val drivestartstoptype_of_int : int -> drivestartstoptype
val drivestartstoptype_to_int : drivestartstoptype -> int

(* EmblemOrigin - enumeration *)
type emblemorigin = [
  | `UNKNOWN (** Emblem of unknown origin *)
  | `DEVICE (** Emblem adds device-specific information *)
  | `LIVEMETADATA (** Emblem depicts live metadata, such as "readonly" *)
  | `TAG (** Emblem comes from a user-defined tag, e.g. set by nautilus (in the future) *)
]

val emblemorigin_of_int : int -> emblemorigin
val emblemorigin_to_int : emblemorigin -> int

(* FileAttributeStatus - enumeration *)
type fileattributestatus = [
  | `UNSET (** Attribute value is unset (empty). *)
  | `SET (** Attribute value is set. *)
  | `ERROR_SETTING (** Indicates an error in setting the value. *)
]

val fileattributestatus_of_int : int -> fileattributestatus
val fileattributestatus_to_int : fileattributestatus -> int

(* FileAttributeType - enumeration *)
type fileattributetype = [
  | `INVALID (** indicates an invalid or uninitialized type. *)
  | `STRING (** a null terminated UTF8 string. *)
  | `BYTE_STRING (** a zero terminated string of non-zero bytes. *)
  | `BOOLEAN (** a boolean value. *)
  | `UINT32 (** an unsigned 4-byte/32-bit integer. *)
  | `INT32 (** a signed 4-byte/32-bit integer. *)
  | `UINT64 (** an unsigned 8-byte/64-bit integer. *)
  | `INT64 (** a signed 8-byte/64-bit integer. *)
  | `OBJECT (** a [GObject]. *)
  | `STRINGV (** a [NULL] terminated char **. Since 2.22 *)
]

val fileattributetype_of_int : int -> fileattributetype
val fileattributetype_to_int : fileattributetype -> int

(* FileMonitorEvent - enumeration *)
type filemonitorevent = [
  | `CHANGED (** a file changed. *)
  | `CHANGES_DONE_HINT (** a hint that this was probably the last change in a set of changes. *)
  | `DELETED (** a file was deleted. *)
  | `CREATED (** a file was created. *)
  | `ATTRIBUTE_CHANGED (** a file attribute was changed. *)
  | `PRE_UNMOUNT (** the file location will soon be unmounted. *)
  | `UNMOUNTED (** the file location was unmounted. *)
  | `MOVED (** the file was moved -- only sent if the
(deprecated) [G_FILE_MONITOR_SEND_MOVED] flag is set *)
  | `RENAMED (** the file was renamed within the
current directory -- only sent if the [G_FILE_MONITOR_WATCH_MOVES]
flag is set.  Since: 2.46. *)
  | `MOVED_IN (** the file was moved into the
monitored directory from another location -- only sent if the
[G_FILE_MONITOR_WATCH_MOVES] flag is set.  Since: 2.46. *)
  | `MOVED_OUT (** the file was moved out of the
monitored directory to another location -- only sent if the
[G_FILE_MONITOR_WATCH_MOVES] flag is set.  Since: 2.46 *)
]

val filemonitorevent_of_int : int -> filemonitorevent
val filemonitorevent_to_int : filemonitorevent -> int

(* FileType - enumeration *)
type filetype = [
  | `UNKNOWN (** File's type is unknown. *)
  | `REGULAR (** File handle represents a regular file. *)
  | `DIRECTORY (** File handle represents a directory. *)
  | `SYMBOLIC_LINK (** File handle represents a symbolic link
(Unix systems). *)
  | `SPECIAL (** File is a "special" file, such as a socket, fifo,
block device, or character device. *)
  | `SHORTCUT (** File is a shortcut (Windows systems). *)
  | `MOUNTABLE (** File is a mountable location. *)
]

val filetype_of_int : int -> filetype
val filetype_to_int : filetype -> int

(* FilesystemPreviewType - enumeration *)
type filesystempreviewtype = [
  | `IF_ALWAYS (** Only preview files if user has explicitly requested it. *)
  | `IF_LOCAL (** Preview files if user has requested preview of "local" files. *)
  | `NEVER (** Never preview files. *)
]

val filesystempreviewtype_of_int : int -> filesystempreviewtype
val filesystempreviewtype_to_int : filesystempreviewtype -> int

(* IOErrorEnum - enumeration *)
type ioerrorenum = [
  | `FAILED (** Generic error condition for when an operation fails
and no more specific [GIOErrorEnum] value is defined. *)
  | `NOT_FOUND (** File not found. *)
  | `EXISTS (** File already exists. *)
  | `IS_DIRECTORY (** File is a directory. *)
  | `NOT_DIRECTORY (** File is not a directory. *)
  | `NOT_EMPTY (** File is a directory that isn't empty. *)
  | `NOT_REGULAR_FILE (** File is not a regular file. *)
  | `NOT_SYMBOLIC_LINK (** File is not a symbolic link. *)
  | `NOT_MOUNTABLE_FILE (** File cannot be mounted. *)
  | `FILENAME_TOO_LONG (** Filename is too many characters. *)
  | `INVALID_FILENAME (** Filename is invalid or contains invalid characters. *)
  | `TOO_MANY_LINKS (** File contains too many symbolic links. *)
  | `NO_SPACE (** No space left on drive. *)
  | `INVALID_ARGUMENT (** Invalid argument. *)
  | `PERMISSION_DENIED (** Permission denied. *)
  | `NOT_SUPPORTED (** Operation (or one of its parameters) not supported *)
  | `NOT_MOUNTED (** File isn't mounted. *)
  | `ALREADY_MOUNTED (** File is already mounted. *)
  | `CLOSED (** File was closed. *)
  | `CANCELLED (** Operation was cancelled. See [GCancellable]. *)
  | `PENDING (** Operations are still pending. *)
  | `READ_ONLY (** File is read only. *)
  | `CANT_CREATE_BACKUP (** Backup couldn't be created. *)
  | `WRONG_ETAG (** File's Entity Tag was incorrect. *)
  | `TIMED_OUT (** Operation timed out. *)
  | `WOULD_RECURSE (** Operation would be recursive. *)
  | `BUSY (** File is busy. *)
  | `WOULD_BLOCK (** Operation would block. *)
  | `HOST_NOT_FOUND (** Host couldn't be found (remote operations). *)
  | `WOULD_MERGE (** Operation would merge files. *)
  | `FAILED_HANDLED (** Operation failed and a helper program has
already interacted with the user. Do not display any error dialog. *)
  | `TOO_MANY_OPEN_FILES (** The current process has too many files
open and can't open any more. Duplicate descriptors do count toward
this limit. Since 2.20 *)
  | `NOT_INITIALIZED (** The object has not been initialized. Since 2.22 *)
  | `ADDRESS_IN_USE (** The requested address is already in use. Since 2.22 *)
  | `PARTIAL_INPUT (** Need more input to finish operation. Since 2.24 *)
  | `INVALID_DATA (** The input data was invalid. Since 2.24 *)
  | `DBUS_ERROR (** A remote object generated an error that
doesn't correspond to a locally registered [GError] error
domain. Use g_dbus_error_get_remote_error() to extract the D-Bus
error name and g_dbus_error_strip_remote_error() to fix up the
message so it matches what was received on the wire. Since 2.26. *)
  | `HOST_UNREACHABLE (** Host unreachable. Since 2.26 *)
  | `NETWORK_UNREACHABLE (** Network unreachable. Since 2.26 *)
  | `CONNECTION_REFUSED (** Connection refused. Since 2.26 *)
  | `PROXY_FAILED (** Connection to proxy server failed. Since 2.26 *)
  | `PROXY_AUTH_FAILED (** Proxy authentication failed. Since 2.26 *)
  | `PROXY_NEED_AUTH (** Proxy server needs authentication. Since 2.26 *)
  | `PROXY_NOT_ALLOWED (** Proxy connection is not allowed by ruleset.
Since 2.26 *)
  | `BROKEN_PIPE (** Broken pipe. Since 2.36 *)
  | `CONNECTION_CLOSED (** Connection closed by peer. Note that this
is the same code as [G_IO_ERROR_BROKEN_PIPE]; before 2.44 some
"connection closed" errors returned [G_IO_ERROR_BROKEN_PIPE], but others
returned [G_IO_ERROR_FAILED]. Now they should all return the same
value, which has this more logical name. Since 2.44. *)
  | `NOT_CONNECTED (** Transport endpoint is not connected. Since 2.44 *)
  | `MESSAGE_TOO_LARGE (** Message too large. Since 2.48. *)
  | `NO_SUCH_DEVICE (** No such device found. Since 2.74 *)
  | `DESTINATION_UNSET (** Destination address unset. Since 2.80 *)
]

val ioerrorenum_of_int : int -> ioerrorenum
val ioerrorenum_to_int : ioerrorenum -> int

(* IOModuleScopeFlags - enumeration *)
type iomodulescopeflags = [
  | `NONE (** No module scan flags *)
  | `BLOCK_DUPLICATES (** When using this scope to load or
scan modules, automatically block a modules which has the same base
basename as previously loaded module. *)
]

val iomodulescopeflags_of_int : int -> iomodulescopeflags
val iomodulescopeflags_to_int : iomodulescopeflags -> int

(* MemoryMonitorWarningLevel - enumeration *)
type memorymonitorwarninglevel = [
  | `LOW (** Memory on the device is low, processes
should free up unneeded resources (for example, in-memory caches) so they can
be used elsewhere. *)
  | `MEDIUM (** Same as \@G_MEMORY_MONITOR_WARNING_LEVEL_LOW
but the device has even less free memory, so processes should try harder to free
up unneeded resources. If your process does not need to stay running, it is a
good time for it to quit. *)
  | `CRITICAL (** The system will soon start terminating
processes to reclaim memory, including background processes. *)
]

val memorymonitorwarninglevel_of_int : int -> memorymonitorwarninglevel
val memorymonitorwarninglevel_to_int : memorymonitorwarninglevel -> int

(* MountOperationResult - enumeration *)
type mountoperationresult = [
  | `HANDLED (** The request was fulfilled and the
user specified data is now available *)
  | `ABORTED (** The user requested the mount operation
to be aborted *)
  | `UNHANDLED (** The request was unhandled (i.e. not
implemented) *)
]

val mountoperationresult_of_int : int -> mountoperationresult
val mountoperationresult_to_int : mountoperationresult -> int

(* NetworkConnectivity - enumeration *)
type networkconnectivity = [
  | `LOCAL (** The host is not configured with a
route to the Internet; it may or may not be connected to a local
network. *)
  | `LIMITED (** The host is connected to a network, but
does not appear to be able to reach the full Internet, perhaps
due to upstream network problems. *)
  | `PORTAL (** The host is behind a captive portal and
cannot reach the full Internet. *)
  | `FULL (** The host is connected to a network, and
appears to be able to reach the full Internet. *)
]

val networkconnectivity_of_int : int -> networkconnectivity
val networkconnectivity_to_int : networkconnectivity -> int

(* NotificationPriority - enumeration *)
type notificationpriority = [
  | `NORMAL (** the default priority, to be used for the
majority of notifications (for example email messages, software updates,
completed download/sync operations) *)
  | `LOW (** for notifications that do not require
immediate attention - typically used for contextual background
information, such as contact birthdays or local weather *)
  | `HIGH (** for events that require more attention,
usually because responses are time-sensitive (for example chat and SMS
messages or alarms) *)
  | `URGENT (** for urgent notifications, or notifications
that require a response in a short space of time (for example phone calls
or emergency warnings) *)
]

val notificationpriority_of_int : int -> notificationpriority
val notificationpriority_to_int : notificationpriority -> int

(* PasswordSave - enumeration *)
type passwordsave = [
  | `NEVER (** never save a password. *)
  | `FOR_SESSION (** save a password for the session. *)
  | `PERMANENTLY (** save a password permanently. *)
]

val passwordsave_of_int : int -> passwordsave
val passwordsave_to_int : passwordsave -> int

(* PollableReturn - enumeration *)
type pollablereturn = [
  | `FAILED (** Generic error condition for when an operation fails. *)
  | `OK (** The operation was successfully finished. *)
  | `WOULD_BLOCK (** The operation would block. *)
]

val pollablereturn_of_int : int -> pollablereturn
val pollablereturn_to_int : pollablereturn -> int

(* ResolverError - enumeration *)
type resolvererror = [
  | `NOT_FOUND (** the requested name/address/service was not
found *)
  | `TEMPORARY_FAILURE (** the requested information could not
be looked up due to a network error or similar problem *)
  | `INTERNAL (** unknown error *)
]

val resolvererror_of_int : int -> resolvererror
val resolvererror_to_int : resolvererror -> int

(* ResolverRecordType - enumeration *)
type resolverrecordtype = [
  | `SRV (** look up DNS SRV records for a domain *)
  | `MX (** look up DNS MX records for a domain *)
  | `TXT (** look up DNS TXT records for a name *)
  | `SOA (** look up DNS SOA records for a zone *)
  | `NS (** look up DNS NS records for a domain *)
]

val resolverrecordtype_of_int : int -> resolverrecordtype
val resolverrecordtype_to_int : resolverrecordtype -> int

(* ResourceError - enumeration *)
type resourceerror = [
  | `NOT_FOUND (** no file was found at the requested path *)
  | `INTERNAL (** unknown error *)
]

val resourceerror_of_int : int -> resourceerror
val resourceerror_to_int : resourceerror -> int

(* SocketClientEvent - enumeration *)
type socketclientevent = [
  | `RESOLVING (** The client is doing a DNS lookup. *)
  | `RESOLVED (** The client has completed a DNS lookup. *)
  | `CONNECTING (** The client is connecting to a remote
host (either a proxy or the destination server). *)
  | `CONNECTED (** The client has connected to a remote
host. *)
  | `PROXY_NEGOTIATING (** The client is negotiating
with a proxy to connect to the destination server. *)
  | `PROXY_NEGOTIATED (** The client has negotiated
with the proxy server. *)
  | `TLS_HANDSHAKING (** The client is performing a
TLS handshake. *)
  | `TLS_HANDSHAKED (** The client has performed a
TLS handshake. *)
  | `COMPLETE (** The client is done with a particular
[GSocketConnectable]. *)
]

val socketclientevent_of_int : int -> socketclientevent
val socketclientevent_to_int : socketclientevent -> int

(* SocketFamily - enumeration *)
type socketfamily = [
  | `INVALID (** no address family *)
  | `UNIX (** the UNIX domain family *)
  | `IPV4 (** the IPv4 family *)
  | `IPV6 (** the IPv6 family *)
]

val socketfamily_of_int : int -> socketfamily
val socketfamily_to_int : socketfamily -> int

(* SocketListenerEvent - enumeration *)
type socketlistenerevent = [
  | `BINDING (** The listener is about to bind a socket. *)
  | `BOUND (** The listener has bound a socket. *)
  | `LISTENING (** The listener is about to start
listening on this socket. *)
  | `LISTENED (** The listener is now listening on
this socket. *)
]

val socketlistenerevent_of_int : int -> socketlistenerevent
val socketlistenerevent_to_int : socketlistenerevent -> int

(* SocketProtocol - enumeration *)
type socketprotocol = [
  | `UNKNOWN (** The protocol type is unknown *)
  | `DEFAULT (** The default protocol for the family/type *)
  | `TCP (** TCP over IP *)
  | `UDP (** UDP over IP *)
  | `SCTP (** SCTP over IP *)
]

val socketprotocol_of_int : int -> socketprotocol
val socketprotocol_to_int : socketprotocol -> int

(* SocketType - enumeration *)
type sockettype = [
  | `INVALID (** Type unknown or wrong *)
  | `STREAM (** Reliable connection-based byte streams (e.g. TCP). *)
  | `DATAGRAM (** Connectionless, unreliable datagram passing.
(e.g. UDP) *)
  | `SEQPACKET (** Reliable connection-based passing of datagrams
of fixed maximum length (e.g. SCTP). *)
]

val sockettype_of_int : int -> sockettype
val sockettype_to_int : sockettype -> int

(* TlsAuthenticationMode - enumeration *)
type tlsauthenticationmode = [
  | `NONE (** client authentication not required *)
  | `REQUESTED (** client authentication is requested *)
  | `REQUIRED (** client authentication is required *)
]

val tlsauthenticationmode_of_int : int -> tlsauthenticationmode
val tlsauthenticationmode_to_int : tlsauthenticationmode -> int

(* TlsCertificateRequestFlags - enumeration *)
type tlscertificaterequestflags = [
  | `NONE (** No flags *)
]

val tlscertificaterequestflags_of_int : int -> tlscertificaterequestflags
val tlscertificaterequestflags_to_int : tlscertificaterequestflags -> int

(* TlsChannelBindingError - enumeration *)
type tlschannelbindingerror = [
  | `NOT_IMPLEMENTED (** Either entire binding
retrieval facility or specific binding type is not implemented in the
TLS backend. *)
  | `INVALID_STATE (** The handshake is not yet
complete on the connection which is a strong requirement for any existing
binding type. *)
  | `NOT_AVAILABLE (** Handshake is complete but
binding data is not available. That normally indicates the TLS
implementation failed to provide the binding data. For example, some
implementations do not provide a peer certificate for resumed connections. *)
  | `NOT_SUPPORTED (** Binding type is not supported
on the current connection. This error could be triggered when requesting
[tls-server-end-point] binding data for a certificate which has no hash
function or uses multiple hash functions. *)
  | `GENERAL_ERROR (** Any other backend error
preventing binding data retrieval. *)
]

val tlschannelbindingerror_of_int : int -> tlschannelbindingerror
val tlschannelbindingerror_to_int : tlschannelbindingerror -> int

(* TlsChannelBindingType - enumeration *)
type tlschannelbindingtype = [
  | `UNIQUE (** {{:https://tools.ietf.org/html/rfc5929#section-3}[tls-unique]} binding
type *)
  | `SERVER_END_POINT (** {{:https://tools.ietf.org/html/rfc5929#section-4}[tls-server-end-point]}
binding type *)
  | `EXPORTER (** {{:https://www.rfc-editor.org/rfc/rfc9266.html}[tls-exporter]} binding
type. Since: 2.74 *)
]

val tlschannelbindingtype_of_int : int -> tlschannelbindingtype
val tlschannelbindingtype_to_int : tlschannelbindingtype -> int

(* TlsDatabaseLookupFlags - enumeration *)
type tlsdatabaselookupflags = [
  | `NONE (** No lookup flags *)
  | `KEYPAIR (** Restrict lookup to certificates that have
a private key. *)
]

val tlsdatabaselookupflags_of_int : int -> tlsdatabaselookupflags
val tlsdatabaselookupflags_to_int : tlsdatabaselookupflags -> int

(* TlsError - enumeration *)
type tlserror = [
  | `UNAVAILABLE (** No TLS provider is available *)
  | `MISC (** Miscellaneous TLS error *)
  | `BAD_CERTIFICATE (** The certificate presented could not
be parsed or failed validation. *)
  | `NOT_TLS (** The TLS handshake failed because the
peer does not seem to be a TLS server. *)
  | `HANDSHAKE (** The TLS handshake failed because the
peer's certificate was not acceptable. *)
  | `CERTIFICATE_REQUIRED (** The TLS handshake failed because
the server requested a client-side certificate, but none was
provided. See g_tls_connection_set_certificate(). *)
  | `EOF (** The TLS connection was closed without proper
notice, which may indicate an attack. See
g_tls_connection_set_require_close_notify(). *)
  | `INAPPROPRIATE_FALLBACK (** The TLS handshake failed
because the client sent the fallback SCSV, indicating a protocol
downgrade attack. Since: 2.60 *)
  | `BAD_CERTIFICATE_PASSWORD (** The certificate failed
to load because a password was incorrect. Since: 2.72 *)
]

val tlserror_of_int : int -> tlserror
val tlserror_to_int : tlserror -> int

(* TlsInteractionResult - enumeration *)
type tlsinteractionresult = [
  | `UNHANDLED (** The interaction was unhandled (i.e. not
implemented). *)
  | `HANDLED (** The interaction completed, and resulting data
is available. *)
  | `FAILED (** The interaction has failed, or was cancelled.
and the operation should be aborted. *)
]

val tlsinteractionresult_of_int : int -> tlsinteractionresult
val tlsinteractionresult_to_int : tlsinteractionresult -> int

(* TlsProtocolVersion - enumeration *)
type tlsprotocolversion = [
  | `UNKNOWN (** No protocol version or unknown protocol version *)
  | `SSL_3_0 (** SSL 3.0, which is insecure and should not be used *)
  | `TLS_1_0 (** TLS 1.0, which is insecure and should not be used *)
  | `TLS_1_1 (** TLS 1.1, which is insecure and should not be used *)
  | `TLS_1_2 (** TLS 1.2, defined by {{:https://datatracker.ietf.org/doc/html/rfc5246}RFC 5246} *)
  | `TLS_1_3 (** TLS 1.3, defined by {{:https://datatracker.ietf.org/doc/html/rfc8446}RFC 8446} *)
  | `DTLS_1_0 (** DTLS 1.0, which is insecure and should not be used *)
  | `DTLS_1_2 (** DTLS 1.2, defined by {{:https://datatracker.ietf.org/doc/html/rfc6347}RFC 6347} *)
]

val tlsprotocolversion_of_int : int -> tlsprotocolversion
val tlsprotocolversion_to_int : tlsprotocolversion -> int

(* TlsRehandshakeMode - enumeration *)
type tlsrehandshakemode = [
  | `NEVER (** Never allow rehandshaking *)
  | `SAFELY (** Allow safe rehandshaking only *)
  | `UNSAFELY (** Allow unsafe rehandshaking *)
]

val tlsrehandshakemode_of_int : int -> tlsrehandshakemode
val tlsrehandshakemode_to_int : tlsrehandshakemode -> int

(* UnixSocketAddressType - enumeration *)
type unixsocketaddresstype = [
  | `INVALID (** invalid *)
  | `ANONYMOUS (** anonymous *)
  | `PATH (** a filesystem path *)
  | `ABSTRACT (** an abstract name *)
  | `ABSTRACT_PADDED (** an abstract name, 0-padded
to the full length of a unix socket name *)
]

val unixsocketaddresstype_of_int : int -> unixsocketaddresstype
val unixsocketaddresstype_to_int : unixsocketaddresstype -> int

(* ZlibCompressorFormat - enumeration *)
type zlibcompressorformat = [
  | `ZLIB (** deflate compression with zlib header *)
  | `GZIP (** gzip file format *)
  | `RAW (** deflate compression with no header *)
]

val zlibcompressorformat_of_int : int -> zlibcompressorformat
val zlibcompressorformat_to_int : zlibcompressorformat -> int

(* AppInfoCreateFlags - bitfield/flags *)
type appinfocreateflags_flag = [
  | `NONE (** No flags. *)
  | `NEEDS_TERMINAL (** Application opens in a terminal window. *)
  | `SUPPORTS_URIS (** Application supports URI arguments. *)
  | `SUPPORTS_STARTUP_NOTIFICATION (** Application supports startup notification. Since 2.26 *)
]

type appinfocreateflags = appinfocreateflags_flag list

val appinfocreateflags_of_int : int -> appinfocreateflags
val appinfocreateflags_to_int : appinfocreateflags -> int

(* ApplicationFlags - bitfield/flags *)
type applicationflags_flag = [
  | `FLAGS_NONE (** Default flags. *)
  | `DEFAULT_FLAGS (** Default flags. *)
  | `IS_SERVICE (** Run as a service. In this mode, registration
fails if the service is already running, and the application
will initially wait up to 10 seconds for an initial activation
message to arrive. *)
  | `IS_LAUNCHER (** Don't try to become the primary instance. *)
  | `HANDLES_OPEN (** This application handles opening files (in
the primary instance). Note that this flag only affects the default
implementation of local_command_line(), and has no effect if
[G_APPLICATION_HANDLES_COMMAND_LINE] is given.
See g_application_run() for details. *)
  | `HANDLES_COMMAND_LINE (** This application handles command line
arguments (in the primary instance). Note that this flag only affect
the default implementation of local_command_line().
See g_application_run() for details. *)
  | `SEND_ENVIRONMENT (** Send the environment of the
launching process to the primary instance. Set this flag if your
application is expected to behave differently depending on certain
environment variables. For instance, an editor might be expected
to use the [GIT_COMMITTER_NAME] environment variable
when editing a git commit message. The environment is available
to the [GApplication::command]-line signal handler, via
g_application_command_line_getenv(). *)
  | `NON_UNIQUE (** Make no attempts to do any of the typical
single-instance application negotiation, even if the application
ID is given.  The application neither attempts to become the
owner of the application ID nor does it check if an existing
owner already exists.  Everything occurs in the local process.
Since: 2.30. *)
  | `CAN_OVERRIDE_APP_ID (** Allow users to override the
application ID from the command line with [--gapplication-app-id].
Since: 2.48 *)
  | `ALLOW_REPLACEMENT (** Allow another instance to take over
the bus name. Since: 2.60 *)
  | `REPLACE (** Take over from another instance. This flag is
usually set by passing [--gapplication-replace] on the commandline.
Since: 2.60 *)
]

type applicationflags = applicationflags_flag list

val applicationflags_of_int : int -> applicationflags
val applicationflags_to_int : applicationflags -> int

(* AskPasswordFlags - bitfield/flags *)
type askpasswordflags_flag = [
  | `NEED_PASSWORD (** operation requires a password. *)
  | `NEED_USERNAME (** operation requires a username. *)
  | `NEED_DOMAIN (** operation requires a domain. *)
  | `SAVING_SUPPORTED (** operation supports saving settings. *)
  | `ANONYMOUS_SUPPORTED (** operation supports anonymous users. *)
  | `TCRYPT (** operation takes TCRYPT parameters (Since: 2.58) *)
]

type askpasswordflags = askpasswordflags_flag list

val askpasswordflags_of_int : int -> askpasswordflags
val askpasswordflags_to_int : askpasswordflags -> int

(* BusNameOwnerFlags - bitfield/flags *)
type busnameownerflags_flag = [
  | `NONE (** No flags set. *)
  | `ALLOW_REPLACEMENT (** Allow another message bus connection to claim the name. *)
  | `REPLACE (** If another message bus connection owns the name and have
specified [G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT], then take the name from the other connection. *)
  | `DO_NOT_QUEUE (** If another message bus connection owns the name, immediately return an error
from [Gio.bus_own_name] rather than entering the waiting queue for that
name. *)
]

type busnameownerflags = busnameownerflags_flag list

val busnameownerflags_of_int : int -> busnameownerflags
val busnameownerflags_to_int : busnameownerflags -> int

(* BusNameWatcherFlags - bitfield/flags *)
type busnamewatcherflags_flag = [
  | `NONE (** No flags set. *)
  | `AUTO_START (** If no-one owns the name when
beginning to watch the name, ask the bus to launch an owner for the
name. *)
]

type busnamewatcherflags = busnamewatcherflags_flag list

val busnamewatcherflags_of_int : int -> busnamewatcherflags
val busnamewatcherflags_to_int : busnamewatcherflags -> int

(* ConverterFlags - bitfield/flags *)
type converterflags_flag = [
  | `NONE (** No flags. *)
  | `INPUT_AT_END (** At end of input data *)
  | `FLUSH (** Flush data *)
]

type converterflags = converterflags_flag list

val converterflags_of_int : int -> converterflags
val converterflags_to_int : converterflags -> int

(* DBusCallFlags - bitfield/flags *)
type dbuscallflags_flag = [
  | `NONE (** No flags set. *)
  | `NO_AUTO_START (** The bus must not launch
an owner for the destination name in response to this method
invocation. *)
  | `ALLOW_INTERACTIVE_AUTHORIZATION (** the caller is prepared to
wait for interactive authorization. Since 2.46. *)
]

type dbuscallflags = dbuscallflags_flag list

val dbuscallflags_of_int : int -> dbuscallflags
val dbuscallflags_to_int : dbuscallflags -> int

(* DBusCapabilityFlags - bitfield/flags *)
type dbuscapabilityflags_flag = [
  | `NONE (** No flags set. *)
  | `UNIX_FD_PASSING (** The connection
supports exchanging UNIX file descriptors with the remote peer. *)
]

type dbuscapabilityflags = dbuscapabilityflags_flag list

val dbuscapabilityflags_of_int : int -> dbuscapabilityflags
val dbuscapabilityflags_to_int : dbuscapabilityflags -> int

(* DBusConnectionFlags - bitfield/flags *)
type dbusconnectionflags_flag = [
  | `NONE (** No flags set. *)
  | `AUTHENTICATION_CLIENT (** Perform authentication against server. *)
  | `AUTHENTICATION_SERVER (** Perform authentication against client. *)
  | `AUTHENTICATION_ALLOW_ANONYMOUS (** When
authenticating as a server, allow the anonymous authentication
method. *)
  | `MESSAGE_BUS_CONNECTION (** Pass this flag if connecting to a peer that is a
message bus. This means that the Hello() method will be invoked as part of the connection setup. *)
  | `DELAY_MESSAGE_PROCESSING (** If set, processing of D-Bus messages is
delayed until g_dbus_connection_start_message_processing() is called. *)
  | `AUTHENTICATION_REQUIRE_SAME_USER (** When authenticating
as a server, require the UID of the peer to be the same as the UID of the server. (Since: 2.68) *)
  | `CROSS_NAMESPACE (** When authenticating, try to use
protocols that work across a Linux user namespace boundary, even if this
reduces interoperability with older D-Bus implementations. This currently
affects client-side [EXTERNAL] authentication, for which this flag makes
connections to a server in another user namespace succeed, but causes
a deadlock when connecting to a GDBus server older than 2.73.3. Since: 2.74 *)
]

type dbusconnectionflags = dbusconnectionflags_flag list

val dbusconnectionflags_of_int : int -> dbusconnectionflags
val dbusconnectionflags_to_int : dbusconnectionflags -> int

(* DBusInterfaceSkeletonFlags - bitfield/flags *)
type dbusinterfaceskeletonflags_flag = [
  | `NONE (** No flags set. *)
  | `HANDLE_METHOD_INVOCATIONS_IN_THREAD (** Each method invocation is handled in
a thread dedicated to the invocation. This means that the method implementation can use blocking IO
without blocking any other part of the process. It also means that the method implementation must
use locking to access data structures used by other threads. *)
]

type dbusinterfaceskeletonflags = dbusinterfaceskeletonflags_flag list

val dbusinterfaceskeletonflags_of_int : int -> dbusinterfaceskeletonflags
val dbusinterfaceskeletonflags_to_int : dbusinterfaceskeletonflags -> int

(* DBusMessageFlags - bitfield/flags *)
type dbusmessageflags_flag = [
  | `NONE (** No flags set. *)
  | `NO_REPLY_EXPECTED (** A reply is not expected. *)
  | `NO_AUTO_START (** The bus must not launch an
owner for the destination name in response to this message. *)
  | `ALLOW_INTERACTIVE_AUTHORIZATION (** If set on a method
call, this flag means that the caller is prepared to wait for interactive
authorization. Since 2.46. *)
]

type dbusmessageflags = dbusmessageflags_flag list

val dbusmessageflags_of_int : int -> dbusmessageflags
val dbusmessageflags_to_int : dbusmessageflags -> int

(* DBusObjectManagerClientFlags - bitfield/flags *)
type dbusobjectmanagerclientflags_flag = [
  | `NONE (** No flags set. *)
  | `DO_NOT_AUTO_START (** If not set and the
manager is for a well-known name, then request the bus to launch
an owner for the name if no-one owns the name. This flag can only
be used in managers for well-known names. *)
]

type dbusobjectmanagerclientflags = dbusobjectmanagerclientflags_flag list

val dbusobjectmanagerclientflags_of_int : int -> dbusobjectmanagerclientflags
val dbusobjectmanagerclientflags_to_int : dbusobjectmanagerclientflags -> int

(* DBusPropertyInfoFlags - bitfield/flags *)
type dbuspropertyinfoflags_flag = [
  | `NONE (** No flags set. *)
  | `READABLE (** Property is readable. *)
  | `WRITABLE (** Property is writable. *)
]

type dbuspropertyinfoflags = dbuspropertyinfoflags_flag list

val dbuspropertyinfoflags_of_int : int -> dbuspropertyinfoflags
val dbuspropertyinfoflags_to_int : dbuspropertyinfoflags -> int

(* DBusProxyFlags - bitfield/flags *)
type dbusproxyflags_flag = [
  | `NONE (** No flags set. *)
  | `DO_NOT_LOAD_PROPERTIES (** Don't load properties. *)
  | `DO_NOT_CONNECT_SIGNALS (** Don't connect to signals on the remote object. *)
  | `DO_NOT_AUTO_START (** If the proxy is for a well-known name,
do not ask the bus to launch an owner during proxy initialization or a method call.
This flag is only meaningful in proxies for well-known names. *)
  | `GET_INVALIDATED_PROPERTIES (** If set, the property value for any __invalidated property__ will be (asynchronously) retrieved upon receiving the [PropertiesChanged] D-Bus signal and the property will not cause emission of the [GDBusProxy::g]-properties-changed signal. When the value is received the [GDBusProxy::g]-properties-changed signal is emitted for the property along with the retrieved value. Since 2.32. *)
  | `DO_NOT_AUTO_START_AT_CONSTRUCTION (** If the proxy is for a well-known name,
do not ask the bus to launch an owner during proxy initialization, but allow it to be
autostarted by a method call. This flag is only meaningful in proxies for well-known names,
and only if [G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START] is not also specified. *)
  | `NO_MATCH_RULE (** Don't actually send the AddMatch D-Bus
call for this signal subscription. This gives you more control
over which match rules you add (but you must add them manually). (Since: 2.72) *)
]

type dbusproxyflags = dbusproxyflags_flag list

val dbusproxyflags_of_int : int -> dbusproxyflags
val dbusproxyflags_to_int : dbusproxyflags -> int

(* DBusSendMessageFlags - bitfield/flags *)
type dbussendmessageflags_flag = [
  | `NONE (** No flags set. *)
  | `PRESERVE_SERIAL (** Do not automatically
assign a serial number from the [GDBusConnection] object when
sending a message. *)
]

type dbussendmessageflags = dbussendmessageflags_flag list

val dbussendmessageflags_of_int : int -> dbussendmessageflags
val dbussendmessageflags_to_int : dbussendmessageflags -> int

(* DBusServerFlags - bitfield/flags *)
type dbusserverflags_flag = [
  | `NONE (** No flags set. *)
  | `RUN_IN_THREAD (** All [GDBusServer::new]-connection
signals will run in separated dedicated threads (see signal for
details). *)
  | `AUTHENTICATION_ALLOW_ANONYMOUS (** Allow the anonymous
authentication method. *)
  | `AUTHENTICATION_REQUIRE_SAME_USER (** Require the UID of the
peer to be the same as the UID of the server when authenticating. (Since: 2.68) *)
]

type dbusserverflags = dbusserverflags_flag list

val dbusserverflags_of_int : int -> dbusserverflags
val dbusserverflags_to_int : dbusserverflags -> int

(* DBusSignalFlags - bitfield/flags *)
type dbussignalflags_flag = [
  | `NONE (** No flags set. *)
  | `NO_MATCH_RULE (** Don't actually send the AddMatch
D-Bus call for this signal subscription.  This gives you more control
over which match rules you add (but you must add them manually). *)
  | `MATCH_ARG0_NAMESPACE (** Match first arguments that
contain a bus or interface name with the given namespace. *)
  | `MATCH_ARG0_PATH (** Match first arguments that
contain an object path that is either equivalent to the given path,
or one of the paths is a subpath of the other. *)
]

type dbussignalflags = dbussignalflags_flag list

val dbussignalflags_of_int : int -> dbussignalflags
val dbussignalflags_to_int : dbussignalflags -> int

(* DBusSubtreeFlags - bitfield/flags *)
type dbussubtreeflags_flag = [
  | `NONE (** No flags set. *)
  | `DISPATCH_TO_UNENUMERATED_NODES (** Method calls to objects not in the enumerated range
will still be dispatched. This is useful if you want
to dynamically spawn objects in the subtree. *)
]

type dbussubtreeflags = dbussubtreeflags_flag list

val dbussubtreeflags_of_int : int -> dbussubtreeflags
val dbussubtreeflags_to_int : dbussubtreeflags -> int

(* DriveStartFlags - bitfield/flags *)
type drivestartflags_flag = [
  | `NONE (** No flags set. *)
]

type drivestartflags = drivestartflags_flag list

val drivestartflags_of_int : int -> drivestartflags
val drivestartflags_to_int : drivestartflags -> int

(* FileAttributeInfoFlags - bitfield/flags *)
type fileattributeinfoflags_flag = [
  | `NONE (** no flags set. *)
  | `COPY_WITH_FILE (** copy the attribute values when the file is copied. *)
  | `COPY_WHEN_MOVED (** copy the attribute values when the file is moved. *)
]

type fileattributeinfoflags = fileattributeinfoflags_flag list

val fileattributeinfoflags_of_int : int -> fileattributeinfoflags
val fileattributeinfoflags_to_int : fileattributeinfoflags -> int

(* FileCopyFlags - bitfield/flags *)
type filecopyflags_flag = [
  | `NONE (** No flags set. *)
  | `OVERWRITE (** Overwrite any existing files *)
  | `BACKUP (** Make a backup of any existing files. *)
  | `NOFOLLOW_SYMLINKS (** Don't follow symlinks. *)
  | `ALL_METADATA (** Copy all file metadata instead of just default set used for copy (see [GFileInfo]). *)
  | `NO_FALLBACK_FOR_MOVE (** Don't use copy and delete fallback if native move not supported. *)
  | `TARGET_DEFAULT_PERMS (** Leaves target file with default perms, instead of setting the source file perms. *)
  | `TARGET_DEFAULT_MODIFIED_TIME (** Use default modification
timestamps instead of copying them from the source file. Since 2.80 *)
]

type filecopyflags = filecopyflags_flag list

val filecopyflags_of_int : int -> filecopyflags
val filecopyflags_to_int : filecopyflags -> int

(* FileCreateFlags - bitfield/flags *)
type filecreateflags_flag = [
  | `NONE (** No flags set. *)
  | `PRIVATE (** Create a file that can only be
accessed by the current user. *)
  | `REPLACE_DESTINATION (** Replace the destination
as if it didn't exist before. Don't try to keep any old
permissions, replace instead of following links. This
is generally useful if you're doing a "copy over"
rather than a "save new version of" replace operation.
You can think of it as "unlink destination" before
writing to it, although the implementation may not
be exactly like that. This flag can only be used with
g_file_replace() and its variants, including g_file_replace_contents().
Since 2.20 *)
]

type filecreateflags = filecreateflags_flag list

val filecreateflags_of_int : int -> filecreateflags
val filecreateflags_to_int : filecreateflags -> int

(* FileMeasureFlags - bitfield/flags *)
type filemeasureflags_flag = [
  | `NONE (** No flags set. *)
  | `REPORT_ANY_ERROR (** Report any error encountered
while traversing the directory tree.  Normally errors are only
reported for the toplevel file. *)
  | `APPARENT_SIZE (** Tally usage based on apparent file
sizes.  Normally, the block-size is used, if available, as this is a
more accurate representation of disk space used.
Compare with [du --apparent-size].
Since GLib 2.78. and similarly to [du] since GNU Coreutils 9.2, this will
ignore the sizes of file types other than regular files and links, as the
sizes of other file types are not specified in a standard way. *)
  | `NO_XDEV (** Do not cross mount point boundaries.
Compare with [du -x]. *)
]

type filemeasureflags = filemeasureflags_flag list

val filemeasureflags_of_int : int -> filemeasureflags
val filemeasureflags_to_int : filemeasureflags -> int

(* FileMonitorFlags - bitfield/flags *)
type filemonitorflags_flag = [
  | `NONE (** No flags set. *)
  | `WATCH_MOUNTS (** Watch for mount events. *)
  | `SEND_MOVED (** Pair DELETED and CREATED events caused
by file renames (moves) and send a single G_FILE_MONITOR_EVENT_MOVED
event instead (NB: not supported on all backends; the default
behaviour -without specifying this flag- is to send single DELETED
and CREATED events).  Deprecated since 2.46: use
[G_FILE_MONITOR_WATCH_MOVES] instead. *)
  | `WATCH_HARD_LINKS (** Watch for changes to the file made
via another hard link. Since 2.36. *)
  | `WATCH_MOVES (** Watch for rename operations on a
monitored directory.  This causes [G_FILE_MONITOR_EVENT_RENAMED],
[G_FILE_MONITOR_EVENT_MOVED_IN] and [G_FILE_MONITOR_EVENT_MOVED_OUT]
events to be emitted when possible.  Since: 2.46. *)
]

type filemonitorflags = filemonitorflags_flag list

val filemonitorflags_of_int : int -> filemonitorflags
val filemonitorflags_to_int : filemonitorflags -> int

(* FileQueryInfoFlags - bitfield/flags *)
type filequeryinfoflags_flag = [
  | `NONE (** No flags set. *)
  | `NOFOLLOW_SYMLINKS (** Don't follow symlinks. *)
]

type filequeryinfoflags = filequeryinfoflags_flag list

val filequeryinfoflags_of_int : int -> filequeryinfoflags
val filequeryinfoflags_to_int : filequeryinfoflags -> int

(* IOStreamSpliceFlags - bitfield/flags *)
type iostreamspliceflags_flag = [
  | `NONE (** Do not close either stream. *)
  | `CLOSE_STREAM1 (** Close the first stream after
the splice. *)
  | `CLOSE_STREAM2 (** Close the second stream after
the splice. *)
  | `WAIT_FOR_BOTH (** Wait for both splice operations to finish
before calling the callback. *)
]

type iostreamspliceflags = iostreamspliceflags_flag list

val iostreamspliceflags_of_int : int -> iostreamspliceflags
val iostreamspliceflags_to_int : iostreamspliceflags -> int

(* MountMountFlags - bitfield/flags *)
type mountmountflags_flag = [
  | `NONE (** No flags set. *)
]

type mountmountflags = mountmountflags_flag list

val mountmountflags_of_int : int -> mountmountflags
val mountmountflags_to_int : mountmountflags -> int

(* MountUnmountFlags - bitfield/flags *)
type mountunmountflags_flag = [
  | `NONE (** No flags set. *)
  | `FORCE (** Unmount even if there are outstanding
file operations on the mount. *)
]

type mountunmountflags = mountunmountflags_flag list

val mountunmountflags_of_int : int -> mountunmountflags
val mountunmountflags_to_int : mountunmountflags -> int

(* OutputStreamSpliceFlags - bitfield/flags *)
type outputstreamspliceflags_flag = [
  | `NONE (** Do not close either stream. *)
  | `CLOSE_SOURCE (** Close the source stream after
the splice. *)
  | `CLOSE_TARGET (** Close the target stream after
the splice. *)
]

type outputstreamspliceflags = outputstreamspliceflags_flag list

val outputstreamspliceflags_of_int : int -> outputstreamspliceflags
val outputstreamspliceflags_to_int : outputstreamspliceflags -> int

(* ResolverNameLookupFlags - bitfield/flags *)
type resolvernamelookupflags_flag = [
  | `DEFAULT (** default behavior (same as g_resolver_lookup_by_name()) *)
  | `IPV4_ONLY (** only resolve ipv4 addresses *)
  | `IPV6_ONLY (** only resolve ipv6 addresses *)
]

type resolvernamelookupflags = resolvernamelookupflags_flag list

val resolvernamelookupflags_of_int : int -> resolvernamelookupflags
val resolvernamelookupflags_to_int : resolvernamelookupflags -> int

(* ResourceFlags - bitfield/flags *)
type resourceflags_flag = [
  | `NONE (** No flags set. *)
  | `COMPRESSED (** The file is compressed. *)
]

type resourceflags = resourceflags_flag list

val resourceflags_of_int : int -> resourceflags
val resourceflags_to_int : resourceflags -> int

(* ResourceLookupFlags - bitfield/flags *)
type resourcelookupflags_flag = [
  | `NONE (** No flags set. *)
]

type resourcelookupflags = resourcelookupflags_flag list

val resourcelookupflags_of_int : int -> resourcelookupflags
val resourcelookupflags_to_int : resourcelookupflags -> int

(* SettingsBindFlags - bitfield/flags *)
type settingsbindflags_flag = [
  | `DEFAULT (** Equivalent to [G_SETTINGS_BIND_GET|G_SETTINGS_BIND_SET] *)
  | `GET (** Update the [GObject.Object] property when the setting changes.
It is an error to use this flag if the property is not writable. *)
  | `SET (** Update the setting when the [GObject.Object] property changes.
It is an error to use this flag if the property is not readable. *)
  | `NO_SENSITIVITY (** Do not try to bind a ‘sensitivity’ property to the writability of the setting *)
  | `GET_NO_CHANGES (** When set in addition to [Gio.SettingsBindFlags.GET],
set the [GObject.Object] property
value initially from the setting, but do not listen for changes of the setting *)
  | `INVERT_BOOLEAN (** When passed to [Gio.Settings.bind],
uses a pair of mapping functions that invert
the boolean value when mapping between the setting and the property.  The setting and property must both
be booleans.  You cannot pass this flag to [Gio.Settings.bind_with_mapping]. *)
]

type settingsbindflags = settingsbindflags_flag list

val settingsbindflags_of_int : int -> settingsbindflags
val settingsbindflags_to_int : settingsbindflags -> int

(* SocketMsgFlags - bitfield/flags *)
type socketmsgflags_flag = [
  | `NONE (** No flags. *)
  | `OOB (** Request to send/receive out of band data. *)
  | `PEEK (** Read data from the socket without removing it from
the queue. *)
  | `DONTROUTE (** Don't use a gateway to send out the packet,
only send to hosts on directly connected networks. *)
]

type socketmsgflags = socketmsgflags_flag list

val socketmsgflags_of_int : int -> socketmsgflags
val socketmsgflags_to_int : socketmsgflags -> int

(* SubprocessFlags - bitfield/flags *)
type subprocessflags_flag = [
  | `NONE (** No flags. *)
  | `STDIN_PIPE (** create a pipe for the stdin of the
spawned process that can be accessed with
g_subprocess_get_stdin_pipe(). *)
  | `STDIN_INHERIT (** stdin is inherited from the
calling process. *)
  | `STDOUT_PIPE (** create a pipe for the stdout of the
spawned process that can be accessed with
g_subprocess_get_stdout_pipe(). *)
  | `STDOUT_SILENCE (** silence the stdout of the spawned
process (ie: redirect to [/dev/null]). *)
  | `STDERR_PIPE (** create a pipe for the stderr of the
spawned process that can be accessed with
g_subprocess_get_stderr_pipe(). *)
  | `STDERR_SILENCE (** silence the stderr of the spawned
process (ie: redirect to [/dev/null]). *)
  | `STDERR_MERGE (** merge the stderr of the spawned
process with whatever the stdout happens to be.  This is a good way
of directing both streams to a common log file, for example. *)
  | `INHERIT_FDS (** spawned processes will inherit the
file descriptors of their parent, unless those descriptors have
been explicitly marked as close-on-exec.  This flag has no effect
over the "standard" file descriptors (stdin, stdout, stderr). *)
  | `SEARCH_PATH_FROM_ENVP (** if path searching is
needed when spawning the subprocess, use the [PATH] in the launcher
environment. (Since: 2.72) *)
]

type subprocessflags = subprocessflags_flag list

val subprocessflags_of_int : int -> subprocessflags
val subprocessflags_to_int : subprocessflags -> int

(* TestDBusFlags - bitfield/flags *)
type testdbusflags_flag = [
  | `NONE (** No flags. *)
]

type testdbusflags = testdbusflags_flag list

val testdbusflags_of_int : int -> testdbusflags
val testdbusflags_to_int : testdbusflags -> int

(* TlsCertificateFlags - bitfield/flags *)
type tlscertificateflags_flag = [
  | `NO_FLAGS (** No flags set. Since: 2.74 *)
  | `UNKNOWN_CA (** The signing certificate authority is
not known. *)
  | `BAD_IDENTITY (** The certificate does not match the
expected identity of the site that it was retrieved from. *)
  | `NOT_ACTIVATED (** The certificate's activation time
is still in the future *)
  | `EXPIRED (** The certificate has expired *)
  | `REVOKED (** The certificate has been revoked
according to the [GTlsConnection]'s certificate revocation list. *)
  | `INSECURE (** The certificate's algorithm is
considered insecure. *)
  | `GENERIC_ERROR (** Some other error occurred validating
the certificate *)
  | `VALIDATE_ALL (** the combination of all of the above
flags *)
]

type tlscertificateflags = tlscertificateflags_flag list

val tlscertificateflags_of_int : int -> tlscertificateflags
val tlscertificateflags_to_int : tlscertificateflags -> int

(* TlsDatabaseVerifyFlags - bitfield/flags *)
type tlsdatabaseverifyflags_flag = [
  | `NONE (** No verification flags *)
]

type tlsdatabaseverifyflags = tlsdatabaseverifyflags_flag list

val tlsdatabaseverifyflags_of_int : int -> tlsdatabaseverifyflags
val tlsdatabaseverifyflags_to_int : tlsdatabaseverifyflags -> int

(* TlsPasswordFlags - bitfield/flags *)
type tlspasswordflags_flag = [
  | `NONE (** No flags *)
  | `RETRY (** The password was wrong, and the user should retry. *)
  | `MANY_TRIES (** Hint to the user that the password has been
wrong many times, and the user may not have many chances left. *)
  | `FINAL_TRY (** Hint to the user that this is the last try to get
this password right. *)
  | `PKCS11_USER (** For PKCS #11, the user PIN is required.
Since: 2.70. *)
  | `PKCS11_SECURITY_OFFICER (** For PKCS #11, the security officer
PIN is required. Since: 2.70. *)
  | `PKCS11_CONTEXT_SPECIFIC (** For PKCS #11, the context-specific
PIN is required. Since: 2.70. *)
]

type tlspasswordflags = tlspasswordflags_flag list

val tlspasswordflags_of_int : int -> tlspasswordflags
val tlspasswordflags_to_int : tlspasswordflags -> int

