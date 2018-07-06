package main

import (
	"fmt"
	"net"
	"time"
)

func main() {
	raddr, _ := net.ResolveUDPAddr("udp", "192.168.45.128:1212")
	conn, _ := net.DialUDP("udp", nil, raddr)

	conn.WriteToUDP([]byte("hello world\n"), raddr)
	laddr := conn.LocalAddr()
	fmt.Println("local addr:", laddr.String())

	tmpaddr, _ := net.ResolveUDPAddr("udp", "192.168.45.128:10000")
	conn1, _ := net.ListenUDP("udp", tmpaddr)
	laddr1 := conn1.LocalAddr()
	fmt.Println("local1 addr:", laddr1.String())
	defer func() {
		conn.Close()
		conn1.Close()
	}()

	time.Sleep(time.Duration(10000) * time.Second)

}
