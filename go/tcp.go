//go-tcpsock/server.go
package main

import (
	"fmt"
	"log"
	"net"
	_ "time"
)

func handleConn(c net.Conn) {
	defer c.Close()
	fmt.Printf("recv conn, Local:%v <-- remove:%v\n", c.LocalAddr().String(), c.RemoteAddr().String())
	for {
		// read from the connection
		var buf = make([]byte, 65536)
		fmt.Println("start to read from conn")
		//c.SetReadDeadline(time.Now().Add(time.Microsecond * 10))
		n, err := c.Read(buf)
		if err != nil {
			log.Printf("conn read %d bytes,  error: %s", n, err)
			if nerr, ok := err.(net.Error); ok && nerr.Timeout() {
				continue
			}
			return
		}
		fmt.Printf("read %d bytes, content is %s\n", n, string(buf[:n]))
		// ... ...
		// write to the connection
		//... ...
	}
}

func main() {
	l, err := net.Listen("tcp", ":8888")
	if err != nil {
		fmt.Println("listen error:", err)
		return
	}
	fmt.Printf("listen:%v", l.Addr())
	for {
		c, err := l.Accept()
		if err != nil {
			fmt.Println("accept error:", err)
			break
		}
		// start a new goroutine to handle
		// the new connection.
		go handleConn(c)
	}
}
