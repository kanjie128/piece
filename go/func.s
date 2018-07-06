TEXT runtime.main(SB) /usr/local/go/src/runtime/proc.go
	proc.go:106	0x424260	64488b0c25f8ffffff	FS MOVQ FS:0xfffffff8, CX		
	proc.go:106	0x424269	483b6110		CMPQ 0x10(CX), SP			
	proc.go:106	0x42426d	0f863e030000		JBE 0x4245b1				
	proc.go:106	0x424273	4883ec50		SUBQ $0x50, SP				
	proc.go:106	0x424277	48896c2448		MOVQ BP, 0x48(SP)			
	proc.go:106	0x42427c	488d6c2448		LEAQ 0x48(SP), BP			
	proc.go:107	0x424281	64488b0425f8ffffff	FS MOVQ FS:0xfffffff8, AX		
	proc.go:107	0x42428a	4889442438		MOVQ AX, 0x38(SP)			
	proc.go:111	0x42428f	488b4830		MOVQ 0x30(AX), CX			
	proc.go:111	0x424293	488b09			MOVQ 0(CX), CX				
	proc.go:111	0x424296	48c7815801000000000000	MOVQ $0x0, 0x158(CX)			
	proc.go:117	0x4242a1	48c705a45d070000ca9a3b	MOVQ $0x3b9aca00, 0x75da4(IP)		
	proc.go:123	0x4242ac	e84f4f0200		CALL runtime.nanotime(SB)		
	proc.go:123	0x4242b1	488b0424		MOVQ 0(SP), AX				
	proc.go:123	0x4242b5	488905341c0900		MOVQ AX, 0x91c34(IP)			
	proc.go:127	0x4242bc	488d052d910400		LEAQ 0x4912d(IP), AX			
	proc.go:127	0x4242c3	48890424		MOVQ AX, 0(SP)				
	proc.go:127	0x4242c7	e874180200		CALL runtime.systemstack(SB)		
	proc.go:135	0x4242cc	64488b0425f8ffffff	FS MOVQ FS:0xfffffff8, AX		
	proc.go:135	0x4242d5	488b4030		MOVQ 0x30(AX), AX			
	proc.go:135	0x4242d9	8b88bc020000		MOVL 0x2bc(AX), CX			
	proc.go:135	0x4242df	83c102			ADDL $0x2, CX				
	proc.go:135	0x4242e2	8988bc020000		MOVL CX, 0x2bc(AX)			
	proc.go:135	0x4242e8	64488b0425f8ffffff	FS MOVQ FS:0xfffffff8, AX		
	proc.go:135	0x4242f1	4889442440		MOVQ AX, 0x40(SP)			
	proc.go:135	0x4242f6	488b4830		MOVQ 0x30(AX), CX			
	proc.go:135	0x4242fa	8401			TESTB AL, 0(CX)				
	proc.go:135	0x4242fc	8b155e1c0900		MOVL 0x91c5e(IP), DX			
	proc.go:135	0x424302	488d9930010000		LEAQ 0x130(CX), BX			
	proc.go:135	0x424309	85d2			TESTL DX, DX				
	proc.go:135	0x42430b	0f8588020000		JNE 0x424599				
	proc.go:135	0x424311	48898130010000		MOVQ AX, 0x130(CX)			
	proc.go:135	0x424318	488b4830		MOVQ 0x30(AX), CX			
	proc.go:135	0x42431c	8b153e1c0900		MOVL 0x91c3e(IP), DX			
	proc.go:135	0x424322	488d9808010000		LEAQ 0x108(AX), BX			
	proc.go:135	0x424329	85d2			TESTL DX, DX				
	proc.go:135	0x42432b	0f8555020000		JNE 0x424586				
	proc.go:135	0x424331	48898808010000		MOVQ CX, 0x108(AX)			
	proc.go:137	0x424338	488b442438		MOVQ 0x38(SP), AX			
	proc.go:137	0x42433d	488b4030		MOVQ 0x30(AX), AX			
	proc.go:137	0x424341	488d0d587d0700		LEAQ 0x77d58(IP), CX			
	proc.go:137	0x424348	4839c8			CMPQ CX, AX				
	proc.go:137	0x42434b	0f851a020000		JNE 0x42456b				
	proc.go:141	0x424351	e82a120200		CALL runtime.init(SB)			
	proc.go:144	0x424356	c644243701		MOVB $0x1, 0x37(SP)			
	proc.go:144	0x42435b	488d442437		LEAQ 0x37(SP), AX			
	proc.go:149	0x424360	4889442410		MOVQ AX, 0x10(SP)			
	proc.go:149	0x424365	c7042408000000		MOVL $0x8, 0(SP)			
	proc.go:149	0x42436c	488d0585900400		LEAQ 0x49085(IP), AX			
	proc.go:149	0x424373	4889442408		MOVQ AX, 0x8(SP)			
	proc.go:149	0x424378	e843d2ffff		CALL runtime.deferproc(SB)		
	proc.go:149	0x42437d	85c0			TESTL AX, AX				
	proc.go:149	0x42437f	0f85d6010000		JNE 0x42455b				
	proc.go:151	0x424385	e8c6ccfeff		CALL runtime.gcenable(SB)		
	proc.go:153	0x42438a	488d050f340300		LEAQ 0x3340f(IP), AX			
	proc.go:153	0x424391	48890424		MOVQ AX, 0(SP)				
	proc.go:153	0x424395	48c744240800000000	MOVQ $0x0, 0x8(SP)			
	proc.go:153	0x42439e	e8fdeffdff		CALL runtime.makechan(SB)		
	proc.go:153	0x4243a3	488b442410		MOVQ 0x10(SP), AX			
	proc.go:153	0x4243a8	8b0db21b0900		MOVL 0x91bb2(IP), CX			
	proc.go:153	0x4243ae	85c9			TESTL CX, CX				
	proc.go:153	0x4243b0	0f858b010000		JNE 0x424541				
	proc.go:153	0x4243b6	48890503740700		MOVQ AX, 0x77403(IP)			
	proc.go:154	0x4243bd	0fb605c6190900		MOVZX 0x919c6(IP), AX			
	proc.go:154	0x4243c4	84c0			TESTL AL, AL				
	proc.go:154	0x4243c6	7452			JE 0x42441a				
	proc.go:155	0x4243c8	488b0579730700		MOVQ 0x77379(IP), AX			
	proc.go:155	0x4243cf	4885c0			TESTQ AX, AX				
	proc.go:155	0x4243d2	0f844e010000		JE 0x424526				
	proc.go:159	0x4243d8	488b0571730700		MOVQ 0x77371(IP), AX			
	proc.go:159	0x4243df	4885c0			TESTQ AX, AX				
	proc.go:159	0x4243e2	0f8423010000		JE 0x42450b				
	proc.go:162	0x4243e8	488b0569730700		MOVQ 0x77369(IP), AX			
	proc.go:162	0x4243ef	4885c0			TESTQ AX, AX				
	proc.go:162	0x4243f2	0f84f8000000		JE 0x4244f0				
	proc.go:166	0x4243f8	488b0539730700		MOVQ 0x77339(IP), AX			
	proc.go:166	0x4243ff	4885c0			TESTQ AX, AX				
	proc.go:166	0x424402	0f84cd000000		JE 0x4244d5				
	proc.go:169	0x424408	48890424		MOVQ AX, 0(SP)				
	proc.go:169	0x42440c	48c744240800000000	MOVQ $0x0, 0x8(SP)			
	proc.go:169	0x424415	e8d6defdff		CALL runtime.cgocall(SB)		
	proc.go:173	0x42441a	488b05df8f0400		MOVQ 0x48fdf(IP), AX			
	proc.go:172	0x424421	488d15d88f0400		LEAQ 0x48fd8(IP), DX			
	proc.go:173	0x424428	ffd0			CALL AX					
	proc.go:174	0x42442a	488b058f730700		MOVQ 0x7738f(IP), AX			
	proc.go:174	0x424431	48890424		MOVQ AX, 0(SP)				
	proc.go:174	0x424435	e866fefdff		CALL runtime.closechan(SB)		
	proc.go:176	0x42443a	c644243700		MOVB $0x0, 0x37(SP)			
	proc.go:177	0x42443f	e88c7c0000		CALL runtime.unlockOSThread(SB)		
	proc.go:179	0x424444	0fb6053e190900		MOVZX 0x9193e(IP), AX			
	proc.go:179	0x42444b	84c0			TESTL AL, AL				
	proc.go:179	0x42444d	7576			JNE 0x4244c5				
	proc.go:179	0x42444f	0fb60535190900		MOVZX 0x91935(IP), AX			
	proc.go:179	0x424456	84c0			TESTL AL, AL				
	proc.go:179	0x424458	756b			JNE 0x4244c5				
	proc.go:185	0x42445a	488b05a78f0400		MOVQ 0x48fa7(IP), AX			
	proc.go:184	0x424461	488d15a08f0400		LEAQ 0x48fa0(IP), DX			
	proc.go:185	0x424468	ffd0			CALL AX					
	proc.go:194	0x42446a	8b0564190900		MOVL 0x91964(IP), AX			
	proc.go:194	0x424470	85c0			TESTL AX, AX				
	proc.go:194	0x424472	7516			JNE 0x42448a				
	proc.go:198	0x424474	c7042400000000		MOVL $0x0, 0(SP)			
	proc.go:198	0x42447b	e8704b0200		CALL runtime.exit(SB)			
	proc.go:200	0x424480	31c0			XORL AX, AX				
	proc.go:201	0x424482	c70000000000		MOVL $0x0, 0(AX)			
	proc.go:200	0x424488	ebf6			JMP 0x424480				
	proc.go:195	0x42448a	48c7042400000000	MOVQ $0x0, 0(SP)			
	proc.go:195	0x424492	48c744240800000000	MOVQ $0x0, 0x8(SP)			
	proc.go:195	0x42449b	488d059a4f0400		LEAQ 0x44f9a(IP), AX			
	proc.go:195	0x4244a2	4889442410		MOVQ AX, 0x10(SP)			
	proc.go:195	0x4244a7	48c744241809000000	MOVQ $0x9, 0x18(SP)			
	proc.go:195	0x4244b0	c644242010		MOVB $0x10, 0x20(SP)			
	proc.go:195	0x4244b5	48c744242801000000	MOVQ $0x1, 0x28(SP)			
	proc.go:195	0x4244be	e8ad020000		CALL runtime.gopark(SB)			
	proc.go:198	0x4244c3	ebaf			JMP 0x424474				
	proc.go:182	0x4244c5	90			NOPL					
	proc.go:182	0x4244c6	e895daffff		CALL runtime.deferreturn(SB)		
	proc.go:182	0x4244cb	488b6c2448		MOVQ 0x48(SP), BP			
	proc.go:182	0x4244d0	4883c450		ADDQ $0x50, SP				
	proc.go:182	0x4244d4	c3			RET					
	proc.go:167	0x4244d5	488d05717e0400		LEAQ 0x47e71(IP), AX			
	proc.go:167	0x4244dc	48890424		MOVQ AX, 0(SP)				
	proc.go:167	0x4244e0	48c744240825000000	MOVQ $0x25, 0x8(SP)			
	proc.go:167	0x4244e9	e812e8ffff		CALL runtime.throw(SB)			
	proc.go:167	0x4244ee	0f0b			UD2					
	proc.go:163	0x4244f0	488d052e610400		LEAQ 0x4612e(IP), AX			
	proc.go:163	0x4244f7	48890424		MOVQ AX, 0(SP)				
	proc.go:163	0x4244fb	48c744240815000000	MOVQ $0x15, 0x8(SP)			
	proc.go:163	0x424504	e8f7e7ffff		CALL runtime.throw(SB)			
	proc.go:163	0x424509	0f0b			UD2					
	proc.go:160	0x42450b	488d05ff5c0400		LEAQ 0x45cff(IP), AX			
	proc.go:160	0x424512	48890424		MOVQ AX, 0(SP)				
	proc.go:160	0x424516	48c744240813000000	MOVQ $0x13, 0x8(SP)			
	proc.go:160	0x42451f	e8dce7ffff		CALL runtime.throw(SB)			
	proc.go:160	0x424524	0f0b			UD2					
	proc.go:156	0x424526	488d0504680400		LEAQ 0x46804(IP), AX			
	proc.go:156	0x42452d	48890424		MOVQ AX, 0(SP)				
	proc.go:156	0x424531	48c744240819000000	MOVQ $0x19, 0x8(SP)			
	proc.go:156	0x42453a	e8c1e7ffff		CALL runtime.throw(SB)			
	proc.go:156	0x42453f	0f0b			UD2					
	proc.go:153	0x424541	488d0d78720700		LEAQ 0x77278(IP), CX			
	proc.go:153	0x424548	48890c24		MOVQ CX, 0(SP)				
	proc.go:153	0x42454c	4889442408		MOVQ AX, 0x8(SP)			
	proc.go:153	0x424551	e88a7efeff		CALL runtime.writebarrierptr(SB)	
	proc.go:154	0x424556	e962feffff		JMP 0x4243bd				
	proc.go:149	0x42455b	90			NOPL					
	proc.go:149	0x42455c	e8ffd9ffff		CALL runtime.deferreturn(SB)		
	proc.go:149	0x424561	488b6c2448		MOVQ 0x48(SP), BP			
	proc.go:149	0x424566	4883c450		ADDQ $0x50, SP				
	proc.go:149	0x42456a	c3			RET					
	proc.go:138	0x42456b	488d05e0620400		LEAQ 0x462e0(IP), AX			
	proc.go:138	0x424572	48890424		MOVQ AX, 0(SP)				
	proc.go:138	0x424576	48c744240816000000	MOVQ $0x16, 0x8(SP)			
	proc.go:138	0x42457f	e87ce7ffff		CALL runtime.throw(SB)			
	proc.go:138	0x424584	0f0b			UD2					
	proc.go:135	0x424586	48891c24		MOVQ BX, 0(SP)				
	proc.go:135	0x42458a	48894c2408		MOVQ CX, 0x8(SP)			
	proc.go:135	0x42458f	e84c7efeff		CALL runtime.writebarrierptr(SB)	
	proc.go:137	0x424594	e99ffdffff		JMP 0x424338				
	proc.go:135	0x424599	48891c24		MOVQ BX, 0(SP)				
	proc.go:135	0x42459d	4889442408		MOVQ AX, 0x8(SP)			
	proc.go:135	0x4245a2	e8397efeff		CALL runtime.writebarrierptr(SB)	
	proc.go:135	0x4245a7	488b442440		MOVQ 0x40(SP), AX			
	proc.go:135	0x4245ac	e967fdffff		JMP 0x424318				
	proc.go:106	0x4245b1	e8da160200		CALL runtime.morestack_noctxt(SB)	
	proc.go:106	0x4245b6	e9a5fcffff		JMP runtime.main(SB)			

