(*
 * Copyright (c) 2011 Richard Mortier <mort@cantab.net>
 * Copyright (c) 2011 Charalampos Rotsos <cr409@cl.cam.ac.uk>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *)
open Net

type t
val add_port : Manager.t -> ?use_mac:bool -> t -> Manager.id -> unit Lwt.t
val del_port : Manager.t -> t -> string -> unit Lwt.t
val add_port_local : Manager.t -> t -> Manager.id -> unit Lwt.t
val add_flow : t -> Ofpacket.Flow_mod.t -> unit Lwt.t
val del_flow : t -> Ofpacket.Match.t -> unit Lwt.t
val get_flow_stats : t -> Ofpacket.Match.t -> Ofpacket.Flow.stats list 
val create_switch :  ?verbose:bool -> int64 -> t
val listen : t -> Manager.t -> Nettypes.ipv4_src -> 
  unit Lwt.t 
val connect : t -> Manager.t -> Nettypes.ipv4_dst -> 
  unit Lwt.t

val local_connect : t -> Manager.t -> Ofsocket.conn_state -> unit Lwt.t
(*
val lwt_connect : t -> ?standalone:bool -> Manager.t -> Nettypes.ipv4_dst -> 
  unit Lwt.t
 *)
