package main

import (
	"fmt"
	"net"
	"strings"
)

func main() {
	m := make(map[int]string, 10)
	m[122] = "abc"
	for a, b := range m {
		fmt.Println(a, b)
	}
	c, d := m[122]
	fmt.Println(c, d)

	addr, _ := net.ResolveTCPAddr("tcp", "127.0.0.1:9527")
	l, _ := net.ListenTCP("tcp", addr)
	for {
		conn, _ := l.Accept()
		go func() {
			fmt.Println(conn.LocalAddr(), " recv conn from:", conn.RemoteAddr())
			b := make([]byte, 1024)
			for {
				n, _ := conn.Read(b)
				if strings.Compare(string(b[:n-2]), ("bye")) == 0 {
					fmt.Println(conn.RemoteAddr(), " disconnected!")
					conn.Close()
					return
				}
				fmt.Println(conn.RemoteAddr(), " send:", n, len(string(b[:n-1])), b[:n])
				conn.Write(b[:n])
			}
		}()
	}
}