TEXT runtime.main.func1(SB) /usr/local/go/src/runtime/proc.go
	proc.go:125	0x444b70	64488b0c25f8ffffff	FS MOVQ FS:0xfffffff8, CX		
	proc.go:125	0x444b79	483b6110		CMPQ 0x10(CX), SP			
	proc.go:125	0x444b7d	7631			JBE 0x444bb0				
	proc.go:125	0x444b7f	4883ec18		SUBQ $0x18, SP				
	proc.go:125	0x444b83	48896c2410		MOVQ BP, 0x10(SP)			
	proc.go:125	0x444b88	488d6c2410		LEAQ 0x10(SP), BP			
	proc.go:126	0x444b8d	488d05cc890200		LEAQ 0x289cc(IP), AX			
	proc.go:126	0x444b94	48890424		MOVQ AX, 0(SP)				
	proc.go:126	0x444b98	48c744240800000000	MOVQ $0x0, 0x8(SP)			
	proc.go:126	0x444ba1	e88a33feff		CALL runtime.newm(SB)			
	proc.go:127	0x444ba6	488b6c2410		MOVQ 0x10(SP), BP			
	proc.go:127	0x444bab	4883c418		ADDQ $0x18, SP				
	proc.go:127	0x444baf	c3			RET					
	proc.go:125	0x444bb0	e8db100000		CALL runtime.morestack_noctxt(SB)	
	proc.go:125	0x444bb5	ebb9			JMP runtime.main.func1(SB)		

TEXT runtime.main.func2(SB) /usr/local/go/src/runtime/proc.go
	proc.go:145	0x444bc0	64488b0c25f8ffffff	FS MOVQ FS:0xfffffff8, CX		
	proc.go:145	0x444bc9	483b6110		CMPQ 0x10(CX), SP			
	proc.go:145	0x444bcd	7628			JBE 0x444bf7				
	proc.go:145	0x444bcf	4883ec08		SUBQ $0x8, SP				
	proc.go:145	0x444bd3	48892c24		MOVQ BP, 0(SP)				
	proc.go:145	0x444bd7	488d2c24		LEAQ 0(SP), BP				
	proc.go:146	0x444bdb	488b442410		MOVQ 0x10(SP), AX			
	proc.go:146	0x444be0	0fb600			MOVZX 0(AX), AX				
	proc.go:146	0x444be3	84c0			TESTL AL, AL				
	proc.go:146	0x444be5	7509			JNE 0x444bf0				
	proc.go:149	0x444be7	488b2c24		MOVQ 0(SP), BP				
	proc.go:149	0x444beb	4883c408		ADDQ $0x8, SP				
	proc.go:149	0x444bef	c3			RET					
	proc.go:147	0x444bf0	e8db74feff		CALL runtime.unlockOSThread(SB)		
	proc.go:149	0x444bf5	ebf0			JMP 0x444be7				
	proc.go:145	0x444bf7	e894100000		CALL runtime.morestack_noctxt(SB)	
	proc.go:145	0x444bfc	ebc2			JMP runtime.main.func2(SB)		

TEXT main(SB) /usr/local/go/src/runtime/rt0_linux_amd64.s
	rt0_linux_amd64.s:73	0x448fe0	488d0509c8ffff	LEAQ 0xffffc809(IP), AX	
	rt0_linux_amd64.s:74	0x448fe7	ffe0		JMP AX			

TEXT main.add(SB) /home/jaykan/test/go/func.go
	func.go:3	0x44d650	48c744241800000000	MOVQ $0x0, 0x18(SP)	
	func.go:4	0x44d659	488b442408		MOVQ 0x8(SP), AX	
	func.go:4	0x44d65e	488b4c2410		MOVQ 0x10(SP), CX	
	func.go:4	0x44d663	4801c8			ADDQ CX, AX		
	func.go:4	0x44d666	4889442418		MOVQ AX, 0x18(SP)	
	func.go:4	0x44d66b	c3			RET			

TEXT main.main(SB) /home/jaykan/test/go/func.go
	func.go:7	0x44d670	64488b0c25f8ffffff	FS MOVQ FS:0xfffffff8, CX		
	func.go:7	0x44d679	483b6110		CMPQ 0x10(CX), SP			
	func.go:7	0x44d67d	762e			JBE 0x44d6ad				
	func.go:7	0x44d67f	4883ec20		SUBQ $0x20, SP				
	func.go:7	0x44d683	48896c2418		MOVQ BP, 0x18(SP)			
	func.go:7	0x44d688	488d6c2418		LEAQ 0x18(SP), BP			
	func.go:8	0x44d68d	48c7042401000000	MOVQ $0x1, 0(SP)			
	func.go:8	0x44d695	48c744240802000000	MOVQ $0x2, 0x8(SP)			
	func.go:8	0x44d69e	e8adffffff		CALL main.add(SB)			
	func.go:9	0x44d6a3	488b6c2418		MOVQ 0x18(SP), BP			
	func.go:9	0x44d6a8	4883c420		ADDQ $0x20, SP				
	func.go:9	0x44d6ac	c3			RET					
	func.go:7	0x44d6ad	e8de85ffff		CALL runtime.morestack_noctxt(SB)	
	func.go:7	0x44d6b2	ebbc			JMP main.main(SB)			

TEXT main.init(SB) /home/jaykan/test/go/func.go
	func.go:10	0x44d6c0	64488b0c25f8ffffff	FS MOVQ FS:0xfffffff8, CX		
	func.go:10	0x44d6c9	483b6110		CMPQ 0x10(CX), SP			
	func.go:10	0x44d6cd	764d			JBE 0x44d71c				
	func.go:10	0x44d6cf	4883ec08		SUBQ $0x8, SP				
	func.go:10	0x44d6d3	48892c24		MOVQ BP, 0(SP)				
	func.go:10	0x44d6d7	488d2c24		LEAQ 0(SP), BP				
	func.go:10	0x44d6db	0fb6059e860600		MOVZX 0x6869e(IP), AX			
	func.go:10	0x44d6e2	3c01			CMPL $0x1, AL				
	func.go:10	0x44d6e4	7702			JA 0x44d6e8				
	func.go:10	0x44d6e6	eb09			JMP 0x44d6f1				
	func.go:10	0x44d6e8	488b2c24		MOVQ 0(SP), BP				
	func.go:10	0x44d6ec	4883c408		ADDQ $0x8, SP				
	func.go:10	0x44d6f0	c3			RET					
	func.go:10	0x44d6f1	0fb60588860600		MOVZX 0x68688(IP), AX			
	func.go:10	0x44d6f8	3c01			CMPL $0x1, AL				
	func.go:10	0x44d6fa	7402			JE 0x44d6fe				
	func.go:10	0x44d6fc	eb07			JMP 0x44d705				
	func.go:10	0x44d6fe	e87d3efdff		CALL runtime.throwinit(SB)		
	func.go:10	0x44d703	0f0b			UD2					
	func.go:10	0x44d705	c6057486060001		MOVB $0x1, 0x68674(IP)			
	func.go:10	0x44d70c	c6056d86060002		MOVB $0x2, 0x6866d(IP)			
	func.go:10	0x44d713	488b2c24		MOVQ 0(SP), BP				
	func.go:10	0x44d717	4883c408		ADDQ $0x8, SP				
	func.go:10	0x44d71b	c3			RET					
	func.go:10	0x44d71c	e86f85ffff		CALL runtime.morestack_noctxt(SB)	
	func.go:10	0x44d721	eb9d			JMP main.init(SB)			
