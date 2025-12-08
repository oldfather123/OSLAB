
kernel.elf:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <_entry>:
    80200000:	00019117          	auipc	sp,0x19
    80200004:	34010113          	addi	sp,sp,832 # 80219340 <stack_top>
    80200008:	6511                	lui	a0,0x4
    8020000a:	4585                	li	a1,1
    8020000c:	02b50533          	mul	a0,a0,a1
    80200010:	912a                	add	sp,sp,a0
    80200012:	4e8050ef          	jal	802054fa <main>

0000000080200016 <spin>:
    80200016:	a001                	j	80200016 <spin>

0000000080200018 <uart_putc>:
    80200018:	10000737          	lui	a4,0x10000
    8020001c:	0715                	addi	a4,a4,5 # 10000005 <_entry-0x701ffffb>
    8020001e:	00074783          	lbu	a5,0(a4)
    80200022:	0207f793          	andi	a5,a5,32
    80200026:	dfe5                	beqz	a5,8020001e <uart_putc+0x6>
    80200028:	100007b7          	lui	a5,0x10000
    8020002c:	00a78023          	sb	a0,0(a5) # 10000000 <_entry-0x70200000>
    80200030:	8082                	ret

0000000080200032 <uart_puts>:
    80200032:	00054683          	lbu	a3,0(a0) # 4000 <_entry-0x801fc000>
    80200036:	c28d                	beqz	a3,80200058 <uart_puts+0x26>
    80200038:	10000737          	lui	a4,0x10000
    8020003c:	10000637          	lui	a2,0x10000
    80200040:	0715                	addi	a4,a4,5 # 10000005 <_entry-0x701ffffb>
    80200042:	0505                	addi	a0,a0,1
    80200044:	00074783          	lbu	a5,0(a4)
    80200048:	0207f793          	andi	a5,a5,32
    8020004c:	dfe5                	beqz	a5,80200044 <uart_puts+0x12>
    8020004e:	00d60023          	sb	a3,0(a2) # 10000000 <_entry-0x70200000>
    80200052:	00054683          	lbu	a3,0(a0)
    80200056:	f6f5                	bnez	a3,80200042 <uart_puts+0x10>
    80200058:	8082                	ret

000000008020005a <console_putc>:
    8020005a:	bf7d                	j	80200018 <uart_putc>

000000008020005c <console_puts>:
    8020005c:	1141                	addi	sp,sp,-16
    8020005e:	e022                	sd	s0,0(sp)
    80200060:	e406                	sd	ra,8(sp)
    80200062:	842a                	mv	s0,a0
    80200064:	00054503          	lbu	a0,0(a0)
    80200068:	c519                	beqz	a0,80200076 <console_puts+0x1a>
    8020006a:	0405                	addi	s0,s0,1
    8020006c:	fadff0ef          	jal	80200018 <uart_putc>
    80200070:	00044503          	lbu	a0,0(s0)
    80200074:	f97d                	bnez	a0,8020006a <console_puts+0xe>
    80200076:	60a2                	ld	ra,8(sp)
    80200078:	6402                	ld	s0,0(sp)
    8020007a:	0141                	addi	sp,sp,16
    8020007c:	8082                	ret

000000008020007e <print_number>:
    8020007e:	7139                	addi	sp,sp,-64
    80200080:	fc06                	sd	ra,56(sp)
    80200082:	f822                	sd	s0,48(sp)
    80200084:	f426                	sd	s1,40(sp)
    80200086:	c609                	beqz	a2,80200090 <print_number+0x12>
    80200088:	40a006bb          	negw	a3,a0
    8020008c:	00054463          	bltz	a0,80200094 <print_number+0x16>
    80200090:	0005069b          	sext.w	a3,a0
    80200094:	2581                	sext.w	a1,a1
    80200096:	00810893          	addi	a7,sp,8
    8020009a:	4801                	li	a6,0
    8020009c:	4e25                	li	t3,9
    8020009e:	a011                	j	802000a2 <print_number+0x24>
    802000a0:	86be                	mv	a3,a5
    802000a2:	02b6f73b          	remuw	a4,a3,a1
    802000a6:	8442                	mv	s0,a6
    802000a8:	2805                	addiw	a6,a6,1
    802000aa:	0ff77793          	zext.b	a5,a4
    802000ae:	0307831b          	addiw	t1,a5,48
    802000b2:	0577879b          	addiw	a5,a5,87
    802000b6:	0ff7f793          	zext.b	a5,a5
    802000ba:	00ee4463          	blt	t3,a4,802000c2 <print_number+0x44>
    802000be:	0ff37793          	zext.b	a5,t1
    802000c2:	00f88023          	sb	a5,0(a7)
    802000c6:	02b6d7bb          	divuw	a5,a3,a1
    802000ca:	0885                	addi	a7,a7,1
    802000cc:	fcb6fae3          	bgeu	a3,a1,802000a0 <print_number+0x22>
    802000d0:	c219                	beqz	a2,802000d6 <print_number+0x58>
    802000d2:	02054263          	bltz	a0,802000f6 <print_number+0x78>
    802000d6:	003c                	addi	a5,sp,8
    802000d8:	943e                	add	s0,s0,a5
    802000da:	fff78493          	addi	s1,a5,-1
    802000de:	00044503          	lbu	a0,0(s0)
    802000e2:	147d                	addi	s0,s0,-1
    802000e4:	f77ff0ef          	jal	8020005a <console_putc>
    802000e8:	fe941be3          	bne	s0,s1,802000de <print_number+0x60>
    802000ec:	70e2                	ld	ra,56(sp)
    802000ee:	7442                	ld	s0,48(sp)
    802000f0:	74a2                	ld	s1,40(sp)
    802000f2:	6121                	addi	sp,sp,64
    802000f4:	8082                	ret
    802000f6:	02080793          	addi	a5,a6,32
    802000fa:	978a                	add	a5,a5,sp
    802000fc:	02d00713          	li	a4,45
    80200100:	fee78423          	sb	a4,-24(a5)
    80200104:	8442                	mv	s0,a6
    80200106:	bfc1                	j	802000d6 <print_number+0x58>

0000000080200108 <print_ptr>:
    80200108:	7179                	addi	sp,sp,-48
    8020010a:	ec26                	sd	s1,24(sp)
    8020010c:	84aa                	mv	s1,a0
    8020010e:	03000513          	li	a0,48
    80200112:	f406                	sd	ra,40(sp)
    80200114:	f022                	sd	s0,32(sp)
    80200116:	e84a                	sd	s2,16(sp)
    80200118:	e44e                	sd	s3,8(sp)
    8020011a:	f41ff0ef          	jal	8020005a <console_putc>
    8020011e:	07800513          	li	a0,120
    80200122:	f39ff0ef          	jal	8020005a <console_putc>
    80200126:	03c00413          	li	s0,60
    8020012a:	49a5                	li	s3,9
    8020012c:	5971                	li	s2,-4
    8020012e:	0084d7b3          	srl	a5,s1,s0
    80200132:	00f7f713          	andi	a4,a5,15
    80200136:	03070513          	addi	a0,a4,48
    8020013a:	00e9f463          	bgeu	s3,a4,80200142 <print_ptr+0x3a>
    8020013e:	05770513          	addi	a0,a4,87
    80200142:	3471                	addiw	s0,s0,-4
    80200144:	f17ff0ef          	jal	8020005a <console_putc>
    80200148:	ff2413e3          	bne	s0,s2,8020012e <print_ptr+0x26>
    8020014c:	70a2                	ld	ra,40(sp)
    8020014e:	7402                	ld	s0,32(sp)
    80200150:	64e2                	ld	s1,24(sp)
    80200152:	6942                	ld	s2,16(sp)
    80200154:	69a2                	ld	s3,8(sp)
    80200156:	6145                	addi	sp,sp,48
    80200158:	8082                	ret

000000008020015a <printf>:
    8020015a:	7119                	addi	sp,sp,-128
    8020015c:	f822                	sd	s0,48(sp)
    8020015e:	f4be                	sd	a5,104(sp)
    80200160:	fc06                	sd	ra,56(sp)
    80200162:	e4ae                	sd	a1,72(sp)
    80200164:	e8b2                	sd	a2,80(sp)
    80200166:	ecb6                	sd	a3,88(sp)
    80200168:	f0ba                	sd	a4,96(sp)
    8020016a:	f8c2                	sd	a6,112(sp)
    8020016c:	fcc6                	sd	a7,120(sp)
    8020016e:	842a                	mv	s0,a0
    80200170:	00054503          	lbu	a0,0(a0)
    80200174:	00bc                	addi	a5,sp,72
    80200176:	e43e                	sd	a5,8(sp)
    80200178:	c12d                	beqz	a0,802001da <printf+0x80>
    8020017a:	f426                	sd	s1,40(sp)
    8020017c:	f04a                	sd	s2,32(sp)
    8020017e:	ec4e                	sd	s3,24(sp)
    80200180:	02500493          	li	s1,37
    80200184:	49d5                	li	s3,21
    80200186:	00008917          	auipc	s2,0x8
    8020018a:	65690913          	addi	s2,s2,1622 # 802087dc <etext+0x17dc>
    8020018e:	0a951463          	bne	a0,s1,80200236 <printf+0xdc>
    80200192:	00144783          	lbu	a5,1(s0)
    80200196:	0a978363          	beq	a5,s1,8020023c <printf+0xe2>
    8020019a:	f9d7879b          	addiw	a5,a5,-99
    8020019e:	0ff7f793          	zext.b	a5,a5
    802001a2:	00f9e763          	bltu	s3,a5,802001b0 <printf+0x56>
    802001a6:	078a                	slli	a5,a5,0x2
    802001a8:	97ca                	add	a5,a5,s2
    802001aa:	439c                	lw	a5,0(a5)
    802001ac:	97ca                	add	a5,a5,s2
    802001ae:	8782                	jr	a5
    802001b0:	00007517          	auipc	a0,0x7
    802001b4:	e6850513          	addi	a0,a0,-408 # 80207018 <etext+0x18>
    802001b8:	ea5ff0ef          	jal	8020005c <console_puts>
    802001bc:	00144503          	lbu	a0,1(s0)
    802001c0:	e9bff0ef          	jal	8020005a <console_putc>
    802001c4:	4529                	li	a0,10
    802001c6:	e95ff0ef          	jal	8020005a <console_putc>
    802001ca:	0405                	addi	s0,s0,1
    802001cc:	00144503          	lbu	a0,1(s0)
    802001d0:	0405                	addi	s0,s0,1
    802001d2:	fd55                	bnez	a0,8020018e <printf+0x34>
    802001d4:	74a2                	ld	s1,40(sp)
    802001d6:	7902                	ld	s2,32(sp)
    802001d8:	69e2                	ld	s3,24(sp)
    802001da:	70e2                	ld	ra,56(sp)
    802001dc:	7442                	ld	s0,48(sp)
    802001de:	4501                	li	a0,0
    802001e0:	6109                	addi	sp,sp,128
    802001e2:	8082                	ret
    802001e4:	67a2                	ld	a5,8(sp)
    802001e6:	4601                	li	a2,0
    802001e8:	45c1                	li	a1,16
    802001ea:	4388                	lw	a0,0(a5)
    802001ec:	07a1                	addi	a5,a5,8
    802001ee:	e43e                	sd	a5,8(sp)
    802001f0:	e8fff0ef          	jal	8020007e <print_number>
    802001f4:	bfd9                	j	802001ca <printf+0x70>
    802001f6:	67a2                	ld	a5,8(sp)
    802001f8:	6388                	ld	a0,0(a5)
    802001fa:	07a1                	addi	a5,a5,8
    802001fc:	e43e                	sd	a5,8(sp)
    802001fe:	c521                	beqz	a0,80200246 <printf+0xec>
    80200200:	e5dff0ef          	jal	8020005c <console_puts>
    80200204:	b7d9                	j	802001ca <printf+0x70>
    80200206:	67a2                	ld	a5,8(sp)
    80200208:	6388                	ld	a0,0(a5)
    8020020a:	07a1                	addi	a5,a5,8
    8020020c:	e43e                	sd	a5,8(sp)
    8020020e:	efbff0ef          	jal	80200108 <print_ptr>
    80200212:	bf65                	j	802001ca <printf+0x70>
    80200214:	67a2                	ld	a5,8(sp)
    80200216:	4605                	li	a2,1
    80200218:	45a9                	li	a1,10
    8020021a:	4388                	lw	a0,0(a5)
    8020021c:	07a1                	addi	a5,a5,8
    8020021e:	e43e                	sd	a5,8(sp)
    80200220:	e5fff0ef          	jal	8020007e <print_number>
    80200224:	b75d                	j	802001ca <printf+0x70>
    80200226:	67a2                	ld	a5,8(sp)
    80200228:	0007c503          	lbu	a0,0(a5)
    8020022c:	07a1                	addi	a5,a5,8
    8020022e:	e43e                	sd	a5,8(sp)
    80200230:	e2bff0ef          	jal	8020005a <console_putc>
    80200234:	bf59                	j	802001ca <printf+0x70>
    80200236:	e25ff0ef          	jal	8020005a <console_putc>
    8020023a:	bf49                	j	802001cc <printf+0x72>
    8020023c:	02500513          	li	a0,37
    80200240:	e1bff0ef          	jal	8020005a <console_putc>
    80200244:	b759                	j	802001ca <printf+0x70>
    80200246:	00007517          	auipc	a0,0x7
    8020024a:	dca50513          	addi	a0,a0,-566 # 80207010 <etext+0x10>
    8020024e:	bf4d                	j	80200200 <printf+0xa6>

0000000080200250 <panic>:
    80200250:	1141                	addi	sp,sp,-16
    80200252:	e022                	sd	s0,0(sp)
    80200254:	842a                	mv	s0,a0
    80200256:	00007517          	auipc	a0,0x7
    8020025a:	dd250513          	addi	a0,a0,-558 # 80207028 <etext+0x28>
    8020025e:	e406                	sd	ra,8(sp)
    80200260:	dfdff0ef          	jal	8020005c <console_puts>
    80200264:	8522                	mv	a0,s0
    80200266:	df7ff0ef          	jal	8020005c <console_puts>
    8020026a:	4529                	li	a0,10
    8020026c:	defff0ef          	jal	8020005a <console_putc>
    80200270:	a001                	j	80200270 <panic+0x20>

0000000080200272 <clear_screen>:
    80200272:	1141                	addi	sp,sp,-16
    80200274:	00007517          	auipc	a0,0x7
    80200278:	dbc50513          	addi	a0,a0,-580 # 80207030 <etext+0x30>
    8020027c:	e406                	sd	ra,8(sp)
    8020027e:	ddfff0ef          	jal	8020005c <console_puts>
    80200282:	60a2                	ld	ra,8(sp)
    80200284:	00007517          	auipc	a0,0x7
    80200288:	db450513          	addi	a0,a0,-588 # 80207038 <etext+0x38>
    8020028c:	0141                	addi	sp,sp,16
    8020028e:	b3f9                	j	8020005c <console_puts>

0000000080200290 <initlock>:
    80200290:	e50c                	sd	a1,8(a0)
    80200292:	00052023          	sw	zero,0(a0)
    80200296:	8082                	ret

0000000080200298 <acquire>:
    80200298:	4705                	li	a4,1
    8020029a:	87ba                	mv	a5,a4
    8020029c:	0cf527af          	amoswap.w.aq	a5,a5,(a0)
    802002a0:	2781                	sext.w	a5,a5
    802002a2:	ffe5                	bnez	a5,8020029a <acquire+0x2>
    802002a4:	0ff0000f          	fence
    802002a8:	8082                	ret

00000000802002aa <release>:
    802002aa:	0ff0000f          	fence
    802002ae:	0f50000f          	fence	iorw,ow
    802002b2:	0805202f          	amoswap.w	zero,zero,(a0)
    802002b6:	8082                	ret

00000000802002b8 <alloc_page>:
    802002b8:	1101                	addi	sp,sp,-32
    802002ba:	e822                	sd	s0,16(sp)
    802002bc:	00008417          	auipc	s0,0x8
    802002c0:	5f440413          	addi	s0,s0,1524 # 802088b0 <page_cache>
    802002c4:	8522                	mv	a0,s0
    802002c6:	ec06                	sd	ra,24(sp)
    802002c8:	e426                	sd	s1,8(sp)
    802002ca:	fcfff0ef          	jal	80200298 <acquire>
    802002ce:	09042783          	lw	a5,144(s0)
    802002d2:	04f04063          	bgtz	a5,80200312 <alloc_page+0x5a>
    802002d6:	8522                	mv	a0,s0
    802002d8:	fd3ff0ef          	jal	802002aa <release>
    802002dc:	00008517          	auipc	a0,0x8
    802002e0:	66c50513          	addi	a0,a0,1644 # 80208948 <pmm>
    802002e4:	fb5ff0ef          	jal	80200298 <acquire>
    802002e8:	7444                	ld	s1,168(s0)
    802002ea:	cc9d                	beqz	s1,80200328 <alloc_page+0x70>
    802002ec:	609c                	ld	a5,0(s1)
    802002ee:	00008517          	auipc	a0,0x8
    802002f2:	65a50513          	addi	a0,a0,1626 # 80208948 <pmm>
    802002f6:	f45c                	sd	a5,168(s0)
    802002f8:	fb3ff0ef          	jal	802002aa <release>
    802002fc:	8526                	mv	a0,s1
    802002fe:	6605                	lui	a2,0x1
    80200300:	4595                	li	a1,5
    80200302:	286000ef          	jal	80200588 <memset>
    80200306:	60e2                	ld	ra,24(sp)
    80200308:	6442                	ld	s0,16(sp)
    8020030a:	8526                	mv	a0,s1
    8020030c:	64a2                	ld	s1,8(sp)
    8020030e:	6105                	addi	sp,sp,32
    80200310:	8082                	ret
    80200312:	fff7871b          	addiw	a4,a5,-1
    80200316:	87ba                	mv	a5,a4
    80200318:	0709                	addi	a4,a4,2
    8020031a:	070e                	slli	a4,a4,0x3
    8020031c:	9722                	add	a4,a4,s0
    8020031e:	6304                	ld	s1,0(a4)
    80200320:	8522                	mv	a0,s0
    80200322:	08f42823          	sw	a5,144(s0)
    80200326:	bfc9                	j	802002f8 <alloc_page+0x40>
    80200328:	00008517          	auipc	a0,0x8
    8020032c:	62050513          	addi	a0,a0,1568 # 80208948 <pmm>
    80200330:	f7bff0ef          	jal	802002aa <release>
    80200334:	60e2                	ld	ra,24(sp)
    80200336:	6442                	ld	s0,16(sp)
    80200338:	8526                	mv	a0,s1
    8020033a:	64a2                	ld	s1,8(sp)
    8020033c:	6105                	addi	sp,sp,32
    8020033e:	8082                	ret

0000000080200340 <free_page_to_freelist>:
    80200340:	1101                	addi	sp,sp,-32
    80200342:	e822                	sd	s0,16(sp)
    80200344:	842a                	mv	s0,a0
    80200346:	00008517          	auipc	a0,0x8
    8020034a:	60250513          	addi	a0,a0,1538 # 80208948 <pmm>
    8020034e:	e426                	sd	s1,8(sp)
    80200350:	ec06                	sd	ra,24(sp)
    80200352:	00008497          	auipc	s1,0x8
    80200356:	55e48493          	addi	s1,s1,1374 # 802088b0 <page_cache>
    8020035a:	f3fff0ef          	jal	80200298 <acquire>
    8020035e:	74dc                	ld	a5,168(s1)
    80200360:	c399                	beqz	a5,80200366 <free_page_to_freelist+0x26>
    80200362:	00f47f63          	bgeu	s0,a5,80200380 <free_page_to_freelist+0x40>
    80200366:	e01c                	sd	a5,0(s0)
    80200368:	f4c0                	sd	s0,168(s1)
    8020036a:	6442                	ld	s0,16(sp)
    8020036c:	60e2                	ld	ra,24(sp)
    8020036e:	64a2                	ld	s1,8(sp)
    80200370:	00008517          	auipc	a0,0x8
    80200374:	5d850513          	addi	a0,a0,1496 # 80208948 <pmm>
    80200378:	6105                	addi	sp,sp,32
    8020037a:	bf05                	j	802002aa <release>
    8020037c:	0087f563          	bgeu	a5,s0,80200386 <free_page_to_freelist+0x46>
    80200380:	873e                	mv	a4,a5
    80200382:	639c                	ld	a5,0(a5)
    80200384:	ffe5                	bnez	a5,8020037c <free_page_to_freelist+0x3c>
    80200386:	e01c                	sd	a5,0(s0)
    80200388:	e300                	sd	s0,0(a4)
    8020038a:	6442                	ld	s0,16(sp)
    8020038c:	60e2                	ld	ra,24(sp)
    8020038e:	64a2                	ld	s1,8(sp)
    80200390:	00008517          	auipc	a0,0x8
    80200394:	5b850513          	addi	a0,a0,1464 # 80208948 <pmm>
    80200398:	6105                	addi	sp,sp,32
    8020039a:	bf01                	j	802002aa <release>

000000008020039c <free_page>:
    8020039c:	1101                	addi	sp,sp,-32
    8020039e:	ec06                	sd	ra,24(sp)
    802003a0:	e822                	sd	s0,16(sp)
    802003a2:	e426                	sd	s1,8(sp)
    802003a4:	03451793          	slli	a5,a0,0x34
    802003a8:	e3bd                	bnez	a5,8020040e <free_page+0x72>
    802003aa:	0001d797          	auipc	a5,0x1d
    802003ae:	f9678793          	addi	a5,a5,-106 # 8021d340 <end>
    802003b2:	842a                	mv	s0,a0
    802003b4:	04f56d63          	bltu	a0,a5,8020040e <free_page+0x72>
    802003b8:	47c5                	li	a5,17
    802003ba:	07ee                	slli	a5,a5,0x1b
    802003bc:	04f57963          	bgeu	a0,a5,8020040e <free_page+0x72>
    802003c0:	6605                	lui	a2,0x1
    802003c2:	4585                	li	a1,1
    802003c4:	1c4000ef          	jal	80200588 <memset>
    802003c8:	00008497          	auipc	s1,0x8
    802003cc:	4e848493          	addi	s1,s1,1256 # 802088b0 <page_cache>
    802003d0:	8526                	mv	a0,s1
    802003d2:	ec7ff0ef          	jal	80200298 <acquire>
    802003d6:	0904a783          	lw	a5,144(s1)
    802003da:	473d                	li	a4,15
    802003dc:	00f75b63          	bge	a4,a5,802003f2 <free_page+0x56>
    802003e0:	8526                	mv	a0,s1
    802003e2:	ec9ff0ef          	jal	802002aa <release>
    802003e6:	8522                	mv	a0,s0
    802003e8:	6442                	ld	s0,16(sp)
    802003ea:	60e2                	ld	ra,24(sp)
    802003ec:	64a2                	ld	s1,8(sp)
    802003ee:	6105                	addi	sp,sp,32
    802003f0:	bf81                	j	80200340 <free_page_to_freelist>
    802003f2:	00278713          	addi	a4,a5,2
    802003f6:	070e                	slli	a4,a4,0x3
    802003f8:	9726                	add	a4,a4,s1
    802003fa:	e300                	sd	s0,0(a4)
    802003fc:	2785                	addiw	a5,a5,1
    802003fe:	6442                	ld	s0,16(sp)
    80200400:	60e2                	ld	ra,24(sp)
    80200402:	08f4a823          	sw	a5,144(s1)
    80200406:	8526                	mv	a0,s1
    80200408:	64a2                	ld	s1,8(sp)
    8020040a:	6105                	addi	sp,sp,32
    8020040c:	bd79                	j	802002aa <release>
    8020040e:	00007517          	auipc	a0,0x7
    80200412:	c3250513          	addi	a0,a0,-974 # 80207040 <etext+0x40>
    80200416:	e3bff0ef          	jal	80200250 <panic>

000000008020041a <freerange>:
    8020041a:	6785                	lui	a5,0x1
    8020041c:	fff78713          	addi	a4,a5,-1 # fff <_entry-0x801ff001>
    80200420:	1101                	addi	sp,sp,-32
    80200422:	953a                	add	a0,a0,a4
    80200424:	777d                	lui	a4,0xfffff
    80200426:	e822                	sd	s0,16(sp)
    80200428:	e426                	sd	s1,8(sp)
    8020042a:	ec06                	sd	ra,24(sp)
    8020042c:	00e574b3          	and	s1,a0,a4
    80200430:	40f58433          	sub	s0,a1,a5
    80200434:	00946b63          	bltu	s0,s1,8020044a <freerange+0x30>
    80200438:	e04a                	sd	s2,0(sp)
    8020043a:	797d                	lui	s2,0xfffff
    8020043c:	8522                	mv	a0,s0
    8020043e:	944a                	add	s0,s0,s2
    80200440:	f5dff0ef          	jal	8020039c <free_page>
    80200444:	fe947ce3          	bgeu	s0,s1,8020043c <freerange+0x22>
    80200448:	6902                	ld	s2,0(sp)
    8020044a:	60e2                	ld	ra,24(sp)
    8020044c:	6442                	ld	s0,16(sp)
    8020044e:	64a2                	ld	s1,8(sp)
    80200450:	6105                	addi	sp,sp,32
    80200452:	8082                	ret

0000000080200454 <pmm_init>:
    80200454:	1101                	addi	sp,sp,-32
    80200456:	00007597          	auipc	a1,0x7
    8020045a:	c0258593          	addi	a1,a1,-1022 # 80207058 <etext+0x58>
    8020045e:	00008517          	auipc	a0,0x8
    80200462:	4ea50513          	addi	a0,a0,1258 # 80208948 <pmm>
    80200466:	ec06                	sd	ra,24(sp)
    80200468:	e822                	sd	s0,16(sp)
    8020046a:	e426                	sd	s1,8(sp)
    8020046c:	e25ff0ef          	jal	80200290 <initlock>
    80200470:	00007597          	auipc	a1,0x7
    80200474:	bf058593          	addi	a1,a1,-1040 # 80207060 <etext+0x60>
    80200478:	00008517          	auipc	a0,0x8
    8020047c:	43850513          	addi	a0,a0,1080 # 802088b0 <page_cache>
    80200480:	e11ff0ef          	jal	80200290 <initlock>
    80200484:	00088437          	lui	s0,0x88
    80200488:	00008797          	auipc	a5,0x8
    8020048c:	4a07ac23          	sw	zero,1208(a5) # 80208940 <page_cache+0x90>
    80200490:	147d                	addi	s0,s0,-1 # 87fff <_entry-0x80178001>
    80200492:	0001e497          	auipc	s1,0x1e
    80200496:	ead48493          	addi	s1,s1,-339 # 8021e33f <end+0xfff>
    8020049a:	77fd                	lui	a5,0xfffff
    8020049c:	8cfd                	and	s1,s1,a5
    8020049e:	0432                	slli	s0,s0,0xc
    802004a0:	00946b63          	bltu	s0,s1,802004b6 <pmm_init+0x62>
    802004a4:	e04a                	sd	s2,0(sp)
    802004a6:	797d                	lui	s2,0xfffff
    802004a8:	8522                	mv	a0,s0
    802004aa:	944a                	add	s0,s0,s2
    802004ac:	ef1ff0ef          	jal	8020039c <free_page>
    802004b0:	fe947ce3          	bgeu	s0,s1,802004a8 <pmm_init+0x54>
    802004b4:	6902                	ld	s2,0(sp)
    802004b6:	60e2                	ld	ra,24(sp)
    802004b8:	6442                	ld	s0,16(sp)
    802004ba:	64a2                	ld	s1,8(sp)
    802004bc:	6105                	addi	sp,sp,32
    802004be:	8082                	ret

00000000802004c0 <alloc_pages>:
    802004c0:	1101                	addi	sp,sp,-32
    802004c2:	ec06                	sd	ra,24(sp)
    802004c4:	e04a                	sd	s2,0(sp)
    802004c6:	08a05f63          	blez	a0,80200564 <alloc_pages+0xa4>
    802004ca:	e822                	sd	s0,16(sp)
    802004cc:	842a                	mv	s0,a0
    802004ce:	00008517          	auipc	a0,0x8
    802004d2:	47a50513          	addi	a0,a0,1146 # 80208948 <pmm>
    802004d6:	e426                	sd	s1,8(sp)
    802004d8:	00008497          	auipc	s1,0x8
    802004dc:	3d848493          	addi	s1,s1,984 # 802088b0 <page_cache>
    802004e0:	db9ff0ef          	jal	80200298 <acquire>
    802004e4:	74d8                	ld	a4,168(s1)
    802004e6:	c749                	beqz	a4,80200570 <alloc_pages+0xb0>
    802004e8:	4685                	li	a3,1
    802004ea:	893a                	mv	s2,a4
    802004ec:	4601                	li	a2,0
    802004ee:	6505                	lui	a0,0x1
    802004f0:	00868f63          	beq	a3,s0,8020050e <alloc_pages+0x4e>
    802004f4:	631c                	ld	a5,0(a4)
    802004f6:	cfad                	beqz	a5,80200570 <alloc_pages+0xb0>
    802004f8:	c689                	beqz	a3,80200502 <alloc_pages+0x42>
    802004fa:	00a705b3          	add	a1,a4,a0
    802004fe:	04b78e63          	beq	a5,a1,8020055a <alloc_pages+0x9a>
    80200502:	893e                	mv	s2,a5
    80200504:	4685                	li	a3,1
    80200506:	863a                	mv	a2,a4
    80200508:	873e                	mv	a4,a5
    8020050a:	fe8695e3          	bne	a3,s0,802004f4 <alloc_pages+0x34>
    8020050e:	4785                	li	a5,1
    80200510:	874a                	mv	a4,s2
    80200512:	00f40663          	beq	s0,a5,8020051e <alloc_pages+0x5e>
    80200516:	2785                	addiw	a5,a5,1 # fffffffffffff001 <end+0xffffffff7fde1cc1>
    80200518:	6318                	ld	a4,0(a4)
    8020051a:	fef41ee3          	bne	s0,a5,80200516 <alloc_pages+0x56>
    8020051e:	631c                	ld	a5,0(a4)
    80200520:	c221                	beqz	a2,80200560 <alloc_pages+0xa0>
    80200522:	e21c                	sd	a5,0(a2)
    80200524:	00073023          	sd	zero,0(a4) # fffffffffffff000 <end+0xffffffff7fde1cc0>
    80200528:	00008517          	auipc	a0,0x8
    8020052c:	42050513          	addi	a0,a0,1056 # 80208948 <pmm>
    80200530:	0432                	slli	s0,s0,0xc
    80200532:	d79ff0ef          	jal	802002aa <release>
    80200536:	84ca                	mv	s1,s2
    80200538:	944a                	add	s0,s0,s2
    8020053a:	8526                	mv	a0,s1
    8020053c:	6605                	lui	a2,0x1
    8020053e:	458d                	li	a1,3
    80200540:	048000ef          	jal	80200588 <memset>
    80200544:	6785                	lui	a5,0x1
    80200546:	94be                	add	s1,s1,a5
    80200548:	fe8499e3          	bne	s1,s0,8020053a <alloc_pages+0x7a>
    8020054c:	6442                	ld	s0,16(sp)
    8020054e:	60e2                	ld	ra,24(sp)
    80200550:	64a2                	ld	s1,8(sp)
    80200552:	854a                	mv	a0,s2
    80200554:	6902                	ld	s2,0(sp)
    80200556:	6105                	addi	sp,sp,32
    80200558:	8082                	ret
    8020055a:	2685                	addiw	a3,a3,1
    8020055c:	8732                	mv	a4,a2
    8020055e:	b765                	j	80200506 <alloc_pages+0x46>
    80200560:	f4dc                	sd	a5,168(s1)
    80200562:	b7c9                	j	80200524 <alloc_pages+0x64>
    80200564:	60e2                	ld	ra,24(sp)
    80200566:	4901                	li	s2,0
    80200568:	854a                	mv	a0,s2
    8020056a:	6902                	ld	s2,0(sp)
    8020056c:	6105                	addi	sp,sp,32
    8020056e:	8082                	ret
    80200570:	00008517          	auipc	a0,0x8
    80200574:	3d850513          	addi	a0,a0,984 # 80208948 <pmm>
    80200578:	d33ff0ef          	jal	802002aa <release>
    8020057c:	00007517          	auipc	a0,0x7
    80200580:	af450513          	addi	a0,a0,-1292 # 80207070 <etext+0x70>
    80200584:	ccdff0ef          	jal	80200250 <panic>

0000000080200588 <memset>:
    80200588:	ce09                	beqz	a2,802005a2 <memset+0x1a>
    8020058a:	1602                	slli	a2,a2,0x20
    8020058c:	9201                	srli	a2,a2,0x20
    8020058e:	0ff5f593          	zext.b	a1,a1
    80200592:	87aa                	mv	a5,a0
    80200594:	00a60733          	add	a4,a2,a0
    80200598:	00b78023          	sb	a1,0(a5) # 1000 <_entry-0x801ff000>
    8020059c:	0785                	addi	a5,a5,1
    8020059e:	fee79de3          	bne	a5,a4,80200598 <memset+0x10>
    802005a2:	8082                	ret

00000000802005a4 <memmove>:
    802005a4:	c205                	beqz	a2,802005c4 <memmove+0x20>
    802005a6:	02061713          	slli	a4,a2,0x20
    802005aa:	9301                	srli	a4,a4,0x20
    802005ac:	00a5ed63          	bltu	a1,a0,802005c6 <memmove+0x22>
    802005b0:	972e                	add	a4,a4,a1
    802005b2:	87aa                	mv	a5,a0
    802005b4:	0005c683          	lbu	a3,0(a1)
    802005b8:	0585                	addi	a1,a1,1
    802005ba:	0785                	addi	a5,a5,1
    802005bc:	fed78fa3          	sb	a3,-1(a5)
    802005c0:	fee59ae3          	bne	a1,a4,802005b4 <memmove+0x10>
    802005c4:	8082                	ret
    802005c6:	00e586b3          	add	a3,a1,a4
    802005ca:	fed573e3          	bgeu	a0,a3,802005b0 <memmove+0xc>
    802005ce:	fff6079b          	addiw	a5,a2,-1 # fff <_entry-0x801ff001>
    802005d2:	1782                	slli	a5,a5,0x20
    802005d4:	9381                	srli	a5,a5,0x20
    802005d6:	fff7c793          	not	a5,a5
    802005da:	972a                	add	a4,a4,a0
    802005dc:	97b6                	add	a5,a5,a3
    802005de:	fff6c603          	lbu	a2,-1(a3)
    802005e2:	16fd                	addi	a3,a3,-1
    802005e4:	177d                	addi	a4,a4,-1
    802005e6:	00c70023          	sb	a2,0(a4)
    802005ea:	fed79ae3          	bne	a5,a3,802005de <memmove+0x3a>
    802005ee:	8082                	ret

00000000802005f0 <strncmp>:
    802005f0:	ce01                	beqz	a2,80200608 <strncmp+0x18>
    802005f2:	00054783          	lbu	a5,0(a0)
    802005f6:	367d                	addiw	a2,a2,-1
    802005f8:	cb91                	beqz	a5,8020060c <strncmp+0x1c>
    802005fa:	0005c703          	lbu	a4,0(a1)
    802005fe:	00f71763          	bne	a4,a5,8020060c <strncmp+0x1c>
    80200602:	0505                	addi	a0,a0,1
    80200604:	0585                	addi	a1,a1,1
    80200606:	f675                	bnez	a2,802005f2 <strncmp+0x2>
    80200608:	4501                	li	a0,0
    8020060a:	8082                	ret
    8020060c:	00054503          	lbu	a0,0(a0)
    80200610:	0005c783          	lbu	a5,0(a1)
    80200614:	9d1d                	subw	a0,a0,a5
    80200616:	8082                	ret

0000000080200618 <strncpy>:
    80200618:	87aa                	mv	a5,a0
    8020061a:	a039                	j	80200628 <strncpy+0x10>
    8020061c:	0005c683          	lbu	a3,0(a1)
    80200620:	0585                	addi	a1,a1,1
    80200622:	fed78fa3          	sb	a3,-1(a5)
    80200626:	c699                	beqz	a3,80200634 <strncpy+0x1c>
    80200628:	8732                	mv	a4,a2
    8020062a:	0785                	addi	a5,a5,1
    8020062c:	367d                	addiw	a2,a2,-1
    8020062e:	fee047e3          	bgtz	a4,8020061c <strncpy+0x4>
    80200632:	8082                	ret
    80200634:	9f3d                	addw	a4,a4,a5
    80200636:	377d                	addiw	a4,a4,-1
    80200638:	ca09                	beqz	a2,8020064a <strncpy+0x32>
    8020063a:	0785                	addi	a5,a5,1
    8020063c:	40f706bb          	subw	a3,a4,a5
    80200640:	fe078fa3          	sb	zero,-1(a5)
    80200644:	fed04be3          	bgtz	a3,8020063a <strncpy+0x22>
    80200648:	8082                	ret
    8020064a:	8082                	ret

000000008020064c <strlen>:
    8020064c:	00054783          	lbu	a5,0(a0)
    80200650:	cf81                	beqz	a5,80200668 <strlen+0x1c>
    80200652:	0505                	addi	a0,a0,1
    80200654:	87aa                	mv	a5,a0
    80200656:	0007c703          	lbu	a4,0(a5)
    8020065a:	86be                	mv	a3,a5
    8020065c:	0785                	addi	a5,a5,1
    8020065e:	ff65                	bnez	a4,80200656 <strlen+0xa>
    80200660:	40a6853b          	subw	a0,a3,a0
    80200664:	2505                	addiw	a0,a0,1
    80200666:	8082                	ret
    80200668:	4501                	li	a0,0
    8020066a:	8082                	ret

000000008020066c <create_pagetable>:
    8020066c:	1141                	addi	sp,sp,-16
    8020066e:	e022                	sd	s0,0(sp)
    80200670:	e406                	sd	ra,8(sp)
    80200672:	c47ff0ef          	jal	802002b8 <alloc_page>
    80200676:	842a                	mv	s0,a0
    80200678:	c509                	beqz	a0,80200682 <create_pagetable+0x16>
    8020067a:	6605                	lui	a2,0x1
    8020067c:	4581                	li	a1,0
    8020067e:	f0bff0ef          	jal	80200588 <memset>
    80200682:	60a2                	ld	ra,8(sp)
    80200684:	8522                	mv	a0,s0
    80200686:	6402                	ld	s0,0(sp)
    80200688:	0141                	addi	sp,sp,16
    8020068a:	8082                	ret

000000008020068c <destroy_pagetable>:
    8020068c:	7111                	addi	sp,sp,-256
    8020068e:	6785                	lui	a5,0x1
    80200690:	f9a2                	sd	s0,240(sp)
    80200692:	f1ca                	sd	s2,224(sp)
    80200694:	e1da                	sd	s6,192(sp)
    80200696:	fd5e                	sd	s7,184(sp)
    80200698:	fd86                	sd	ra,248(sp)
    8020069a:	842a                	mv	s0,a0
    8020069c:	892a                	mv	s2,a0
    8020069e:	00f50b33          	add	s6,a0,a5
    802006a2:	6b85                	lui	s7,0x1
    802006a4:	a021                	j	802006ac <destroy_pagetable+0x20>
    802006a6:	0921                	addi	s2,s2,8 # fffffffffffff008 <end+0xffffffff7fde1cc8>
    802006a8:	21690363          	beq	s2,s6,802008ae <destroy_pagetable+0x222>
    802006ac:	00093783          	ld	a5,0(s2)
    802006b0:	4705                	li	a4,1
    802006b2:	00f7f693          	andi	a3,a5,15
    802006b6:	fee698e3          	bne	a3,a4,802006a6 <destroy_pagetable+0x1a>
    802006ba:	83a9                	srli	a5,a5,0xa
    802006bc:	e9d2                	sd	s4,208(sp)
    802006be:	00c79a13          	slli	s4,a5,0xc
    802006c2:	f5a6                	sd	s1,232(sp)
    802006c4:	e5d6                	sd	s5,200(sp)
    802006c6:	f566                	sd	s9,168(sp)
    802006c8:	ed6e                	sd	s11,152(sp)
    802006ca:	017a0cb3          	add	s9,s4,s7
    802006ce:	4d85                	li	s11,1
    802006d0:	8ad2                	mv	s5,s4
    802006d2:	84a2                	mv	s1,s0
    802006d4:	a021                	j	802006dc <destroy_pagetable+0x50>
    802006d6:	0a21                	addi	s4,s4,8
    802006d8:	1b9a0f63          	beq	s4,s9,80200896 <destroy_pagetable+0x20a>
    802006dc:	000a3783          	ld	a5,0(s4)
    802006e0:	00f7f713          	andi	a4,a5,15
    802006e4:	ffb719e3          	bne	a4,s11,802006d6 <destroy_pagetable+0x4a>
    802006e8:	83a9                	srli	a5,a5,0xa
    802006ea:	edce                	sd	s3,216(sp)
    802006ec:	00c79993          	slli	s3,a5,0xc
    802006f0:	f962                	sd	s8,176(sp)
    802006f2:	f16a                	sd	s10,160(sp)
    802006f4:	8c4e                	mv	s8,s3
    802006f6:	01798d33          	add	s10,s3,s7
    802006fa:	844e                	mv	s0,s3
    802006fc:	a021                	j	80200704 <destroy_pagetable+0x78>
    802006fe:	0421                	addi	s0,s0,8
    80200700:	19a40263          	beq	s0,s10,80200884 <destroy_pagetable+0x1f8>
    80200704:	601c                	ld	a5,0(s0)
    80200706:	00f7f713          	andi	a4,a5,15
    8020070a:	ffb71ae3          	bne	a4,s11,802006fe <destroy_pagetable+0x72>
    8020070e:	83a9                	srli	a5,a5,0xa
    80200710:	07b2                	slli	a5,a5,0xc
    80200712:	8726                	mv	a4,s1
    80200714:	fc56                	sd	s5,56(sp)
    80200716:	84ca                	mv	s1,s2
    80200718:	017789b3          	add	s3,a5,s7
    8020071c:	f822                	sd	s0,48(sp)
    8020071e:	8abe                	mv	s5,a5
    80200720:	893a                	mv	s2,a4
    80200722:	a021                	j	8020072a <destroy_pagetable+0x9e>
    80200724:	07a1                	addi	a5,a5,8 # 1008 <_entry-0x801feff8>
    80200726:	14f98463          	beq	s3,a5,8020086e <destroy_pagetable+0x1e2>
    8020072a:	6398                	ld	a4,0(a5)
    8020072c:	00f77693          	andi	a3,a4,15
    80200730:	ffb69ae3          	bne	a3,s11,80200724 <destroy_pagetable+0x98>
    80200734:	8329                	srli	a4,a4,0xa
    80200736:	0732                	slli	a4,a4,0xc
    80200738:	017706b3          	add	a3,a4,s7
    8020073c:	e0ce                	sd	s3,64(sp)
    8020073e:	e436                	sd	a3,8(sp)
    80200740:	e4be                	sd	a5,72(sp)
    80200742:	89ba                	mv	s3,a4
    80200744:	a029                	j	8020074e <destroy_pagetable+0xc2>
    80200746:	67a2                	ld	a5,8(sp)
    80200748:	0721                	addi	a4,a4,8
    8020074a:	10e78863          	beq	a5,a4,8020085a <destroy_pagetable+0x1ce>
    8020074e:	631c                	ld	a5,0(a4)
    80200750:	00f7f693          	andi	a3,a5,15
    80200754:	ffb699e3          	bne	a3,s11,80200746 <destroy_pagetable+0xba>
    80200758:	83a9                	srli	a5,a5,0xa
    8020075a:	07b2                	slli	a5,a5,0xc
    8020075c:	017786b3          	add	a3,a5,s7
    80200760:	e8e2                	sd	s8,80(sp)
    80200762:	ec36                	sd	a3,24(sp)
    80200764:	8c56                	mv	s8,s5
    80200766:	ecba                	sd	a4,88(sp)
    80200768:	8abe                	mv	s5,a5
    8020076a:	f0ca                	sd	s2,96(sp)
    8020076c:	a029                	j	80200776 <destroy_pagetable+0xea>
    8020076e:	6762                	ld	a4,24(sp)
    80200770:	07a1                	addi	a5,a5,8
    80200772:	0cf70763          	beq	a4,a5,80200840 <destroy_pagetable+0x1b4>
    80200776:	6398                	ld	a4,0(a5)
    80200778:	00f77693          	andi	a3,a4,15
    8020077c:	ffb699e3          	bne	a3,s11,8020076e <destroy_pagetable+0xe2>
    80200780:	8329                	srli	a4,a4,0xa
    80200782:	00c71913          	slli	s2,a4,0xc
    80200786:	01790733          	add	a4,s2,s7
    8020078a:	f4ca                	sd	s2,104(sp)
    8020078c:	844a                	mv	s0,s2
    8020078e:	f03a                	sd	a4,32(sp)
    80200790:	f8be                	sd	a5,112(sp)
    80200792:	8926                	mv	s2,s1
    80200794:	a029                	j	8020079e <destroy_pagetable+0x112>
    80200796:	7782                	ld	a5,32(sp)
    80200798:	0421                	addi	s0,s0,8
    8020079a:	08878863          	beq	a5,s0,8020082a <destroy_pagetable+0x19e>
    8020079e:	601c                	ld	a5,0(s0)
    802007a0:	00f7f693          	andi	a3,a5,15
    802007a4:	ffb699e3          	bne	a3,s11,80200796 <destroy_pagetable+0x10a>
    802007a8:	83a9                	srli	a5,a5,0xa
    802007aa:	00c79493          	slli	s1,a5,0xc
    802007ae:	017487b3          	add	a5,s1,s7
    802007b2:	e826                	sd	s1,16(sp)
    802007b4:	f43e                	sd	a5,40(sp)
    802007b6:	fca2                	sd	s0,120(sp)
    802007b8:	a029                	j	802007c2 <destroy_pagetable+0x136>
    802007ba:	77a2                	ld	a5,40(sp)
    802007bc:	04a1                	addi	s1,s1,8
    802007be:	04978e63          	beq	a5,s1,8020081a <destroy_pagetable+0x18e>
    802007c2:	609c                	ld	a5,0(s1)
    802007c4:	00f7f693          	andi	a3,a5,15
    802007c8:	ffb699e3          	bne	a3,s11,802007ba <destroy_pagetable+0x12e>
    802007cc:	83a9                	srli	a5,a5,0xa
    802007ce:	00c79413          	slli	s0,a5,0xc
    802007d2:	017406b3          	add	a3,s0,s7
    802007d6:	e14a                	sd	s2,128(sp)
    802007d8:	e55a                	sd	s6,136(sp)
    802007da:	8922                	mv	s2,s0
    802007dc:	8b52                	mv	s6,s4
    802007de:	8a26                	mv	s4,s1
    802007e0:	84b6                	mv	s1,a3
    802007e2:	a021                	j	802007ea <destroy_pagetable+0x15e>
    802007e4:	0421                	addi	s0,s0,8
    802007e6:	00848f63          	beq	s1,s0,80200804 <destroy_pagetable+0x178>
    802007ea:	601c                	ld	a5,0(s0)
    802007ec:	00f7f713          	andi	a4,a5,15
    802007f0:	ffb71ae3          	bne	a4,s11,802007e4 <destroy_pagetable+0x158>
    802007f4:	83a9                	srli	a5,a5,0xa
    802007f6:	00c79513          	slli	a0,a5,0xc
    802007fa:	0421                	addi	s0,s0,8
    802007fc:	e91ff0ef          	jal	8020068c <destroy_pagetable>
    80200800:	fe8495e3          	bne	s1,s0,802007ea <destroy_pagetable+0x15e>
    80200804:	854a                	mv	a0,s2
    80200806:	84d2                	mv	s1,s4
    80200808:	690a                	ld	s2,128(sp)
    8020080a:	8a5a                	mv	s4,s6
    8020080c:	6b2a                	ld	s6,136(sp)
    8020080e:	b8fff0ef          	jal	8020039c <free_page>
    80200812:	77a2                	ld	a5,40(sp)
    80200814:	04a1                	addi	s1,s1,8
    80200816:	fa9796e3          	bne	a5,s1,802007c2 <destroy_pagetable+0x136>
    8020081a:	6542                	ld	a0,16(sp)
    8020081c:	7466                	ld	s0,120(sp)
    8020081e:	b7fff0ef          	jal	8020039c <free_page>
    80200822:	7782                	ld	a5,32(sp)
    80200824:	0421                	addi	s0,s0,8
    80200826:	f6879ce3          	bne	a5,s0,8020079e <destroy_pagetable+0x112>
    8020082a:	77c6                	ld	a5,112(sp)
    8020082c:	7526                	ld	a0,104(sp)
    8020082e:	84ca                	mv	s1,s2
    80200830:	e83e                	sd	a5,16(sp)
    80200832:	b6bff0ef          	jal	8020039c <free_page>
    80200836:	67c2                	ld	a5,16(sp)
    80200838:	6762                	ld	a4,24(sp)
    8020083a:	07a1                	addi	a5,a5,8
    8020083c:	f2f71de3          	bne	a4,a5,80200776 <destroy_pagetable+0xea>
    80200840:	6766                	ld	a4,88(sp)
    80200842:	8556                	mv	a0,s5
    80200844:	7906                	ld	s2,96(sp)
    80200846:	e83a                	sd	a4,16(sp)
    80200848:	8ae2                	mv	s5,s8
    8020084a:	6c46                	ld	s8,80(sp)
    8020084c:	b51ff0ef          	jal	8020039c <free_page>
    80200850:	6742                	ld	a4,16(sp)
    80200852:	67a2                	ld	a5,8(sp)
    80200854:	0721                	addi	a4,a4,8
    80200856:	eee79ce3          	bne	a5,a4,8020074e <destroy_pagetable+0xc2>
    8020085a:	67a6                	ld	a5,72(sp)
    8020085c:	854e                	mv	a0,s3
    8020085e:	6986                	ld	s3,64(sp)
    80200860:	e43e                	sd	a5,8(sp)
    80200862:	b3bff0ef          	jal	8020039c <free_page>
    80200866:	67a2                	ld	a5,8(sp)
    80200868:	07a1                	addi	a5,a5,8
    8020086a:	ecf990e3          	bne	s3,a5,8020072a <destroy_pagetable+0x9e>
    8020086e:	7442                	ld	s0,48(sp)
    80200870:	87ca                	mv	a5,s2
    80200872:	8556                	mv	a0,s5
    80200874:	0421                	addi	s0,s0,8
    80200876:	7ae2                	ld	s5,56(sp)
    80200878:	8926                	mv	s2,s1
    8020087a:	84be                	mv	s1,a5
    8020087c:	b21ff0ef          	jal	8020039c <free_page>
    80200880:	e9a412e3          	bne	s0,s10,80200704 <destroy_pagetable+0x78>
    80200884:	8562                	mv	a0,s8
    80200886:	0a21                	addi	s4,s4,8
    80200888:	b15ff0ef          	jal	8020039c <free_page>
    8020088c:	69ee                	ld	s3,216(sp)
    8020088e:	7c4a                	ld	s8,176(sp)
    80200890:	7d0a                	ld	s10,160(sp)
    80200892:	e59a15e3          	bne	s4,s9,802006dc <destroy_pagetable+0x50>
    80200896:	8556                	mv	a0,s5
    80200898:	0921                	addi	s2,s2,8
    8020089a:	b03ff0ef          	jal	8020039c <free_page>
    8020089e:	8426                	mv	s0,s1
    802008a0:	6a4e                	ld	s4,208(sp)
    802008a2:	74ae                	ld	s1,232(sp)
    802008a4:	6aae                	ld	s5,200(sp)
    802008a6:	7caa                	ld	s9,168(sp)
    802008a8:	6dea                	ld	s11,152(sp)
    802008aa:	e16911e3          	bne	s2,s6,802006ac <destroy_pagetable+0x20>
    802008ae:	8522                	mv	a0,s0
    802008b0:	744e                	ld	s0,240(sp)
    802008b2:	70ee                	ld	ra,248(sp)
    802008b4:	790e                	ld	s2,224(sp)
    802008b6:	6b0e                	ld	s6,192(sp)
    802008b8:	7bea                	ld	s7,184(sp)
    802008ba:	6111                	addi	sp,sp,256
    802008bc:	b4c5                	j	8020039c <free_page>

00000000802008be <walk_create>:
    802008be:	7179                	addi	sp,sp,-48
    802008c0:	ec26                	sd	s1,24(sp)
    802008c2:	e84a                	sd	s2,16(sp)
    802008c4:	e44e                	sd	s3,8(sp)
    802008c6:	e052                	sd	s4,0(sp)
    802008c8:	f406                	sd	ra,40(sp)
    802008ca:	f022                	sd	s0,32(sp)
    802008cc:	84aa                	mv	s1,a0
    802008ce:	892e                	mv	s2,a1
    802008d0:	4989                	li	s3,2
    802008d2:	4789                	li	a5,2
    802008d4:	4a05                	li	s4,1
    802008d6:	0037941b          	slliw	s0,a5,0x3
    802008da:	9c3d                	addw	s0,s0,a5
    802008dc:	2431                	addiw	s0,s0,12
    802008de:	00895433          	srl	s0,s2,s0
    802008e2:	1ff47413          	andi	s0,s0,511
    802008e6:	040e                	slli	s0,s0,0x3
    802008e8:	9426                	add	s0,s0,s1
    802008ea:	6004                	ld	s1,0(s0)
    802008ec:	0014f793          	andi	a5,s1,1
    802008f0:	80a9                	srli	s1,s1,0xa
    802008f2:	04b2                	slli	s1,s1,0xc
    802008f4:	c78d                	beqz	a5,8020091e <walk_create+0x60>
    802008f6:	4785                	li	a5,1
    802008f8:	01498463          	beq	s3,s4,80200900 <walk_create+0x42>
    802008fc:	4985                	li	s3,1
    802008fe:	bfe1                	j	802008d6 <walk_create+0x18>
    80200900:	00c95913          	srli	s2,s2,0xc
    80200904:	1ff97913          	andi	s2,s2,511
    80200908:	090e                	slli	s2,s2,0x3
    8020090a:	01248533          	add	a0,s1,s2
    8020090e:	70a2                	ld	ra,40(sp)
    80200910:	7402                	ld	s0,32(sp)
    80200912:	64e2                	ld	s1,24(sp)
    80200914:	6942                	ld	s2,16(sp)
    80200916:	69a2                	ld	s3,8(sp)
    80200918:	6a02                	ld	s4,0(sp)
    8020091a:	6145                	addi	sp,sp,48
    8020091c:	8082                	ret
    8020091e:	99bff0ef          	jal	802002b8 <alloc_page>
    80200922:	6605                	lui	a2,0x1
    80200924:	4581                	li	a1,0
    80200926:	84aa                	mv	s1,a0
    80200928:	c911                	beqz	a0,8020093c <walk_create+0x7e>
    8020092a:	c5fff0ef          	jal	80200588 <memset>
    8020092e:	00c4d793          	srli	a5,s1,0xc
    80200932:	07aa                	slli	a5,a5,0xa
    80200934:	0017e793          	ori	a5,a5,1
    80200938:	e01c                	sd	a5,0(s0)
    8020093a:	bf75                	j	802008f6 <walk_create+0x38>
    8020093c:	4501                	li	a0,0
    8020093e:	bfc1                	j	8020090e <walk_create+0x50>

0000000080200940 <map_page>:
    80200940:	6805                	lui	a6,0x1
    80200942:	7139                	addi	sp,sp,-64
    80200944:	fff80793          	addi	a5,a6,-1 # fff <_entry-0x801ff001>
    80200948:	fc06                	sd	ra,56(sp)
    8020094a:	f822                	sd	s0,48(sp)
    8020094c:	f426                	sd	s1,40(sp)
    8020094e:	f04a                	sd	s2,32(sp)
    80200950:	ec4e                	sd	s3,24(sp)
    80200952:	e852                	sd	s4,16(sp)
    80200954:	e456                	sd	s5,8(sp)
    80200956:	e05a                	sd	s6,0(sp)
    80200958:	00f5f8b3          	and	a7,a1,a5
    8020095c:	08089563          	bnez	a7,802009e6 <map_page+0xa6>
    80200960:	8a3a                	mv	s4,a4
    80200962:	00f67733          	and	a4,a2,a5
    80200966:	eb35                	bnez	a4,802009da <map_page+0x9a>
    80200968:	8ff5                	and	a5,a5,a3
    8020096a:	e3b5                	bnez	a5,802009ce <map_page+0x8e>
    8020096c:	410686b3          	sub	a3,a3,a6
    80200970:	89aa                	mv	s3,a0
    80200972:	8b2e                	mv	s6,a1
    80200974:	00b684b3          	add	s1,a3,a1
    80200978:	40b60933          	sub	s2,a2,a1
    8020097c:	6a85                	lui	s5,0x1
    8020097e:	a831                	j	8020099a <map_page+0x5a>
    80200980:	611c                	ld	a5,0(a0)
    80200982:	8b85                	andi	a5,a5,1
    80200984:	ef9d                	bnez	a5,802009c2 <map_page+0x82>
    80200986:	8031                	srli	s0,s0,0xc
    80200988:	042a                	slli	s0,s0,0xa
    8020098a:	01446433          	or	s0,s0,s4
    8020098e:	00146413          	ori	s0,s0,1
    80200992:	e100                	sd	s0,0(a0)
    80200994:	029b0563          	beq	s6,s1,802009be <map_page+0x7e>
    80200998:	9b56                	add	s6,s6,s5
    8020099a:	85da                	mv	a1,s6
    8020099c:	854e                	mv	a0,s3
    8020099e:	012b0433          	add	s0,s6,s2
    802009a2:	f1dff0ef          	jal	802008be <walk_create>
    802009a6:	fd69                	bnez	a0,80200980 <map_page+0x40>
    802009a8:	557d                	li	a0,-1
    802009aa:	70e2                	ld	ra,56(sp)
    802009ac:	7442                	ld	s0,48(sp)
    802009ae:	74a2                	ld	s1,40(sp)
    802009b0:	7902                	ld	s2,32(sp)
    802009b2:	69e2                	ld	s3,24(sp)
    802009b4:	6a42                	ld	s4,16(sp)
    802009b6:	6aa2                	ld	s5,8(sp)
    802009b8:	6b02                	ld	s6,0(sp)
    802009ba:	6121                	addi	sp,sp,64
    802009bc:	8082                	ret
    802009be:	4501                	li	a0,0
    802009c0:	b7ed                	j	802009aa <map_page+0x6a>
    802009c2:	00006517          	auipc	a0,0x6
    802009c6:	73650513          	addi	a0,a0,1846 # 802070f8 <etext+0xf8>
    802009ca:	887ff0ef          	jal	80200250 <panic>
    802009ce:	00006517          	auipc	a0,0x6
    802009d2:	70a50513          	addi	a0,a0,1802 # 802070d8 <etext+0xd8>
    802009d6:	87bff0ef          	jal	80200250 <panic>
    802009da:	00006517          	auipc	a0,0x6
    802009de:	6de50513          	addi	a0,a0,1758 # 802070b8 <etext+0xb8>
    802009e2:	86fff0ef          	jal	80200250 <panic>
    802009e6:	00006517          	auipc	a0,0x6
    802009ea:	6b250513          	addi	a0,a0,1714 # 80207098 <etext+0x98>
    802009ee:	863ff0ef          	jal	80200250 <panic>

00000000802009f2 <unmap_page.part.0>:
    802009f2:	7139                	addi	sp,sp,-64
    802009f4:	f04a                	sd	s2,32(sp)
    802009f6:	00c61913          	slli	s2,a2,0xc
    802009fa:	fc06                	sd	ra,56(sp)
    802009fc:	992e                	add	s2,s2,a1
    802009fe:	0525f163          	bgeu	a1,s2,80200a40 <unmap_page.part.0+0x4e>
    80200a02:	f426                	sd	s1,40(sp)
    80200a04:	ec4e                	sd	s3,24(sp)
    80200a06:	e852                	sd	s4,16(sp)
    80200a08:	e456                	sd	s5,8(sp)
    80200a0a:	f822                	sd	s0,48(sp)
    80200a0c:	84ae                	mv	s1,a1
    80200a0e:	89aa                	mv	s3,a0
    80200a10:	8ab6                	mv	s5,a3
    80200a12:	6a05                	lui	s4,0x1
    80200a14:	85a6                	mv	a1,s1
    80200a16:	854e                	mv	a0,s3
    80200a18:	ea7ff0ef          	jal	802008be <walk_create>
    80200a1c:	842a                	mv	s0,a0
    80200a1e:	c909                	beqz	a0,80200a30 <unmap_page.part.0+0x3e>
    80200a20:	611c                	ld	a5,0(a0)
    80200a22:	0017f713          	andi	a4,a5,1
    80200a26:	c709                	beqz	a4,80200a30 <unmap_page.part.0+0x3e>
    80200a28:	020a9063          	bnez	s5,80200a48 <unmap_page.part.0+0x56>
    80200a2c:	00043023          	sd	zero,0(s0)
    80200a30:	94d2                	add	s1,s1,s4
    80200a32:	ff24e1e3          	bltu	s1,s2,80200a14 <unmap_page.part.0+0x22>
    80200a36:	7442                	ld	s0,48(sp)
    80200a38:	74a2                	ld	s1,40(sp)
    80200a3a:	69e2                	ld	s3,24(sp)
    80200a3c:	6a42                	ld	s4,16(sp)
    80200a3e:	6aa2                	ld	s5,8(sp)
    80200a40:	70e2                	ld	ra,56(sp)
    80200a42:	7902                	ld	s2,32(sp)
    80200a44:	6121                	addi	sp,sp,64
    80200a46:	8082                	ret
    80200a48:	83a9                	srli	a5,a5,0xa
    80200a4a:	00c79513          	slli	a0,a5,0xc
    80200a4e:	94fff0ef          	jal	8020039c <free_page>
    80200a52:	bfe9                	j	80200a2c <unmap_page.part.0+0x3a>

0000000080200a54 <walk_lookup>:
    80200a54:	01e5d793          	srli	a5,a1,0x1e
    80200a58:	1ff7f793          	andi	a5,a5,511
    80200a5c:	078e                	slli	a5,a5,0x3
    80200a5e:	953e                	add	a0,a0,a5
    80200a60:	6118                	ld	a4,0(a0)
    80200a62:	00177793          	andi	a5,a4,1
    80200a66:	c78d                	beqz	a5,80200a90 <walk_lookup+0x3c>
    80200a68:	0155d793          	srli	a5,a1,0x15
    80200a6c:	8329                	srli	a4,a4,0xa
    80200a6e:	1ff7f793          	andi	a5,a5,511
    80200a72:	0732                	slli	a4,a4,0xc
    80200a74:	078e                	slli	a5,a5,0x3
    80200a76:	97ba                	add	a5,a5,a4
    80200a78:	6388                	ld	a0,0(a5)
    80200a7a:	00157793          	andi	a5,a0,1
    80200a7e:	cb89                	beqz	a5,80200a90 <walk_lookup+0x3c>
    80200a80:	81b1                	srli	a1,a1,0xc
    80200a82:	8129                	srli	a0,a0,0xa
    80200a84:	1ff5f593          	andi	a1,a1,511
    80200a88:	058e                	slli	a1,a1,0x3
    80200a8a:	0532                	slli	a0,a0,0xc
    80200a8c:	952e                	add	a0,a0,a1
    80200a8e:	8082                	ret
    80200a90:	4501                	li	a0,0
    80200a92:	8082                	ret

0000000080200a94 <kvm_init>:
    80200a94:	1101                	addi	sp,sp,-32
    80200a96:	e822                	sd	s0,16(sp)
    80200a98:	ec06                	sd	ra,24(sp)
    80200a9a:	e426                	sd	s1,8(sp)
    80200a9c:	e04a                	sd	s2,0(sp)
    80200a9e:	81bff0ef          	jal	802002b8 <alloc_page>
    80200aa2:	842a                	mv	s0,a0
    80200aa4:	c509                	beqz	a0,80200aae <kvm_init+0x1a>
    80200aa6:	6605                	lui	a2,0x1
    80200aa8:	4581                	li	a1,0
    80200aaa:	adfff0ef          	jal	80200588 <memset>
    80200aae:	bff00693          	li	a3,-1025
    80200ab2:	40100613          	li	a2,1025
    80200ab6:	00006917          	auipc	s2,0x6
    80200aba:	54a90913          	addi	s2,s2,1354 # 80207000 <etext>
    80200abe:	06d6                	slli	a3,a3,0x15
    80200ac0:	0656                	slli	a2,a2,0x15
    80200ac2:	00008497          	auipc	s1,0x8
    80200ac6:	dce48493          	addi	s1,s1,-562 # 80208890 <kernel_pagetable>
    80200aca:	4729                	li	a4,10
    80200acc:	96ca                	add	a3,a3,s2
    80200ace:	85b2                	mv	a1,a2
    80200ad0:	8522                	mv	a0,s0
    80200ad2:	e080                	sd	s0,0(s1)
    80200ad4:	e6dff0ef          	jal	80200940 <map_page>
    80200ad8:	e149                	bnez	a0,80200b5a <kvm_init+0xc6>
    80200ada:	46c5                	li	a3,17
    80200adc:	6088                	ld	a0,0(s1)
    80200ade:	06ee                	slli	a3,a3,0x1b
    80200ae0:	4719                	li	a4,6
    80200ae2:	412686b3          	sub	a3,a3,s2
    80200ae6:	864a                	mv	a2,s2
    80200ae8:	85ca                	mv	a1,s2
    80200aea:	e57ff0ef          	jal	80200940 <map_page>
    80200aee:	e535                	bnez	a0,80200b5a <kvm_init+0xc6>
    80200af0:	6088                	ld	a0,0(s1)
    80200af2:	100005b7          	lui	a1,0x10000
    80200af6:	dc9ff0ef          	jal	802008be <walk_create>
    80200afa:	872a                	mv	a4,a0
    80200afc:	cd39                	beqz	a0,80200b5a <kvm_init+0xc6>
    80200afe:	611c                	ld	a5,0(a0)
    80200b00:	8b85                	andi	a5,a5,1
    80200b02:	ebc1                	bnez	a5,80200b92 <kvm_init+0xfe>
    80200b04:	6088                	ld	a0,0(s1)
    80200b06:	040007b7          	lui	a5,0x4000
    80200b0a:	079d                	addi	a5,a5,7 # 4000007 <_entry-0x7c1ffff9>
    80200b0c:	e31c                	sd	a5,0(a4)
    80200b0e:	100015b7          	lui	a1,0x10001
    80200b12:	dadff0ef          	jal	802008be <walk_create>
    80200b16:	c131                	beqz	a0,80200b5a <kvm_init+0xc6>
    80200b18:	611c                	ld	a5,0(a0)
    80200b1a:	8b85                	andi	a5,a5,1
    80200b1c:	ebbd                	bnez	a5,80200b92 <kvm_init+0xfe>
    80200b1e:	040007b7          	lui	a5,0x4000
    80200b22:	40778793          	addi	a5,a5,1031 # 4000407 <_entry-0x7c1ffbf9>
    80200b26:	0004b903          	ld	s2,0(s1)
    80200b2a:	0c000437          	lui	s0,0xc000
    80200b2e:	e11c                	sd	a5,0(a0)
    80200b30:	a005                	j	80200b50 <kvm_init+0xbc>
    80200b32:	611c                	ld	a5,0(a0)
    80200b34:	8b85                	andi	a5,a5,1
    80200b36:	efb1                	bnez	a5,80200b92 <kvm_init+0xfe>
    80200b38:	00c45793          	srli	a5,s0,0xc
    80200b3c:	07aa                	slli	a5,a5,0xa
    80200b3e:	0077e793          	ori	a5,a5,7
    80200b42:	e11c                	sd	a5,0(a0)
    80200b44:	0c3ff7b7          	lui	a5,0xc3ff
    80200b48:	00f40f63          	beq	s0,a5,80200b66 <kvm_init+0xd2>
    80200b4c:	6785                	lui	a5,0x1
    80200b4e:	943e                	add	s0,s0,a5
    80200b50:	85a2                	mv	a1,s0
    80200b52:	854a                	mv	a0,s2
    80200b54:	d6bff0ef          	jal	802008be <walk_create>
    80200b58:	fd69                	bnez	a0,80200b32 <kvm_init+0x9e>
    80200b5a:	00006517          	auipc	a0,0x6
    80200b5e:	5ae50513          	addi	a0,a0,1454 # 80207108 <etext+0x108>
    80200b62:	eeeff0ef          	jal	80200250 <panic>
    80200b66:	040005b7          	lui	a1,0x4000
    80200b6a:	6088                	ld	a0,0(s1)
    80200b6c:	15fd                	addi	a1,a1,-1 # 3ffffff <_entry-0x7c200001>
    80200b6e:	4729                	li	a4,10
    80200b70:	6685                	lui	a3,0x1
    80200b72:	00005617          	auipc	a2,0x5
    80200b76:	48e60613          	addi	a2,a2,1166 # 80206000 <_trampoline>
    80200b7a:	05b2                	slli	a1,a1,0xc
    80200b7c:	dc5ff0ef          	jal	80200940 <map_page>
    80200b80:	fd69                	bnez	a0,80200b5a <kvm_init+0xc6>
    80200b82:	6442                	ld	s0,16(sp)
    80200b84:	6088                	ld	a0,0(s1)
    80200b86:	60e2                	ld	ra,24(sp)
    80200b88:	64a2                	ld	s1,8(sp)
    80200b8a:	6902                	ld	s2,0(sp)
    80200b8c:	6105                	addi	sp,sp,32
    80200b8e:	7ee0006f          	j	8020137c <proc_mapstacks>
    80200b92:	00006517          	auipc	a0,0x6
    80200b96:	56650513          	addi	a0,a0,1382 # 802070f8 <etext+0xf8>
    80200b9a:	eb6ff0ef          	jal	80200250 <panic>

0000000080200b9e <kvm_inithart>:
    80200b9e:	00008797          	auipc	a5,0x8
    80200ba2:	cf27b783          	ld	a5,-782(a5) # 80208890 <kernel_pagetable>
    80200ba6:	577d                	li	a4,-1
    80200ba8:	177e                	slli	a4,a4,0x3f
    80200baa:	83b1                	srli	a5,a5,0xc
    80200bac:	8fd9                	or	a5,a5,a4
    80200bae:	18079073          	csrw	satp,a5
    80200bb2:	12000073          	sfence.vma
    80200bb6:	8082                	ret

0000000080200bb8 <map_region>:
    80200bb8:	1141                	addi	sp,sp,-16
    80200bba:	e406                	sd	ra,8(sp)
    80200bbc:	d85ff0ef          	jal	80200940 <map_page>
    80200bc0:	e501                	bnez	a0,80200bc8 <map_region+0x10>
    80200bc2:	60a2                	ld	ra,8(sp)
    80200bc4:	0141                	addi	sp,sp,16
    80200bc6:	8082                	ret
    80200bc8:	00006517          	auipc	a0,0x6
    80200bcc:	54050513          	addi	a0,a0,1344 # 80207108 <etext+0x108>
    80200bd0:	e80ff0ef          	jal	80200250 <panic>

0000000080200bd4 <unmap_page>:
    80200bd4:	03459793          	slli	a5,a1,0x34
    80200bd8:	e391                	bnez	a5,80200bdc <unmap_page+0x8>
    80200bda:	bd21                	j	802009f2 <unmap_page.part.0>
    80200bdc:	1141                	addi	sp,sp,-16
    80200bde:	00006517          	auipc	a0,0x6
    80200be2:	53250513          	addi	a0,a0,1330 # 80207110 <etext+0x110>
    80200be6:	e406                	sd	ra,8(sp)
    80200be8:	e68ff0ef          	jal	80200250 <panic>

0000000080200bec <copyout>:
    80200bec:	c6c9                	beqz	a3,80200c76 <copyout+0x8a>
    80200bee:	715d                	addi	sp,sp,-80
    80200bf0:	e0a2                	sd	s0,64(sp)
    80200bf2:	f84a                	sd	s2,48(sp)
    80200bf4:	f44e                	sd	s3,40(sp)
    80200bf6:	f052                	sd	s4,32(sp)
    80200bf8:	ec56                	sd	s5,24(sp)
    80200bfa:	e85a                	sd	s6,16(sp)
    80200bfc:	e45e                	sd	s7,8(sp)
    80200bfe:	e486                	sd	ra,72(sp)
    80200c00:	fc26                	sd	s1,56(sp)
    80200c02:	8bb6                	mv	s7,a3
    80200c04:	8a2a                	mv	s4,a0
    80200c06:	842e                	mv	s0,a1
    80200c08:	8932                	mv	s2,a2
    80200c0a:	7afd                	lui	s5,0xfffff
    80200c0c:	4b45                	li	s6,17
    80200c0e:	6985                	lui	s3,0x1
    80200c10:	a805                	j	80200c40 <copyout+0x54>
    80200c12:	611c                	ld	a5,0(a0)
    80200c14:	00a7d713          	srli	a4,a5,0xa
    80200c18:	0732                	slli	a4,a4,0xc
    80200c1a:	8bc5                	andi	a5,a5,17
    80200c1c:	00d70533          	add	a0,a4,a3
    80200c20:	03679d63          	bne	a5,s6,80200c5a <copyout+0x6e>
    80200c24:	008bf363          	bgeu	s7,s0,80200c2a <copyout+0x3e>
    80200c28:	845e                	mv	s0,s7
    80200c2a:	0004061b          	sext.w	a2,s0
    80200c2e:	408b8bb3          	sub	s7,s7,s0
    80200c32:	9922                	add	s2,s2,s0
    80200c34:	971ff0ef          	jal	802005a4 <memmove>
    80200c38:	01348433          	add	s0,s1,s3
    80200c3c:	020b8b63          	beqz	s7,80200c72 <copyout+0x86>
    80200c40:	015474b3          	and	s1,s0,s5
    80200c44:	85a6                	mv	a1,s1
    80200c46:	8552                	mv	a0,s4
    80200c48:	e0dff0ef          	jal	80200a54 <walk_lookup>
    80200c4c:	409406b3          	sub	a3,s0,s1
    80200c50:	40848433          	sub	s0,s1,s0
    80200c54:	85ca                	mv	a1,s2
    80200c56:	944e                	add	s0,s0,s3
    80200c58:	fd4d                	bnez	a0,80200c12 <copyout+0x26>
    80200c5a:	557d                	li	a0,-1
    80200c5c:	60a6                	ld	ra,72(sp)
    80200c5e:	6406                	ld	s0,64(sp)
    80200c60:	74e2                	ld	s1,56(sp)
    80200c62:	7942                	ld	s2,48(sp)
    80200c64:	79a2                	ld	s3,40(sp)
    80200c66:	7a02                	ld	s4,32(sp)
    80200c68:	6ae2                	ld	s5,24(sp)
    80200c6a:	6b42                	ld	s6,16(sp)
    80200c6c:	6ba2                	ld	s7,8(sp)
    80200c6e:	6161                	addi	sp,sp,80
    80200c70:	8082                	ret
    80200c72:	4501                	li	a0,0
    80200c74:	b7e5                	j	80200c5c <copyout+0x70>
    80200c76:	4501                	li	a0,0
    80200c78:	8082                	ret

0000000080200c7a <copy_pagetable>:
    80200c7a:	c649                	beqz	a2,80200d04 <copy_pagetable+0x8a>
    80200c7c:	7139                	addi	sp,sp,-64
    80200c7e:	f822                	sd	s0,48(sp)
    80200c80:	f04a                	sd	s2,32(sp)
    80200c82:	ec4e                	sd	s3,24(sp)
    80200c84:	e852                	sd	s4,16(sp)
    80200c86:	fc06                	sd	ra,56(sp)
    80200c88:	f426                	sd	s1,40(sp)
    80200c8a:	e456                	sd	s5,8(sp)
    80200c8c:	8932                	mv	s2,a2
    80200c8e:	89aa                	mv	s3,a0
    80200c90:	8a2e                	mv	s4,a1
    80200c92:	4401                	li	s0,0
    80200c94:	85a2                	mv	a1,s0
    80200c96:	854e                	mv	a0,s3
    80200c98:	c27ff0ef          	jal	802008be <walk_create>
    80200c9c:	c915                	beqz	a0,80200cd0 <copy_pagetable+0x56>
    80200c9e:	611c                	ld	a5,0(a0)
    80200ca0:	00a7d593          	srli	a1,a5,0xa
    80200ca4:	3ff7fa93          	andi	s5,a5,1023
    80200ca8:	8b85                	andi	a5,a5,1
    80200caa:	00c59493          	slli	s1,a1,0xc
    80200cae:	c38d                	beqz	a5,80200cd0 <copy_pagetable+0x56>
    80200cb0:	e08ff0ef          	jal	802002b8 <alloc_page>
    80200cb4:	85a6                	mv	a1,s1
    80200cb6:	6605                	lui	a2,0x1
    80200cb8:	84aa                	mv	s1,a0
    80200cba:	cd05                	beqz	a0,80200cf2 <copy_pagetable+0x78>
    80200cbc:	8e9ff0ef          	jal	802005a4 <memmove>
    80200cc0:	8756                	mv	a4,s5
    80200cc2:	86a6                	mv	a3,s1
    80200cc4:	6605                	lui	a2,0x1
    80200cc6:	85a2                	mv	a1,s0
    80200cc8:	8552                	mv	a0,s4
    80200cca:	c77ff0ef          	jal	80200940 <map_page>
    80200cce:	ed19                	bnez	a0,80200cec <copy_pagetable+0x72>
    80200cd0:	6785                	lui	a5,0x1
    80200cd2:	943e                	add	s0,s0,a5
    80200cd4:	fd2460e3          	bltu	s0,s2,80200c94 <copy_pagetable+0x1a>
    80200cd8:	4501                	li	a0,0
    80200cda:	70e2                	ld	ra,56(sp)
    80200cdc:	7442                	ld	s0,48(sp)
    80200cde:	74a2                	ld	s1,40(sp)
    80200ce0:	7902                	ld	s2,32(sp)
    80200ce2:	69e2                	ld	s3,24(sp)
    80200ce4:	6a42                	ld	s4,16(sp)
    80200ce6:	6aa2                	ld	s5,8(sp)
    80200ce8:	6121                	addi	sp,sp,64
    80200cea:	8082                	ret
    80200cec:	8526                	mv	a0,s1
    80200cee:	eaeff0ef          	jal	8020039c <free_page>
    80200cf2:	8552                	mv	a0,s4
    80200cf4:	4685                	li	a3,1
    80200cf6:	00c45613          	srli	a2,s0,0xc
    80200cfa:	4581                	li	a1,0
    80200cfc:	cf7ff0ef          	jal	802009f2 <unmap_page.part.0>
    80200d00:	557d                	li	a0,-1
    80200d02:	bfe1                	j	80200cda <copy_pagetable+0x60>
    80200d04:	4501                	li	a0,0
    80200d06:	8082                	ret

0000000080200d08 <plic_init>:
    80200d08:	0c000737          	lui	a4,0xc000
    80200d0c:	4685                	li	a3,1
    80200d0e:	c354                	sw	a3,4(a4)
    80200d10:	0c0027b7          	lui	a5,0xc002
    80200d14:	4709                	li	a4,2
    80200d16:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x741fdf80>
    80200d1a:	0c2017b7          	lui	a5,0xc201
    80200d1e:	0007a023          	sw	zero,0(a5) # c201000 <_entry-0x73fff000>
    80200d22:	8082                	ret

0000000080200d24 <trap_init>:
    80200d24:	00000797          	auipc	a5,0x0
    80200d28:	56c78793          	addi	a5,a5,1388 # 80201290 <kernelvec>
    80200d2c:	10579073          	csrw	stvec,a5
    80200d30:	100027f3          	csrr	a5,sstatus
    80200d34:	0027e793          	ori	a5,a5,2
    80200d38:	10079073          	csrw	sstatus,a5
    80200d3c:	104027f3          	csrr	a5,sie
    80200d40:	2007e793          	ori	a5,a5,512
    80200d44:	10479073          	csrw	sie,a5
    80200d48:	00008797          	auipc	a5,0x8
    80200d4c:	c1878793          	addi	a5,a5,-1000 # 80208960 <interrupt_vector>
    80200d50:	00008717          	auipc	a4,0x8
    80200d54:	01070713          	addi	a4,a4,16 # 80208d60 <pid_lock>
    80200d58:	0007b023          	sd	zero,0(a5)
    80200d5c:	07a1                	addi	a5,a5,8
    80200d5e:	fee79de3          	bne	a5,a4,80200d58 <trap_init+0x34>
    80200d62:	0c000737          	lui	a4,0xc000
    80200d66:	4685                	li	a3,1
    80200d68:	c354                	sw	a3,4(a4)
    80200d6a:	0c0027b7          	lui	a5,0xc002
    80200d6e:	4709                	li	a4,2
    80200d70:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x741fdf80>
    80200d74:	0c2017b7          	lui	a5,0xc201
    80200d78:	0007a023          	sw	zero,0(a5) # c201000 <_entry-0x73fff000>
    80200d7c:	8082                	ret

0000000080200d7e <prepare_return>:
    80200d7e:	00008697          	auipc	a3,0x8
    80200d82:	b2a6b683          	ld	a3,-1238(a3) # 802088a8 <current_proc>
    80200d86:	100027f3          	csrr	a5,sstatus
    80200d8a:	9bf5                	andi	a5,a5,-3
    80200d8c:	10079073          	csrw	sstatus,a5
    80200d90:	04000737          	lui	a4,0x4000
    80200d94:	00005617          	auipc	a2,0x5
    80200d98:	26c60613          	addi	a2,a2,620 # 80206000 <_trampoline>
    80200d9c:	177d                	addi	a4,a4,-1 # 3ffffff <_entry-0x7c200001>
    80200d9e:	00005797          	auipc	a5,0x5
    80200da2:	26278793          	addi	a5,a5,610 # 80206000 <_trampoline>
    80200da6:	0732                	slli	a4,a4,0xc
    80200da8:	8f91                	sub	a5,a5,a2
    80200daa:	97ba                	add	a5,a5,a4
    80200dac:	10579073          	csrw	stvec,a5
    80200db0:	1406b783          	ld	a5,320(a3)
    80200db4:	18002673          	csrr	a2,satp
    80200db8:	6e98                	ld	a4,24(a3)
    80200dba:	6685                	lui	a3,0x1
    80200dbc:	e390                	sd	a2,0(a5)
    80200dbe:	9736                	add	a4,a4,a3
    80200dc0:	e798                	sd	a4,8(a5)
    80200dc2:	00000717          	auipc	a4,0x0
    80200dc6:	02670713          	addi	a4,a4,38 # 80200de8 <usertrap>
    80200dca:	eb98                	sd	a4,16(a5)
    80200dcc:	8712                	mv	a4,tp
    80200dce:	f398                	sd	a4,32(a5)
    80200dd0:	10002773          	csrr	a4,sstatus
    80200dd4:	eff77713          	andi	a4,a4,-257
    80200dd8:	02076713          	ori	a4,a4,32
    80200ddc:	10071073          	csrw	sstatus,a4
    80200de0:	6f9c                	ld	a5,24(a5)
    80200de2:	14179073          	csrw	sepc,a5
    80200de6:	8082                	ret

0000000080200de8 <usertrap>:
    80200de8:	1101                	addi	sp,sp,-32
    80200dea:	ec06                	sd	ra,24(sp)
    80200dec:	e822                	sd	s0,16(sp)
    80200dee:	e426                	sd	s1,8(sp)
    80200df0:	100027f3          	csrr	a5,sstatus
    80200df4:	1007f793          	andi	a5,a5,256
    80200df8:	efdd                	bnez	a5,80200eb6 <usertrap+0xce>
    80200dfa:	00000797          	auipc	a5,0x0
    80200dfe:	49678793          	addi	a5,a5,1174 # 80201290 <kernelvec>
    80200e02:	10579073          	csrw	stvec,a5
    80200e06:	00008497          	auipc	s1,0x8
    80200e0a:	aa24b483          	ld	s1,-1374(s1) # 802088a8 <current_proc>
    80200e0e:	1404b403          	ld	s0,320(s1)
    80200e12:	141027f3          	csrr	a5,sepc
    80200e16:	ec1c                	sd	a5,24(s0)
    80200e18:	142025f3          	csrr	a1,scause
    80200e1c:	4721                	li	a4,8
    80200e1e:	02e59c63          	bne	a1,a4,80200e56 <usertrap+0x6e>
    80200e22:	0791                	addi	a5,a5,4
    80200e24:	ec1c                	sd	a5,24(s0)
    80200e26:	100027f3          	csrr	a5,sstatus
    80200e2a:	0027e793          	ori	a5,a5,2
    80200e2e:	10079073          	csrw	sstatus,a5
    80200e32:	745c                	ld	a5,168(s0)
    80200e34:	470d                	li	a4,3
    80200e36:	7828                	ld	a0,112(s0)
    80200e38:	04e78d63          	beq	a5,a4,80200e92 <usertrap+0xaa>
    80200e3c:	06f76363          	bltu	a4,a5,80200ea2 <usertrap+0xba>
    80200e40:	4705                	li	a4,1
    80200e42:	04e78c63          	beq	a5,a4,80200e9a <usertrap+0xb2>
    80200e46:	4709                	li	a4,2
    80200e48:	06e79463          	bne	a5,a4,80200eb0 <usertrap+0xc8>
    80200e4c:	2501                	sext.w	a0,a0
    80200e4e:	2d4030ef          	jal	80204122 <sys_exit>
    80200e52:	f828                	sd	a0,112(s0)
    80200e54:	a015                	j	80200e78 <usertrap+0x90>
    80200e56:	4890                	lw	a2,16(s1)
    80200e58:	00006517          	auipc	a0,0x6
    80200e5c:	2f050513          	addi	a0,a0,752 # 80207148 <etext+0x148>
    80200e60:	afaff0ef          	jal	8020015a <printf>
    80200e64:	141025f3          	csrr	a1,sepc
    80200e68:	14302673          	csrr	a2,stval
    80200e6c:	00006517          	auipc	a0,0x6
    80200e70:	30c50513          	addi	a0,a0,780 # 80207178 <etext+0x178>
    80200e74:	ae6ff0ef          	jal	8020015a <printf>
    80200e78:	f07ff0ef          	jal	80200d7e <prepare_return>
    80200e7c:	1384b503          	ld	a0,312(s1)
    80200e80:	60e2                	ld	ra,24(sp)
    80200e82:	6442                	ld	s0,16(sp)
    80200e84:	57fd                	li	a5,-1
    80200e86:	8131                	srli	a0,a0,0xc
    80200e88:	17fe                	slli	a5,a5,0x3f
    80200e8a:	64a2                	ld	s1,8(sp)
    80200e8c:	8d5d                	or	a0,a0,a5
    80200e8e:	6105                	addi	sp,sp,32
    80200e90:	8082                	ret
    80200e92:	2c4030ef          	jal	80204156 <sys_wait>
    80200e96:	f828                	sd	a0,112(s0)
    80200e98:	b7c5                	j	80200e78 <usertrap+0x90>
    80200e9a:	2ae030ef          	jal	80204148 <sys_fork>
    80200e9e:	f828                	sd	a0,112(s0)
    80200ea0:	bfe1                	j	80200e78 <usertrap+0x90>
    80200ea2:	472d                	li	a4,11
    80200ea4:	00e79663          	bne	a5,a4,80200eb0 <usertrap+0xc8>
    80200ea8:	294030ef          	jal	8020413c <sys_getpid>
    80200eac:	f828                	sd	a0,112(s0)
    80200eae:	b7e9                	j	80200e78 <usertrap+0x90>
    80200eb0:	57fd                	li	a5,-1
    80200eb2:	f83c                	sd	a5,112(s0)
    80200eb4:	b7d1                	j	80200e78 <usertrap+0x90>
    80200eb6:	00006517          	auipc	a0,0x6
    80200eba:	27250513          	addi	a0,a0,626 # 80207128 <etext+0x128>
    80200ebe:	b92ff0ef          	jal	80200250 <panic>

0000000080200ec2 <register_interrupt>:
    80200ec2:	07f00793          	li	a5,127
    80200ec6:	00a7ea63          	bltu	a5,a0,80200eda <register_interrupt+0x18>
    80200eca:	050e                	slli	a0,a0,0x3
    80200ecc:	00008797          	auipc	a5,0x8
    80200ed0:	a9478793          	addi	a5,a5,-1388 # 80208960 <interrupt_vector>
    80200ed4:	97aa                	add	a5,a5,a0
    80200ed6:	e38c                	sd	a1,0(a5)
    80200ed8:	8082                	ret
    80200eda:	1141                	addi	sp,sp,-16
    80200edc:	00006517          	auipc	a0,0x6
    80200ee0:	2c450513          	addi	a0,a0,708 # 802071a0 <etext+0x1a0>
    80200ee4:	e406                	sd	ra,8(sp)
    80200ee6:	b6aff0ef          	jal	80200250 <panic>

0000000080200eea <unregister_interrupt>:
    80200eea:	07f00793          	li	a5,127
    80200eee:	00a7eb63          	bltu	a5,a0,80200f04 <unregister_interrupt+0x1a>
    80200ef2:	050e                	slli	a0,a0,0x3
    80200ef4:	00008797          	auipc	a5,0x8
    80200ef8:	a6c78793          	addi	a5,a5,-1428 # 80208960 <interrupt_vector>
    80200efc:	97aa                	add	a5,a5,a0
    80200efe:	0007b023          	sd	zero,0(a5)
    80200f02:	8082                	ret
    80200f04:	1141                	addi	sp,sp,-16
    80200f06:	00006517          	auipc	a0,0x6
    80200f0a:	29a50513          	addi	a0,a0,666 # 802071a0 <etext+0x1a0>
    80200f0e:	e406                	sd	ra,8(sp)
    80200f10:	b40ff0ef          	jal	80200250 <panic>

0000000080200f14 <enable_interrupt>:
    80200f14:	07f00793          	li	a5,127
    80200f18:	00a7ec63          	bltu	a5,a0,80200f30 <enable_interrupt+0x1c>
    80200f1c:	00f50363          	beq	a0,a5,80200f22 <enable_interrupt+0xe>
    80200f20:	8082                	ret
    80200f22:	104027f3          	csrr	a5,sie
    80200f26:	0207e793          	ori	a5,a5,32
    80200f2a:	10479073          	csrw	sie,a5
    80200f2e:	8082                	ret
    80200f30:	1141                	addi	sp,sp,-16
    80200f32:	00006517          	auipc	a0,0x6
    80200f36:	26e50513          	addi	a0,a0,622 # 802071a0 <etext+0x1a0>
    80200f3a:	e406                	sd	ra,8(sp)
    80200f3c:	b14ff0ef          	jal	80200250 <panic>

0000000080200f40 <disable_interrupt>:
    80200f40:	07f00793          	li	a5,127
    80200f44:	00a7ec63          	bltu	a5,a0,80200f5c <disable_interrupt+0x1c>
    80200f48:	00f50363          	beq	a0,a5,80200f4e <disable_interrupt+0xe>
    80200f4c:	8082                	ret
    80200f4e:	104027f3          	csrr	a5,sie
    80200f52:	fdf7f793          	andi	a5,a5,-33
    80200f56:	10479073          	csrw	sie,a5
    80200f5a:	8082                	ret
    80200f5c:	1141                	addi	sp,sp,-16
    80200f5e:	00006517          	auipc	a0,0x6
    80200f62:	24250513          	addi	a0,a0,578 # 802071a0 <etext+0x1a0>
    80200f66:	e406                	sd	ra,8(sp)
    80200f68:	ae8ff0ef          	jal	80200250 <panic>

0000000080200f6c <interrupt_dispatch>:
    80200f6c:	57fd                	li	a5,-1
    80200f6e:	1101                	addi	sp,sp,-32
    80200f70:	17fe                	slli	a5,a5,0x3f
    80200f72:	ec06                	sd	ra,24(sp)
    80200f74:	0795                	addi	a5,a5,5
    80200f76:	02f50a63          	beq	a0,a5,80200faa <interrupt_dispatch+0x3e>
    80200f7a:	57fd                	li	a5,-1
    80200f7c:	17fe                	slli	a5,a5,0x3f
    80200f7e:	e822                	sd	s0,16(sp)
    80200f80:	e426                	sd	s1,8(sp)
    80200f82:	07a5                	addi	a5,a5,9
    80200f84:	04f51163          	bne	a0,a5,80200fc6 <interrupt_dispatch+0x5a>
    80200f88:	0c201437          	lui	s0,0xc201
    80200f8c:	4044                	lw	s1,4(s0)
    80200f8e:	00008797          	auipc	a5,0x8
    80200f92:	9da7b783          	ld	a5,-1574(a5) # 80208968 <interrupt_vector+0x8>
    80200f96:	0411                	addi	s0,s0,4 # c201004 <_entry-0x73ffeffc>
    80200f98:	2481                	sext.w	s1,s1
    80200f9a:	c385                	beqz	a5,80200fba <interrupt_dispatch+0x4e>
    80200f9c:	9782                	jalr	a5
    80200f9e:	60e2                	ld	ra,24(sp)
    80200fa0:	c004                	sw	s1,0(s0)
    80200fa2:	6442                	ld	s0,16(sp)
    80200fa4:	64a2                	ld	s1,8(sp)
    80200fa6:	6105                	addi	sp,sp,32
    80200fa8:	8082                	ret
    80200faa:	00008797          	auipc	a5,0x8
    80200fae:	dae7b783          	ld	a5,-594(a5) # 80208d58 <interrupt_vector+0x3f8>
    80200fb2:	c385                	beqz	a5,80200fd2 <interrupt_dispatch+0x66>
    80200fb4:	60e2                	ld	ra,24(sp)
    80200fb6:	6105                	addi	sp,sp,32
    80200fb8:	8782                	jr	a5
    80200fba:	00006517          	auipc	a0,0x6
    80200fbe:	21e50513          	addi	a0,a0,542 # 802071d8 <etext+0x1d8>
    80200fc2:	a8eff0ef          	jal	80200250 <panic>
    80200fc6:	00006517          	auipc	a0,0x6
    80200fca:	23a50513          	addi	a0,a0,570 # 80207200 <etext+0x200>
    80200fce:	a82ff0ef          	jal	80200250 <panic>
    80200fd2:	00006517          	auipc	a0,0x6
    80200fd6:	1e650513          	addi	a0,a0,486 # 802071b8 <etext+0x1b8>
    80200fda:	e822                	sd	s0,16(sp)
    80200fdc:	e426                	sd	s1,8(sp)
    80200fde:	a72ff0ef          	jal	80200250 <panic>

0000000080200fe2 <dump_tframe>:
    80200fe2:	1141                	addi	sp,sp,-16
    80200fe4:	e022                	sd	s0,0(sp)
    80200fe6:	842a                	mv	s0,a0
    80200fe8:	00006517          	auipc	a0,0x6
    80200fec:	23050513          	addi	a0,a0,560 # 80207218 <etext+0x218>
    80200ff0:	e406                	sd	ra,8(sp)
    80200ff2:	968ff0ef          	jal	8020015a <printf>
    80200ff6:	600c                	ld	a1,0(s0)
    80200ff8:	00006517          	auipc	a0,0x6
    80200ffc:	23850513          	addi	a0,a0,568 # 80207230 <etext+0x230>
    80201000:	95aff0ef          	jal	8020015a <printf>
    80201004:	640c                	ld	a1,8(s0)
    80201006:	00006517          	auipc	a0,0x6
    8020100a:	23a50513          	addi	a0,a0,570 # 80207240 <etext+0x240>
    8020100e:	94cff0ef          	jal	8020015a <printf>
    80201012:	680c                	ld	a1,16(s0)
    80201014:	00006517          	auipc	a0,0x6
    80201018:	23c50513          	addi	a0,a0,572 # 80207250 <etext+0x250>
    8020101c:	93eff0ef          	jal	8020015a <printf>
    80201020:	6c0c                	ld	a1,24(s0)
    80201022:	6402                	ld	s0,0(sp)
    80201024:	60a2                	ld	ra,8(sp)
    80201026:	00006517          	auipc	a0,0x6
    8020102a:	23a50513          	addi	a0,a0,570 # 80207260 <etext+0x260>
    8020102e:	0141                	addi	sp,sp,16
    80201030:	92aff06f          	j	8020015a <printf>

0000000080201034 <handle_illegal_instruction>:
    80201034:	1141                	addi	sp,sp,-16
    80201036:	e022                	sd	s0,0(sp)
    80201038:	842a                	mv	s0,a0
    8020103a:	00006517          	auipc	a0,0x6
    8020103e:	23650513          	addi	a0,a0,566 # 80207270 <etext+0x270>
    80201042:	e406                	sd	ra,8(sp)
    80201044:	916ff0ef          	jal	8020015a <printf>
    80201048:	601c                	ld	a5,0(s0)
    8020104a:	60a2                	ld	ra,8(sp)
    8020104c:	0791                	addi	a5,a5,4
    8020104e:	e01c                	sd	a5,0(s0)
    80201050:	6402                	ld	s0,0(sp)
    80201052:	0141                	addi	sp,sp,16
    80201054:	8082                	ret

0000000080201056 <handle_syscall>:
    80201056:	1141                	addi	sp,sp,-16
    80201058:	e022                	sd	s0,0(sp)
    8020105a:	842a                	mv	s0,a0
    8020105c:	00006517          	auipc	a0,0x6
    80201060:	23450513          	addi	a0,a0,564 # 80207290 <etext+0x290>
    80201064:	e406                	sd	ra,8(sp)
    80201066:	8f4ff0ef          	jal	8020015a <printf>
    8020106a:	601c                	ld	a5,0(s0)
    8020106c:	60a2                	ld	ra,8(sp)
    8020106e:	0791                	addi	a5,a5,4
    80201070:	e01c                	sd	a5,0(s0)
    80201072:	6402                	ld	s0,0(sp)
    80201074:	0141                	addi	sp,sp,16
    80201076:	8082                	ret

0000000080201078 <handle_instruction_page_fault>:
    80201078:	1141                	addi	sp,sp,-16
    8020107a:	e022                	sd	s0,0(sp)
    8020107c:	842a                	mv	s0,a0
    8020107e:	00006517          	auipc	a0,0x6
    80201082:	22a50513          	addi	a0,a0,554 # 802072a8 <etext+0x2a8>
    80201086:	e406                	sd	ra,8(sp)
    80201088:	8d2ff0ef          	jal	8020015a <printf>
    8020108c:	00006517          	auipc	a0,0x6
    80201090:	18c50513          	addi	a0,a0,396 # 80207218 <etext+0x218>
    80201094:	8c6ff0ef          	jal	8020015a <printf>
    80201098:	600c                	ld	a1,0(s0)
    8020109a:	00006517          	auipc	a0,0x6
    8020109e:	19650513          	addi	a0,a0,406 # 80207230 <etext+0x230>
    802010a2:	8b8ff0ef          	jal	8020015a <printf>
    802010a6:	640c                	ld	a1,8(s0)
    802010a8:	00006517          	auipc	a0,0x6
    802010ac:	19850513          	addi	a0,a0,408 # 80207240 <etext+0x240>
    802010b0:	8aaff0ef          	jal	8020015a <printf>
    802010b4:	680c                	ld	a1,16(s0)
    802010b6:	00006517          	auipc	a0,0x6
    802010ba:	19a50513          	addi	a0,a0,410 # 80207250 <etext+0x250>
    802010be:	89cff0ef          	jal	8020015a <printf>
    802010c2:	6c0c                	ld	a1,24(s0)
    802010c4:	00006517          	auipc	a0,0x6
    802010c8:	19c50513          	addi	a0,a0,412 # 80207260 <etext+0x260>
    802010cc:	88eff0ef          	jal	8020015a <printf>
    802010d0:	00007697          	auipc	a3,0x7
    802010d4:	7c868693          	addi	a3,a3,1992 # 80208898 <cnt>
    802010d8:	6018                	ld	a4,0(s0)
    802010da:	429c                	lw	a5,0(a3)
    802010dc:	4611                	li	a2,4
    802010de:	0711                	addi	a4,a4,4
    802010e0:	2785                	addiw	a5,a5,1
    802010e2:	e018                	sd	a4,0(s0)
    802010e4:	c29c                	sw	a5,0(a3)
    802010e6:	0007871b          	sext.w	a4,a5
    802010ea:	00e64663          	blt	a2,a4,802010f6 <handle_instruction_page_fault+0x7e>
    802010ee:	60a2                	ld	ra,8(sp)
    802010f0:	6402                	ld	s0,0(sp)
    802010f2:	0141                	addi	sp,sp,16
    802010f4:	8082                	ret
    802010f6:	00006517          	auipc	a0,0x6
    802010fa:	1da50513          	addi	a0,a0,474 # 802072d0 <etext+0x2d0>
    802010fe:	952ff0ef          	jal	80200250 <panic>

0000000080201102 <handle_load_page_fault>:
    80201102:	1141                	addi	sp,sp,-16
    80201104:	e022                	sd	s0,0(sp)
    80201106:	842a                	mv	s0,a0
    80201108:	00006517          	auipc	a0,0x6
    8020110c:	1f050513          	addi	a0,a0,496 # 802072f8 <etext+0x2f8>
    80201110:	e406                	sd	ra,8(sp)
    80201112:	848ff0ef          	jal	8020015a <printf>
    80201116:	601c                	ld	a5,0(s0)
    80201118:	60a2                	ld	ra,8(sp)
    8020111a:	0791                	addi	a5,a5,4
    8020111c:	e01c                	sd	a5,0(s0)
    8020111e:	6402                	ld	s0,0(sp)
    80201120:	0141                	addi	sp,sp,16
    80201122:	8082                	ret

0000000080201124 <handle_store_page_fault>:
    80201124:	1141                	addi	sp,sp,-16
    80201126:	e022                	sd	s0,0(sp)
    80201128:	842a                	mv	s0,a0
    8020112a:	00006517          	auipc	a0,0x6
    8020112e:	1ee50513          	addi	a0,a0,494 # 80207318 <etext+0x318>
    80201132:	e406                	sd	ra,8(sp)
    80201134:	826ff0ef          	jal	8020015a <printf>
    80201138:	601c                	ld	a5,0(s0)
    8020113a:	60a2                	ld	ra,8(sp)
    8020113c:	0791                	addi	a5,a5,4
    8020113e:	e01c                	sd	a5,0(s0)
    80201140:	6402                	ld	s0,0(sp)
    80201142:	0141                	addi	sp,sp,16
    80201144:	8082                	ret

0000000080201146 <handle_exception>:
    80201146:	1101                	addi	sp,sp,-32
    80201148:	e426                	sd	s1,8(sp)
    8020114a:	ec06                	sd	ra,24(sp)
    8020114c:	e822                	sd	s0,16(sp)
    8020114e:	84aa                	mv	s1,a0
    80201150:	14202473          	csrr	s0,scause
    80201154:	0406                	slli	s0,s0,0x1
    80201156:	8005                	srli	s0,s0,0x1
    80201158:	85a2                	mv	a1,s0
    8020115a:	00006517          	auipc	a0,0x6
    8020115e:	1de50513          	addi	a0,a0,478 # 80207338 <etext+0x338>
    80201162:	ff9fe0ef          	jal	8020015a <printf>
    80201166:	47bd                	li	a5,15
    80201168:	0887e963          	bltu	a5,s0,802011fa <handle_exception+0xb4>
    8020116c:	00007717          	auipc	a4,0x7
    80201170:	6c870713          	addi	a4,a4,1736 # 80208834 <etext+0x1834>
    80201174:	040a                	slli	s0,s0,0x2
    80201176:	943a                	add	s0,s0,a4
    80201178:	401c                	lw	a5,0(s0)
    8020117a:	97ba                	add	a5,a5,a4
    8020117c:	8782                	jr	a5
    8020117e:	00006517          	auipc	a0,0x6
    80201182:	0f250513          	addi	a0,a0,242 # 80207270 <etext+0x270>
    80201186:	fd5fe0ef          	jal	8020015a <printf>
    8020118a:	609c                	ld	a5,0(s1)
    8020118c:	60e2                	ld	ra,24(sp)
    8020118e:	6442                	ld	s0,16(sp)
    80201190:	0791                	addi	a5,a5,4
    80201192:	e09c                	sd	a5,0(s1)
    80201194:	64a2                	ld	s1,8(sp)
    80201196:	6105                	addi	sp,sp,32
    80201198:	8082                	ret
    8020119a:	00006517          	auipc	a0,0x6
    8020119e:	0f650513          	addi	a0,a0,246 # 80207290 <etext+0x290>
    802011a2:	fb9fe0ef          	jal	8020015a <printf>
    802011a6:	609c                	ld	a5,0(s1)
    802011a8:	60e2                	ld	ra,24(sp)
    802011aa:	6442                	ld	s0,16(sp)
    802011ac:	0791                	addi	a5,a5,4
    802011ae:	e09c                	sd	a5,0(s1)
    802011b0:	64a2                	ld	s1,8(sp)
    802011b2:	6105                	addi	sp,sp,32
    802011b4:	8082                	ret
    802011b6:	6442                	ld	s0,16(sp)
    802011b8:	60e2                	ld	ra,24(sp)
    802011ba:	8526                	mv	a0,s1
    802011bc:	64a2                	ld	s1,8(sp)
    802011be:	6105                	addi	sp,sp,32
    802011c0:	bd65                	j	80201078 <handle_instruction_page_fault>
    802011c2:	00006517          	auipc	a0,0x6
    802011c6:	13650513          	addi	a0,a0,310 # 802072f8 <etext+0x2f8>
    802011ca:	f91fe0ef          	jal	8020015a <printf>
    802011ce:	609c                	ld	a5,0(s1)
    802011d0:	60e2                	ld	ra,24(sp)
    802011d2:	6442                	ld	s0,16(sp)
    802011d4:	0791                	addi	a5,a5,4
    802011d6:	e09c                	sd	a5,0(s1)
    802011d8:	64a2                	ld	s1,8(sp)
    802011da:	6105                	addi	sp,sp,32
    802011dc:	8082                	ret
    802011de:	00006517          	auipc	a0,0x6
    802011e2:	13a50513          	addi	a0,a0,314 # 80207318 <etext+0x318>
    802011e6:	f75fe0ef          	jal	8020015a <printf>
    802011ea:	609c                	ld	a5,0(s1)
    802011ec:	60e2                	ld	ra,24(sp)
    802011ee:	6442                	ld	s0,16(sp)
    802011f0:	0791                	addi	a5,a5,4
    802011f2:	e09c                	sd	a5,0(s1)
    802011f4:	64a2                	ld	s1,8(sp)
    802011f6:	6105                	addi	sp,sp,32
    802011f8:	8082                	ret
    802011fa:	00006517          	auipc	a0,0x6
    802011fe:	14e50513          	addi	a0,a0,334 # 80207348 <etext+0x348>
    80201202:	84eff0ef          	jal	80200250 <panic>

0000000080201206 <kerneltrap>:
    80201206:	7139                	addi	sp,sp,-64
    80201208:	fc06                	sd	ra,56(sp)
    8020120a:	f822                	sd	s0,48(sp)
    8020120c:	f426                	sd	s1,40(sp)
    8020120e:	141024f3          	csrr	s1,sepc
    80201212:	10002473          	csrr	s0,sstatus
    80201216:	14202773          	csrr	a4,scause
    8020121a:	10047793          	andi	a5,s0,256
    8020121e:	cfa9                	beqz	a5,80201278 <kerneltrap+0x72>
    80201220:	100027f3          	csrr	a5,sstatus
    80201224:	8b89                	andi	a5,a5,2
    80201226:	e3b9                	bnez	a5,8020126c <kerneltrap+0x66>
    80201228:	02074663          	bltz	a4,80201254 <kerneltrap+0x4e>
    8020122c:	e026                	sd	s1,0(sp)
    8020122e:	e422                	sd	s0,8(sp)
    80201230:	143027f3          	csrr	a5,stval
    80201234:	850a                	mv	a0,sp
    80201236:	e83e                	sd	a5,16(sp)
    80201238:	ec3a                	sd	a4,24(sp)
    8020123a:	f0dff0ef          	jal	80201146 <handle_exception>
    8020123e:	6782                	ld	a5,0(sp)
    80201240:	14179073          	csrw	sepc,a5
    80201244:	67a2                	ld	a5,8(sp)
    80201246:	10079073          	csrw	sstatus,a5
    8020124a:	70e2                	ld	ra,56(sp)
    8020124c:	7442                	ld	s0,48(sp)
    8020124e:	74a2                	ld	s1,40(sp)
    80201250:	6121                	addi	sp,sp,64
    80201252:	8082                	ret
    80201254:	853a                	mv	a0,a4
    80201256:	d17ff0ef          	jal	80200f6c <interrupt_dispatch>
    8020125a:	14149073          	csrw	sepc,s1
    8020125e:	10041073          	csrw	sstatus,s0
    80201262:	70e2                	ld	ra,56(sp)
    80201264:	7442                	ld	s0,48(sp)
    80201266:	74a2                	ld	s1,40(sp)
    80201268:	6121                	addi	sp,sp,64
    8020126a:	8082                	ret
    8020126c:	00006517          	auipc	a0,0x6
    80201270:	11c50513          	addi	a0,a0,284 # 80207388 <etext+0x388>
    80201274:	fddfe0ef          	jal	80200250 <panic>
    80201278:	00006517          	auipc	a0,0x6
    8020127c:	0e850513          	addi	a0,a0,232 # 80207360 <etext+0x360>
    80201280:	fd1fe0ef          	jal	80200250 <panic>
	...

0000000080201290 <kernelvec>:
    80201290:	7111                	addi	sp,sp,-256
    80201292:	e006                	sd	ra,0(sp)
    80201294:	e80e                	sd	gp,16(sp)
    80201296:	ec12                	sd	tp,24(sp)
    80201298:	f016                	sd	t0,32(sp)
    8020129a:	f41a                	sd	t1,40(sp)
    8020129c:	f81e                	sd	t2,48(sp)
    8020129e:	e4aa                	sd	a0,72(sp)
    802012a0:	e8ae                	sd	a1,80(sp)
    802012a2:	ecb2                	sd	a2,88(sp)
    802012a4:	f0b6                	sd	a3,96(sp)
    802012a6:	f4ba                	sd	a4,104(sp)
    802012a8:	f8be                	sd	a5,112(sp)
    802012aa:	fcc2                	sd	a6,120(sp)
    802012ac:	e146                	sd	a7,128(sp)
    802012ae:	edf2                	sd	t3,216(sp)
    802012b0:	f1f6                	sd	t4,224(sp)
    802012b2:	f5fa                	sd	t5,232(sp)
    802012b4:	f9fe                	sd	t6,240(sp)
    802012b6:	f51ff0ef          	jal	80201206 <kerneltrap>
    802012ba:	6082                	ld	ra,0(sp)
    802012bc:	61c2                	ld	gp,16(sp)
    802012be:	6262                	ld	tp,24(sp)
    802012c0:	7282                	ld	t0,32(sp)
    802012c2:	7322                	ld	t1,40(sp)
    802012c4:	73c2                	ld	t2,48(sp)
    802012c6:	6526                	ld	a0,72(sp)
    802012c8:	65c6                	ld	a1,80(sp)
    802012ca:	6666                	ld	a2,88(sp)
    802012cc:	7686                	ld	a3,96(sp)
    802012ce:	7726                	ld	a4,104(sp)
    802012d0:	77c6                	ld	a5,112(sp)
    802012d2:	7866                	ld	a6,120(sp)
    802012d4:	688a                	ld	a7,128(sp)
    802012d6:	6e6e                	ld	t3,216(sp)
    802012d8:	7e8e                	ld	t4,224(sp)
    802012da:	7f2e                	ld	t5,232(sp)
    802012dc:	7fce                	ld	t6,240(sp)
    802012de:	6111                	addi	sp,sp,256
    802012e0:	10200073          	sret
	...

00000000802012ee <sbi_set_timer>:
    802012ee:	4881                	li	a7,0
    802012f0:	00000073          	ecall
    802012f4:	8082                	ret

00000000802012f6 <get_time>:
    802012f6:	c0102573          	rdtime	a0
    802012fa:	8082                	ret

00000000802012fc <forkret>:
    802012fc:	1141                	addi	sp,sp,-16
    802012fe:	e022                	sd	s0,0(sp)
    80201300:	00007417          	auipc	s0,0x7
    80201304:	5a843403          	ld	s0,1448(s0) # 802088a8 <current_proc>
    80201308:	8522                	mv	a0,s0
    8020130a:	e406                	sd	ra,8(sp)
    8020130c:	f9ffe0ef          	jal	802002aa <release>
    80201310:	a6fff0ef          	jal	80200d7e <prepare_return>
    80201314:	04000737          	lui	a4,0x4000
    80201318:	13843503          	ld	a0,312(s0)
    8020131c:	177d                	addi	a4,a4,-1 # 3ffffff <_entry-0x7c200001>
    8020131e:	00005797          	auipc	a5,0x5
    80201322:	d7e78793          	addi	a5,a5,-642 # 8020609c <userret>
    80201326:	00005697          	auipc	a3,0x5
    8020132a:	cda68693          	addi	a3,a3,-806 # 80206000 <_trampoline>
    8020132e:	6402                	ld	s0,0(sp)
    80201330:	0732                	slli	a4,a4,0xc
    80201332:	8f95                	sub	a5,a5,a3
    80201334:	60a2                	ld	ra,8(sp)
    80201336:	97ba                	add	a5,a5,a4
    80201338:	577d                	li	a4,-1
    8020133a:	8131                	srli	a0,a0,0xc
    8020133c:	177e                	slli	a4,a4,0x3f
    8020133e:	8d59                	or	a0,a0,a4
    80201340:	0141                	addi	sp,sp,16
    80201342:	8782                	jr	a5

0000000080201344 <alloc_pid>:
    80201344:	1101                	addi	sp,sp,-32
    80201346:	e426                	sd	s1,8(sp)
    80201348:	00008497          	auipc	s1,0x8
    8020134c:	a1848493          	addi	s1,s1,-1512 # 80208d60 <pid_lock>
    80201350:	8526                	mv	a0,s1
    80201352:	ec06                	sd	ra,24(sp)
    80201354:	e822                	sd	s0,16(sp)
    80201356:	f43fe0ef          	jal	80200298 <acquire>
    8020135a:	00007797          	auipc	a5,0x7
    8020135e:	52678793          	addi	a5,a5,1318 # 80208880 <next_pid>
    80201362:	4380                	lw	s0,0(a5)
    80201364:	8526                	mv	a0,s1
    80201366:	0014071b          	addiw	a4,s0,1
    8020136a:	c398                	sw	a4,0(a5)
    8020136c:	f3ffe0ef          	jal	802002aa <release>
    80201370:	60e2                	ld	ra,24(sp)
    80201372:	8522                	mv	a0,s0
    80201374:	6442                	ld	s0,16(sp)
    80201376:	64a2                	ld	s1,8(sp)
    80201378:	6105                	addi	sp,sp,32
    8020137a:	8082                	ret

000000008020137c <proc_mapstacks>:
    8020137c:	7139                	addi	sp,sp,-64
    8020137e:	f822                	sd	s0,48(sp)
    80201380:	fcf3d437          	lui	s0,0xfcf3d
    80201384:	f3d40413          	addi	s0,s0,-195 # fffffffffcf3cf3d <end+0xffffffff7cd1fbfd>
    80201388:	0432                	slli	s0,s0,0xc
    8020138a:	f3d40413          	addi	s0,s0,-195
    8020138e:	0432                	slli	s0,s0,0xc
    80201390:	f426                	sd	s1,40(sp)
    80201392:	f3d40413          	addi	s0,s0,-195
    80201396:	040004b7          	lui	s1,0x4000
    8020139a:	ec4e                	sd	s3,24(sp)
    8020139c:	0432                	slli	s0,s0,0xc
    8020139e:	00013997          	auipc	s3,0x13
    802013a2:	ba298993          	addi	s3,s3,-1118 # 80213f40 <proc_table>
    802013a6:	14fd                	addi	s1,s1,-1 # 3ffffff <_entry-0x7c200001>
    802013a8:	f04a                	sd	s2,32(sp)
    802013aa:	e852                	sd	s4,16(sp)
    802013ac:	e456                	sd	s5,8(sp)
    802013ae:	fc06                	sd	ra,56(sp)
    802013b0:	892a                	mv	s2,a0
    802013b2:	8ace                	mv	s5,s3
    802013b4:	f3d40413          	addi	s0,s0,-195
    802013b8:	04b2                	slli	s1,s1,0xc
    802013ba:	00018a17          	auipc	s4,0x18
    802013be:	f86a0a13          	addi	s4,s4,-122 # 80219340 <stack_top>
    802013c2:	ef7fe0ef          	jal	802002b8 <alloc_page>
    802013c6:	862a                	mv	a2,a0
    802013c8:	cd0d                	beqz	a0,80201402 <proc_mapstacks+0x86>
    802013ca:	413a85b3          	sub	a1,s5,s3
    802013ce:	8591                	srai	a1,a1,0x4
    802013d0:	028585b3          	mul	a1,a1,s0
    802013d4:	4719                	li	a4,6
    802013d6:	6685                	lui	a3,0x1
    802013d8:	854a                	mv	a0,s2
    802013da:	150a8a93          	addi	s5,s5,336 # fffffffffffff150 <end+0xffffffff7fde1e10>
    802013de:	2585                	addiw	a1,a1,1
    802013e0:	00d5959b          	slliw	a1,a1,0xd
    802013e4:	40b485b3          	sub	a1,s1,a1
    802013e8:	fd0ff0ef          	jal	80200bb8 <map_region>
    802013ec:	fd4a9be3          	bne	s5,s4,802013c2 <proc_mapstacks+0x46>
    802013f0:	70e2                	ld	ra,56(sp)
    802013f2:	7442                	ld	s0,48(sp)
    802013f4:	74a2                	ld	s1,40(sp)
    802013f6:	7902                	ld	s2,32(sp)
    802013f8:	69e2                	ld	s3,24(sp)
    802013fa:	6a42                	ld	s4,16(sp)
    802013fc:	6aa2                	ld	s5,8(sp)
    802013fe:	6121                	addi	sp,sp,64
    80201400:	8082                	ret
    80201402:	00006517          	auipc	a0,0x6
    80201406:	fa650513          	addi	a0,a0,-90 # 802073a8 <etext+0x3a8>
    8020140a:	e47fe0ef          	jal	80200250 <panic>

000000008020140e <proc_init>:
    8020140e:	7139                	addi	sp,sp,-64
    80201410:	f426                	sd	s1,40(sp)
    80201412:	fcf3d4b7          	lui	s1,0xfcf3d
    80201416:	f3d48493          	addi	s1,s1,-195 # fffffffffcf3cf3d <end+0xffffffff7cd1fbfd>
    8020141a:	04b2                	slli	s1,s1,0xc
    8020141c:	f3d48493          	addi	s1,s1,-195
    80201420:	00006597          	auipc	a1,0x6
    80201424:	f9058593          	addi	a1,a1,-112 # 802073b0 <etext+0x3b0>
    80201428:	00008517          	auipc	a0,0x8
    8020142c:	93850513          	addi	a0,a0,-1736 # 80208d60 <pid_lock>
    80201430:	04b2                	slli	s1,s1,0xc
    80201432:	fc06                	sd	ra,56(sp)
    80201434:	f822                	sd	s0,48(sp)
    80201436:	f04a                	sd	s2,32(sp)
    80201438:	ec4e                	sd	s3,24(sp)
    8020143a:	e852                	sd	s4,16(sp)
    8020143c:	e456                	sd	s5,8(sp)
    8020143e:	f3d48493          	addi	s1,s1,-195
    80201442:	e4ffe0ef          	jal	80200290 <initlock>
    80201446:	04000937          	lui	s2,0x4000
    8020144a:	00006597          	auipc	a1,0x6
    8020144e:	f7658593          	addi	a1,a1,-138 # 802073c0 <etext+0x3c0>
    80201452:	00008517          	auipc	a0,0x8
    80201456:	91e50513          	addi	a0,a0,-1762 # 80208d70 <wait_lock>
    8020145a:	00013997          	auipc	s3,0x13
    8020145e:	ae698993          	addi	s3,s3,-1306 # 80213f40 <proc_table>
    80201462:	04b2                	slli	s1,s1,0xc
    80201464:	197d                	addi	s2,s2,-1 # 3ffffff <_entry-0x7c200001>
    80201466:	e2bfe0ef          	jal	80200290 <initlock>
    8020146a:	844e                	mv	s0,s3
    8020146c:	00018a97          	auipc	s5,0x18
    80201470:	ed4a8a93          	addi	s5,s5,-300 # 80219340 <stack_top>
    80201474:	00006a17          	auipc	s4,0x6
    80201478:	f5ca0a13          	addi	s4,s4,-164 # 802073d0 <etext+0x3d0>
    8020147c:	f3d48493          	addi	s1,s1,-195
    80201480:	0932                	slli	s2,s2,0xc
    80201482:	8522                	mv	a0,s0
    80201484:	85d2                	mv	a1,s4
    80201486:	e0bfe0ef          	jal	80200290 <initlock>
    8020148a:	413407b3          	sub	a5,s0,s3
    8020148e:	8791                	srai	a5,a5,0x4
    80201490:	029787b3          	mul	a5,a5,s1
    80201494:	00042a23          	sw	zero,20(s0)
    80201498:	08042a23          	sw	zero,148(s0)
    8020149c:	15040413          	addi	s0,s0,336
    802014a0:	2785                	addiw	a5,a5,1
    802014a2:	00d7979b          	slliw	a5,a5,0xd
    802014a6:	40f907b3          	sub	a5,s2,a5
    802014aa:	ecf43423          	sd	a5,-312(s0)
    802014ae:	fd541ae3          	bne	s0,s5,80201482 <proc_init+0x74>
    802014b2:	70e2                	ld	ra,56(sp)
    802014b4:	7442                	ld	s0,48(sp)
    802014b6:	74a2                	ld	s1,40(sp)
    802014b8:	7902                	ld	s2,32(sp)
    802014ba:	69e2                	ld	s3,24(sp)
    802014bc:	6a42                	ld	s4,16(sp)
    802014be:	6aa2                	ld	s5,8(sp)
    802014c0:	6121                	addi	sp,sp,64
    802014c2:	8082                	ret

00000000802014c4 <proc_pagetable>:
    802014c4:	1101                	addi	sp,sp,-32
    802014c6:	e426                	sd	s1,8(sp)
    802014c8:	ec06                	sd	ra,24(sp)
    802014ca:	e822                	sd	s0,16(sp)
    802014cc:	84aa                	mv	s1,a0
    802014ce:	99eff0ef          	jal	8020066c <create_pagetable>
    802014d2:	c531                	beqz	a0,8020151e <proc_pagetable+0x5a>
    802014d4:	040005b7          	lui	a1,0x4000
    802014d8:	15fd                	addi	a1,a1,-1 # 3ffffff <_entry-0x7c200001>
    802014da:	4729                	li	a4,10
    802014dc:	6685                	lui	a3,0x1
    802014de:	00005617          	auipc	a2,0x5
    802014e2:	b2260613          	addi	a2,a2,-1246 # 80206000 <_trampoline>
    802014e6:	05b2                	slli	a1,a1,0xc
    802014e8:	842a                	mv	s0,a0
    802014ea:	c56ff0ef          	jal	80200940 <map_page>
    802014ee:	02054563          	bltz	a0,80201518 <proc_pagetable+0x54>
    802014f2:	020005b7          	lui	a1,0x2000
    802014f6:	1404b603          	ld	a2,320(s1)
    802014fa:	15fd                	addi	a1,a1,-1 # 1ffffff <_entry-0x7e200001>
    802014fc:	4719                	li	a4,6
    802014fe:	6685                	lui	a3,0x1
    80201500:	05b6                	slli	a1,a1,0xd
    80201502:	8522                	mv	a0,s0
    80201504:	c3cff0ef          	jal	80200940 <map_page>
    80201508:	02054263          	bltz	a0,8020152c <proc_pagetable+0x68>
    8020150c:	60e2                	ld	ra,24(sp)
    8020150e:	8522                	mv	a0,s0
    80201510:	6442                	ld	s0,16(sp)
    80201512:	64a2                	ld	s1,8(sp)
    80201514:	6105                	addi	sp,sp,32
    80201516:	8082                	ret
    80201518:	8522                	mv	a0,s0
    8020151a:	972ff0ef          	jal	8020068c <destroy_pagetable>
    8020151e:	4401                	li	s0,0
    80201520:	60e2                	ld	ra,24(sp)
    80201522:	8522                	mv	a0,s0
    80201524:	6442                	ld	s0,16(sp)
    80201526:	64a2                	ld	s1,8(sp)
    80201528:	6105                	addi	sp,sp,32
    8020152a:	8082                	ret
    8020152c:	040005b7          	lui	a1,0x4000
    80201530:	15fd                	addi	a1,a1,-1 # 3ffffff <_entry-0x7c200001>
    80201532:	8522                	mv	a0,s0
    80201534:	4681                	li	a3,0
    80201536:	4605                	li	a2,1
    80201538:	05b2                	slli	a1,a1,0xc
    8020153a:	e9aff0ef          	jal	80200bd4 <unmap_page>
    8020153e:	8522                	mv	a0,s0
    80201540:	94cff0ef          	jal	8020068c <destroy_pagetable>
    80201544:	4401                	li	s0,0
    80201546:	bfe9                	j	80201520 <proc_pagetable+0x5c>

0000000080201548 <proc_freepagetable>:
    80201548:	040005b7          	lui	a1,0x4000
    8020154c:	15fd                	addi	a1,a1,-1 # 3ffffff <_entry-0x7c200001>
    8020154e:	1141                	addi	sp,sp,-16
    80201550:	4681                	li	a3,0
    80201552:	4605                	li	a2,1
    80201554:	05b2                	slli	a1,a1,0xc
    80201556:	e406                	sd	ra,8(sp)
    80201558:	e022                	sd	s0,0(sp)
    8020155a:	842a                	mv	s0,a0
    8020155c:	e78ff0ef          	jal	80200bd4 <unmap_page>
    80201560:	020005b7          	lui	a1,0x2000
    80201564:	15fd                	addi	a1,a1,-1 # 1ffffff <_entry-0x7e200001>
    80201566:	8522                	mv	a0,s0
    80201568:	4681                	li	a3,0
    8020156a:	4605                	li	a2,1
    8020156c:	05b6                	slli	a1,a1,0xd
    8020156e:	e66ff0ef          	jal	80200bd4 <unmap_page>
    80201572:	8522                	mv	a0,s0
    80201574:	6402                	ld	s0,0(sp)
    80201576:	60a2                	ld	ra,8(sp)
    80201578:	0141                	addi	sp,sp,16
    8020157a:	912ff06f          	j	8020068c <destroy_pagetable>

000000008020157e <free_process>:
    8020157e:	1101                	addi	sp,sp,-32
    80201580:	e822                	sd	s0,16(sp)
    80201582:	842a                	mv	s0,a0
    80201584:	14053503          	ld	a0,320(a0)
    80201588:	ec06                	sd	ra,24(sp)
    8020158a:	e426                	sd	s1,8(sp)
    8020158c:	c119                	beqz	a0,80201592 <free_process+0x14>
    8020158e:	e0ffe0ef          	jal	8020039c <free_page>
    80201592:	13843483          	ld	s1,312(s0)
    80201596:	14043023          	sd	zero,320(s0)
    8020159a:	c495                	beqz	s1,802015c6 <free_process+0x48>
    8020159c:	040005b7          	lui	a1,0x4000
    802015a0:	15fd                	addi	a1,a1,-1 # 3ffffff <_entry-0x7c200001>
    802015a2:	4681                	li	a3,0
    802015a4:	4605                	li	a2,1
    802015a6:	05b2                	slli	a1,a1,0xc
    802015a8:	8526                	mv	a0,s1
    802015aa:	e2aff0ef          	jal	80200bd4 <unmap_page>
    802015ae:	020005b7          	lui	a1,0x2000
    802015b2:	15fd                	addi	a1,a1,-1 # 1ffffff <_entry-0x7e200001>
    802015b4:	8526                	mv	a0,s1
    802015b6:	4681                	li	a3,0
    802015b8:	4605                	li	a2,1
    802015ba:	05b6                	slli	a1,a1,0xd
    802015bc:	e18ff0ef          	jal	80200bd4 <unmap_page>
    802015c0:	8526                	mv	a0,s1
    802015c2:	8caff0ef          	jal	8020068c <destroy_pagetable>
    802015c6:	00043823          	sd	zero,16(s0)
    802015ca:	60e2                	ld	ra,24(sp)
    802015cc:	12043c23          	sd	zero,312(s0)
    802015d0:	12043823          	sd	zero,304(s0)
    802015d4:	12043423          	sd	zero,296(s0)
    802015d8:	08043c23          	sd	zero,152(s0)
    802015dc:	08043823          	sd	zero,144(s0)
    802015e0:	6442                	ld	s0,16(sp)
    802015e2:	64a2                	ld	s1,8(sp)
    802015e4:	6105                	addi	sp,sp,32
    802015e6:	8082                	ret

00000000802015e8 <alloc_process>:
    802015e8:	7139                	addi	sp,sp,-64
    802015ea:	e456                	sd	s5,8(sp)
    802015ec:	00013a97          	auipc	s5,0x13
    802015f0:	954a8a93          	addi	s5,s5,-1708 # 80213f40 <proc_table>
    802015f4:	f822                	sd	s0,48(sp)
    802015f6:	f426                	sd	s1,40(sp)
    802015f8:	f04a                	sd	s2,32(sp)
    802015fa:	e852                	sd	s4,16(sp)
    802015fc:	fc06                	sd	ra,56(sp)
    802015fe:	ec4e                	sd	s3,24(sp)
    80201600:	8456                	mv	s0,s5
    80201602:	4901                	li	s2,0
    80201604:	4481                	li	s1,0
    80201606:	04000a13          	li	s4,64
    8020160a:	a811                	j	8020161e <alloc_process+0x36>
    8020160c:	2485                	addiw	s1,s1,1
    8020160e:	c9dfe0ef          	jal	802002aa <release>
    80201612:	15090913          	addi	s2,s2,336
    80201616:	15040413          	addi	s0,s0,336
    8020161a:	0b448d63          	beq	s1,s4,802016d4 <alloc_process+0xec>
    8020161e:	8522                	mv	a0,s0
    80201620:	c79fe0ef          	jal	80200298 <acquire>
    80201624:	485c                	lw	a5,20(s0)
    80201626:	89a2                	mv	s3,s0
    80201628:	8522                	mv	a0,s0
    8020162a:	f3ed                	bnez	a5,8020160c <alloc_process+0x24>
    8020162c:	15000793          	li	a5,336
    80201630:	02f484b3          	mul	s1,s1,a5
    80201634:	00007517          	auipc	a0,0x7
    80201638:	72c50513          	addi	a0,a0,1836 # 80208d60 <pid_lock>
    8020163c:	4785                	li	a5,1
    8020163e:	94d6                	add	s1,s1,s5
    80201640:	c8dc                	sw	a5,20(s1)
    80201642:	c57fe0ef          	jal	80200298 <acquire>
    80201646:	00007797          	auipc	a5,0x7
    8020164a:	23a78793          	addi	a5,a5,570 # 80208880 <next_pid>
    8020164e:	0007aa03          	lw	s4,0(a5)
    80201652:	00007517          	auipc	a0,0x7
    80201656:	70e50513          	addi	a0,a0,1806 # 80208d60 <pid_lock>
    8020165a:	001a071b          	addiw	a4,s4,1
    8020165e:	c398                	sw	a4,0(a5)
    80201660:	c4bfe0ef          	jal	802002aa <release>
    80201664:	0144a823          	sw	s4,16(s1)
    80201668:	c51fe0ef          	jal	802002b8 <alloc_page>
    8020166c:	14a4b023          	sd	a0,320(s1)
    80201670:	cd21                	beqz	a0,802016c8 <alloc_process+0xe0>
    80201672:	8522                	mv	a0,s0
    80201674:	e51ff0ef          	jal	802014c4 <proc_pagetable>
    80201678:	12a4bc23          	sd	a0,312(s1)
    8020167c:	c531                	beqz	a0,802016c8 <alloc_process+0xe0>
    8020167e:	02090513          	addi	a0,s2,32
    80201682:	07000613          	li	a2,112
    80201686:	4581                	li	a1,0
    80201688:	9556                	add	a0,a0,s5
    8020168a:	efffe0ef          	jal	80200588 <memset>
    8020168e:	6c9c                	ld	a5,24(s1)
    80201690:	6705                	lui	a4,0x1
    80201692:	00006517          	auipc	a0,0x6
    80201696:	d4650513          	addi	a0,a0,-698 # 802073d8 <etext+0x3d8>
    8020169a:	97ba                	add	a5,a5,a4
    8020169c:	00000717          	auipc	a4,0x0
    802016a0:	c6070713          	addi	a4,a4,-928 # 802012fc <forkret>
    802016a4:	f098                	sd	a4,32(s1)
    802016a6:	f49c                	sd	a5,40(s1)
    802016a8:	419010ef          	jal	802032c0 <namei>
    802016ac:	12a4b023          	sd	a0,288(s1)
    802016b0:	1204b423          	sd	zero,296(s1)
    802016b4:	70e2                	ld	ra,56(sp)
    802016b6:	7442                	ld	s0,48(sp)
    802016b8:	74a2                	ld	s1,40(sp)
    802016ba:	7902                	ld	s2,32(sp)
    802016bc:	6a42                	ld	s4,16(sp)
    802016be:	6aa2                	ld	s5,8(sp)
    802016c0:	854e                	mv	a0,s3
    802016c2:	69e2                	ld	s3,24(sp)
    802016c4:	6121                	addi	sp,sp,64
    802016c6:	8082                	ret
    802016c8:	8522                	mv	a0,s0
    802016ca:	eb5ff0ef          	jal	8020157e <free_process>
    802016ce:	8522                	mv	a0,s0
    802016d0:	bdbfe0ef          	jal	802002aa <release>
    802016d4:	4981                	li	s3,0
    802016d6:	bff9                	j	802016b4 <alloc_process+0xcc>

00000000802016d8 <create_process>:
    802016d8:	1101                	addi	sp,sp,-32
    802016da:	e426                	sd	s1,8(sp)
    802016dc:	ec06                	sd	ra,24(sp)
    802016de:	84aa                	mv	s1,a0
    802016e0:	f09ff0ef          	jal	802015e8 <alloc_process>
    802016e4:	c105                	beqz	a0,80201704 <create_process+0x2c>
    802016e6:	e822                	sd	s0,16(sp)
    802016e8:	4789                	li	a5,2
    802016ea:	f104                	sd	s1,32(a0)
    802016ec:	c95c                	sw	a5,20(a0)
    802016ee:	14053423          	sd	zero,328(a0)
    802016f2:	842a                	mv	s0,a0
    802016f4:	bb7fe0ef          	jal	802002aa <release>
    802016f8:	4808                	lw	a0,16(s0)
    802016fa:	6442                	ld	s0,16(sp)
    802016fc:	60e2                	ld	ra,24(sp)
    802016fe:	64a2                	ld	s1,8(sp)
    80201700:	6105                	addi	sp,sp,32
    80201702:	8082                	ret
    80201704:	557d                	li	a0,-1
    80201706:	bfdd                	j	802016fc <create_process+0x24>

0000000080201708 <exit_process>:
    80201708:	7139                	addi	sp,sp,-64
    8020170a:	ec4e                	sd	s3,24(sp)
    8020170c:	e05a                	sd	s6,0(sp)
    8020170e:	fc06                	sd	ra,56(sp)
    80201710:	f822                	sd	s0,48(sp)
    80201712:	f426                	sd	s1,40(sp)
    80201714:	00007797          	auipc	a5,0x7
    80201718:	1947b783          	ld	a5,404(a5) # 802088a8 <current_proc>
    8020171c:	89aa                	mv	s3,a0
    8020171e:	8b2e                	mv	s6,a1
    80201720:	0ca78b63          	beq	a5,a0,802017f6 <exit_process+0xee>
    80201724:	0a098413          	addi	s0,s3,160
    80201728:	12098493          	addi	s1,s3,288
    8020172c:	6008                	ld	a0,0(s0)
    8020172e:	c509                	beqz	a0,80201738 <exit_process+0x30>
    80201730:	4d7000ef          	jal	80202406 <fileclose>
    80201734:	00043023          	sd	zero,0(s0)
    80201738:	0421                	addi	s0,s0,8
    8020173a:	fe9419e3          	bne	s0,s1,8020172c <exit_process+0x24>
    8020173e:	64e020ef          	jal	80203d8c <begin_op>
    80201742:	1209b503          	ld	a0,288(s3)
    80201746:	4ae010ef          	jal	80202bf4 <iput>
    8020174a:	6a0020ef          	jal	80203dea <end_op>
    8020174e:	1289b783          	ld	a5,296(s3)
    80201752:	1209b023          	sd	zero,288(s3)
    80201756:	cba5                	beqz	a5,802017c6 <exit_process+0xbe>
    80201758:	00007517          	auipc	a0,0x7
    8020175c:	61850513          	addi	a0,a0,1560 # 80208d70 <wait_lock>
    80201760:	f04a                	sd	s2,32(sp)
    80201762:	e852                	sd	s4,16(sp)
    80201764:	e456                	sd	s5,8(sp)
    80201766:	00012417          	auipc	s0,0x12
    8020176a:	7da40413          	addi	s0,s0,2010 # 80213f40 <proc_table>
    8020176e:	b2bfe0ef          	jal	80200298 <acquire>
    80201772:	00018917          	auipc	s2,0x18
    80201776:	bce90913          	addi	s2,s2,-1074 # 80219340 <stack_top>
    8020177a:	1289ba03          	ld	s4,296(s3)
    8020177e:	4491                	li	s1,4
    80201780:	4a89                	li	s5,2
    80201782:	a039                	j	80201790 <exit_process+0x88>
    80201784:	15040413          	addi	s0,s0,336
    80201788:	b23fe0ef          	jal	802002aa <release>
    8020178c:	03240463          	beq	s0,s2,802017b4 <exit_process+0xac>
    80201790:	8522                	mv	a0,s0
    80201792:	b07fe0ef          	jal	80200298 <acquire>
    80201796:	485c                	lw	a5,20(s0)
    80201798:	8522                	mv	a0,s0
    8020179a:	fe9795e3          	bne	a5,s1,80201784 <exit_process+0x7c>
    8020179e:	6c5c                	ld	a5,152(s0)
    802017a0:	fefa12e3          	bne	s4,a5,80201784 <exit_process+0x7c>
    802017a4:	01542a23          	sw	s5,20(s0)
    802017a8:	15040413          	addi	s0,s0,336
    802017ac:	afffe0ef          	jal	802002aa <release>
    802017b0:	ff2410e3          	bne	s0,s2,80201790 <exit_process+0x88>
    802017b4:	00007517          	auipc	a0,0x7
    802017b8:	5bc50513          	addi	a0,a0,1468 # 80208d70 <wait_lock>
    802017bc:	aeffe0ef          	jal	802002aa <release>
    802017c0:	7902                	ld	s2,32(sp)
    802017c2:	6a42                	ld	s4,16(sp)
    802017c4:	6aa2                	ld	s5,8(sp)
    802017c6:	854e                	mv	a0,s3
    802017c8:	ad1fe0ef          	jal	80200298 <acquire>
    802017cc:	4795                	li	a5,5
    802017ce:	0969a823          	sw	s6,144(s3)
    802017d2:	854e                	mv	a0,s3
    802017d4:	00f9aa23          	sw	a5,20(s3)
    802017d8:	ad3fe0ef          	jal	802002aa <release>
    802017dc:	7442                	ld	s0,48(sp)
    802017de:	70e2                	ld	ra,56(sp)
    802017e0:	74a2                	ld	s1,40(sp)
    802017e2:	6b02                	ld	s6,0(sp)
    802017e4:	02098513          	addi	a0,s3,32
    802017e8:	69e2                	ld	s3,24(sp)
    802017ea:	00007597          	auipc	a1,0x7
    802017ee:	59658593          	addi	a1,a1,1430 # 80208d80 <sched_ctx>
    802017f2:	6121                	addi	sp,sp,64
    802017f4:	a5f9                	j	80201ec2 <swtch>
    802017f6:	00007797          	auipc	a5,0x7
    802017fa:	0a07b923          	sd	zero,178(a5) # 802088a8 <current_proc>
    802017fe:	b71d                	j	80201724 <exit_process+0x1c>

0000000080201800 <set_proc_priority>:
    80201800:	7139                	addi	sp,sp,-64
    80201802:	e852                	sd	s4,16(sp)
    80201804:	00012a17          	auipc	s4,0x12
    80201808:	73ca0a13          	addi	s4,s4,1852 # 80213f40 <proc_table>
    8020180c:	f822                	sd	s0,48(sp)
    8020180e:	f426                	sd	s1,40(sp)
    80201810:	f04a                	sd	s2,32(sp)
    80201812:	ec4e                	sd	s3,24(sp)
    80201814:	e456                	sd	s5,8(sp)
    80201816:	fc06                	sd	ra,56(sp)
    80201818:	892a                	mv	s2,a0
    8020181a:	8aae                	mv	s5,a1
    8020181c:	8452                	mv	s0,s4
    8020181e:	4481                	li	s1,0
    80201820:	04000993          	li	s3,64
    80201824:	a801                	j	80201834 <set_proc_priority+0x34>
    80201826:	2485                	addiw	s1,s1,1
    80201828:	a83fe0ef          	jal	802002aa <release>
    8020182c:	15040413          	addi	s0,s0,336
    80201830:	03348a63          	beq	s1,s3,80201864 <set_proc_priority+0x64>
    80201834:	8522                	mv	a0,s0
    80201836:	a63fe0ef          	jal	80200298 <acquire>
    8020183a:	481c                	lw	a5,16(s0)
    8020183c:	8522                	mv	a0,s0
    8020183e:	ff2794e3          	bne	a5,s2,80201826 <set_proc_priority+0x26>
    80201842:	15000793          	li	a5,336
    80201846:	02f484b3          	mul	s1,s1,a5
    8020184a:	7442                	ld	s0,48(sp)
    8020184c:	70e2                	ld	ra,56(sp)
    8020184e:	7902                	ld	s2,32(sp)
    80201850:	69e2                	ld	s3,24(sp)
    80201852:	9a26                	add	s4,s4,s1
    80201854:	095a2a23          	sw	s5,148(s4)
    80201858:	74a2                	ld	s1,40(sp)
    8020185a:	6a42                	ld	s4,16(sp)
    8020185c:	6aa2                	ld	s5,8(sp)
    8020185e:	6121                	addi	sp,sp,64
    80201860:	a4bfe06f          	j	802002aa <release>
    80201864:	70e2                	ld	ra,56(sp)
    80201866:	7442                	ld	s0,48(sp)
    80201868:	74a2                	ld	s1,40(sp)
    8020186a:	7902                	ld	s2,32(sp)
    8020186c:	69e2                	ld	s3,24(sp)
    8020186e:	6a42                	ld	s4,16(sp)
    80201870:	6aa2                	ld	s5,8(sp)
    80201872:	6121                	addi	sp,sp,64
    80201874:	8082                	ret

0000000080201876 <scheduler_priority>:
    80201876:	715d                	addi	sp,sp,-80
    80201878:	fc26                	sd	s1,56(sp)
    8020187a:	f84a                	sd	s2,48(sp)
    8020187c:	ec56                	sd	s5,24(sp)
    8020187e:	e85a                	sd	s6,16(sp)
    80201880:	e45e                	sd	s7,8(sp)
    80201882:	e486                	sd	ra,72(sp)
    80201884:	e0a2                	sd	s0,64(sp)
    80201886:	f44e                	sd	s3,40(sp)
    80201888:	f052                	sd	s4,32(sp)
    8020188a:	00018917          	auipc	s2,0x18
    8020188e:	ab690913          	addi	s2,s2,-1354 # 80219340 <stack_top>
    80201892:	4489                	li	s1,2
    80201894:	4b8d                	li	s7,3
    80201896:	00007b17          	auipc	s6,0x7
    8020189a:	012b0b13          	addi	s6,s6,18 # 802088a8 <current_proc>
    8020189e:	00007a97          	auipc	s5,0x7
    802018a2:	4e2a8a93          	addi	s5,s5,1250 # 80208d80 <sched_ctx>
    802018a6:	100027f3          	csrr	a5,sstatus
    802018aa:	0027e793          	ori	a5,a5,2
    802018ae:	10079073          	csrw	sstatus,a5
    802018b2:	59fd                	li	s3,-1
    802018b4:	4a01                	li	s4,0
    802018b6:	00012417          	auipc	s0,0x12
    802018ba:	68a40413          	addi	s0,s0,1674 # 80213f40 <proc_table>
    802018be:	a039                	j	802018cc <scheduler_priority+0x56>
    802018c0:	15040413          	addi	s0,s0,336
    802018c4:	9e7fe0ef          	jal	802002aa <release>
    802018c8:	03240563          	beq	s0,s2,802018f2 <scheduler_priority+0x7c>
    802018cc:	8522                	mv	a0,s0
    802018ce:	9cbfe0ef          	jal	80200298 <acquire>
    802018d2:	485c                	lw	a5,20(s0)
    802018d4:	8522                	mv	a0,s0
    802018d6:	fe9795e3          	bne	a5,s1,802018c0 <scheduler_priority+0x4a>
    802018da:	09442783          	lw	a5,148(s0)
    802018de:	fef9d1e3          	bge	s3,a5,802018c0 <scheduler_priority+0x4a>
    802018e2:	8a22                	mv	s4,s0
    802018e4:	15040413          	addi	s0,s0,336
    802018e8:	89be                	mv	s3,a5
    802018ea:	9c1fe0ef          	jal	802002aa <release>
    802018ee:	fd241fe3          	bne	s0,s2,802018cc <scheduler_priority+0x56>
    802018f2:	040a0363          	beqz	s4,80201938 <scheduler_priority+0xc2>
    802018f6:	8552                	mv	a0,s4
    802018f8:	9a1fe0ef          	jal	80200298 <acquire>
    802018fc:	014a2783          	lw	a5,20(s4)
    80201900:	00978663          	beq	a5,s1,8020190c <scheduler_priority+0x96>
    80201904:	8552                	mv	a0,s4
    80201906:	9a5fe0ef          	jal	802002aa <release>
    8020190a:	bf71                	j	802018a6 <scheduler_priority+0x30>
    8020190c:	094a2783          	lw	a5,148(s4)
    80201910:	8552                	mv	a0,s4
    80201912:	017a2a23          	sw	s7,20(s4)
    80201916:	37f5                	addiw	a5,a5,-3
    80201918:	08fa2a23          	sw	a5,148(s4)
    8020191c:	014b3023          	sd	s4,0(s6)
    80201920:	98bfe0ef          	jal	802002aa <release>
    80201924:	020a0593          	addi	a1,s4,32
    80201928:	8556                	mv	a0,s5
    8020192a:	598000ef          	jal	80201ec2 <swtch>
    8020192e:	00007797          	auipc	a5,0x7
    80201932:	f607bd23          	sd	zero,-134(a5) # 802088a8 <current_proc>
    80201936:	bf85                	j	802018a6 <scheduler_priority+0x30>
    80201938:	60a6                	ld	ra,72(sp)
    8020193a:	6406                	ld	s0,64(sp)
    8020193c:	74e2                	ld	s1,56(sp)
    8020193e:	7942                	ld	s2,48(sp)
    80201940:	79a2                	ld	s3,40(sp)
    80201942:	7a02                	ld	s4,32(sp)
    80201944:	6ae2                	ld	s5,24(sp)
    80201946:	6b42                	ld	s6,16(sp)
    80201948:	6ba2                	ld	s7,8(sp)
    8020194a:	6161                	addi	sp,sp,80
    8020194c:	8082                	ret

000000008020194e <scheduler_rotate>:
    8020194e:	711d                	addi	sp,sp,-96
    80201950:	e4a6                	sd	s1,72(sp)
    80201952:	e0ca                	sd	s2,64(sp)
    80201954:	fc4e                	sd	s3,56(sp)
    80201956:	f852                	sd	s4,48(sp)
    80201958:	f456                	sd	s5,40(sp)
    8020195a:	f05a                	sd	s6,32(sp)
    8020195c:	e862                	sd	s8,16(sp)
    8020195e:	ec86                	sd	ra,88(sp)
    80201960:	e8a2                	sd	s0,80(sp)
    80201962:	ec5e                	sd	s7,24(sp)
    80201964:	e466                	sd	s9,8(sp)
    80201966:	e06a                	sd	s10,0(sp)
    80201968:	4c01                	li	s8,0
    8020196a:	00012917          	auipc	s2,0x12
    8020196e:	5d690913          	addi	s2,s2,1494 # 80213f40 <proc_table>
    80201972:	15000993          	li	s3,336
    80201976:	4489                	li	s1,2
    80201978:	4b0d                	li	s6,3
    8020197a:	00007a97          	auipc	s5,0x7
    8020197e:	f2ea8a93          	addi	s5,s5,-210 # 802088a8 <current_proc>
    80201982:	00007a17          	auipc	s4,0x7
    80201986:	3fea0a13          	addi	s4,s4,1022 # 80208d80 <sched_ctx>
    8020198a:	100027f3          	csrr	a5,sstatus
    8020198e:	0027e793          	ori	a5,a5,2
    80201992:	10079073          	csrw	sstatus,a5
    80201996:	000c0c9b          	sext.w	s9,s8
    8020199a:	040c0c1b          	addiw	s8,s8,64
    8020199e:	a031                	j	802019aa <scheduler_rotate+0x5c>
    802019a0:	2c85                	addiw	s9,s9,1
    802019a2:	909fe0ef          	jal	802002aa <release>
    802019a6:	098c8263          	beq	s9,s8,80201a2a <scheduler_rotate+0xdc>
    802019aa:	41fcd79b          	sraiw	a5,s9,0x1f
    802019ae:	01a7d79b          	srliw	a5,a5,0x1a
    802019b2:	0197843b          	addw	s0,a5,s9
    802019b6:	03f47413          	andi	s0,s0,63
    802019ba:	40f40bbb          	subw	s7,s0,a5
    802019be:	845e                	mv	s0,s7
    802019c0:	033b8bb3          	mul	s7,s7,s3
    802019c4:	01790d33          	add	s10,s2,s7
    802019c8:	856a                	mv	a0,s10
    802019ca:	8cffe0ef          	jal	80200298 <acquire>
    802019ce:	014d2783          	lw	a5,20(s10)
    802019d2:	856a                	mv	a0,s10
    802019d4:	fc9796e3          	bne	a5,s1,802019a0 <scheduler_rotate+0x52>
    802019d8:	2405                	addiw	s0,s0,1
    802019da:	41f4579b          	sraiw	a5,s0,0x1f
    802019de:	01a7d79b          	srliw	a5,a5,0x1a
    802019e2:	9c3d                	addw	s0,s0,a5
    802019e4:	03f47413          	andi	s0,s0,63
    802019e8:	40f40c3b          	subw	s8,s0,a5
    802019ec:	8bffe0ef          	jal	802002aa <release>
    802019f0:	856a                	mv	a0,s10
    802019f2:	8a7fe0ef          	jal	80200298 <acquire>
    802019f6:	014d2783          	lw	a5,20(s10)
    802019fa:	00978663          	beq	a5,s1,80201a06 <scheduler_rotate+0xb8>
    802019fe:	856a                	mv	a0,s10
    80201a00:	8abfe0ef          	jal	802002aa <release>
    80201a04:	b759                	j	8020198a <scheduler_rotate+0x3c>
    80201a06:	856a                	mv	a0,s10
    80201a08:	016d2a23          	sw	s6,20(s10)
    80201a0c:	01aab023          	sd	s10,0(s5)
    80201a10:	89bfe0ef          	jal	802002aa <release>
    80201a14:	020b8593          	addi	a1,s7,32 # 1020 <_entry-0x801fefe0>
    80201a18:	95ca                	add	a1,a1,s2
    80201a1a:	8552                	mv	a0,s4
    80201a1c:	4a6000ef          	jal	80201ec2 <swtch>
    80201a20:	00007797          	auipc	a5,0x7
    80201a24:	e807b423          	sd	zero,-376(a5) # 802088a8 <current_proc>
    80201a28:	b78d                	j	8020198a <scheduler_rotate+0x3c>
    80201a2a:	60e6                	ld	ra,88(sp)
    80201a2c:	6446                	ld	s0,80(sp)
    80201a2e:	64a6                	ld	s1,72(sp)
    80201a30:	6906                	ld	s2,64(sp)
    80201a32:	79e2                	ld	s3,56(sp)
    80201a34:	7a42                	ld	s4,48(sp)
    80201a36:	7aa2                	ld	s5,40(sp)
    80201a38:	7b02                	ld	s6,32(sp)
    80201a3a:	6be2                	ld	s7,24(sp)
    80201a3c:	6c42                	ld	s8,16(sp)
    80201a3e:	6ca2                	ld	s9,8(sp)
    80201a40:	6d02                	ld	s10,0(sp)
    80201a42:	6125                	addi	sp,sp,96
    80201a44:	8082                	ret

0000000080201a46 <yield>:
    80201a46:	1141                	addi	sp,sp,-16
    80201a48:	e022                	sd	s0,0(sp)
    80201a4a:	00007417          	auipc	s0,0x7
    80201a4e:	e5e43403          	ld	s0,-418(s0) # 802088a8 <current_proc>
    80201a52:	8522                	mv	a0,s0
    80201a54:	e406                	sd	ra,8(sp)
    80201a56:	843fe0ef          	jal	80200298 <acquire>
    80201a5a:	4789                	li	a5,2
    80201a5c:	8522                	mv	a0,s0
    80201a5e:	c85c                	sw	a5,20(s0)
    80201a60:	84bfe0ef          	jal	802002aa <release>
    80201a64:	02040513          	addi	a0,s0,32
    80201a68:	6402                	ld	s0,0(sp)
    80201a6a:	60a2                	ld	ra,8(sp)
    80201a6c:	00007597          	auipc	a1,0x7
    80201a70:	31458593          	addi	a1,a1,788 # 80208d80 <sched_ctx>
    80201a74:	0141                	addi	sp,sp,16
    80201a76:	a1b1                	j	80201ec2 <swtch>

0000000080201a78 <sleep>:
    80201a78:	1101                	addi	sp,sp,-32
    80201a7a:	e822                	sd	s0,16(sp)
    80201a7c:	e426                	sd	s1,8(sp)
    80201a7e:	ec06                	sd	ra,24(sp)
    80201a80:	00007417          	auipc	s0,0x7
    80201a84:	e2843403          	ld	s0,-472(s0) # 802088a8 <current_proc>
    80201a88:	84ae                	mv	s1,a1
    80201a8a:	c821                	beqz	s0,80201ada <sleep+0x62>
    80201a8c:	e04a                	sd	s2,0(sp)
    80201a8e:	892a                	mv	s2,a0
    80201a90:	8522                	mv	a0,s0
    80201a92:	807fe0ef          	jal	80200298 <acquire>
    80201a96:	8526                	mv	a0,s1
    80201a98:	813fe0ef          	jal	802002aa <release>
    80201a9c:	4791                	li	a5,4
    80201a9e:	c85c                	sw	a5,20(s0)
    80201aa0:	09243c23          	sd	s2,152(s0)
    80201aa4:	8522                	mv	a0,s0
    80201aa6:	805fe0ef          	jal	802002aa <release>
    80201aaa:	00007597          	auipc	a1,0x7
    80201aae:	2d658593          	addi	a1,a1,726 # 80208d80 <sched_ctx>
    80201ab2:	02040513          	addi	a0,s0,32
    80201ab6:	40c000ef          	jal	80201ec2 <swtch>
    80201aba:	8522                	mv	a0,s0
    80201abc:	fdcfe0ef          	jal	80200298 <acquire>
    80201ac0:	8522                	mv	a0,s0
    80201ac2:	08043c23          	sd	zero,152(s0)
    80201ac6:	fe4fe0ef          	jal	802002aa <release>
    80201aca:	6442                	ld	s0,16(sp)
    80201acc:	6902                	ld	s2,0(sp)
    80201ace:	60e2                	ld	ra,24(sp)
    80201ad0:	8526                	mv	a0,s1
    80201ad2:	64a2                	ld	s1,8(sp)
    80201ad4:	6105                	addi	sp,sp,32
    80201ad6:	fc2fe06f          	j	80200298 <acquire>
    80201ada:	6442                	ld	s0,16(sp)
    80201adc:	60e2                	ld	ra,24(sp)
    80201ade:	64a2                	ld	s1,8(sp)
    80201ae0:	852e                	mv	a0,a1
    80201ae2:	6105                	addi	sp,sp,32
    80201ae4:	fc6fe06f          	j	802002aa <release>

0000000080201ae8 <wait_process>:
    80201ae8:	715d                	addi	sp,sp,-80
    80201aea:	ec56                	sd	s5,24(sp)
    80201aec:	8aaa                	mv	s5,a0
    80201aee:	00007517          	auipc	a0,0x7
    80201af2:	28250513          	addi	a0,a0,642 # 80208d70 <wait_lock>
    80201af6:	f44e                	sd	s3,40(sp)
    80201af8:	f052                	sd	s4,32(sp)
    80201afa:	e85a                	sd	s6,16(sp)
    80201afc:	e45e                	sd	s7,8(sp)
    80201afe:	e062                	sd	s8,0(sp)
    80201b00:	e486                	sd	ra,72(sp)
    80201b02:	e0a2                	sd	s0,64(sp)
    80201b04:	fc26                	sd	s1,56(sp)
    80201b06:	f84a                	sd	s2,48(sp)
    80201b08:	00007997          	auipc	s3,0x7
    80201b0c:	da09b983          	ld	s3,-608(s3) # 802088a8 <current_proc>
    80201b10:	00012b17          	auipc	s6,0x12
    80201b14:	430b0b13          	addi	s6,s6,1072 # 80213f40 <proc_table>
    80201b18:	f80fe0ef          	jal	80200298 <acquire>
    80201b1c:	4b95                	li	s7,5
    80201b1e:	4c09                	li	s8,2
    80201b20:	04000a13          	li	s4,64
    80201b24:	00012417          	auipc	s0,0x12
    80201b28:	41c40413          	addi	s0,s0,1052 # 80213f40 <proc_table>
    80201b2c:	4901                	li	s2,0
    80201b2e:	4481                	li	s1,0
    80201b30:	4701                	li	a4,0
    80201b32:	a801                	j	80201b42 <wait_process+0x5a>
    80201b34:	2485                	addiw	s1,s1,1
    80201b36:	15040413          	addi	s0,s0,336
    80201b3a:	15090913          	addi	s2,s2,336
    80201b3e:	03448963          	beq	s1,s4,80201b70 <wait_process+0x88>
    80201b42:	12843783          	ld	a5,296(s0)
    80201b46:	ff3797e3          	bne	a5,s3,80201b34 <wait_process+0x4c>
    80201b4a:	8522                	mv	a0,s0
    80201b4c:	f4cfe0ef          	jal	80200298 <acquire>
    80201b50:	485c                	lw	a5,20(s0)
    80201b52:	8522                	mv	a0,s0
    80201b54:	03778763          	beq	a5,s7,80201b82 <wait_process+0x9a>
    80201b58:	03878563          	beq	a5,s8,80201b82 <wait_process+0x9a>
    80201b5c:	f4efe0ef          	jal	802002aa <release>
    80201b60:	2485                	addiw	s1,s1,1
    80201b62:	4705                	li	a4,1
    80201b64:	15040413          	addi	s0,s0,336
    80201b68:	15090913          	addi	s2,s2,336
    80201b6c:	fd449be3          	bne	s1,s4,80201b42 <wait_process+0x5a>
    80201b70:	c72d                	beqz	a4,80201bda <wait_process+0xf2>
    80201b72:	00007597          	auipc	a1,0x7
    80201b76:	1fe58593          	addi	a1,a1,510 # 80208d70 <wait_lock>
    80201b7a:	854e                	mv	a0,s3
    80201b7c:	efdff0ef          	jal	80201a78 <sleep>
    80201b80:	b755                	j	80201b24 <wait_process+0x3c>
    80201b82:	15000793          	li	a5,336
    80201b86:	02f487b3          	mul	a5,s1,a5
    80201b8a:	97da                	add	a5,a5,s6
    80201b8c:	4b84                	lw	s1,16(a5)
    80201b8e:	000a8d63          	beqz	s5,80201ba8 <wait_process+0xc0>
    80201b92:	1389b503          	ld	a0,312(s3)
    80201b96:	09090613          	addi	a2,s2,144
    80201b9a:	4691                	li	a3,4
    80201b9c:	965a                	add	a2,a2,s6
    80201b9e:	85d6                	mv	a1,s5
    80201ba0:	84cff0ef          	jal	80200bec <copyout>
    80201ba4:	04054363          	bltz	a0,80201bea <wait_process+0x102>
    80201ba8:	8522                	mv	a0,s0
    80201baa:	9d5ff0ef          	jal	8020157e <free_process>
    80201bae:	8522                	mv	a0,s0
    80201bb0:	efafe0ef          	jal	802002aa <release>
    80201bb4:	00007517          	auipc	a0,0x7
    80201bb8:	1bc50513          	addi	a0,a0,444 # 80208d70 <wait_lock>
    80201bbc:	eeefe0ef          	jal	802002aa <release>
    80201bc0:	60a6                	ld	ra,72(sp)
    80201bc2:	6406                	ld	s0,64(sp)
    80201bc4:	7942                	ld	s2,48(sp)
    80201bc6:	79a2                	ld	s3,40(sp)
    80201bc8:	7a02                	ld	s4,32(sp)
    80201bca:	6ae2                	ld	s5,24(sp)
    80201bcc:	6b42                	ld	s6,16(sp)
    80201bce:	6ba2                	ld	s7,8(sp)
    80201bd0:	6c02                	ld	s8,0(sp)
    80201bd2:	8526                	mv	a0,s1
    80201bd4:	74e2                	ld	s1,56(sp)
    80201bd6:	6161                	addi	sp,sp,80
    80201bd8:	8082                	ret
    80201bda:	00007517          	auipc	a0,0x7
    80201bde:	19650513          	addi	a0,a0,406 # 80208d70 <wait_lock>
    80201be2:	ec8fe0ef          	jal	802002aa <release>
    80201be6:	54fd                	li	s1,-1
    80201be8:	bfe1                	j	80201bc0 <wait_process+0xd8>
    80201bea:	8522                	mv	a0,s0
    80201bec:	ebefe0ef          	jal	802002aa <release>
    80201bf0:	00007517          	auipc	a0,0x7
    80201bf4:	18050513          	addi	a0,a0,384 # 80208d70 <wait_lock>
    80201bf8:	eb2fe0ef          	jal	802002aa <release>
    80201bfc:	54fd                	li	s1,-1
    80201bfe:	b7c9                	j	80201bc0 <wait_process+0xd8>

0000000080201c00 <wakeup>:
    80201c00:	7179                	addi	sp,sp,-48
    80201c02:	f022                	sd	s0,32(sp)
    80201c04:	ec26                	sd	s1,24(sp)
    80201c06:	e84a                	sd	s2,16(sp)
    80201c08:	e44e                	sd	s3,8(sp)
    80201c0a:	e052                	sd	s4,0(sp)
    80201c0c:	f406                	sd	ra,40(sp)
    80201c0e:	89aa                	mv	s3,a0
    80201c10:	00012417          	auipc	s0,0x12
    80201c14:	33040413          	addi	s0,s0,816 # 80213f40 <proc_table>
    80201c18:	00017917          	auipc	s2,0x17
    80201c1c:	72890913          	addi	s2,s2,1832 # 80219340 <stack_top>
    80201c20:	4491                	li	s1,4
    80201c22:	4a09                	li	s4,2
    80201c24:	a039                	j	80201c32 <wakeup+0x32>
    80201c26:	15040413          	addi	s0,s0,336
    80201c2a:	e80fe0ef          	jal	802002aa <release>
    80201c2e:	03240463          	beq	s0,s2,80201c56 <wakeup+0x56>
    80201c32:	8522                	mv	a0,s0
    80201c34:	e64fe0ef          	jal	80200298 <acquire>
    80201c38:	485c                	lw	a5,20(s0)
    80201c3a:	8522                	mv	a0,s0
    80201c3c:	fe9795e3          	bne	a5,s1,80201c26 <wakeup+0x26>
    80201c40:	6c5c                	ld	a5,152(s0)
    80201c42:	ff3792e3          	bne	a5,s3,80201c26 <wakeup+0x26>
    80201c46:	01442a23          	sw	s4,20(s0)
    80201c4a:	15040413          	addi	s0,s0,336
    80201c4e:	e5cfe0ef          	jal	802002aa <release>
    80201c52:	ff2410e3          	bne	s0,s2,80201c32 <wakeup+0x32>
    80201c56:	70a2                	ld	ra,40(sp)
    80201c58:	7402                	ld	s0,32(sp)
    80201c5a:	64e2                	ld	s1,24(sp)
    80201c5c:	6942                	ld	s2,16(sp)
    80201c5e:	69a2                	ld	s3,8(sp)
    80201c60:	6a02                	ld	s4,0(sp)
    80201c62:	6145                	addi	sp,sp,48
    80201c64:	8082                	ret

0000000080201c66 <fork_process>:
    80201c66:	7179                	addi	sp,sp,-48
    80201c68:	e052                	sd	s4,0(sp)
    80201c6a:	f406                	sd	ra,40(sp)
    80201c6c:	f022                	sd	s0,32(sp)
    80201c6e:	00007a17          	auipc	s4,0x7
    80201c72:	c3aa3a03          	ld	s4,-966(s4) # 802088a8 <current_proc>
    80201c76:	973ff0ef          	jal	802015e8 <alloc_process>
    80201c7a:	0c050c63          	beqz	a0,80201d52 <fork_process+0xec>
    80201c7e:	e44e                	sd	s3,8(sp)
    80201c80:	13853583          	ld	a1,312(a0)
    80201c84:	89aa                	mv	s3,a0
    80201c86:	130a3603          	ld	a2,304(s4)
    80201c8a:	138a3503          	ld	a0,312(s4)
    80201c8e:	fedfe0ef          	jal	80200c7a <copy_pagetable>
    80201c92:	0a054963          	bltz	a0,80201d44 <fork_process+0xde>
    80201c96:	130a3703          	ld	a4,304(s4)
    80201c9a:	140a3783          	ld	a5,320(s4)
    80201c9e:	1409b883          	ld	a7,320(s3)
    80201ca2:	ec26                	sd	s1,24(sp)
    80201ca4:	e84a                	sd	s2,16(sp)
    80201ca6:	12e9b823          	sd	a4,304(s3)
    80201caa:	12078813          	addi	a6,a5,288
    80201cae:	8746                	mv	a4,a7
    80201cb0:	6388                	ld	a0,0(a5)
    80201cb2:	678c                	ld	a1,8(a5)
    80201cb4:	6b90                	ld	a2,16(a5)
    80201cb6:	6f94                	ld	a3,24(a5)
    80201cb8:	e308                	sd	a0,0(a4)
    80201cba:	e70c                	sd	a1,8(a4)
    80201cbc:	eb10                	sd	a2,16(a4)
    80201cbe:	ef14                	sd	a3,24(a4)
    80201cc0:	02078793          	addi	a5,a5,32
    80201cc4:	02070713          	addi	a4,a4,32
    80201cc8:	ff0794e3          	bne	a5,a6,80201cb0 <fork_process+0x4a>
    80201ccc:	0608b823          	sd	zero,112(a7)
    80201cd0:	0a0a0413          	addi	s0,s4,160
    80201cd4:	0a098493          	addi	s1,s3,160
    80201cd8:	120a0913          	addi	s2,s4,288
    80201cdc:	6008                	ld	a0,0(s0)
    80201cde:	c501                	beqz	a0,80201ce6 <fork_process+0x80>
    80201ce0:	6e6000ef          	jal	802023c6 <filedup>
    80201ce4:	e088                	sd	a0,0(s1)
    80201ce6:	0421                	addi	s0,s0,8
    80201ce8:	04a1                	addi	s1,s1,8
    80201cea:	ff2419e3          	bne	s0,s2,80201cdc <fork_process+0x76>
    80201cee:	120a3503          	ld	a0,288(s4)
    80201cf2:	55b000ef          	jal	80202a4c <idup>
    80201cf6:	12a9b023          	sd	a0,288(s3)
    80201cfa:	854e                	mv	a0,s3
    80201cfc:	0109a403          	lw	s0,16(s3)
    80201d00:	daafe0ef          	jal	802002aa <release>
    80201d04:	00007517          	auipc	a0,0x7
    80201d08:	06c50513          	addi	a0,a0,108 # 80208d70 <wait_lock>
    80201d0c:	d8cfe0ef          	jal	80200298 <acquire>
    80201d10:	00007517          	auipc	a0,0x7
    80201d14:	06050513          	addi	a0,a0,96 # 80208d70 <wait_lock>
    80201d18:	1349b423          	sd	s4,296(s3)
    80201d1c:	d8efe0ef          	jal	802002aa <release>
    80201d20:	854e                	mv	a0,s3
    80201d22:	d76fe0ef          	jal	80200298 <acquire>
    80201d26:	4789                	li	a5,2
    80201d28:	00f9aa23          	sw	a5,20(s3)
    80201d2c:	854e                	mv	a0,s3
    80201d2e:	d7cfe0ef          	jal	802002aa <release>
    80201d32:	64e2                	ld	s1,24(sp)
    80201d34:	6942                	ld	s2,16(sp)
    80201d36:	69a2                	ld	s3,8(sp)
    80201d38:	70a2                	ld	ra,40(sp)
    80201d3a:	8522                	mv	a0,s0
    80201d3c:	7402                	ld	s0,32(sp)
    80201d3e:	6a02                	ld	s4,0(sp)
    80201d40:	6145                	addi	sp,sp,48
    80201d42:	8082                	ret
    80201d44:	854e                	mv	a0,s3
    80201d46:	839ff0ef          	jal	8020157e <free_process>
    80201d4a:	854e                	mv	a0,s3
    80201d4c:	d5efe0ef          	jal	802002aa <release>
    80201d50:	69a2                	ld	s3,8(sp)
    80201d52:	547d                	li	s0,-1
    80201d54:	b7d5                	j	80201d38 <fork_process+0xd2>

0000000080201d56 <scheduler_priority_extend>:
    80201d56:	7159                	addi	sp,sp,-112
    80201d58:	f062                	sd	s8,32(sp)
    80201d5a:	000f4c37          	lui	s8,0xf4
    80201d5e:	eca6                	sd	s1,88(sp)
    80201d60:	e8ca                	sd	s2,80(sp)
    80201d62:	f45e                	sd	s7,40(sp)
    80201d64:	ec66                	sd	s9,24(sp)
    80201d66:	e86a                	sd	s10,16(sp)
    80201d68:	e46e                	sd	s11,8(sp)
    80201d6a:	f486                	sd	ra,104(sp)
    80201d6c:	f0a2                	sd	s0,96(sp)
    80201d6e:	e4ce                	sd	s3,72(sp)
    80201d70:	e0d2                	sd	s4,64(sp)
    80201d72:	fc56                	sd	s5,56(sp)
    80201d74:	f85a                	sd	s6,48(sp)
    80201d76:	8caa                	mv	s9,a0
    80201d78:	00017917          	auipc	s2,0x17
    80201d7c:	5c890913          	addi	s2,s2,1480 # 80219340 <stack_top>
    80201d80:	240c0c13          	addi	s8,s8,576 # f4240 <_entry-0x8010bdc0>
    80201d84:	4489                	li	s1,2
    80201d86:	4b85                	li	s7,1
    80201d88:	4d8d                	li	s11,3
    80201d8a:	00007d17          	auipc	s10,0x7
    80201d8e:	b1ed0d13          	addi	s10,s10,-1250 # 802088a8 <current_proc>
    80201d92:	100027f3          	csrr	a5,sstatus
    80201d96:	0027e793          	ori	a5,a5,2
    80201d9a:	10079073          	csrw	sstatus,a5
    80201d9e:	59fd                	li	s3,-1
    80201da0:	8b62                	mv	s6,s8
    80201da2:	8ae2                	mv	s5,s8
    80201da4:	4a01                	li	s4,0
    80201da6:	00012417          	auipc	s0,0x12
    80201daa:	19a40413          	addi	s0,s0,410 # 80213f40 <proc_table>
    80201dae:	a801                	j	80201dbe <scheduler_priority_extend+0x68>
    80201db0:	8522                	mv	a0,s0
    80201db2:	15040413          	addi	s0,s0,336
    80201db6:	cf4fe0ef          	jal	802002aa <release>
    80201dba:	03240963          	beq	s0,s2,80201dec <scheduler_priority_extend+0x96>
    80201dbe:	8522                	mv	a0,s0
    80201dc0:	cd8fe0ef          	jal	80200298 <acquire>
    80201dc4:	485c                	lw	a5,20(s0)
    80201dc6:	fe9795e3          	bne	a5,s1,80201db0 <scheduler_priority_extend+0x5a>
    80201dca:	09442783          	lw	a5,148(s0)
    80201dce:	02f9de63          	bge	s3,a5,80201e0a <scheduler_priority_extend+0xb4>
    80201dd2:	14842a83          	lw	s5,328(s0)
    80201dd6:	01042b03          	lw	s6,16(s0)
    80201dda:	8522                	mv	a0,s0
    80201ddc:	8a22                	mv	s4,s0
    80201dde:	15040413          	addi	s0,s0,336
    80201de2:	89be                	mv	s3,a5
    80201de4:	cc6fe0ef          	jal	802002aa <release>
    80201de8:	fd241be3          	bne	s0,s2,80201dbe <scheduler_priority_extend+0x68>
    80201dec:	0a0a0c63          	beqz	s4,80201ea4 <scheduler_priority_extend+0x14e>
    80201df0:	060c9763          	bnez	s9,80201e5e <scheduler_priority_extend+0x108>
    80201df4:	8552                	mv	a0,s4
    80201df6:	ca2fe0ef          	jal	80200298 <acquire>
    80201dfa:	014a2783          	lw	a5,20(s4)
    80201dfe:	02978763          	beq	a5,s1,80201e2c <scheduler_priority_extend+0xd6>
    80201e02:	8552                	mv	a0,s4
    80201e04:	ca6fe0ef          	jal	802002aa <release>
    80201e08:	b769                	j	80201d92 <scheduler_priority_extend+0x3c>
    80201e0a:	fb3793e3          	bne	a5,s3,80201db0 <scheduler_priority_extend+0x5a>
    80201e0e:	14842783          	lw	a5,328(s0)
    80201e12:	0157ca63          	blt	a5,s5,80201e26 <scheduler_priority_extend+0xd0>
    80201e16:	f9579de3          	bne	a5,s5,80201db0 <scheduler_priority_extend+0x5a>
    80201e1a:	481c                	lw	a5,16(s0)
    80201e1c:	f967dae3          	bge	a5,s6,80201db0 <scheduler_priority_extend+0x5a>
    80201e20:	8b3e                	mv	s6,a5
    80201e22:	8a22                	mv	s4,s0
    80201e24:	b771                	j	80201db0 <scheduler_priority_extend+0x5a>
    80201e26:	8abe                	mv	s5,a5
    80201e28:	8a22                	mv	s4,s0
    80201e2a:	b759                	j	80201db0 <scheduler_priority_extend+0x5a>
    80201e2c:	148a2783          	lw	a5,328(s4)
    80201e30:	8552                	mv	a0,s4
    80201e32:	01ba2a23          	sw	s11,20(s4)
    80201e36:	2785                	addiw	a5,a5,1
    80201e38:	14fa2423          	sw	a5,328(s4)
    80201e3c:	014d3023          	sd	s4,0(s10)
    80201e40:	c6afe0ef          	jal	802002aa <release>
    80201e44:	020a0593          	addi	a1,s4,32
    80201e48:	00007517          	auipc	a0,0x7
    80201e4c:	f3850513          	addi	a0,a0,-200 # 80208d80 <sched_ctx>
    80201e50:	072000ef          	jal	80201ec2 <swtch>
    80201e54:	00007797          	auipc	a5,0x7
    80201e58:	a407ba23          	sd	zero,-1452(a5) # 802088a8 <current_proc>
    80201e5c:	bf1d                	j	80201d92 <scheduler_priority_extend+0x3c>
    80201e5e:	00012417          	auipc	s0,0x12
    80201e62:	0e240413          	addi	s0,s0,226 # 80213f40 <proc_table>
    80201e66:	a039                	j	80201e74 <scheduler_priority_extend+0x11e>
    80201e68:	15040413          	addi	s0,s0,336
    80201e6c:	c3efe0ef          	jal	802002aa <release>
    80201e70:	f92402e3          	beq	s0,s2,80201df4 <scheduler_priority_extend+0x9e>
    80201e74:	8522                	mv	a0,s0
    80201e76:	c22fe0ef          	jal	80200298 <acquire>
    80201e7a:	485c                	lw	a5,20(s0)
    80201e7c:	8522                	mv	a0,s0
    80201e7e:	fe9795e3          	bne	a5,s1,80201e68 <scheduler_priority_extend+0x112>
    80201e82:	fe8a03e3          	beq	s4,s0,80201e68 <scheduler_priority_extend+0x112>
    80201e86:	14c42783          	lw	a5,332(s0)
    80201e8a:	2785                	addiw	a5,a5,1
    80201e8c:	14f42623          	sw	a5,332(s0)
    80201e90:	fcfbdce3          	bge	s7,a5,80201e68 <scheduler_priority_extend+0x112>
    80201e94:	09442783          	lw	a5,148(s0)
    80201e98:	14042623          	sw	zero,332(s0)
    80201e9c:	2785                	addiw	a5,a5,1
    80201e9e:	08f42a23          	sw	a5,148(s0)
    80201ea2:	b7d9                	j	80201e68 <scheduler_priority_extend+0x112>
    80201ea4:	70a6                	ld	ra,104(sp)
    80201ea6:	7406                	ld	s0,96(sp)
    80201ea8:	64e6                	ld	s1,88(sp)
    80201eaa:	6946                	ld	s2,80(sp)
    80201eac:	69a6                	ld	s3,72(sp)
    80201eae:	6a06                	ld	s4,64(sp)
    80201eb0:	7ae2                	ld	s5,56(sp)
    80201eb2:	7b42                	ld	s6,48(sp)
    80201eb4:	7ba2                	ld	s7,40(sp)
    80201eb6:	7c02                	ld	s8,32(sp)
    80201eb8:	6ce2                	ld	s9,24(sp)
    80201eba:	6d42                	ld	s10,16(sp)
    80201ebc:	6da2                	ld	s11,8(sp)
    80201ebe:	6165                	addi	sp,sp,112
    80201ec0:	8082                	ret

0000000080201ec2 <swtch>:
    80201ec2:	00153023          	sd	ra,0(a0)
    80201ec6:	00253423          	sd	sp,8(a0)
    80201eca:	e900                	sd	s0,16(a0)
    80201ecc:	ed04                	sd	s1,24(a0)
    80201ece:	03253023          	sd	s2,32(a0)
    80201ed2:	03353423          	sd	s3,40(a0)
    80201ed6:	03453823          	sd	s4,48(a0)
    80201eda:	03553c23          	sd	s5,56(a0)
    80201ede:	05653023          	sd	s6,64(a0)
    80201ee2:	05753423          	sd	s7,72(a0)
    80201ee6:	05853823          	sd	s8,80(a0)
    80201eea:	05953c23          	sd	s9,88(a0)
    80201eee:	07a53023          	sd	s10,96(a0)
    80201ef2:	07b53423          	sd	s11,104(a0)
    80201ef6:	0005b083          	ld	ra,0(a1)
    80201efa:	0085b103          	ld	sp,8(a1)
    80201efe:	6980                	ld	s0,16(a1)
    80201f00:	6d84                	ld	s1,24(a1)
    80201f02:	0205b903          	ld	s2,32(a1)
    80201f06:	0285b983          	ld	s3,40(a1)
    80201f0a:	0305ba03          	ld	s4,48(a1)
    80201f0e:	0385ba83          	ld	s5,56(a1)
    80201f12:	0405bb03          	ld	s6,64(a1)
    80201f16:	0485bb83          	ld	s7,72(a1)
    80201f1a:	0505bc03          	ld	s8,80(a1)
    80201f1e:	0585bc83          	ld	s9,88(a1)
    80201f22:	0605bd03          	ld	s10,96(a1)
    80201f26:	0685bd83          	ld	s11,104(a1)
    80201f2a:	8082                	ret

0000000080201f2c <shared_buffer_init>:
    80201f2c:	1141                	addi	sp,sp,-16
    80201f2e:	00005597          	auipc	a1,0x5
    80201f32:	4b258593          	addi	a1,a1,1202 # 802073e0 <etext+0x3e0>
    80201f36:	00007517          	auipc	a0,0x7
    80201f3a:	eda50513          	addi	a0,a0,-294 # 80208e10 <sbuf+0x20>
    80201f3e:	e022                	sd	s0,0(sp)
    80201f40:	e406                	sd	ra,8(sp)
    80201f42:	00007417          	auipc	s0,0x7
    80201f46:	eae40413          	addi	s0,s0,-338 # 80208df0 <sbuf>
    80201f4a:	b46fe0ef          	jal	80200290 <initlock>
    80201f4e:	60a2                	ld	ra,8(sp)
    80201f50:	00042c23          	sw	zero,24(s0)
    80201f54:	00043823          	sd	zero,16(s0)
    80201f58:	6402                	ld	s0,0(sp)
    80201f5a:	0141                	addi	sp,sp,16
    80201f5c:	8082                	ret

0000000080201f5e <producer_task>:
    80201f5e:	7139                	addi	sp,sp,-64
    80201f60:	f822                	sd	s0,48(sp)
    80201f62:	f426                	sd	s1,40(sp)
    80201f64:	f04a                	sd	s2,32(sp)
    80201f66:	ec4e                	sd	s3,24(sp)
    80201f68:	e852                	sd	s4,16(sp)
    80201f6a:	e456                	sd	s5,8(sp)
    80201f6c:	fc06                	sd	ra,56(sp)
    80201f6e:	4981                	li	s3,0
    80201f70:	00007417          	auipc	s0,0x7
    80201f74:	e8040413          	addi	s0,s0,-384 # 80208df0 <sbuf>
    80201f78:	00007497          	auipc	s1,0x7
    80201f7c:	e9848493          	addi	s1,s1,-360 # 80208e10 <sbuf+0x20>
    80201f80:	4911                	li	s2,4
    80201f82:	00005a97          	auipc	s5,0x5
    80201f86:	466a8a93          	addi	s5,s5,1126 # 802073e8 <etext+0x3e8>
    80201f8a:	4a29                	li	s4,10
    80201f8c:	8526                	mv	a0,s1
    80201f8e:	b0afe0ef          	jal	80200298 <acquire>
    80201f92:	4c1c                	lw	a5,24(s0)
    80201f94:	01279963          	bne	a5,s2,80201fa6 <producer_task+0x48>
    80201f98:	85a6                	mv	a1,s1
    80201f9a:	8522                	mv	a0,s0
    80201f9c:	addff0ef          	jal	80201a78 <sleep>
    80201fa0:	4c1c                	lw	a5,24(s0)
    80201fa2:	ff278be3          	beq	a5,s2,80201f98 <producer_task+0x3a>
    80201fa6:	4854                	lw	a3,20(s0)
    80201fa8:	0017861b          	addiw	a2,a5,1
    80201fac:	8556                	mv	a0,s5
    80201fae:	0016871b          	addiw	a4,a3,1 # 1001 <_entry-0x801fefff>
    80201fb2:	41f7559b          	sraiw	a1,a4,0x1f
    80201fb6:	01e5d59b          	srliw	a1,a1,0x1e
    80201fba:	068a                	slli	a3,a3,0x2
    80201fbc:	96a2                	add	a3,a3,s0
    80201fbe:	9f2d                	addw	a4,a4,a1
    80201fc0:	0136a023          	sw	s3,0(a3)
    80201fc4:	8b0d                	andi	a4,a4,3
    80201fc6:	2985                	addiw	s3,s3,1
    80201fc8:	9f0d                	subw	a4,a4,a1
    80201fca:	85ce                	mv	a1,s3
    80201fcc:	c858                	sw	a4,20(s0)
    80201fce:	cc10                	sw	a2,24(s0)
    80201fd0:	98afe0ef          	jal	8020015a <printf>
    80201fd4:	8522                	mv	a0,s0
    80201fd6:	c2bff0ef          	jal	80201c00 <wakeup>
    80201fda:	8526                	mv	a0,s1
    80201fdc:	acefe0ef          	jal	802002aa <release>
    80201fe0:	fb4996e3          	bne	s3,s4,80201f8c <producer_task+0x2e>
    80201fe4:	00005517          	auipc	a0,0x5
    80201fe8:	42450513          	addi	a0,a0,1060 # 80207408 <etext+0x408>
    80201fec:	96efe0ef          	jal	8020015a <printf>
    80201ff0:	7442                	ld	s0,48(sp)
    80201ff2:	70e2                	ld	ra,56(sp)
    80201ff4:	74a2                	ld	s1,40(sp)
    80201ff6:	7902                	ld	s2,32(sp)
    80201ff8:	69e2                	ld	s3,24(sp)
    80201ffa:	6a42                	ld	s4,16(sp)
    80201ffc:	6aa2                	ld	s5,8(sp)
    80201ffe:	00007517          	auipc	a0,0x7
    80202002:	8aa53503          	ld	a0,-1878(a0) # 802088a8 <current_proc>
    80202006:	4581                	li	a1,0
    80202008:	6121                	addi	sp,sp,64
    8020200a:	efeff06f          	j	80201708 <exit_process>

000000008020200e <consumer_task>:
    8020200e:	7179                	addi	sp,sp,-48
    80202010:	f022                	sd	s0,32(sp)
    80202012:	ec26                	sd	s1,24(sp)
    80202014:	e84a                	sd	s2,16(sp)
    80202016:	e44e                	sd	s3,8(sp)
    80202018:	f406                	sd	ra,40(sp)
    8020201a:	4929                	li	s2,10
    8020201c:	00007417          	auipc	s0,0x7
    80202020:	dd440413          	addi	s0,s0,-556 # 80208df0 <sbuf>
    80202024:	00007497          	auipc	s1,0x7
    80202028:	dec48493          	addi	s1,s1,-532 # 80208e10 <sbuf+0x20>
    8020202c:	00005997          	auipc	s3,0x5
    80202030:	3f498993          	addi	s3,s3,1012 # 80207420 <etext+0x420>
    80202034:	8526                	mv	a0,s1
    80202036:	a62fe0ef          	jal	80200298 <acquire>
    8020203a:	4c1c                	lw	a5,24(s0)
    8020203c:	e799                	bnez	a5,8020204a <consumer_task+0x3c>
    8020203e:	85a6                	mv	a1,s1
    80202040:	8522                	mv	a0,s0
    80202042:	a37ff0ef          	jal	80201a78 <sleep>
    80202046:	4c1c                	lw	a5,24(s0)
    80202048:	dbfd                	beqz	a5,8020203e <consumer_task+0x30>
    8020204a:	4814                	lw	a3,16(s0)
    8020204c:	fff7861b          	addiw	a2,a5,-1
    80202050:	cc10                	sw	a2,24(s0)
    80202052:	0016871b          	addiw	a4,a3,1
    80202056:	068a                	slli	a3,a3,0x2
    80202058:	96a2                	add	a3,a3,s0
    8020205a:	41f7551b          	sraiw	a0,a4,0x1f
    8020205e:	428c                	lw	a1,0(a3)
    80202060:	01e5551b          	srliw	a0,a0,0x1e
    80202064:	9f29                	addw	a4,a4,a0
    80202066:	8b0d                	andi	a4,a4,3
    80202068:	9f09                	subw	a4,a4,a0
    8020206a:	2585                	addiw	a1,a1,1
    8020206c:	854e                	mv	a0,s3
    8020206e:	c818                	sw	a4,16(s0)
    80202070:	8eafe0ef          	jal	8020015a <printf>
    80202074:	8522                	mv	a0,s0
    80202076:	b8bff0ef          	jal	80201c00 <wakeup>
    8020207a:	8526                	mv	a0,s1
    8020207c:	397d                	addiw	s2,s2,-1
    8020207e:	a2cfe0ef          	jal	802002aa <release>
    80202082:	fa0919e3          	bnez	s2,80202034 <consumer_task+0x26>
    80202086:	00005517          	auipc	a0,0x5
    8020208a:	3ba50513          	addi	a0,a0,954 # 80207440 <etext+0x440>
    8020208e:	8ccfe0ef          	jal	8020015a <printf>
    80202092:	7402                	ld	s0,32(sp)
    80202094:	70a2                	ld	ra,40(sp)
    80202096:	64e2                	ld	s1,24(sp)
    80202098:	6942                	ld	s2,16(sp)
    8020209a:	69a2                	ld	s3,8(sp)
    8020209c:	00007517          	auipc	a0,0x7
    802020a0:	80c53503          	ld	a0,-2036(a0) # 802088a8 <current_proc>
    802020a4:	4581                	li	a1,0
    802020a6:	6145                	addi	sp,sp,48
    802020a8:	e60ff06f          	j	80201708 <exit_process>

00000000802020ac <binit>:
    802020ac:	7179                	addi	sp,sp,-48
    802020ae:	00005597          	auipc	a1,0x5
    802020b2:	3aa58593          	addi	a1,a1,938 # 80207458 <etext+0x458>
    802020b6:	00007517          	auipc	a0,0x7
    802020ba:	d6a50513          	addi	a0,a0,-662 # 80208e20 <bcache>
    802020be:	f022                	sd	s0,32(sp)
    802020c0:	ec26                	sd	s1,24(sp)
    802020c2:	e84a                	sd	s2,16(sp)
    802020c4:	e44e                	sd	s3,8(sp)
    802020c6:	0000f917          	auipc	s2,0xf
    802020ca:	eca90913          	addi	s2,s2,-310 # 80210f90 <bcache+0x8170>
    802020ce:	e052                	sd	s4,0(sp)
    802020d0:	0000f497          	auipc	s1,0xf
    802020d4:	d5048493          	addi	s1,s1,-688 # 80210e20 <bcache+0x8000>
    802020d8:	f406                	sd	ra,40(sp)
    802020da:	9b6fe0ef          	jal	80200290 <initlock>
    802020de:	8a4a                	mv	s4,s2
    802020e0:	1b24b823          	sd	s2,432(s1)
    802020e4:	1b24bc23          	sd	s2,440(s1)
    802020e8:	874a                	mv	a4,s2
    802020ea:	00007417          	auipc	s0,0x7
    802020ee:	d4640413          	addi	s0,s0,-698 # 80208e30 <bcache+0x10>
    802020f2:	00005997          	auipc	s3,0x5
    802020f6:	36e98993          	addi	s3,s3,878 # 80207460 <etext+0x460>
    802020fa:	a011                	j	802020fe <binit+0x52>
    802020fc:	843e                	mv	s0,a5
    802020fe:	e438                	sd	a4,72(s0)
    80202100:	05243023          	sd	s2,64(s0)
    80202104:	85ce                	mv	a1,s3
    80202106:	01040513          	addi	a0,s0,16
    8020210a:	1ce010ef          	jal	802032d8 <initsleeplock>
    8020210e:	1b84b683          	ld	a3,440(s1)
    80202112:	45040793          	addi	a5,s0,1104
    80202116:	8722                	mv	a4,s0
    80202118:	e2a0                	sd	s0,64(a3)
    8020211a:	1a84bc23          	sd	s0,440(s1)
    8020211e:	fd479fe3          	bne	a5,s4,802020fc <binit+0x50>
    80202122:	70a2                	ld	ra,40(sp)
    80202124:	7402                	ld	s0,32(sp)
    80202126:	64e2                	ld	s1,24(sp)
    80202128:	6942                	ld	s2,16(sp)
    8020212a:	69a2                	ld	s3,8(sp)
    8020212c:	6a02                	ld	s4,0(sp)
    8020212e:	6145                	addi	sp,sp,48
    80202130:	8082                	ret

0000000080202132 <bread>:
    80202132:	7179                	addi	sp,sp,-48
    80202134:	02051793          	slli	a5,a0,0x20
    80202138:	9381                	srli	a5,a5,0x20
    8020213a:	ec26                	sd	s1,24(sp)
    8020213c:	02059713          	slli	a4,a1,0x20
    80202140:	84aa                	mv	s1,a0
    80202142:	00007517          	auipc	a0,0x7
    80202146:	cde50513          	addi	a0,a0,-802 # 80208e20 <bcache>
    8020214a:	f022                	sd	s0,32(sp)
    8020214c:	e84a                	sd	s2,16(sp)
    8020214e:	e44e                	sd	s3,8(sp)
    80202150:	f406                	sd	ra,40(sp)
    80202152:	00e7e9b3          	or	s3,a5,a4
    80202156:	892e                	mv	s2,a1
    80202158:	940fe0ef          	jal	80200298 <acquire>
    8020215c:	0000f697          	auipc	a3,0xf
    80202160:	cc468693          	addi	a3,a3,-828 # 80210e20 <bcache+0x8000>
    80202164:	1b86b403          	ld	s0,440(a3)
    80202168:	0000f797          	auipc	a5,0xf
    8020216c:	e2878793          	addi	a5,a5,-472 # 80210f90 <bcache+0x8170>
    80202170:	00f41663          	bne	s0,a5,8020217c <bread+0x4a>
    80202174:	a0b9                	j	802021c2 <bread+0x90>
    80202176:	6420                	ld	s0,72(s0)
    80202178:	04f40563          	beq	s0,a5,802021c2 <bread+0x90>
    8020217c:	4418                	lw	a4,8(s0)
    8020217e:	fe971ce3          	bne	a4,s1,80202176 <bread+0x44>
    80202182:	4458                	lw	a4,12(s0)
    80202184:	ff2719e3          	bne	a4,s2,80202176 <bread+0x44>
    80202188:	5c1c                	lw	a5,56(s0)
    8020218a:	00007517          	auipc	a0,0x7
    8020218e:	c9650513          	addi	a0,a0,-874 # 80208e20 <bcache>
    80202192:	2785                	addiw	a5,a5,1
    80202194:	dc1c                	sw	a5,56(s0)
    80202196:	914fe0ef          	jal	802002aa <release>
    8020219a:	01040513          	addi	a0,s0,16
    8020219e:	168010ef          	jal	80203306 <acquiresleep>
    802021a2:	401c                	lw	a5,0(s0)
    802021a4:	ebb9                	bnez	a5,802021fa <bread+0xc8>
    802021a6:	8522                	mv	a0,s0
    802021a8:	4581                	li	a1,0
    802021aa:	0a1010ef          	jal	80203a4a <virtio_disk_rw>
    802021ae:	4785                	li	a5,1
    802021b0:	70a2                	ld	ra,40(sp)
    802021b2:	c01c                	sw	a5,0(s0)
    802021b4:	8522                	mv	a0,s0
    802021b6:	7402                	ld	s0,32(sp)
    802021b8:	64e2                	ld	s1,24(sp)
    802021ba:	6942                	ld	s2,16(sp)
    802021bc:	69a2                	ld	s3,8(sp)
    802021be:	6145                	addi	sp,sp,48
    802021c0:	8082                	ret
    802021c2:	1b06b403          	ld	s0,432(a3)
    802021c6:	00f41663          	bne	s0,a5,802021d2 <bread+0xa0>
    802021ca:	a081                	j	8020220a <bread+0xd8>
    802021cc:	6020                	ld	s0,64(s0)
    802021ce:	02f40e63          	beq	s0,a5,8020220a <bread+0xd8>
    802021d2:	5c18                	lw	a4,56(s0)
    802021d4:	ff65                	bnez	a4,802021cc <bread+0x9a>
    802021d6:	4785                	li	a5,1
    802021d8:	dc1c                	sw	a5,56(s0)
    802021da:	00007517          	auipc	a0,0x7
    802021de:	c4650513          	addi	a0,a0,-954 # 80208e20 <bcache>
    802021e2:	01343423          	sd	s3,8(s0)
    802021e6:	00042023          	sw	zero,0(s0)
    802021ea:	8c0fe0ef          	jal	802002aa <release>
    802021ee:	01040513          	addi	a0,s0,16
    802021f2:	114010ef          	jal	80203306 <acquiresleep>
    802021f6:	401c                	lw	a5,0(s0)
    802021f8:	d7dd                	beqz	a5,802021a6 <bread+0x74>
    802021fa:	70a2                	ld	ra,40(sp)
    802021fc:	8522                	mv	a0,s0
    802021fe:	7402                	ld	s0,32(sp)
    80202200:	64e2                	ld	s1,24(sp)
    80202202:	6942                	ld	s2,16(sp)
    80202204:	69a2                	ld	s3,8(sp)
    80202206:	6145                	addi	sp,sp,48
    80202208:	8082                	ret
    8020220a:	00005517          	auipc	a0,0x5
    8020220e:	25e50513          	addi	a0,a0,606 # 80207468 <etext+0x468>
    80202212:	83efe0ef          	jal	80200250 <panic>

0000000080202216 <bwrite>:
    80202216:	1141                	addi	sp,sp,-16
    80202218:	e022                	sd	s0,0(sp)
    8020221a:	842a                	mv	s0,a0
    8020221c:	0541                	addi	a0,a0,16
    8020221e:	e406                	sd	ra,8(sp)
    80202220:	158010ef          	jal	80203378 <holdingsleep>
    80202224:	c901                	beqz	a0,80202234 <bwrite+0x1e>
    80202226:	8522                	mv	a0,s0
    80202228:	6402                	ld	s0,0(sp)
    8020222a:	60a2                	ld	ra,8(sp)
    8020222c:	4585                	li	a1,1
    8020222e:	0141                	addi	sp,sp,16
    80202230:	01b0106f          	j	80203a4a <virtio_disk_rw>
    80202234:	00005517          	auipc	a0,0x5
    80202238:	24c50513          	addi	a0,a0,588 # 80207480 <etext+0x480>
    8020223c:	814fe0ef          	jal	80200250 <panic>

0000000080202240 <brelse>:
    80202240:	1101                	addi	sp,sp,-32
    80202242:	e426                	sd	s1,8(sp)
    80202244:	01050493          	addi	s1,a0,16
    80202248:	e822                	sd	s0,16(sp)
    8020224a:	842a                	mv	s0,a0
    8020224c:	8526                	mv	a0,s1
    8020224e:	ec06                	sd	ra,24(sp)
    80202250:	128010ef          	jal	80203378 <holdingsleep>
    80202254:	cd21                	beqz	a0,802022ac <brelse+0x6c>
    80202256:	8526                	mv	a0,s1
    80202258:	0f0010ef          	jal	80203348 <releasesleep>
    8020225c:	00007517          	auipc	a0,0x7
    80202260:	bc450513          	addi	a0,a0,-1084 # 80208e20 <bcache>
    80202264:	834fe0ef          	jal	80200298 <acquire>
    80202268:	5c1c                	lw	a5,56(s0)
    8020226a:	fff7871b          	addiw	a4,a5,-1
    8020226e:	dc18                	sw	a4,56(s0)
    80202270:	e705                	bnez	a4,80202298 <brelse+0x58>
    80202272:	6434                	ld	a3,72(s0)
    80202274:	6038                	ld	a4,64(s0)
    80202276:	0000f797          	auipc	a5,0xf
    8020227a:	baa78793          	addi	a5,a5,-1110 # 80210e20 <bcache+0x8000>
    8020227e:	e2b8                	sd	a4,64(a3)
    80202280:	e734                	sd	a3,72(a4)
    80202282:	1b87b703          	ld	a4,440(a5)
    80202286:	0000f697          	auipc	a3,0xf
    8020228a:	d0a68693          	addi	a3,a3,-758 # 80210f90 <bcache+0x8170>
    8020228e:	e034                	sd	a3,64(s0)
    80202290:	e438                	sd	a4,72(s0)
    80202292:	e320                	sd	s0,64(a4)
    80202294:	1a87bc23          	sd	s0,440(a5)
    80202298:	6442                	ld	s0,16(sp)
    8020229a:	60e2                	ld	ra,24(sp)
    8020229c:	64a2                	ld	s1,8(sp)
    8020229e:	00007517          	auipc	a0,0x7
    802022a2:	b8250513          	addi	a0,a0,-1150 # 80208e20 <bcache>
    802022a6:	6105                	addi	sp,sp,32
    802022a8:	802fe06f          	j	802002aa <release>
    802022ac:	00005517          	auipc	a0,0x5
    802022b0:	1dc50513          	addi	a0,a0,476 # 80207488 <etext+0x488>
    802022b4:	f9dfd0ef          	jal	80200250 <panic>

00000000802022b8 <bpin>:
    802022b8:	1141                	addi	sp,sp,-16
    802022ba:	e022                	sd	s0,0(sp)
    802022bc:	842a                	mv	s0,a0
    802022be:	00007517          	auipc	a0,0x7
    802022c2:	b6250513          	addi	a0,a0,-1182 # 80208e20 <bcache>
    802022c6:	e406                	sd	ra,8(sp)
    802022c8:	fd1fd0ef          	jal	80200298 <acquire>
    802022cc:	5c1c                	lw	a5,56(s0)
    802022ce:	60a2                	ld	ra,8(sp)
    802022d0:	00007517          	auipc	a0,0x7
    802022d4:	b5050513          	addi	a0,a0,-1200 # 80208e20 <bcache>
    802022d8:	2785                	addiw	a5,a5,1
    802022da:	dc1c                	sw	a5,56(s0)
    802022dc:	6402                	ld	s0,0(sp)
    802022de:	0141                	addi	sp,sp,16
    802022e0:	fcbfd06f          	j	802002aa <release>

00000000802022e4 <bunpin>:
    802022e4:	1141                	addi	sp,sp,-16
    802022e6:	e022                	sd	s0,0(sp)
    802022e8:	842a                	mv	s0,a0
    802022ea:	00007517          	auipc	a0,0x7
    802022ee:	b3650513          	addi	a0,a0,-1226 # 80208e20 <bcache>
    802022f2:	e406                	sd	ra,8(sp)
    802022f4:	fa5fd0ef          	jal	80200298 <acquire>
    802022f8:	5c1c                	lw	a5,56(s0)
    802022fa:	60a2                	ld	ra,8(sp)
    802022fc:	00007517          	auipc	a0,0x7
    80202300:	b2450513          	addi	a0,a0,-1244 # 80208e20 <bcache>
    80202304:	37fd                	addiw	a5,a5,-1
    80202306:	dc1c                	sw	a5,56(s0)
    80202308:	6402                	ld	s0,0(sp)
    8020230a:	0141                	addi	sp,sp,16
    8020230c:	f9ffd06f          	j	802002aa <release>

0000000080202310 <bcache_reset>:
    80202310:	1141                	addi	sp,sp,-16
    80202312:	00007517          	auipc	a0,0x7
    80202316:	b0e50513          	addi	a0,a0,-1266 # 80208e20 <bcache>
    8020231a:	e406                	sd	ra,8(sp)
    8020231c:	f7dfd0ef          	jal	80200298 <acquire>
    80202320:	00007797          	auipc	a5,0x7
    80202324:	b1078793          	addi	a5,a5,-1264 # 80208e30 <bcache+0x10>
    80202328:	0000f717          	auipc	a4,0xf
    8020232c:	c6870713          	addi	a4,a4,-920 # 80210f90 <bcache+0x8170>
    80202330:	0007a023          	sw	zero,0(a5)
    80202334:	0207ac23          	sw	zero,56(a5)
    80202338:	45078793          	addi	a5,a5,1104
    8020233c:	fee79ae3          	bne	a5,a4,80202330 <bcache_reset+0x20>
    80202340:	60a2                	ld	ra,8(sp)
    80202342:	00007517          	auipc	a0,0x7
    80202346:	ade50513          	addi	a0,a0,-1314 # 80208e20 <bcache>
    8020234a:	0141                	addi	sp,sp,16
    8020234c:	f5ffd06f          	j	802002aa <release>

0000000080202350 <fileinit>:
    80202350:	00005597          	auipc	a1,0x5
    80202354:	14058593          	addi	a1,a1,320 # 80207490 <etext+0x490>
    80202358:	0000f517          	auipc	a0,0xf
    8020235c:	08850513          	addi	a0,a0,136 # 802113e0 <ftable>
    80202360:	f31fd06f          	j	80200290 <initlock>

0000000080202364 <filealloc>:
    80202364:	1141                	addi	sp,sp,-16
    80202366:	0000f517          	auipc	a0,0xf
    8020236a:	07a50513          	addi	a0,a0,122 # 802113e0 <ftable>
    8020236e:	e022                	sd	s0,0(sp)
    80202370:	e406                	sd	ra,8(sp)
    80202372:	f27fd0ef          	jal	80200298 <acquire>
    80202376:	0000f417          	auipc	s0,0xf
    8020237a:	07a40413          	addi	s0,s0,122 # 802113f0 <ftable+0x10>
    8020237e:	00010717          	auipc	a4,0x10
    80202382:	01270713          	addi	a4,a4,18 # 80212390 <devsw>
    80202386:	a029                	j	80202390 <filealloc+0x2c>
    80202388:	02840413          	addi	s0,s0,40
    8020238c:	02e40163          	beq	s0,a4,802023ae <filealloc+0x4a>
    80202390:	405c                	lw	a5,4(s0)
    80202392:	fbfd                	bnez	a5,80202388 <filealloc+0x24>
    80202394:	4785                	li	a5,1
    80202396:	c05c                	sw	a5,4(s0)
    80202398:	0000f517          	auipc	a0,0xf
    8020239c:	04850513          	addi	a0,a0,72 # 802113e0 <ftable>
    802023a0:	f0bfd0ef          	jal	802002aa <release>
    802023a4:	60a2                	ld	ra,8(sp)
    802023a6:	8522                	mv	a0,s0
    802023a8:	6402                	ld	s0,0(sp)
    802023aa:	0141                	addi	sp,sp,16
    802023ac:	8082                	ret
    802023ae:	0000f517          	auipc	a0,0xf
    802023b2:	03250513          	addi	a0,a0,50 # 802113e0 <ftable>
    802023b6:	ef5fd0ef          	jal	802002aa <release>
    802023ba:	4401                	li	s0,0
    802023bc:	60a2                	ld	ra,8(sp)
    802023be:	8522                	mv	a0,s0
    802023c0:	6402                	ld	s0,0(sp)
    802023c2:	0141                	addi	sp,sp,16
    802023c4:	8082                	ret

00000000802023c6 <filedup>:
    802023c6:	1141                	addi	sp,sp,-16
    802023c8:	e022                	sd	s0,0(sp)
    802023ca:	842a                	mv	s0,a0
    802023cc:	0000f517          	auipc	a0,0xf
    802023d0:	01450513          	addi	a0,a0,20 # 802113e0 <ftable>
    802023d4:	e406                	sd	ra,8(sp)
    802023d6:	ec3fd0ef          	jal	80200298 <acquire>
    802023da:	405c                	lw	a5,4(s0)
    802023dc:	00f05f63          	blez	a5,802023fa <filedup+0x34>
    802023e0:	2785                	addiw	a5,a5,1
    802023e2:	c05c                	sw	a5,4(s0)
    802023e4:	0000f517          	auipc	a0,0xf
    802023e8:	ffc50513          	addi	a0,a0,-4 # 802113e0 <ftable>
    802023ec:	ebffd0ef          	jal	802002aa <release>
    802023f0:	60a2                	ld	ra,8(sp)
    802023f2:	8522                	mv	a0,s0
    802023f4:	6402                	ld	s0,0(sp)
    802023f6:	0141                	addi	sp,sp,16
    802023f8:	8082                	ret
    802023fa:	00005517          	auipc	a0,0x5
    802023fe:	09e50513          	addi	a0,a0,158 # 80207498 <etext+0x498>
    80202402:	e4ffd0ef          	jal	80200250 <panic>

0000000080202406 <fileclose>:
    80202406:	1101                	addi	sp,sp,-32
    80202408:	e822                	sd	s0,16(sp)
    8020240a:	842a                	mv	s0,a0
    8020240c:	0000f517          	auipc	a0,0xf
    80202410:	fd450513          	addi	a0,a0,-44 # 802113e0 <ftable>
    80202414:	ec06                	sd	ra,24(sp)
    80202416:	e83fd0ef          	jal	80200298 <acquire>
    8020241a:	405c                	lw	a5,4(s0)
    8020241c:	04f05d63          	blez	a5,80202476 <fileclose+0x70>
    80202420:	fff7871b          	addiw	a4,a5,-1
    80202424:	c058                	sw	a4,4(s0)
    80202426:	e705                	bnez	a4,8020244e <fileclose+0x48>
    80202428:	e426                	sd	s1,8(sp)
    8020242a:	0000f517          	auipc	a0,0xf
    8020242e:	fb650513          	addi	a0,a0,-74 # 802113e0 <ftable>
    80202432:	4004                	lw	s1,0(s0)
    80202434:	00042023          	sw	zero,0(s0)
    80202438:	6c00                	ld	s0,24(s0)
    8020243a:	e71fd0ef          	jal	802002aa <release>
    8020243e:	4789                	li	a5,2
    80202440:	02f48063          	beq	s1,a5,80202460 <fileclose+0x5a>
    80202444:	60e2                	ld	ra,24(sp)
    80202446:	6442                	ld	s0,16(sp)
    80202448:	64a2                	ld	s1,8(sp)
    8020244a:	6105                	addi	sp,sp,32
    8020244c:	8082                	ret
    8020244e:	6442                	ld	s0,16(sp)
    80202450:	60e2                	ld	ra,24(sp)
    80202452:	0000f517          	auipc	a0,0xf
    80202456:	f8e50513          	addi	a0,a0,-114 # 802113e0 <ftable>
    8020245a:	6105                	addi	sp,sp,32
    8020245c:	e4ffd06f          	j	802002aa <release>
    80202460:	12d010ef          	jal	80203d8c <begin_op>
    80202464:	8522                	mv	a0,s0
    80202466:	78e000ef          	jal	80202bf4 <iput>
    8020246a:	6442                	ld	s0,16(sp)
    8020246c:	64a2                	ld	s1,8(sp)
    8020246e:	60e2                	ld	ra,24(sp)
    80202470:	6105                	addi	sp,sp,32
    80202472:	1790106f          	j	80203dea <end_op>
    80202476:	00005517          	auipc	a0,0x5
    8020247a:	02a50513          	addi	a0,a0,42 # 802074a0 <etext+0x4a0>
    8020247e:	e426                	sd	s1,8(sp)
    80202480:	dd1fd0ef          	jal	80200250 <panic>

0000000080202484 <fileread>:
    80202484:	1101                	addi	sp,sp,-32
    80202486:	ec06                	sd	ra,24(sp)
    80202488:	e426                	sd	s1,8(sp)
    8020248a:	00854783          	lbu	a5,8(a0)
    8020248e:	c7a1                	beqz	a5,802024d6 <fileread+0x52>
    80202490:	4118                	lw	a4,0(a0)
    80202492:	e822                	sd	s0,16(sp)
    80202494:	e04a                	sd	s2,0(sp)
    80202496:	4789                	li	a5,2
    80202498:	842a                	mv	s0,a0
    8020249a:	04f71063          	bne	a4,a5,802024da <fileread+0x56>
    8020249e:	6d08                	ld	a0,24(a0)
    802024a0:	84ae                	mv	s1,a1
    802024a2:	8932                	mv	s2,a2
    802024a4:	5d8000ef          	jal	80202a7c <ilock>
    802024a8:	5014                	lw	a3,32(s0)
    802024aa:	6c08                	ld	a0,24(s0)
    802024ac:	8626                	mv	a2,s1
    802024ae:	874a                	mv	a4,s2
    802024b0:	4581                	li	a1,0
    802024b2:	13f000ef          	jal	80202df0 <readi>
    802024b6:	84aa                	mv	s1,a0
    802024b8:	00a05563          	blez	a0,802024c2 <fileread+0x3e>
    802024bc:	501c                	lw	a5,32(s0)
    802024be:	9fa9                	addw	a5,a5,a0
    802024c0:	d01c                	sw	a5,32(s0)
    802024c2:	6c08                	ld	a0,24(s0)
    802024c4:	666000ef          	jal	80202b2a <iunlock>
    802024c8:	6442                	ld	s0,16(sp)
    802024ca:	6902                	ld	s2,0(sp)
    802024cc:	60e2                	ld	ra,24(sp)
    802024ce:	8526                	mv	a0,s1
    802024d0:	64a2                	ld	s1,8(sp)
    802024d2:	6105                	addi	sp,sp,32
    802024d4:	8082                	ret
    802024d6:	54fd                	li	s1,-1
    802024d8:	bfd5                	j	802024cc <fileread+0x48>
    802024da:	00005517          	auipc	a0,0x5
    802024de:	fd650513          	addi	a0,a0,-42 # 802074b0 <etext+0x4b0>
    802024e2:	d6ffd0ef          	jal	80200250 <panic>

00000000802024e6 <filewrite>:
    802024e6:	7139                	addi	sp,sp,-64
    802024e8:	fc06                	sd	ra,56(sp)
    802024ea:	f426                	sd	s1,40(sp)
    802024ec:	00954783          	lbu	a5,9(a0)
    802024f0:	c3dd                	beqz	a5,80202596 <filewrite+0xb0>
    802024f2:	4118                	lw	a4,0(a0)
    802024f4:	f822                	sd	s0,48(sp)
    802024f6:	4789                	li	a5,2
    802024f8:	842a                	mv	s0,a0
    802024fa:	0af71063          	bne	a4,a5,8020259a <filewrite+0xb4>
    802024fe:	e852                	sd	s4,16(sp)
    80202500:	8a32                	mv	s4,a2
    80202502:	08c05763          	blez	a2,80202590 <filewrite+0xaa>
    80202506:	e456                	sd	s5,8(sp)
    80202508:	6a85                	lui	s5,0x1
    8020250a:	e05a                	sd	s6,0(sp)
    8020250c:	f04a                	sd	s2,32(sp)
    8020250e:	ec4e                	sd	s3,24(sp)
    80202510:	8b2e                	mv	s6,a1
    80202512:	4481                	li	s1,0
    80202514:	c00a8a93          	addi	s5,s5,-1024 # c00 <_entry-0x801ff400>
    80202518:	a005                	j	80202538 <filewrite+0x52>
    8020251a:	501c                	lw	a5,32(s0)
    8020251c:	6c08                	ld	a0,24(s0)
    8020251e:	012787bb          	addw	a5,a5,s2
    80202522:	d01c                	sw	a5,32(s0)
    80202524:	606000ef          	jal	80202b2a <iunlock>
    80202528:	0c3010ef          	jal	80203dea <end_op>
    8020252c:	05299d63          	bne	s3,s2,80202586 <filewrite+0xa0>
    80202530:	013484bb          	addw	s1,s1,s3
    80202534:	0544d963          	bge	s1,s4,80202586 <filewrite+0xa0>
    80202538:	409a09bb          	subw	s3,s4,s1
    8020253c:	013ad363          	bge	s5,s3,80202542 <filewrite+0x5c>
    80202540:	89d6                	mv	s3,s5
    80202542:	04b010ef          	jal	80203d8c <begin_op>
    80202546:	6c08                	ld	a0,24(s0)
    80202548:	534000ef          	jal	80202a7c <ilock>
    8020254c:	5014                	lw	a3,32(s0)
    8020254e:	6c08                	ld	a0,24(s0)
    80202550:	874e                	mv	a4,s3
    80202552:	01648633          	add	a2,s1,s6
    80202556:	4581                	li	a1,0
    80202558:	1a7000ef          	jal	80202efe <writei>
    8020255c:	892a                	mv	s2,a0
    8020255e:	faa04ee3          	bgtz	a0,8020251a <filewrite+0x34>
    80202562:	6c08                	ld	a0,24(s0)
    80202564:	5c6000ef          	jal	80202b2a <iunlock>
    80202568:	083010ef          	jal	80203dea <end_op>
    8020256c:	7902                	ld	s2,32(sp)
    8020256e:	69e2                	ld	s3,24(sp)
    80202570:	6aa2                	ld	s5,8(sp)
    80202572:	6b02                	ld	s6,0(sp)
    80202574:	7442                	ld	s0,48(sp)
    80202576:	009a1f63          	bne	s4,s1,80202594 <filewrite+0xae>
    8020257a:	6a42                	ld	s4,16(sp)
    8020257c:	70e2                	ld	ra,56(sp)
    8020257e:	8526                	mv	a0,s1
    80202580:	74a2                	ld	s1,40(sp)
    80202582:	6121                	addi	sp,sp,64
    80202584:	8082                	ret
    80202586:	7902                	ld	s2,32(sp)
    80202588:	69e2                	ld	s3,24(sp)
    8020258a:	6aa2                	ld	s5,8(sp)
    8020258c:	6b02                	ld	s6,0(sp)
    8020258e:	b7dd                	j	80202574 <filewrite+0x8e>
    80202590:	4481                	li	s1,0
    80202592:	b7cd                	j	80202574 <filewrite+0x8e>
    80202594:	6a42                	ld	s4,16(sp)
    80202596:	54fd                	li	s1,-1
    80202598:	b7d5                	j	8020257c <filewrite+0x96>
    8020259a:	00005517          	auipc	a0,0x5
    8020259e:	f2650513          	addi	a0,a0,-218 # 802074c0 <etext+0x4c0>
    802025a2:	f04a                	sd	s2,32(sp)
    802025a4:	ec4e                	sd	s3,24(sp)
    802025a6:	e852                	sd	s4,16(sp)
    802025a8:	e456                	sd	s5,8(sp)
    802025aa:	e05a                	sd	s6,0(sp)
    802025ac:	ca5fd0ef          	jal	80200250 <panic>

00000000802025b0 <balloc>:
    802025b0:	715d                	addi	sp,sp,-80
    802025b2:	e85a                	sd	s6,16(sp)
    802025b4:	00012b17          	auipc	s6,0x12
    802025b8:	96cb0b13          	addi	s6,s6,-1684 # 80213f20 <sb>
    802025bc:	004b2783          	lw	a5,4(s6)
    802025c0:	e486                	sd	ra,72(sp)
    802025c2:	e0a2                	sd	s0,64(sp)
    802025c4:	cba5                	beqz	a5,80202634 <balloc+0x84>
    802025c6:	fc26                	sd	s1,56(sp)
    802025c8:	f84a                	sd	s2,48(sp)
    802025ca:	f44e                	sd	s3,40(sp)
    802025cc:	f052                	sd	s4,32(sp)
    802025ce:	ec56                	sd	s5,24(sp)
    802025d0:	84aa                	mv	s1,a0
    802025d2:	4a81                	li	s5,0
    802025d4:	4985                	li	s3,1
    802025d6:	6a09                	lui	s4,0x2
    802025d8:	6909                	lui	s2,0x2
    802025da:	01cb2783          	lw	a5,28(s6)
    802025de:	40dad59b          	sraiw	a1,s5,0xd
    802025e2:	8526                	mv	a0,s1
    802025e4:	9dbd                	addw	a1,a1,a5
    802025e6:	b4dff0ef          	jal	80202132 <bread>
    802025ea:	004b2803          	lw	a6,4(s6)
    802025ee:	000a841b          	sext.w	s0,s5
    802025f2:	4781                	li	a5,0
    802025f4:	a809                	j	80202606 <balloc+0x56>
    802025f6:	05074603          	lbu	a2,80(a4)
    802025fa:	00c6f5b3          	and	a1,a3,a2
    802025fe:	c9a1                	beqz	a1,8020264e <balloc+0x9e>
    80202600:	2405                	addiw	s0,s0,1
    80202602:	01478c63          	beq	a5,s4,8020261a <balloc+0x6a>
    80202606:	4037d713          	srai	a4,a5,0x3
    8020260a:	0077f693          	andi	a3,a5,7
    8020260e:	972a                	add	a4,a4,a0
    80202610:	00d996bb          	sllw	a3,s3,a3
    80202614:	2785                	addiw	a5,a5,1
    80202616:	ff0460e3          	bltu	s0,a6,802025f6 <balloc+0x46>
    8020261a:	c27ff0ef          	jal	80202240 <brelse>
    8020261e:	004b2783          	lw	a5,4(s6)
    80202622:	01590abb          	addw	s5,s2,s5
    80202626:	fafaeae3          	bltu	s5,a5,802025da <balloc+0x2a>
    8020262a:	74e2                	ld	s1,56(sp)
    8020262c:	7942                	ld	s2,48(sp)
    8020262e:	79a2                	ld	s3,40(sp)
    80202630:	7a02                	ld	s4,32(sp)
    80202632:	6ae2                	ld	s5,24(sp)
    80202634:	00005517          	auipc	a0,0x5
    80202638:	e9c50513          	addi	a0,a0,-356 # 802074d0 <etext+0x4d0>
    8020263c:	b1ffd0ef          	jal	8020015a <printf>
    80202640:	4401                	li	s0,0
    80202642:	60a6                	ld	ra,72(sp)
    80202644:	8522                	mv	a0,s0
    80202646:	6406                	ld	s0,64(sp)
    80202648:	6b42                	ld	s6,16(sp)
    8020264a:	6161                	addi	sp,sp,80
    8020264c:	8082                	ret
    8020264e:	8e55                	or	a2,a2,a3
    80202650:	04c70823          	sb	a2,80(a4)
    80202654:	e42a                	sd	a0,8(sp)
    80202656:	093010ef          	jal	80203ee8 <log_write>
    8020265a:	6522                	ld	a0,8(sp)
    8020265c:	be5ff0ef          	jal	80202240 <brelse>
    80202660:	60a6                	ld	ra,72(sp)
    80202662:	8522                	mv	a0,s0
    80202664:	6406                	ld	s0,64(sp)
    80202666:	74e2                	ld	s1,56(sp)
    80202668:	7942                	ld	s2,48(sp)
    8020266a:	79a2                	ld	s3,40(sp)
    8020266c:	7a02                	ld	s4,32(sp)
    8020266e:	6ae2                	ld	s5,24(sp)
    80202670:	6b42                	ld	s6,16(sp)
    80202672:	6161                	addi	sp,sp,80
    80202674:	8082                	ret

0000000080202676 <bmap>:
    80202676:	7179                	addi	sp,sp,-48
    80202678:	e84a                	sd	s2,16(sp)
    8020267a:	f406                	sd	ra,40(sp)
    8020267c:	f022                	sd	s0,32(sp)
    8020267e:	ec26                	sd	s1,24(sp)
    80202680:	47ad                	li	a5,11
    80202682:	892a                	mv	s2,a0
    80202684:	02b7e163          	bltu	a5,a1,802026a6 <bmap+0x30>
    80202688:	02059793          	slli	a5,a1,0x20
    8020268c:	01e7d593          	srli	a1,a5,0x1e
    80202690:	00b50433          	add	s0,a0,a1
    80202694:	4424                	lw	s1,72(s0)
    80202696:	c8c9                	beqz	s1,80202728 <bmap+0xb2>
    80202698:	70a2                	ld	ra,40(sp)
    8020269a:	7402                	ld	s0,32(sp)
    8020269c:	6942                	ld	s2,16(sp)
    8020269e:	8526                	mv	a0,s1
    802026a0:	64e2                	ld	s1,24(sp)
    802026a2:	6145                	addi	sp,sp,48
    802026a4:	8082                	ret
    802026a6:	ff45841b          	addiw	s0,a1,-12
    802026aa:	0004071b          	sext.w	a4,s0
    802026ae:	0ff00793          	li	a5,255
    802026b2:	0ae7e763          	bltu	a5,a4,80202760 <bmap+0xea>
    802026b6:	5d24                	lw	s1,120(a0)
    802026b8:	4108                	lw	a0,0(a0)
    802026ba:	e4c9                	bnez	s1,80202744 <bmap+0xce>
    802026bc:	ef5ff0ef          	jal	802025b0 <balloc>
    802026c0:	0005049b          	sext.w	s1,a0
    802026c4:	d8f1                	beqz	s1,80202698 <bmap+0x22>
    802026c6:	00092503          	lw	a0,0(s2) # 2000 <_entry-0x801fe000>
    802026ca:	e44e                	sd	s3,8(sp)
    802026cc:	85a6                	mv	a1,s1
    802026ce:	06992c23          	sw	s1,120(s2)
    802026d2:	a61ff0ef          	jal	80202132 <bread>
    802026d6:	89aa                	mv	s3,a0
    802026d8:	40000613          	li	a2,1024
    802026dc:	4581                	li	a1,0
    802026de:	05050513          	addi	a0,a0,80
    802026e2:	ea7fd0ef          	jal	80200588 <memset>
    802026e6:	854e                	mv	a0,s3
    802026e8:	001010ef          	jal	80203ee8 <log_write>
    802026ec:	854e                	mv	a0,s3
    802026ee:	b53ff0ef          	jal	80202240 <brelse>
    802026f2:	00092503          	lw	a0,0(s2)
    802026f6:	85a6                	mv	a1,s1
    802026f8:	a3bff0ef          	jal	80202132 <bread>
    802026fc:	02041713          	slli	a4,s0,0x20
    80202700:	05050793          	addi	a5,a0,80
    80202704:	01e75593          	srli	a1,a4,0x1e
    80202708:	00b78433          	add	s0,a5,a1
    8020270c:	4004                	lw	s1,0(s0)
    8020270e:	89aa                	mv	s3,a0
    80202710:	cc85                	beqz	s1,80202748 <bmap+0xd2>
    80202712:	854e                	mv	a0,s3
    80202714:	b2dff0ef          	jal	80202240 <brelse>
    80202718:	70a2                	ld	ra,40(sp)
    8020271a:	7402                	ld	s0,32(sp)
    8020271c:	69a2                	ld	s3,8(sp)
    8020271e:	6942                	ld	s2,16(sp)
    80202720:	8526                	mv	a0,s1
    80202722:	64e2                	ld	s1,24(sp)
    80202724:	6145                	addi	sp,sp,48
    80202726:	8082                	ret
    80202728:	4108                	lw	a0,0(a0)
    8020272a:	e87ff0ef          	jal	802025b0 <balloc>
    8020272e:	0005049b          	sext.w	s1,a0
    80202732:	d0bd                	beqz	s1,80202698 <bmap+0x22>
    80202734:	c424                	sw	s1,72(s0)
    80202736:	70a2                	ld	ra,40(sp)
    80202738:	7402                	ld	s0,32(sp)
    8020273a:	6942                	ld	s2,16(sp)
    8020273c:	8526                	mv	a0,s1
    8020273e:	64e2                	ld	s1,24(sp)
    80202740:	6145                	addi	sp,sp,48
    80202742:	8082                	ret
    80202744:	e44e                	sd	s3,8(sp)
    80202746:	bf45                	j	802026f6 <bmap+0x80>
    80202748:	00092503          	lw	a0,0(s2)
    8020274c:	e65ff0ef          	jal	802025b0 <balloc>
    80202750:	0005049b          	sext.w	s1,a0
    80202754:	dcdd                	beqz	s1,80202712 <bmap+0x9c>
    80202756:	c004                	sw	s1,0(s0)
    80202758:	854e                	mv	a0,s3
    8020275a:	78e010ef          	jal	80203ee8 <log_write>
    8020275e:	bf55                	j	80202712 <bmap+0x9c>
    80202760:	00005517          	auipc	a0,0x5
    80202764:	d8850513          	addi	a0,a0,-632 # 802074e8 <etext+0x4e8>
    80202768:	e44e                	sd	s3,8(sp)
    8020276a:	ae7fd0ef          	jal	80200250 <panic>

000000008020276e <iget>:
    8020276e:	7179                	addi	sp,sp,-48
    80202770:	ec26                	sd	s1,24(sp)
    80202772:	84aa                	mv	s1,a0
    80202774:	00010517          	auipc	a0,0x10
    80202778:	cbc50513          	addi	a0,a0,-836 # 80212430 <itable>
    8020277c:	f022                	sd	s0,32(sp)
    8020277e:	e84a                	sd	s2,16(sp)
    80202780:	e44e                	sd	s3,8(sp)
    80202782:	f406                	sd	ra,40(sp)
    80202784:	89ae                	mv	s3,a1
    80202786:	b13fd0ef          	jal	80200298 <acquire>
    8020278a:	4901                	li	s2,0
    8020278c:	00010417          	auipc	s0,0x10
    80202790:	cb440413          	addi	s0,s0,-844 # 80212440 <itable+0x10>
    80202794:	00011697          	auipc	a3,0x11
    80202798:	5ac68693          	addi	a3,a3,1452 # 80213d40 <disk>
    8020279c:	a801                	j	802027ac <iget+0x3e>
    8020279e:	4018                	lw	a4,0(s0)
    802027a0:	04970d63          	beq	a4,s1,802027fa <iget+0x8c>
    802027a4:	08040413          	addi	s0,s0,128
    802027a8:	00d40d63          	beq	s0,a3,802027c2 <iget+0x54>
    802027ac:	441c                	lw	a5,8(s0)
    802027ae:	fef048e3          	bgtz	a5,8020279e <iget+0x30>
    802027b2:	fe0919e3          	bnez	s2,802027a4 <iget+0x36>
    802027b6:	e7b5                	bnez	a5,80202822 <iget+0xb4>
    802027b8:	8922                	mv	s2,s0
    802027ba:	08040413          	addi	s0,s0,128
    802027be:	fed417e3          	bne	s0,a3,802027ac <iget+0x3e>
    802027c2:	06090863          	beqz	s2,80202832 <iget+0xc4>
    802027c6:	1482                	slli	s1,s1,0x20
    802027c8:	1982                	slli	s3,s3,0x20
    802027ca:	9081                	srli	s1,s1,0x20
    802027cc:	0134e4b3          	or	s1,s1,s3
    802027d0:	4785                	li	a5,1
    802027d2:	00993023          	sd	s1,0(s2)
    802027d6:	00f92423          	sw	a5,8(s2)
    802027da:	02092c23          	sw	zero,56(s2)
    802027de:	00010517          	auipc	a0,0x10
    802027e2:	c5250513          	addi	a0,a0,-942 # 80212430 <itable>
    802027e6:	ac5fd0ef          	jal	802002aa <release>
    802027ea:	70a2                	ld	ra,40(sp)
    802027ec:	7402                	ld	s0,32(sp)
    802027ee:	64e2                	ld	s1,24(sp)
    802027f0:	69a2                	ld	s3,8(sp)
    802027f2:	854a                	mv	a0,s2
    802027f4:	6942                	ld	s2,16(sp)
    802027f6:	6145                	addi	sp,sp,48
    802027f8:	8082                	ret
    802027fa:	4058                	lw	a4,4(s0)
    802027fc:	fb3714e3          	bne	a4,s3,802027a4 <iget+0x36>
    80202800:	2785                	addiw	a5,a5,1
    80202802:	00010517          	auipc	a0,0x10
    80202806:	c2e50513          	addi	a0,a0,-978 # 80212430 <itable>
    8020280a:	c41c                	sw	a5,8(s0)
    8020280c:	a9ffd0ef          	jal	802002aa <release>
    80202810:	8922                	mv	s2,s0
    80202812:	70a2                	ld	ra,40(sp)
    80202814:	7402                	ld	s0,32(sp)
    80202816:	64e2                	ld	s1,24(sp)
    80202818:	69a2                	ld	s3,8(sp)
    8020281a:	854a                	mv	a0,s2
    8020281c:	6942                	ld	s2,16(sp)
    8020281e:	6145                	addi	sp,sp,48
    80202820:	8082                	ret
    80202822:	08040413          	addi	s0,s0,128
    80202826:	00d40663          	beq	s0,a3,80202832 <iget+0xc4>
    8020282a:	441c                	lw	a5,8(s0)
    8020282c:	f6f049e3          	bgtz	a5,8020279e <iget+0x30>
    80202830:	b759                	j	802027b6 <iget+0x48>
    80202832:	00005517          	auipc	a0,0x5
    80202836:	cce50513          	addi	a0,a0,-818 # 80207500 <etext+0x500>
    8020283a:	a17fd0ef          	jal	80200250 <panic>

000000008020283e <bfree>:
    8020283e:	1101                	addi	sp,sp,-32
    80202840:	00011797          	auipc	a5,0x11
    80202844:	6fc7a783          	lw	a5,1788(a5) # 80213f3c <sb+0x1c>
    80202848:	e822                	sd	s0,16(sp)
    8020284a:	842e                	mv	s0,a1
    8020284c:	00d5d59b          	srliw	a1,a1,0xd
    80202850:	9dbd                	addw	a1,a1,a5
    80202852:	ec06                	sd	ra,24(sp)
    80202854:	e426                	sd	s1,8(sp)
    80202856:	8ddff0ef          	jal	80202132 <bread>
    8020285a:	4034579b          	sraiw	a5,s0,0x3
    8020285e:	3ff7f793          	andi	a5,a5,1023
    80202862:	97aa                	add	a5,a5,a0
    80202864:	0507c683          	lbu	a3,80(a5)
    80202868:	881d                	andi	s0,s0,7
    8020286a:	4705                	li	a4,1
    8020286c:	0087173b          	sllw	a4,a4,s0
    80202870:	00d77633          	and	a2,a4,a3
    80202874:	c205                	beqz	a2,80202894 <bfree+0x56>
    80202876:	fff74713          	not	a4,a4
    8020287a:	8ef9                	and	a3,a3,a4
    8020287c:	04d78823          	sb	a3,80(a5)
    80202880:	84aa                	mv	s1,a0
    80202882:	666010ef          	jal	80203ee8 <log_write>
    80202886:	6442                	ld	s0,16(sp)
    80202888:	60e2                	ld	ra,24(sp)
    8020288a:	8526                	mv	a0,s1
    8020288c:	64a2                	ld	s1,8(sp)
    8020288e:	6105                	addi	sp,sp,32
    80202890:	9b1ff06f          	j	80202240 <brelse>
    80202894:	00005517          	auipc	a0,0x5
    80202898:	c7c50513          	addi	a0,a0,-900 # 80207510 <etext+0x510>
    8020289c:	9b5fd0ef          	jal	80200250 <panic>

00000000802028a0 <readsb>:
    802028a0:	1101                	addi	sp,sp,-32
    802028a2:	e426                	sd	s1,8(sp)
    802028a4:	84ae                	mv	s1,a1
    802028a6:	4585                	li	a1,1
    802028a8:	ec06                	sd	ra,24(sp)
    802028aa:	e822                	sd	s0,16(sp)
    802028ac:	887ff0ef          	jal	80202132 <bread>
    802028b0:	842a                	mv	s0,a0
    802028b2:	05050593          	addi	a1,a0,80
    802028b6:	02000613          	li	a2,32
    802028ba:	8526                	mv	a0,s1
    802028bc:	ce9fd0ef          	jal	802005a4 <memmove>
    802028c0:	8522                	mv	a0,s0
    802028c2:	6442                	ld	s0,16(sp)
    802028c4:	60e2                	ld	ra,24(sp)
    802028c6:	64a2                	ld	s1,8(sp)
    802028c8:	6105                	addi	sp,sp,32
    802028ca:	977ff06f          	j	80202240 <brelse>

00000000802028ce <iinit>:
    802028ce:	1101                	addi	sp,sp,-32
    802028d0:	00005597          	auipc	a1,0x5
    802028d4:	c5858593          	addi	a1,a1,-936 # 80207528 <etext+0x528>
    802028d8:	00010517          	auipc	a0,0x10
    802028dc:	b5850513          	addi	a0,a0,-1192 # 80212430 <itable>
    802028e0:	e822                	sd	s0,16(sp)
    802028e2:	e426                	sd	s1,8(sp)
    802028e4:	e04a                	sd	s2,0(sp)
    802028e6:	ec06                	sd	ra,24(sp)
    802028e8:	00010417          	auipc	s0,0x10
    802028ec:	b6840413          	addi	s0,s0,-1176 # 80212450 <itable+0x20>
    802028f0:	9a1fd0ef          	jal	80200290 <initlock>
    802028f4:	00011917          	auipc	s2,0x11
    802028f8:	45c90913          	addi	s2,s2,1116 # 80213d50 <disk+0x10>
    802028fc:	00005497          	auipc	s1,0x5
    80202900:	c3448493          	addi	s1,s1,-972 # 80207530 <etext+0x530>
    80202904:	8522                	mv	a0,s0
    80202906:	85a6                	mv	a1,s1
    80202908:	08040413          	addi	s0,s0,128
    8020290c:	1cd000ef          	jal	802032d8 <initsleeplock>
    80202910:	ff241ae3          	bne	s0,s2,80202904 <iinit+0x36>
    80202914:	60e2                	ld	ra,24(sp)
    80202916:	6442                	ld	s0,16(sp)
    80202918:	64a2                	ld	s1,8(sp)
    8020291a:	6902                	ld	s2,0(sp)
    8020291c:	6105                	addi	sp,sp,32
    8020291e:	8082                	ret

0000000080202920 <ialloc>:
    80202920:	7139                	addi	sp,sp,-64
    80202922:	ec4e                	sd	s3,24(sp)
    80202924:	00011997          	auipc	s3,0x11
    80202928:	5fc98993          	addi	s3,s3,1532 # 80213f20 <sb>
    8020292c:	00c9a703          	lw	a4,12(s3)
    80202930:	fc06                	sd	ra,56(sp)
    80202932:	4785                	li	a5,1
    80202934:	08e7f563          	bgeu	a5,a4,802029be <ialloc+0x9e>
    80202938:	f822                	sd	s0,48(sp)
    8020293a:	e852                	sd	s4,16(sp)
    8020293c:	e456                	sd	s5,8(sp)
    8020293e:	f426                	sd	s1,40(sp)
    80202940:	f04a                	sd	s2,32(sp)
    80202942:	8a2a                	mv	s4,a0
    80202944:	8aae                	mv	s5,a1
    80202946:	4405                	li	s0,1
    80202948:	a811                	j	8020295c <ialloc+0x3c>
    8020294a:	8f7ff0ef          	jal	80202240 <brelse>
    8020294e:	00c9a703          	lw	a4,12(s3)
    80202952:	0405                	addi	s0,s0,1
    80202954:	0004079b          	sext.w	a5,s0
    80202958:	04e7fe63          	bgeu	a5,a4,802029b4 <ialloc+0x94>
    8020295c:	0189a783          	lw	a5,24(s3)
    80202960:	00445593          	srli	a1,s0,0x4
    80202964:	8552                	mv	a0,s4
    80202966:	9dbd                	addw	a1,a1,a5
    80202968:	fcaff0ef          	jal	80202132 <bread>
    8020296c:	00f47793          	andi	a5,s0,15
    80202970:	079a                	slli	a5,a5,0x6
    80202972:	05050913          	addi	s2,a0,80
    80202976:	993e                	add	s2,s2,a5
    80202978:	00091783          	lh	a5,0(s2)
    8020297c:	84aa                	mv	s1,a0
    8020297e:	f7f1                	bnez	a5,8020294a <ialloc+0x2a>
    80202980:	4581                	li	a1,0
    80202982:	04000613          	li	a2,64
    80202986:	854a                	mv	a0,s2
    80202988:	c01fd0ef          	jal	80200588 <memset>
    8020298c:	8526                	mv	a0,s1
    8020298e:	01591023          	sh	s5,0(s2)
    80202992:	556010ef          	jal	80203ee8 <log_write>
    80202996:	8526                	mv	a0,s1
    80202998:	8a9ff0ef          	jal	80202240 <brelse>
    8020299c:	0004059b          	sext.w	a1,s0
    802029a0:	7442                	ld	s0,48(sp)
    802029a2:	74a2                	ld	s1,40(sp)
    802029a4:	7902                	ld	s2,32(sp)
    802029a6:	6aa2                	ld	s5,8(sp)
    802029a8:	70e2                	ld	ra,56(sp)
    802029aa:	69e2                	ld	s3,24(sp)
    802029ac:	8552                	mv	a0,s4
    802029ae:	6a42                	ld	s4,16(sp)
    802029b0:	6121                	addi	sp,sp,64
    802029b2:	bb75                	j	8020276e <iget>
    802029b4:	7442                	ld	s0,48(sp)
    802029b6:	74a2                	ld	s1,40(sp)
    802029b8:	7902                	ld	s2,32(sp)
    802029ba:	6a42                	ld	s4,16(sp)
    802029bc:	6aa2                	ld	s5,8(sp)
    802029be:	00005517          	auipc	a0,0x5
    802029c2:	b7a50513          	addi	a0,a0,-1158 # 80207538 <etext+0x538>
    802029c6:	f94fd0ef          	jal	8020015a <printf>
    802029ca:	70e2                	ld	ra,56(sp)
    802029cc:	69e2                	ld	s3,24(sp)
    802029ce:	4501                	li	a0,0
    802029d0:	6121                	addi	sp,sp,64
    802029d2:	8082                	ret

00000000802029d4 <iupdate>:
    802029d4:	415c                	lw	a5,4(a0)
    802029d6:	1101                	addi	sp,sp,-32
    802029d8:	e822                	sd	s0,16(sp)
    802029da:	842a                	mv	s0,a0
    802029dc:	4108                	lw	a0,0(a0)
    802029de:	0047d79b          	srliw	a5,a5,0x4
    802029e2:	00011597          	auipc	a1,0x11
    802029e6:	5565a583          	lw	a1,1366(a1) # 80213f38 <sb+0x18>
    802029ea:	9dbd                	addw	a1,a1,a5
    802029ec:	ec06                	sd	ra,24(sp)
    802029ee:	e426                	sd	s1,8(sp)
    802029f0:	f42ff0ef          	jal	80202132 <bread>
    802029f4:	405c                	lw	a5,4(s0)
    802029f6:	03c45883          	lhu	a7,60(s0)
    802029fa:	03e45803          	lhu	a6,62(s0)
    802029fe:	04045583          	lhu	a1,64(s0)
    80202a02:	04245603          	lhu	a2,66(s0)
    80202a06:	4074                	lw	a3,68(s0)
    80202a08:	00f7f713          	andi	a4,a5,15
    80202a0c:	071a                	slli	a4,a4,0x6
    80202a0e:	05050793          	addi	a5,a0,80
    80202a12:	97ba                	add	a5,a5,a4
    80202a14:	84aa                	mv	s1,a0
    80202a16:	00b79223          	sh	a1,4(a5)
    80202a1a:	00c79323          	sh	a2,6(a5)
    80202a1e:	04840593          	addi	a1,s0,72
    80202a22:	01179023          	sh	a7,0(a5)
    80202a26:	01079123          	sh	a6,2(a5)
    80202a2a:	c794                	sw	a3,8(a5)
    80202a2c:	03400613          	li	a2,52
    80202a30:	00c78513          	addi	a0,a5,12
    80202a34:	b71fd0ef          	jal	802005a4 <memmove>
    80202a38:	8526                	mv	a0,s1
    80202a3a:	4ae010ef          	jal	80203ee8 <log_write>
    80202a3e:	6442                	ld	s0,16(sp)
    80202a40:	60e2                	ld	ra,24(sp)
    80202a42:	8526                	mv	a0,s1
    80202a44:	64a2                	ld	s1,8(sp)
    80202a46:	6105                	addi	sp,sp,32
    80202a48:	ff8ff06f          	j	80202240 <brelse>

0000000080202a4c <idup>:
    80202a4c:	1141                	addi	sp,sp,-16
    80202a4e:	e022                	sd	s0,0(sp)
    80202a50:	842a                	mv	s0,a0
    80202a52:	00010517          	auipc	a0,0x10
    80202a56:	9de50513          	addi	a0,a0,-1570 # 80212430 <itable>
    80202a5a:	e406                	sd	ra,8(sp)
    80202a5c:	83dfd0ef          	jal	80200298 <acquire>
    80202a60:	441c                	lw	a5,8(s0)
    80202a62:	00010517          	auipc	a0,0x10
    80202a66:	9ce50513          	addi	a0,a0,-1586 # 80212430 <itable>
    80202a6a:	2785                	addiw	a5,a5,1
    80202a6c:	c41c                	sw	a5,8(s0)
    80202a6e:	83dfd0ef          	jal	802002aa <release>
    80202a72:	60a2                	ld	ra,8(sp)
    80202a74:	8522                	mv	a0,s0
    80202a76:	6402                	ld	s0,0(sp)
    80202a78:	0141                	addi	sp,sp,16
    80202a7a:	8082                	ret

0000000080202a7c <ilock>:
    80202a7c:	1101                	addi	sp,sp,-32
    80202a7e:	ec06                	sd	ra,24(sp)
    80202a80:	e822                	sd	s0,16(sp)
    80202a82:	c559                	beqz	a0,80202b10 <ilock+0x94>
    80202a84:	451c                	lw	a5,8(a0)
    80202a86:	842a                	mv	s0,a0
    80202a88:	08f05463          	blez	a5,80202b10 <ilock+0x94>
    80202a8c:	0541                	addi	a0,a0,16
    80202a8e:	079000ef          	jal	80203306 <acquiresleep>
    80202a92:	5c1c                	lw	a5,56(s0)
    80202a94:	c789                	beqz	a5,80202a9e <ilock+0x22>
    80202a96:	60e2                	ld	ra,24(sp)
    80202a98:	6442                	ld	s0,16(sp)
    80202a9a:	6105                	addi	sp,sp,32
    80202a9c:	8082                	ret
    80202a9e:	405c                	lw	a5,4(s0)
    80202aa0:	4008                	lw	a0,0(s0)
    80202aa2:	00011597          	auipc	a1,0x11
    80202aa6:	4965a583          	lw	a1,1174(a1) # 80213f38 <sb+0x18>
    80202aaa:	0047d79b          	srliw	a5,a5,0x4
    80202aae:	9dbd                	addw	a1,a1,a5
    80202ab0:	e426                	sd	s1,8(sp)
    80202ab2:	e80ff0ef          	jal	80202132 <bread>
    80202ab6:	405c                	lw	a5,4(s0)
    80202ab8:	05050593          	addi	a1,a0,80
    80202abc:	84aa                	mv	s1,a0
    80202abe:	8bbd                	andi	a5,a5,15
    80202ac0:	079a                	slli	a5,a5,0x6
    80202ac2:	95be                	add	a1,a1,a5
    80202ac4:	0005d503          	lhu	a0,0(a1)
    80202ac8:	0025d603          	lhu	a2,2(a1)
    80202acc:	0065d703          	lhu	a4,6(a1)
    80202ad0:	459c                	lw	a5,8(a1)
    80202ad2:	0045d683          	lhu	a3,4(a1)
    80202ad6:	04e41123          	sh	a4,66(s0)
    80202ada:	c07c                	sw	a5,68(s0)
    80202adc:	02a41e23          	sh	a0,60(s0)
    80202ae0:	02c41f23          	sh	a2,62(s0)
    80202ae4:	04d41023          	sh	a3,64(s0)
    80202ae8:	03400613          	li	a2,52
    80202aec:	05b1                	addi	a1,a1,12
    80202aee:	04840513          	addi	a0,s0,72
    80202af2:	ab3fd0ef          	jal	802005a4 <memmove>
    80202af6:	8526                	mv	a0,s1
    80202af8:	f48ff0ef          	jal	80202240 <brelse>
    80202afc:	03c41783          	lh	a5,60(s0)
    80202b00:	4705                	li	a4,1
    80202b02:	dc18                	sw	a4,56(s0)
    80202b04:	cf89                	beqz	a5,80202b1e <ilock+0xa2>
    80202b06:	60e2                	ld	ra,24(sp)
    80202b08:	6442                	ld	s0,16(sp)
    80202b0a:	64a2                	ld	s1,8(sp)
    80202b0c:	6105                	addi	sp,sp,32
    80202b0e:	8082                	ret
    80202b10:	00005517          	auipc	a0,0x5
    80202b14:	a4050513          	addi	a0,a0,-1472 # 80207550 <etext+0x550>
    80202b18:	e426                	sd	s1,8(sp)
    80202b1a:	f36fd0ef          	jal	80200250 <panic>
    80202b1e:	00005517          	auipc	a0,0x5
    80202b22:	a3a50513          	addi	a0,a0,-1478 # 80207558 <etext+0x558>
    80202b26:	f2afd0ef          	jal	80200250 <panic>

0000000080202b2a <iunlock>:
    80202b2a:	1101                	addi	sp,sp,-32
    80202b2c:	ec06                	sd	ra,24(sp)
    80202b2e:	e822                	sd	s0,16(sp)
    80202b30:	e426                	sd	s1,8(sp)
    80202b32:	c115                	beqz	a0,80202b56 <iunlock+0x2c>
    80202b34:	01050493          	addi	s1,a0,16
    80202b38:	842a                	mv	s0,a0
    80202b3a:	8526                	mv	a0,s1
    80202b3c:	03d000ef          	jal	80203378 <holdingsleep>
    80202b40:	c919                	beqz	a0,80202b56 <iunlock+0x2c>
    80202b42:	441c                	lw	a5,8(s0)
    80202b44:	00f05963          	blez	a5,80202b56 <iunlock+0x2c>
    80202b48:	6442                	ld	s0,16(sp)
    80202b4a:	60e2                	ld	ra,24(sp)
    80202b4c:	8526                	mv	a0,s1
    80202b4e:	64a2                	ld	s1,8(sp)
    80202b50:	6105                	addi	sp,sp,32
    80202b52:	7f60006f          	j	80203348 <releasesleep>
    80202b56:	00005517          	auipc	a0,0x5
    80202b5a:	a1250513          	addi	a0,a0,-1518 # 80207568 <etext+0x568>
    80202b5e:	ef2fd0ef          	jal	80200250 <panic>

0000000080202b62 <itrunc>:
    80202b62:	7179                	addi	sp,sp,-48
    80202b64:	f022                	sd	s0,32(sp)
    80202b66:	ec26                	sd	s1,24(sp)
    80202b68:	e84a                	sd	s2,16(sp)
    80202b6a:	f406                	sd	ra,40(sp)
    80202b6c:	892a                	mv	s2,a0
    80202b6e:	04850413          	addi	s0,a0,72
    80202b72:	07850493          	addi	s1,a0,120
    80202b76:	a021                	j	80202b7e <itrunc+0x1c>
    80202b78:	0411                	addi	s0,s0,4
    80202b7a:	00940d63          	beq	s0,s1,80202b94 <itrunc+0x32>
    80202b7e:	400c                	lw	a1,0(s0)
    80202b80:	dde5                	beqz	a1,80202b78 <itrunc+0x16>
    80202b82:	00092503          	lw	a0,0(s2)
    80202b86:	0411                	addi	s0,s0,4
    80202b88:	cb7ff0ef          	jal	8020283e <bfree>
    80202b8c:	fe042e23          	sw	zero,-4(s0)
    80202b90:	fe9417e3          	bne	s0,s1,80202b7e <itrunc+0x1c>
    80202b94:	07892583          	lw	a1,120(s2)
    80202b98:	e991                	bnez	a1,80202bac <itrunc+0x4a>
    80202b9a:	7402                	ld	s0,32(sp)
    80202b9c:	70a2                	ld	ra,40(sp)
    80202b9e:	64e2                	ld	s1,24(sp)
    80202ba0:	04092223          	sw	zero,68(s2)
    80202ba4:	854a                	mv	a0,s2
    80202ba6:	6942                	ld	s2,16(sp)
    80202ba8:	6145                	addi	sp,sp,48
    80202baa:	b52d                	j	802029d4 <iupdate>
    80202bac:	00092503          	lw	a0,0(s2)
    80202bb0:	e44e                	sd	s3,8(sp)
    80202bb2:	d80ff0ef          	jal	80202132 <bread>
    80202bb6:	89aa                	mv	s3,a0
    80202bb8:	05050413          	addi	s0,a0,80
    80202bbc:	45050493          	addi	s1,a0,1104
    80202bc0:	a021                	j	80202bc8 <itrunc+0x66>
    80202bc2:	0411                	addi	s0,s0,4
    80202bc4:	00940b63          	beq	s0,s1,80202bda <itrunc+0x78>
    80202bc8:	400c                	lw	a1,0(s0)
    80202bca:	dde5                	beqz	a1,80202bc2 <itrunc+0x60>
    80202bcc:	00092503          	lw	a0,0(s2)
    80202bd0:	0411                	addi	s0,s0,4
    80202bd2:	c6dff0ef          	jal	8020283e <bfree>
    80202bd6:	fe9419e3          	bne	s0,s1,80202bc8 <itrunc+0x66>
    80202bda:	854e                	mv	a0,s3
    80202bdc:	e64ff0ef          	jal	80202240 <brelse>
    80202be0:	07892583          	lw	a1,120(s2)
    80202be4:	00092503          	lw	a0,0(s2)
    80202be8:	c57ff0ef          	jal	8020283e <bfree>
    80202bec:	69a2                	ld	s3,8(sp)
    80202bee:	06092c23          	sw	zero,120(s2)
    80202bf2:	b765                	j	80202b9a <itrunc+0x38>

0000000080202bf4 <iput>:
    80202bf4:	1101                	addi	sp,sp,-32
    80202bf6:	e822                	sd	s0,16(sp)
    80202bf8:	842a                	mv	s0,a0
    80202bfa:	00010517          	auipc	a0,0x10
    80202bfe:	83650513          	addi	a0,a0,-1994 # 80212430 <itable>
    80202c02:	ec06                	sd	ra,24(sp)
    80202c04:	e94fd0ef          	jal	80200298 <acquire>
    80202c08:	441c                	lw	a5,8(s0)
    80202c0a:	4705                	li	a4,1
    80202c0c:	00e78d63          	beq	a5,a4,80202c26 <iput+0x32>
    80202c10:	37fd                	addiw	a5,a5,-1
    80202c12:	c41c                	sw	a5,8(s0)
    80202c14:	6442                	ld	s0,16(sp)
    80202c16:	60e2                	ld	ra,24(sp)
    80202c18:	00010517          	auipc	a0,0x10
    80202c1c:	81850513          	addi	a0,a0,-2024 # 80212430 <itable>
    80202c20:	6105                	addi	sp,sp,32
    80202c22:	e88fd06f          	j	802002aa <release>
    80202c26:	5c18                	lw	a4,56(s0)
    80202c28:	d765                	beqz	a4,80202c10 <iput+0x1c>
    80202c2a:	04241703          	lh	a4,66(s0)
    80202c2e:	f36d                	bnez	a4,80202c10 <iput+0x1c>
    80202c30:	e426                	sd	s1,8(sp)
    80202c32:	01040493          	addi	s1,s0,16
    80202c36:	8526                	mv	a0,s1
    80202c38:	6ce000ef          	jal	80203306 <acquiresleep>
    80202c3c:	0000f517          	auipc	a0,0xf
    80202c40:	7f450513          	addi	a0,a0,2036 # 80212430 <itable>
    80202c44:	e66fd0ef          	jal	802002aa <release>
    80202c48:	8522                	mv	a0,s0
    80202c4a:	f19ff0ef          	jal	80202b62 <itrunc>
    80202c4e:	8522                	mv	a0,s0
    80202c50:	02041e23          	sh	zero,60(s0)
    80202c54:	d81ff0ef          	jal	802029d4 <iupdate>
    80202c58:	8526                	mv	a0,s1
    80202c5a:	02042c23          	sw	zero,56(s0)
    80202c5e:	6ea000ef          	jal	80203348 <releasesleep>
    80202c62:	0000f517          	auipc	a0,0xf
    80202c66:	7ce50513          	addi	a0,a0,1998 # 80212430 <itable>
    80202c6a:	e2efd0ef          	jal	80200298 <acquire>
    80202c6e:	441c                	lw	a5,8(s0)
    80202c70:	64a2                	ld	s1,8(sp)
    80202c72:	bf79                	j	80202c10 <iput+0x1c>

0000000080202c74 <iunlockput>:
    80202c74:	1101                	addi	sp,sp,-32
    80202c76:	ec06                	sd	ra,24(sp)
    80202c78:	e822                	sd	s0,16(sp)
    80202c7a:	e426                	sd	s1,8(sp)
    80202c7c:	c505                	beqz	a0,80202ca4 <iunlockput+0x30>
    80202c7e:	01050493          	addi	s1,a0,16
    80202c82:	842a                	mv	s0,a0
    80202c84:	8526                	mv	a0,s1
    80202c86:	6f2000ef          	jal	80203378 <holdingsleep>
    80202c8a:	cd09                	beqz	a0,80202ca4 <iunlockput+0x30>
    80202c8c:	441c                	lw	a5,8(s0)
    80202c8e:	00f05b63          	blez	a5,80202ca4 <iunlockput+0x30>
    80202c92:	8526                	mv	a0,s1
    80202c94:	6b4000ef          	jal	80203348 <releasesleep>
    80202c98:	8522                	mv	a0,s0
    80202c9a:	6442                	ld	s0,16(sp)
    80202c9c:	60e2                	ld	ra,24(sp)
    80202c9e:	64a2                	ld	s1,8(sp)
    80202ca0:	6105                	addi	sp,sp,32
    80202ca2:	bf89                	j	80202bf4 <iput>
    80202ca4:	00005517          	auipc	a0,0x5
    80202ca8:	8c450513          	addi	a0,a0,-1852 # 80207568 <etext+0x568>
    80202cac:	da4fd0ef          	jal	80200250 <panic>

0000000080202cb0 <ireclaim>:
    80202cb0:	7139                	addi	sp,sp,-64
    80202cb2:	f04a                	sd	s2,32(sp)
    80202cb4:	00011917          	auipc	s2,0x11
    80202cb8:	26c90913          	addi	s2,s2,620 # 80213f20 <sb>
    80202cbc:	00c92783          	lw	a5,12(s2)
    80202cc0:	f822                	sd	s0,48(sp)
    80202cc2:	fc06                	sd	ra,56(sp)
    80202cc4:	4405                	li	s0,1
    80202cc6:	0af47a63          	bgeu	s0,a5,80202d7a <ireclaim+0xca>
    80202cca:	ec4e                	sd	s3,24(sp)
    80202ccc:	e852                	sd	s4,16(sp)
    80202cce:	e456                	sd	s5,8(sp)
    80202cd0:	f426                	sd	s1,40(sp)
    80202cd2:	89aa                	mv	s3,a0
    80202cd4:	4a85                	li	s5,1
    80202cd6:	00005a17          	auipc	s4,0x5
    80202cda:	89aa0a13          	addi	s4,s4,-1894 # 80207570 <etext+0x570>
    80202cde:	a811                	j	80202cf2 <ireclaim+0x42>
    80202ce0:	d60ff0ef          	jal	80202240 <brelse>
    80202ce4:	00c92783          	lw	a5,12(s2)
    80202ce8:	0405                	addi	s0,s0,1
    80202cea:	00040a9b          	sext.w	s5,s0
    80202cee:	08faf263          	bgeu	s5,a5,80202d72 <ireclaim+0xc2>
    80202cf2:	01892783          	lw	a5,24(s2)
    80202cf6:	00445593          	srli	a1,s0,0x4
    80202cfa:	854e                	mv	a0,s3
    80202cfc:	9dbd                	addw	a1,a1,a5
    80202cfe:	c34ff0ef          	jal	80202132 <bread>
    80202d02:	00faf793          	andi	a5,s5,15
    80202d06:	05050713          	addi	a4,a0,80
    80202d0a:	079a                	slli	a5,a5,0x6
    80202d0c:	97ba                	add	a5,a5,a4
    80202d0e:	00079703          	lh	a4,0(a5)
    80202d12:	84aa                	mv	s1,a0
    80202d14:	d771                	beqz	a4,80202ce0 <ireclaim+0x30>
    80202d16:	00679783          	lh	a5,6(a5)
    80202d1a:	f3f9                	bnez	a5,80202ce0 <ireclaim+0x30>
    80202d1c:	85d6                	mv	a1,s5
    80202d1e:	8552                	mv	a0,s4
    80202d20:	c3afd0ef          	jal	8020015a <printf>
    80202d24:	85d6                	mv	a1,s5
    80202d26:	854e                	mv	a0,s3
    80202d28:	a47ff0ef          	jal	8020276e <iget>
    80202d2c:	87aa                	mv	a5,a0
    80202d2e:	8526                	mv	a0,s1
    80202d30:	84be                	mv	s1,a5
    80202d32:	d0eff0ef          	jal	80202240 <brelse>
    80202d36:	d4dd                	beqz	s1,80202ce4 <ireclaim+0x34>
    80202d38:	054010ef          	jal	80203d8c <begin_op>
    80202d3c:	8526                	mv	a0,s1
    80202d3e:	d3fff0ef          	jal	80202a7c <ilock>
    80202d42:	01048a93          	addi	s5,s1,16
    80202d46:	8556                	mv	a0,s5
    80202d48:	630000ef          	jal	80203378 <holdingsleep>
    80202d4c:	cd05                	beqz	a0,80202d84 <ireclaim+0xd4>
    80202d4e:	449c                	lw	a5,8(s1)
    80202d50:	02f05a63          	blez	a5,80202d84 <ireclaim+0xd4>
    80202d54:	8556                	mv	a0,s5
    80202d56:	5f2000ef          	jal	80203348 <releasesleep>
    80202d5a:	8526                	mv	a0,s1
    80202d5c:	e99ff0ef          	jal	80202bf4 <iput>
    80202d60:	08a010ef          	jal	80203dea <end_op>
    80202d64:	00c92783          	lw	a5,12(s2)
    80202d68:	0405                	addi	s0,s0,1
    80202d6a:	00040a9b          	sext.w	s5,s0
    80202d6e:	f8fae2e3          	bltu	s5,a5,80202cf2 <ireclaim+0x42>
    80202d72:	74a2                	ld	s1,40(sp)
    80202d74:	69e2                	ld	s3,24(sp)
    80202d76:	6a42                	ld	s4,16(sp)
    80202d78:	6aa2                	ld	s5,8(sp)
    80202d7a:	70e2                	ld	ra,56(sp)
    80202d7c:	7442                	ld	s0,48(sp)
    80202d7e:	7902                	ld	s2,32(sp)
    80202d80:	6121                	addi	sp,sp,64
    80202d82:	8082                	ret
    80202d84:	00004517          	auipc	a0,0x4
    80202d88:	7e450513          	addi	a0,a0,2020 # 80207568 <etext+0x568>
    80202d8c:	cc4fd0ef          	jal	80200250 <panic>

0000000080202d90 <fsinit>:
    80202d90:	1101                	addi	sp,sp,-32
    80202d92:	4585                	li	a1,1
    80202d94:	ec06                	sd	ra,24(sp)
    80202d96:	e822                	sd	s0,16(sp)
    80202d98:	e426                	sd	s1,8(sp)
    80202d9a:	842a                	mv	s0,a0
    80202d9c:	b96ff0ef          	jal	80202132 <bread>
    80202da0:	05050593          	addi	a1,a0,80
    80202da4:	84aa                	mv	s1,a0
    80202da6:	02000613          	li	a2,32
    80202daa:	00011517          	auipc	a0,0x11
    80202dae:	17650513          	addi	a0,a0,374 # 80213f20 <sb>
    80202db2:	ff2fd0ef          	jal	802005a4 <memmove>
    80202db6:	8526                	mv	a0,s1
    80202db8:	c88ff0ef          	jal	80202240 <brelse>
    80202dbc:	00011597          	auipc	a1,0x11
    80202dc0:	16458593          	addi	a1,a1,356 # 80213f20 <sb>
    80202dc4:	4198                	lw	a4,0(a1)
    80202dc6:	102037b7          	lui	a5,0x10203
    80202dca:	04078793          	addi	a5,a5,64 # 10203040 <_entry-0x6fffcfc0>
    80202dce:	00f71b63          	bne	a4,a5,80202de4 <fsinit+0x54>
    80202dd2:	8522                	mv	a0,s0
    80202dd4:	745000ef          	jal	80203d18 <initlog>
    80202dd8:	8522                	mv	a0,s0
    80202dda:	6442                	ld	s0,16(sp)
    80202ddc:	60e2                	ld	ra,24(sp)
    80202dde:	64a2                	ld	s1,8(sp)
    80202de0:	6105                	addi	sp,sp,32
    80202de2:	b5f9                	j	80202cb0 <ireclaim>
    80202de4:	00004517          	auipc	a0,0x4
    80202de8:	7ac50513          	addi	a0,a0,1964 # 80207590 <etext+0x590>
    80202dec:	c64fd0ef          	jal	80200250 <panic>

0000000080202df0 <readi>:
    80202df0:	417c                	lw	a5,68(a0)
    80202df2:	0ed7e663          	bltu	a5,a3,80202ede <readi+0xee>
    80202df6:	715d                	addi	sp,sp,-80
    80202df8:	fc26                	sd	s1,56(sp)
    80202dfa:	f84a                	sd	s2,48(sp)
    80202dfc:	f44e                	sd	s3,40(sp)
    80202dfe:	e486                	sd	ra,72(sp)
    80202e00:	89ba                	mv	s3,a4
    80202e02:	9f35                	addw	a4,a4,a3
    80202e04:	84b6                	mv	s1,a3
    80202e06:	00d73933          	sltu	s2,a4,a3
    80202e0a:	0ad76863          	bltu	a4,a3,80202eba <readi+0xca>
    80202e0e:	e0a2                	sd	s0,64(sp)
    80202e10:	f052                	sd	s4,32(sp)
    80202e12:	ec56                	sd	s5,24(sp)
    80202e14:	8a2a                	mv	s4,a0
    80202e16:	8aae                	mv	s5,a1
    80202e18:	8432                	mv	s0,a2
    80202e1a:	00e7f463          	bgeu	a5,a4,80202e22 <readi+0x32>
    80202e1e:	40d789bb          	subw	s3,a5,a3
    80202e22:	0c098363          	beqz	s3,80202ee8 <readi+0xf8>
    80202e26:	e85a                	sd	s6,16(sp)
    80202e28:	e45e                	sd	s7,8(sp)
    80202e2a:	e062                	sd	s8,0(sp)
    80202e2c:	40000b13          	li	s6,1024
    80202e30:	00a4d59b          	srliw	a1,s1,0xa
    80202e34:	8552                	mv	a0,s4
    80202e36:	841ff0ef          	jal	80202676 <bmap>
    80202e3a:	0005059b          	sext.w	a1,a0
    80202e3e:	c1d5                	beqz	a1,80202ee2 <readi+0xf2>
    80202e40:	000a2503          	lw	a0,0(s4)
    80202e44:	aeeff0ef          	jal	80202132 <bread>
    80202e48:	3ff4f713          	andi	a4,s1,1023
    80202e4c:	40eb063b          	subw	a2,s6,a4
    80202e50:	412986bb          	subw	a3,s3,s2
    80202e54:	8bb2                	mv	s7,a2
    80202e56:	00c6f463          	bgeu	a3,a2,80202e5e <readi+0x6e>
    80202e5a:	00068b9b          	sext.w	s7,a3
    80202e5e:	080a9a63          	bnez	s5,80202ef2 <readi+0x102>
    80202e62:	060b8363          	beqz	s7,80202ec8 <readi+0xd8>
    80202e66:	020b9c13          	slli	s8,s7,0x20
    80202e6a:	020c5c13          	srli	s8,s8,0x20
    80202e6e:	008c06b3          	add	a3,s8,s0
    80202e72:	8822                	mv	a6,s0
    80202e74:	9f01                	subw	a4,a4,s0
    80202e76:	010707bb          	addw	a5,a4,a6
    80202e7a:	1782                	slli	a5,a5,0x20
    80202e7c:	9381                	srli	a5,a5,0x20
    80202e7e:	97aa                	add	a5,a5,a0
    80202e80:	0507c783          	lbu	a5,80(a5)
    80202e84:	0805                	addi	a6,a6,1
    80202e86:	fef80fa3          	sb	a5,-1(a6)
    80202e8a:	fed816e3          	bne	a6,a3,80202e76 <readi+0x86>
    80202e8e:	012b893b          	addw	s2,s7,s2
    80202e92:	baeff0ef          	jal	80202240 <brelse>
    80202e96:	009b84bb          	addw	s1,s7,s1
    80202e9a:	9462                	add	s0,s0,s8
    80202e9c:	f9396ae3          	bltu	s2,s3,80202e30 <readi+0x40>
    80202ea0:	854a                	mv	a0,s2
    80202ea2:	6406                	ld	s0,64(sp)
    80202ea4:	60a6                	ld	ra,72(sp)
    80202ea6:	7a02                	ld	s4,32(sp)
    80202ea8:	6ae2                	ld	s5,24(sp)
    80202eaa:	6b42                	ld	s6,16(sp)
    80202eac:	6ba2                	ld	s7,8(sp)
    80202eae:	6c02                	ld	s8,0(sp)
    80202eb0:	74e2                	ld	s1,56(sp)
    80202eb2:	7942                	ld	s2,48(sp)
    80202eb4:	79a2                	ld	s3,40(sp)
    80202eb6:	6161                	addi	sp,sp,80
    80202eb8:	8082                	ret
    80202eba:	4501                	li	a0,0
    80202ebc:	60a6                	ld	ra,72(sp)
    80202ebe:	74e2                	ld	s1,56(sp)
    80202ec0:	7942                	ld	s2,48(sp)
    80202ec2:	79a2                	ld	s3,40(sp)
    80202ec4:	6161                	addi	sp,sp,80
    80202ec6:	8082                	ret
    80202ec8:	4c01                	li	s8,0
    80202eca:	012b893b          	addw	s2,s7,s2
    80202ece:	b72ff0ef          	jal	80202240 <brelse>
    80202ed2:	009b84bb          	addw	s1,s7,s1
    80202ed6:	9462                	add	s0,s0,s8
    80202ed8:	f5396ce3          	bltu	s2,s3,80202e30 <readi+0x40>
    80202edc:	b7d1                	j	80202ea0 <readi+0xb0>
    80202ede:	4501                	li	a0,0
    80202ee0:	8082                	ret
    80202ee2:	0009051b          	sext.w	a0,s2
    80202ee6:	bf75                	j	80202ea2 <readi+0xb2>
    80202ee8:	6406                	ld	s0,64(sp)
    80202eea:	7a02                	ld	s4,32(sp)
    80202eec:	6ae2                	ld	s5,24(sp)
    80202eee:	4501                	li	a0,0
    80202ef0:	b7f1                	j	80202ebc <readi+0xcc>
    80202ef2:	00004517          	auipc	a0,0x4
    80202ef6:	6b650513          	addi	a0,a0,1718 # 802075a8 <etext+0x5a8>
    80202efa:	b56fd0ef          	jal	80200250 <panic>

0000000080202efe <writei>:
    80202efe:	417c                	lw	a5,68(a0)
    80202f00:	711d                	addi	sp,sp,-96
    80202f02:	ec86                	sd	ra,88(sp)
    80202f04:	e0ca                	sd	s2,64(sp)
    80202f06:	0ed7eb63          	bltu	a5,a3,80202ffc <writei+0xfe>
    80202f0a:	e4a6                	sd	s1,72(sp)
    80202f0c:	f852                	sd	s4,48(sp)
    80202f0e:	00e687bb          	addw	a5,a3,a4
    80202f12:	84b6                	mv	s1,a3
    80202f14:	8a3a                	mv	s4,a4
    80202f16:	00d7b933          	sltu	s2,a5,a3
    80202f1a:	0cd7ed63          	bltu	a5,a3,80202ff4 <writei+0xf6>
    80202f1e:	00043737          	lui	a4,0x43
    80202f22:	0cf76963          	bltu	a4,a5,80202ff4 <writei+0xf6>
    80202f26:	fc4e                	sd	s3,56(sp)
    80202f28:	89aa                	mv	s3,a0
    80202f2a:	0c0a0363          	beqz	s4,80202ff0 <writei+0xf2>
    80202f2e:	e8a2                	sd	s0,80(sp)
    80202f30:	f456                	sd	s5,40(sp)
    80202f32:	f05a                	sd	s6,32(sp)
    80202f34:	ec5e                	sd	s7,24(sp)
    80202f36:	e862                	sd	s8,16(sp)
    80202f38:	e466                	sd	s9,8(sp)
    80202f3a:	8aae                	mv	s5,a1
    80202f3c:	8432                	mv	s0,a2
    80202f3e:	40000b13          	li	s6,1024
    80202f42:	00a4d59b          	srliw	a1,s1,0xa
    80202f46:	854e                	mv	a0,s3
    80202f48:	f2eff0ef          	jal	80202676 <bmap>
    80202f4c:	0005059b          	sext.w	a1,a0
    80202f50:	c5b5                	beqz	a1,80202fbc <writei+0xbe>
    80202f52:	0009a503          	lw	a0,0(s3)
    80202f56:	9dcff0ef          	jal	80202132 <bread>
    80202f5a:	3ff4f713          	andi	a4,s1,1023
    80202f5e:	40eb063b          	subw	a2,s6,a4
    80202f62:	412a06bb          	subw	a3,s4,s2
    80202f66:	8c32                	mv	s8,a2
    80202f68:	8baa                	mv	s7,a0
    80202f6a:	00c6f463          	bgeu	a3,a2,80202f72 <writei+0x74>
    80202f6e:	00068c1b          	sext.w	s8,a3
    80202f72:	080a9763          	bnez	s5,80203000 <writei+0x102>
    80202f76:	060c0b63          	beqz	s8,80202fec <writei+0xee>
    80202f7a:	020c1c93          	slli	s9,s8,0x20
    80202f7e:	020cdc93          	srli	s9,s9,0x20
    80202f82:	008c86b3          	add	a3,s9,s0
    80202f86:	8822                	mv	a6,s0
    80202f88:	9f01                	subw	a4,a4,s0
    80202f8a:	010707bb          	addw	a5,a4,a6
    80202f8e:	00084883          	lbu	a7,0(a6)
    80202f92:	1782                	slli	a5,a5,0x20
    80202f94:	9381                	srli	a5,a5,0x20
    80202f96:	97de                	add	a5,a5,s7
    80202f98:	05178823          	sb	a7,80(a5)
    80202f9c:	0805                	addi	a6,a6,1
    80202f9e:	fed816e3          	bne	a6,a3,80202f8a <writei+0x8c>
    80202fa2:	855e                	mv	a0,s7
    80202fa4:	745000ef          	jal	80203ee8 <log_write>
    80202fa8:	855e                	mv	a0,s7
    80202faa:	012c093b          	addw	s2,s8,s2
    80202fae:	a92ff0ef          	jal	80202240 <brelse>
    80202fb2:	009c04bb          	addw	s1,s8,s1
    80202fb6:	9466                	add	s0,s0,s9
    80202fb8:	f94965e3          	bltu	s2,s4,80202f42 <writei+0x44>
    80202fbc:	0449a783          	lw	a5,68(s3)
    80202fc0:	0097f463          	bgeu	a5,s1,80202fc8 <writei+0xca>
    80202fc4:	0499a223          	sw	s1,68(s3)
    80202fc8:	6446                	ld	s0,80(sp)
    80202fca:	7aa2                	ld	s5,40(sp)
    80202fcc:	7b02                	ld	s6,32(sp)
    80202fce:	6be2                	ld	s7,24(sp)
    80202fd0:	6c42                	ld	s8,16(sp)
    80202fd2:	6ca2                	ld	s9,8(sp)
    80202fd4:	2901                	sext.w	s2,s2
    80202fd6:	854e                	mv	a0,s3
    80202fd8:	9fdff0ef          	jal	802029d4 <iupdate>
    80202fdc:	64a6                	ld	s1,72(sp)
    80202fde:	79e2                	ld	s3,56(sp)
    80202fe0:	7a42                	ld	s4,48(sp)
    80202fe2:	60e6                	ld	ra,88(sp)
    80202fe4:	854a                	mv	a0,s2
    80202fe6:	6906                	ld	s2,64(sp)
    80202fe8:	6125                	addi	sp,sp,96
    80202fea:	8082                	ret
    80202fec:	4c81                	li	s9,0
    80202fee:	bf55                	j	80202fa2 <writei+0xa4>
    80202ff0:	4901                	li	s2,0
    80202ff2:	b7d5                	j	80202fd6 <writei+0xd8>
    80202ff4:	64a6                	ld	s1,72(sp)
    80202ff6:	7a42                	ld	s4,48(sp)
    80202ff8:	597d                	li	s2,-1
    80202ffa:	b7e5                	j	80202fe2 <writei+0xe4>
    80202ffc:	597d                	li	s2,-1
    80202ffe:	b7d5                	j	80202fe2 <writei+0xe4>
    80203000:	00004517          	auipc	a0,0x4
    80203004:	5c850513          	addi	a0,a0,1480 # 802075c8 <etext+0x5c8>
    80203008:	a48fd0ef          	jal	80200250 <panic>

000000008020300c <namecmp>:
    8020300c:	4639                	li	a2,14
    8020300e:	de2fd06f          	j	802005f0 <strncmp>

0000000080203012 <dirlookup>:
    80203012:	03c51703          	lh	a4,60(a0)
    80203016:	7139                	addi	sp,sp,-64
    80203018:	fc06                	sd	ra,56(sp)
    8020301a:	f822                	sd	s0,48(sp)
    8020301c:	f426                	sd	s1,40(sp)
    8020301e:	f04a                	sd	s2,32(sp)
    80203020:	ec4e                	sd	s3,24(sp)
    80203022:	4785                	li	a5,1
    80203024:	06f71e63          	bne	a4,a5,802030a0 <dirlookup+0x8e>
    80203028:	417c                	lw	a5,68(a0)
    8020302a:	84aa                	mv	s1,a0
    8020302c:	892e                	mv	s2,a1
    8020302e:	89b2                	mv	s3,a2
    80203030:	4401                	li	s0,0
    80203032:	cb8d                	beqz	a5,80203064 <dirlookup+0x52>
    80203034:	4741                	li	a4,16
    80203036:	86a2                	mv	a3,s0
    80203038:	860a                	mv	a2,sp
    8020303a:	4581                	li	a1,0
    8020303c:	8526                	mv	a0,s1
    8020303e:	db3ff0ef          	jal	80202df0 <readi>
    80203042:	47c1                	li	a5,16
    80203044:	04f51863          	bne	a0,a5,80203094 <dirlookup+0x82>
    80203048:	00015783          	lhu	a5,0(sp)
    8020304c:	cb81                	beqz	a5,8020305c <dirlookup+0x4a>
    8020304e:	4639                	li	a2,14
    80203050:	00210593          	addi	a1,sp,2
    80203054:	854a                	mv	a0,s2
    80203056:	d9afd0ef          	jal	802005f0 <strncmp>
    8020305a:	cd09                	beqz	a0,80203074 <dirlookup+0x62>
    8020305c:	40fc                	lw	a5,68(s1)
    8020305e:	2441                	addiw	s0,s0,16
    80203060:	fcf46ae3          	bltu	s0,a5,80203034 <dirlookup+0x22>
    80203064:	70e2                	ld	ra,56(sp)
    80203066:	7442                	ld	s0,48(sp)
    80203068:	74a2                	ld	s1,40(sp)
    8020306a:	7902                	ld	s2,32(sp)
    8020306c:	69e2                	ld	s3,24(sp)
    8020306e:	4501                	li	a0,0
    80203070:	6121                	addi	sp,sp,64
    80203072:	8082                	ret
    80203074:	00098463          	beqz	s3,8020307c <dirlookup+0x6a>
    80203078:	0089a023          	sw	s0,0(s3)
    8020307c:	00015583          	lhu	a1,0(sp)
    80203080:	4088                	lw	a0,0(s1)
    80203082:	eecff0ef          	jal	8020276e <iget>
    80203086:	70e2                	ld	ra,56(sp)
    80203088:	7442                	ld	s0,48(sp)
    8020308a:	74a2                	ld	s1,40(sp)
    8020308c:	7902                	ld	s2,32(sp)
    8020308e:	69e2                	ld	s3,24(sp)
    80203090:	6121                	addi	sp,sp,64
    80203092:	8082                	ret
    80203094:	00004517          	auipc	a0,0x4
    80203098:	56c50513          	addi	a0,a0,1388 # 80207600 <etext+0x600>
    8020309c:	9b4fd0ef          	jal	80200250 <panic>
    802030a0:	00004517          	auipc	a0,0x4
    802030a4:	54850513          	addi	a0,a0,1352 # 802075e8 <etext+0x5e8>
    802030a8:	9a8fd0ef          	jal	80200250 <panic>

00000000802030ac <namex>:
    802030ac:	715d                	addi	sp,sp,-80
    802030ae:	e0a2                	sd	s0,64(sp)
    802030b0:	f052                	sd	s4,32(sp)
    802030b2:	ec56                	sd	s5,24(sp)
    802030b4:	e486                	sd	ra,72(sp)
    802030b6:	fc26                	sd	s1,56(sp)
    802030b8:	f84a                	sd	s2,48(sp)
    802030ba:	f44e                	sd	s3,40(sp)
    802030bc:	e85a                	sd	s6,16(sp)
    802030be:	e45e                	sd	s7,8(sp)
    802030c0:	e062                	sd	s8,0(sp)
    802030c2:	00054703          	lbu	a4,0(a0)
    802030c6:	02f00793          	li	a5,47
    802030ca:	842a                	mv	s0,a0
    802030cc:	8aae                	mv	s5,a1
    802030ce:	8a32                	mv	s4,a2
    802030d0:	12f70763          	beq	a4,a5,802031fe <namex+0x152>
    802030d4:	00005797          	auipc	a5,0x5
    802030d8:	7d47b783          	ld	a5,2004(a5) # 802088a8 <current_proc>
    802030dc:	1207b983          	ld	s3,288(a5)
    802030e0:	0000f517          	auipc	a0,0xf
    802030e4:	35050513          	addi	a0,a0,848 # 80212430 <itable>
    802030e8:	9b0fd0ef          	jal	80200298 <acquire>
    802030ec:	0089a783          	lw	a5,8(s3)
    802030f0:	0000f517          	auipc	a0,0xf
    802030f4:	34050513          	addi	a0,a0,832 # 80212430 <itable>
    802030f8:	2785                	addiw	a5,a5,1
    802030fa:	00f9a423          	sw	a5,8(s3)
    802030fe:	9acfd0ef          	jal	802002aa <release>
    80203102:	02f00493          	li	s1,47
    80203106:	4bb5                	li	s7,13
    80203108:	4b05                	li	s6,1
    8020310a:	00044783          	lbu	a5,0(s0)
    8020310e:	00979763          	bne	a5,s1,8020311c <namex+0x70>
    80203112:	00144783          	lbu	a5,1(s0)
    80203116:	0405                	addi	s0,s0,1
    80203118:	fe978de3          	beq	a5,s1,80203112 <namex+0x66>
    8020311c:	c3c5                	beqz	a5,802031bc <namex+0x110>
    8020311e:	00044783          	lbu	a5,0(s0)
    80203122:	8922                	mv	s2,s0
    80203124:	8c52                	mv	s8,s4
    80203126:	4601                	li	a2,0
    80203128:	08978263          	beq	a5,s1,802031ac <namex+0x100>
    8020312c:	c791                	beqz	a5,80203138 <namex+0x8c>
    8020312e:	00194783          	lbu	a5,1(s2)
    80203132:	0905                	addi	s2,s2,1
    80203134:	fe979ce3          	bne	a5,s1,8020312c <namex+0x80>
    80203138:	4089063b          	subw	a2,s2,s0
    8020313c:	06cbd663          	bge	s7,a2,802031a8 <namex+0xfc>
    80203140:	85a2                	mv	a1,s0
    80203142:	4639                	li	a2,14
    80203144:	8552                	mv	a0,s4
    80203146:	c5efd0ef          	jal	802005a4 <memmove>
    8020314a:	844a                	mv	s0,s2
    8020314c:	00094783          	lbu	a5,0(s2)
    80203150:	00979763          	bne	a5,s1,8020315e <namex+0xb2>
    80203154:	00144783          	lbu	a5,1(s0)
    80203158:	0405                	addi	s0,s0,1
    8020315a:	fe978de3          	beq	a5,s1,80203154 <namex+0xa8>
    8020315e:	854e                	mv	a0,s3
    80203160:	91dff0ef          	jal	80202a7c <ilock>
    80203164:	03c99783          	lh	a5,60(s3)
    80203168:	07679963          	bne	a5,s6,802031da <namex+0x12e>
    8020316c:	000a8563          	beqz	s5,80203176 <namex+0xca>
    80203170:	00044783          	lbu	a5,0(s0)
    80203174:	cbd9                	beqz	a5,8020320a <namex+0x15e>
    80203176:	4601                	li	a2,0
    80203178:	85d2                	mv	a1,s4
    8020317a:	854e                	mv	a0,s3
    8020317c:	e97ff0ef          	jal	80203012 <dirlookup>
    80203180:	892a                	mv	s2,a0
    80203182:	cd21                	beqz	a0,802031da <namex+0x12e>
    80203184:	01098c13          	addi	s8,s3,16
    80203188:	8562                	mv	a0,s8
    8020318a:	1ee000ef          	jal	80203378 <holdingsleep>
    8020318e:	cd41                	beqz	a0,80203226 <namex+0x17a>
    80203190:	0089a783          	lw	a5,8(s3)
    80203194:	08f05963          	blez	a5,80203226 <namex+0x17a>
    80203198:	8562                	mv	a0,s8
    8020319a:	1ae000ef          	jal	80203348 <releasesleep>
    8020319e:	854e                	mv	a0,s3
    802031a0:	a55ff0ef          	jal	80202bf4 <iput>
    802031a4:	89ca                	mv	s3,s2
    802031a6:	b795                	j	8020310a <namex+0x5e>
    802031a8:	00ca0c33          	add	s8,s4,a2
    802031ac:	85a2                	mv	a1,s0
    802031ae:	8552                	mv	a0,s4
    802031b0:	bf4fd0ef          	jal	802005a4 <memmove>
    802031b4:	844a                	mv	s0,s2
    802031b6:	000c0023          	sb	zero,0(s8)
    802031ba:	bf49                	j	8020314c <namex+0xa0>
    802031bc:	020a9c63          	bnez	s5,802031f4 <namex+0x148>
    802031c0:	60a6                	ld	ra,72(sp)
    802031c2:	6406                	ld	s0,64(sp)
    802031c4:	74e2                	ld	s1,56(sp)
    802031c6:	7942                	ld	s2,48(sp)
    802031c8:	7a02                	ld	s4,32(sp)
    802031ca:	6ae2                	ld	s5,24(sp)
    802031cc:	6b42                	ld	s6,16(sp)
    802031ce:	6ba2                	ld	s7,8(sp)
    802031d0:	6c02                	ld	s8,0(sp)
    802031d2:	854e                	mv	a0,s3
    802031d4:	79a2                	ld	s3,40(sp)
    802031d6:	6161                	addi	sp,sp,80
    802031d8:	8082                	ret
    802031da:	01098413          	addi	s0,s3,16
    802031de:	8522                	mv	a0,s0
    802031e0:	198000ef          	jal	80203378 <holdingsleep>
    802031e4:	c129                	beqz	a0,80203226 <namex+0x17a>
    802031e6:	0089a783          	lw	a5,8(s3)
    802031ea:	02f05e63          	blez	a5,80203226 <namex+0x17a>
    802031ee:	8522                	mv	a0,s0
    802031f0:	158000ef          	jal	80203348 <releasesleep>
    802031f4:	854e                	mv	a0,s3
    802031f6:	9ffff0ef          	jal	80202bf4 <iput>
    802031fa:	4981                	li	s3,0
    802031fc:	b7d1                	j	802031c0 <namex+0x114>
    802031fe:	4585                	li	a1,1
    80203200:	4505                	li	a0,1
    80203202:	d6cff0ef          	jal	8020276e <iget>
    80203206:	89aa                	mv	s3,a0
    80203208:	bded                	j	80203102 <namex+0x56>
    8020320a:	01098413          	addi	s0,s3,16
    8020320e:	8522                	mv	a0,s0
    80203210:	168000ef          	jal	80203378 <holdingsleep>
    80203214:	c909                	beqz	a0,80203226 <namex+0x17a>
    80203216:	0089a783          	lw	a5,8(s3)
    8020321a:	00f05663          	blez	a5,80203226 <namex+0x17a>
    8020321e:	8522                	mv	a0,s0
    80203220:	128000ef          	jal	80203348 <releasesleep>
    80203224:	bf71                	j	802031c0 <namex+0x114>
    80203226:	00004517          	auipc	a0,0x4
    8020322a:	34250513          	addi	a0,a0,834 # 80207568 <etext+0x568>
    8020322e:	822fd0ef          	jal	80200250 <panic>

0000000080203232 <dirlink>:
    80203232:	7139                	addi	sp,sp,-64
    80203234:	f04a                	sd	s2,32(sp)
    80203236:	8932                	mv	s2,a2
    80203238:	4601                	li	a2,0
    8020323a:	f426                	sd	s1,40(sp)
    8020323c:	ec4e                	sd	s3,24(sp)
    8020323e:	fc06                	sd	ra,56(sp)
    80203240:	84aa                	mv	s1,a0
    80203242:	89ae                	mv	s3,a1
    80203244:	dcfff0ef          	jal	80203012 <dirlookup>
    80203248:	e135                	bnez	a0,802032ac <dirlink+0x7a>
    8020324a:	f822                	sd	s0,48(sp)
    8020324c:	40e0                	lw	s0,68(s1)
    8020324e:	c405                	beqz	s0,80203276 <dirlink+0x44>
    80203250:	4401                	li	s0,0
    80203252:	a029                	j	8020325c <dirlink+0x2a>
    80203254:	40fc                	lw	a5,68(s1)
    80203256:	2441                	addiw	s0,s0,16
    80203258:	00f47f63          	bgeu	s0,a5,80203276 <dirlink+0x44>
    8020325c:	4741                	li	a4,16
    8020325e:	86a2                	mv	a3,s0
    80203260:	860a                	mv	a2,sp
    80203262:	4581                	li	a1,0
    80203264:	8526                	mv	a0,s1
    80203266:	b8bff0ef          	jal	80202df0 <readi>
    8020326a:	47c1                	li	a5,16
    8020326c:	04f51463          	bne	a0,a5,802032b4 <dirlink+0x82>
    80203270:	00015783          	lhu	a5,0(sp)
    80203274:	f3e5                	bnez	a5,80203254 <dirlink+0x22>
    80203276:	4639                	li	a2,14
    80203278:	85ce                	mv	a1,s3
    8020327a:	00210513          	addi	a0,sp,2
    8020327e:	b9afd0ef          	jal	80200618 <strncpy>
    80203282:	86a2                	mv	a3,s0
    80203284:	4741                	li	a4,16
    80203286:	860a                	mv	a2,sp
    80203288:	4581                	li	a1,0
    8020328a:	8526                	mv	a0,s1
    8020328c:	01211023          	sh	s2,0(sp)
    80203290:	c6fff0ef          	jal	80202efe <writei>
    80203294:	1541                	addi	a0,a0,-16
    80203296:	7442                	ld	s0,48(sp)
    80203298:	00a03533          	snez	a0,a0
    8020329c:	40a00533          	neg	a0,a0
    802032a0:	70e2                	ld	ra,56(sp)
    802032a2:	74a2                	ld	s1,40(sp)
    802032a4:	7902                	ld	s2,32(sp)
    802032a6:	69e2                	ld	s3,24(sp)
    802032a8:	6121                	addi	sp,sp,64
    802032aa:	8082                	ret
    802032ac:	949ff0ef          	jal	80202bf4 <iput>
    802032b0:	557d                	li	a0,-1
    802032b2:	b7fd                	j	802032a0 <dirlink+0x6e>
    802032b4:	00004517          	auipc	a0,0x4
    802032b8:	35c50513          	addi	a0,a0,860 # 80207610 <etext+0x610>
    802032bc:	f95fc0ef          	jal	80200250 <panic>

00000000802032c0 <namei>:
    802032c0:	1101                	addi	sp,sp,-32
    802032c2:	860a                	mv	a2,sp
    802032c4:	4581                	li	a1,0
    802032c6:	ec06                	sd	ra,24(sp)
    802032c8:	de5ff0ef          	jal	802030ac <namex>
    802032cc:	60e2                	ld	ra,24(sp)
    802032ce:	6105                	addi	sp,sp,32
    802032d0:	8082                	ret

00000000802032d2 <nameiparent>:
    802032d2:	862e                	mv	a2,a1
    802032d4:	4585                	li	a1,1
    802032d6:	bbd9                	j	802030ac <namex>

00000000802032d8 <initsleeplock>:
    802032d8:	1101                	addi	sp,sp,-32
    802032da:	e822                	sd	s0,16(sp)
    802032dc:	e426                	sd	s1,8(sp)
    802032de:	842a                	mv	s0,a0
    802032e0:	84ae                	mv	s1,a1
    802032e2:	0521                	addi	a0,a0,8
    802032e4:	00004597          	auipc	a1,0x4
    802032e8:	33c58593          	addi	a1,a1,828 # 80207620 <etext+0x620>
    802032ec:	ec06                	sd	ra,24(sp)
    802032ee:	fa3fc0ef          	jal	80200290 <initlock>
    802032f2:	60e2                	ld	ra,24(sp)
    802032f4:	ec04                	sd	s1,24(s0)
    802032f6:	00042023          	sw	zero,0(s0)
    802032fa:	02042023          	sw	zero,32(s0)
    802032fe:	6442                	ld	s0,16(sp)
    80203300:	64a2                	ld	s1,8(sp)
    80203302:	6105                	addi	sp,sp,32
    80203304:	8082                	ret

0000000080203306 <acquiresleep>:
    80203306:	1101                	addi	sp,sp,-32
    80203308:	e426                	sd	s1,8(sp)
    8020330a:	00850493          	addi	s1,a0,8
    8020330e:	e822                	sd	s0,16(sp)
    80203310:	842a                	mv	s0,a0
    80203312:	8526                	mv	a0,s1
    80203314:	ec06                	sd	ra,24(sp)
    80203316:	f83fc0ef          	jal	80200298 <acquire>
    8020331a:	401c                	lw	a5,0(s0)
    8020331c:	c799                	beqz	a5,8020332a <acquiresleep+0x24>
    8020331e:	85a6                	mv	a1,s1
    80203320:	8522                	mv	a0,s0
    80203322:	f56fe0ef          	jal	80201a78 <sleep>
    80203326:	401c                	lw	a5,0(s0)
    80203328:	fbfd                	bnez	a5,8020331e <acquiresleep+0x18>
    8020332a:	00005797          	auipc	a5,0x5
    8020332e:	57e7b783          	ld	a5,1406(a5) # 802088a8 <current_proc>
    80203332:	4b9c                	lw	a5,16(a5)
    80203334:	4705                	li	a4,1
    80203336:	c018                	sw	a4,0(s0)
    80203338:	d01c                	sw	a5,32(s0)
    8020333a:	6442                	ld	s0,16(sp)
    8020333c:	60e2                	ld	ra,24(sp)
    8020333e:	8526                	mv	a0,s1
    80203340:	64a2                	ld	s1,8(sp)
    80203342:	6105                	addi	sp,sp,32
    80203344:	f67fc06f          	j	802002aa <release>

0000000080203348 <releasesleep>:
    80203348:	1101                	addi	sp,sp,-32
    8020334a:	e426                	sd	s1,8(sp)
    8020334c:	00850493          	addi	s1,a0,8
    80203350:	e822                	sd	s0,16(sp)
    80203352:	842a                	mv	s0,a0
    80203354:	8526                	mv	a0,s1
    80203356:	ec06                	sd	ra,24(sp)
    80203358:	f41fc0ef          	jal	80200298 <acquire>
    8020335c:	8522                	mv	a0,s0
    8020335e:	00042023          	sw	zero,0(s0)
    80203362:	02042023          	sw	zero,32(s0)
    80203366:	89bfe0ef          	jal	80201c00 <wakeup>
    8020336a:	6442                	ld	s0,16(sp)
    8020336c:	60e2                	ld	ra,24(sp)
    8020336e:	8526                	mv	a0,s1
    80203370:	64a2                	ld	s1,8(sp)
    80203372:	6105                	addi	sp,sp,32
    80203374:	f37fc06f          	j	802002aa <release>

0000000080203378 <holdingsleep>:
    80203378:	1101                	addi	sp,sp,-32
    8020337a:	e426                	sd	s1,8(sp)
    8020337c:	00850493          	addi	s1,a0,8
    80203380:	e822                	sd	s0,16(sp)
    80203382:	842a                	mv	s0,a0
    80203384:	8526                	mv	a0,s1
    80203386:	ec06                	sd	ra,24(sp)
    80203388:	f11fc0ef          	jal	80200298 <acquire>
    8020338c:	401c                	lw	a5,0(s0)
    8020338e:	c785                	beqz	a5,802033b6 <holdingsleep+0x3e>
    80203390:	00005797          	auipc	a5,0x5
    80203394:	5187b783          	ld	a5,1304(a5) # 802088a8 <current_proc>
    80203398:	4b9c                	lw	a5,16(a5)
    8020339a:	5018                	lw	a4,32(s0)
    8020339c:	40e78433          	sub	s0,a5,a4
    802033a0:	00143413          	seqz	s0,s0
    802033a4:	8526                	mv	a0,s1
    802033a6:	f05fc0ef          	jal	802002aa <release>
    802033aa:	60e2                	ld	ra,24(sp)
    802033ac:	8522                	mv	a0,s0
    802033ae:	6442                	ld	s0,16(sp)
    802033b0:	64a2                	ld	s1,8(sp)
    802033b2:	6105                	addi	sp,sp,32
    802033b4:	8082                	ret
    802033b6:	4401                	li	s0,0
    802033b8:	b7f5                	j	802033a4 <holdingsleep+0x2c>

00000000802033ba <create>:
    802033ba:	715d                	addi	sp,sp,-80
    802033bc:	f84a                	sd	s2,48(sp)
    802033be:	892e                	mv	s2,a1
    802033c0:	858a                	mv	a1,sp
    802033c2:	f44e                	sd	s3,40(sp)
    802033c4:	f052                	sd	s4,32(sp)
    802033c6:	e486                	sd	ra,72(sp)
    802033c8:	e0a2                	sd	s0,64(sp)
    802033ca:	8a32                	mv	s4,a2
    802033cc:	89b6                	mv	s3,a3
    802033ce:	f05ff0ef          	jal	802032d2 <nameiparent>
    802033d2:	c931                	beqz	a0,80203426 <create+0x6c>
    802033d4:	fc26                	sd	s1,56(sp)
    802033d6:	84aa                	mv	s1,a0
    802033d8:	ea4ff0ef          	jal	80202a7c <ilock>
    802033dc:	4601                	li	a2,0
    802033de:	858a                	mv	a1,sp
    802033e0:	8526                	mv	a0,s1
    802033e2:	c31ff0ef          	jal	80203012 <dirlookup>
    802033e6:	842a                	mv	s0,a0
    802033e8:	c921                	beqz	a0,80203438 <create+0x7e>
    802033ea:	8526                	mv	a0,s1
    802033ec:	889ff0ef          	jal	80202c74 <iunlockput>
    802033f0:	8522                	mv	a0,s0
    802033f2:	e8aff0ef          	jal	80202a7c <ilock>
    802033f6:	4789                	li	a5,2
    802033f8:	02f91363          	bne	s2,a5,8020341e <create+0x64>
    802033fc:	03c45783          	lhu	a5,60(s0)
    80203400:	4705                	li	a4,1
    80203402:	37f9                	addiw	a5,a5,-2
    80203404:	17c2                	slli	a5,a5,0x30
    80203406:	93c1                	srli	a5,a5,0x30
    80203408:	00f76b63          	bltu	a4,a5,8020341e <create+0x64>
    8020340c:	60a6                	ld	ra,72(sp)
    8020340e:	8522                	mv	a0,s0
    80203410:	6406                	ld	s0,64(sp)
    80203412:	74e2                	ld	s1,56(sp)
    80203414:	7942                	ld	s2,48(sp)
    80203416:	79a2                	ld	s3,40(sp)
    80203418:	7a02                	ld	s4,32(sp)
    8020341a:	6161                	addi	sp,sp,80
    8020341c:	8082                	ret
    8020341e:	8522                	mv	a0,s0
    80203420:	855ff0ef          	jal	80202c74 <iunlockput>
    80203424:	74e2                	ld	s1,56(sp)
    80203426:	4401                	li	s0,0
    80203428:	60a6                	ld	ra,72(sp)
    8020342a:	8522                	mv	a0,s0
    8020342c:	6406                	ld	s0,64(sp)
    8020342e:	7942                	ld	s2,48(sp)
    80203430:	79a2                	ld	s3,40(sp)
    80203432:	7a02                	ld	s4,32(sp)
    80203434:	6161                	addi	sp,sp,80
    80203436:	8082                	ret
    80203438:	4088                	lw	a0,0(s1)
    8020343a:	85ca                	mv	a1,s2
    8020343c:	ec56                	sd	s5,24(sp)
    8020343e:	ce2ff0ef          	jal	80202920 <ialloc>
    80203442:	842a                	mv	s0,a0
    80203444:	c959                	beqz	a0,802034da <create+0x120>
    80203446:	e36ff0ef          	jal	80202a7c <ilock>
    8020344a:	4a85                	li	s5,1
    8020344c:	03441f23          	sh	s4,62(s0)
    80203450:	05341023          	sh	s3,64(s0)
    80203454:	05541123          	sh	s5,66(s0)
    80203458:	8522                	mv	a0,s0
    8020345a:	d7aff0ef          	jal	802029d4 <iupdate>
    8020345e:	03590663          	beq	s2,s5,8020348a <create+0xd0>
    80203462:	4050                	lw	a2,4(s0)
    80203464:	858a                	mv	a1,sp
    80203466:	8526                	mv	a0,s1
    80203468:	dcbff0ef          	jal	80203232 <dirlink>
    8020346c:	06054163          	bltz	a0,802034ce <create+0x114>
    80203470:	8526                	mv	a0,s1
    80203472:	803ff0ef          	jal	80202c74 <iunlockput>
    80203476:	60a6                	ld	ra,72(sp)
    80203478:	8522                	mv	a0,s0
    8020347a:	6406                	ld	s0,64(sp)
    8020347c:	74e2                	ld	s1,56(sp)
    8020347e:	6ae2                	ld	s5,24(sp)
    80203480:	7942                	ld	s2,48(sp)
    80203482:	79a2                	ld	s3,40(sp)
    80203484:	7a02                	ld	s4,32(sp)
    80203486:	6161                	addi	sp,sp,80
    80203488:	8082                	ret
    8020348a:	0424d783          	lhu	a5,66(s1)
    8020348e:	8526                	mv	a0,s1
    80203490:	2785                	addiw	a5,a5,1
    80203492:	04f49123          	sh	a5,66(s1)
    80203496:	d3eff0ef          	jal	802029d4 <iupdate>
    8020349a:	4050                	lw	a2,4(s0)
    8020349c:	00004597          	auipc	a1,0x4
    802034a0:	1a458593          	addi	a1,a1,420 # 80207640 <etext+0x640>
    802034a4:	8522                	mv	a0,s0
    802034a6:	d8dff0ef          	jal	80203232 <dirlink>
    802034aa:	00054c63          	bltz	a0,802034c2 <create+0x108>
    802034ae:	40d0                	lw	a2,4(s1)
    802034b0:	00004597          	auipc	a1,0x4
    802034b4:	1a858593          	addi	a1,a1,424 # 80207658 <etext+0x658>
    802034b8:	8522                	mv	a0,s0
    802034ba:	d79ff0ef          	jal	80203232 <dirlink>
    802034be:	fa0552e3          	bgez	a0,80203462 <create+0xa8>
    802034c2:	00004517          	auipc	a0,0x4
    802034c6:	18650513          	addi	a0,a0,390 # 80207648 <etext+0x648>
    802034ca:	d87fc0ef          	jal	80200250 <panic>
    802034ce:	00004517          	auipc	a0,0x4
    802034d2:	19250513          	addi	a0,a0,402 # 80207660 <etext+0x660>
    802034d6:	d7bfc0ef          	jal	80200250 <panic>
    802034da:	00004517          	auipc	a0,0x4
    802034de:	15650513          	addi	a0,a0,342 # 80207630 <etext+0x630>
    802034e2:	d6ffc0ef          	jal	80200250 <panic>

00000000802034e6 <sys_open>:
    802034e6:	1101                	addi	sp,sp,-32
    802034e8:	e822                	sd	s0,16(sp)
    802034ea:	e04a                	sd	s2,0(sp)
    802034ec:	ec06                	sd	ra,24(sp)
    802034ee:	892e                	mv	s2,a1
    802034f0:	e426                	sd	s1,8(sp)
    802034f2:	842a                	mv	s0,a0
    802034f4:	099000ef          	jal	80203d8c <begin_op>
    802034f8:	20097793          	andi	a5,s2,512
    802034fc:	c3e1                	beqz	a5,802035bc <sys_open+0xd6>
    802034fe:	4681                	li	a3,0
    80203500:	4601                	li	a2,0
    80203502:	4589                	li	a1,2
    80203504:	8522                	mv	a0,s0
    80203506:	eb5ff0ef          	jal	802033ba <create>
    8020350a:	84aa                	mv	s1,a0
    8020350c:	c129                	beqz	a0,8020354e <sys_open+0x68>
    8020350e:	03c51783          	lh	a5,60(a0)
    80203512:	470d                	li	a4,3
    80203514:	00e79763          	bne	a5,a4,80203522 <sys_open+0x3c>
    80203518:	03e4d703          	lhu	a4,62(s1)
    8020351c:	47a5                	li	a5,9
    8020351e:	02e7e563          	bltu	a5,a4,80203548 <sys_open+0x62>
    80203522:	e43fe0ef          	jal	80202364 <filealloc>
    80203526:	c10d                	beqz	a0,80203548 <sys_open+0x62>
    80203528:	00005617          	auipc	a2,0x5
    8020352c:	38063603          	ld	a2,896(a2) # 802088a8 <current_proc>
    80203530:	0a060793          	addi	a5,a2,160
    80203534:	4401                	li	s0,0
    80203536:	46c1                	li	a3,16
    80203538:	6398                	ld	a4,0(a5)
    8020353a:	07a1                	addi	a5,a5,8
    8020353c:	c31d                	beqz	a4,80203562 <sys_open+0x7c>
    8020353e:	2405                	addiw	s0,s0,1
    80203540:	fed41ce3          	bne	s0,a3,80203538 <sys_open+0x52>
    80203544:	ec3fe0ef          	jal	80202406 <fileclose>
    80203548:	8526                	mv	a0,s1
    8020354a:	f2aff0ef          	jal	80202c74 <iunlockput>
    8020354e:	09d000ef          	jal	80203dea <end_op>
    80203552:	547d                	li	s0,-1
    80203554:	60e2                	ld	ra,24(sp)
    80203556:	8522                	mv	a0,s0
    80203558:	6442                	ld	s0,16(sp)
    8020355a:	64a2                	ld	s1,8(sp)
    8020355c:	6902                	ld	s2,0(sp)
    8020355e:	6105                	addi	sp,sp,32
    80203560:	8082                	ret
    80203562:	01440713          	addi	a4,s0,20
    80203566:	070e                	slli	a4,a4,0x3
    80203568:	03c49683          	lh	a3,60(s1)
    8020356c:	00397793          	andi	a5,s2,3
    80203570:	963a                	add	a2,a2,a4
    80203572:	00f037b3          	snez	a5,a5
    80203576:	fff94713          	not	a4,s2
    8020357a:	0087979b          	slliw	a5,a5,0x8
    8020357e:	8b05                	andi	a4,a4,1
    80203580:	e208                	sd	a0,0(a2)
    80203582:	460d                	li	a2,3
    80203584:	8f5d                	or	a4,a4,a5
    80203586:	04c68a63          	beq	a3,a2,802035da <sys_open+0xf4>
    8020358a:	4789                	li	a5,2
    8020358c:	02052023          	sw	zero,32(a0)
    80203590:	c11c                	sw	a5,0(a0)
    80203592:	ed04                	sd	s1,24(a0)
    80203594:	00e51423          	sh	a4,8(a0)
    80203598:	40097913          	andi	s2,s2,1024
    8020359c:	00090463          	beqz	s2,802035a4 <sys_open+0xbe>
    802035a0:	04f68663          	beq	a3,a5,802035ec <sys_open+0x106>
    802035a4:	8526                	mv	a0,s1
    802035a6:	d84ff0ef          	jal	80202b2a <iunlock>
    802035aa:	041000ef          	jal	80203dea <end_op>
    802035ae:	60e2                	ld	ra,24(sp)
    802035b0:	8522                	mv	a0,s0
    802035b2:	6442                	ld	s0,16(sp)
    802035b4:	64a2                	ld	s1,8(sp)
    802035b6:	6902                	ld	s2,0(sp)
    802035b8:	6105                	addi	sp,sp,32
    802035ba:	8082                	ret
    802035bc:	8522                	mv	a0,s0
    802035be:	d03ff0ef          	jal	802032c0 <namei>
    802035c2:	84aa                	mv	s1,a0
    802035c4:	d549                	beqz	a0,8020354e <sys_open+0x68>
    802035c6:	cb6ff0ef          	jal	80202a7c <ilock>
    802035ca:	03c49783          	lh	a5,60(s1)
    802035ce:	4705                	li	a4,1
    802035d0:	f4e791e3          	bne	a5,a4,80203512 <sys_open+0x2c>
    802035d4:	f40907e3          	beqz	s2,80203522 <sys_open+0x3c>
    802035d8:	bf85                	j	80203548 <sys_open+0x62>
    802035da:	03e4d783          	lhu	a5,62(s1)
    802035de:	c114                	sw	a3,0(a0)
    802035e0:	ed04                	sd	s1,24(a0)
    802035e2:	02f51223          	sh	a5,36(a0)
    802035e6:	00e51423          	sh	a4,8(a0)
    802035ea:	bf6d                	j	802035a4 <sys_open+0xbe>
    802035ec:	8526                	mv	a0,s1
    802035ee:	d74ff0ef          	jal	80202b62 <itrunc>
    802035f2:	bf4d                	j	802035a4 <sys_open+0xbe>

00000000802035f4 <sys_close>:
    802035f4:	473d                	li	a4,15
    802035f6:	00005797          	auipc	a5,0x5
    802035fa:	2b27b783          	ld	a5,690(a5) # 802088a8 <current_proc>
    802035fe:	02a76063          	bltu	a4,a0,8020361e <sys_close+0x2a>
    80203602:	050e                	slli	a0,a0,0x3
    80203604:	97aa                	add	a5,a5,a0
    80203606:	73c8                	ld	a0,160(a5)
    80203608:	c919                	beqz	a0,8020361e <sys_close+0x2a>
    8020360a:	1141                	addi	sp,sp,-16
    8020360c:	e406                	sd	ra,8(sp)
    8020360e:	0a07b023          	sd	zero,160(a5)
    80203612:	df5fe0ef          	jal	80202406 <fileclose>
    80203616:	60a2                	ld	ra,8(sp)
    80203618:	4501                	li	a0,0
    8020361a:	0141                	addi	sp,sp,16
    8020361c:	8082                	ret
    8020361e:	557d                	li	a0,-1
    80203620:	8082                	ret

0000000080203622 <sys_read>:
    80203622:	473d                	li	a4,15
    80203624:	00005797          	auipc	a5,0x5
    80203628:	2847b783          	ld	a5,644(a5) # 802088a8 <current_proc>
    8020362c:	00a76963          	bltu	a4,a0,8020363e <sys_read+0x1c>
    80203630:	0551                	addi	a0,a0,20
    80203632:	050e                	slli	a0,a0,0x3
    80203634:	97aa                	add	a5,a5,a0
    80203636:	6388                	ld	a0,0(a5)
    80203638:	c119                	beqz	a0,8020363e <sys_read+0x1c>
    8020363a:	e4bfe06f          	j	80202484 <fileread>
    8020363e:	557d                	li	a0,-1
    80203640:	8082                	ret

0000000080203642 <sys_write>:
    80203642:	473d                	li	a4,15
    80203644:	00005797          	auipc	a5,0x5
    80203648:	2647b783          	ld	a5,612(a5) # 802088a8 <current_proc>
    8020364c:	00a76963          	bltu	a4,a0,8020365e <sys_write+0x1c>
    80203650:	0551                	addi	a0,a0,20
    80203652:	050e                	slli	a0,a0,0x3
    80203654:	97aa                	add	a5,a5,a0
    80203656:	6388                	ld	a0,0(a5)
    80203658:	c119                	beqz	a0,8020365e <sys_write+0x1c>
    8020365a:	e8dfe06f          	j	802024e6 <filewrite>
    8020365e:	557d                	li	a0,-1
    80203660:	8082                	ret

0000000080203662 <sys_unlink>:
    80203662:	715d                	addi	sp,sp,-80
    80203664:	e0a2                	sd	s0,64(sp)
    80203666:	e486                	sd	ra,72(sp)
    80203668:	842a                	mv	s0,a0
    8020366a:	722000ef          	jal	80203d8c <begin_op>
    8020366e:	080c                	addi	a1,sp,16
    80203670:	8522                	mv	a0,s0
    80203672:	c61ff0ef          	jal	802032d2 <nameiparent>
    80203676:	10050a63          	beqz	a0,8020378a <sys_unlink+0x128>
    8020367a:	f84a                	sd	s2,48(sp)
    8020367c:	892a                	mv	s2,a0
    8020367e:	bfeff0ef          	jal	80202a7c <ilock>
    80203682:	00004597          	auipc	a1,0x4
    80203686:	fbe58593          	addi	a1,a1,-66 # 80207640 <etext+0x640>
    8020368a:	0808                	addi	a0,sp,16
    8020368c:	981ff0ef          	jal	8020300c <namecmp>
    80203690:	0e050563          	beqz	a0,8020377a <sys_unlink+0x118>
    80203694:	00004597          	auipc	a1,0x4
    80203698:	fc458593          	addi	a1,a1,-60 # 80207658 <etext+0x658>
    8020369c:	0808                	addi	a0,sp,16
    8020369e:	96fff0ef          	jal	8020300c <namecmp>
    802036a2:	0c050c63          	beqz	a0,8020377a <sys_unlink+0x118>
    802036a6:	0070                	addi	a2,sp,12
    802036a8:	080c                	addi	a1,sp,16
    802036aa:	854a                	mv	a0,s2
    802036ac:	967ff0ef          	jal	80203012 <dirlookup>
    802036b0:	842a                	mv	s0,a0
    802036b2:	c561                	beqz	a0,8020377a <sys_unlink+0x118>
    802036b4:	bc8ff0ef          	jal	80202a7c <ilock>
    802036b8:	04241783          	lh	a5,66(s0)
    802036bc:	0ef05163          	blez	a5,8020379e <sys_unlink+0x13c>
    802036c0:	03c41703          	lh	a4,60(s0)
    802036c4:	4785                	li	a5,1
    802036c6:	04f70963          	beq	a4,a5,80203718 <sys_unlink+0xb6>
    802036ca:	46b2                	lw	a3,12(sp)
    802036cc:	4741                	li	a4,16
    802036ce:	1010                	addi	a2,sp,32
    802036d0:	4581                	li	a1,0
    802036d2:	854a                	mv	a0,s2
    802036d4:	02011023          	sh	zero,32(sp)
    802036d8:	827ff0ef          	jal	80202efe <writei>
    802036dc:	47c1                	li	a5,16
    802036de:	0cf51763          	bne	a0,a5,802037ac <sys_unlink+0x14a>
    802036e2:	03c41703          	lh	a4,60(s0)
    802036e6:	4785                	li	a5,1
    802036e8:	06f70e63          	beq	a4,a5,80203764 <sys_unlink+0x102>
    802036ec:	854a                	mv	a0,s2
    802036ee:	d86ff0ef          	jal	80202c74 <iunlockput>
    802036f2:	04245783          	lhu	a5,66(s0)
    802036f6:	8522                	mv	a0,s0
    802036f8:	37fd                	addiw	a5,a5,-1
    802036fa:	04f41123          	sh	a5,66(s0)
    802036fe:	ad6ff0ef          	jal	802029d4 <iupdate>
    80203702:	8522                	mv	a0,s0
    80203704:	d70ff0ef          	jal	80202c74 <iunlockput>
    80203708:	6e2000ef          	jal	80203dea <end_op>
    8020370c:	7942                	ld	s2,48(sp)
    8020370e:	4501                	li	a0,0
    80203710:	60a6                	ld	ra,72(sp)
    80203712:	6406                	ld	s0,64(sp)
    80203714:	6161                	addi	sp,sp,80
    80203716:	8082                	ret
    80203718:	4078                	lw	a4,68(s0)
    8020371a:	02000793          	li	a5,32
    8020371e:	fae7f6e3          	bgeu	a5,a4,802036ca <sys_unlink+0x68>
    80203722:	fc26                	sd	s1,56(sp)
    80203724:	02000493          	li	s1,32
    80203728:	a029                	j	80203732 <sys_unlink+0xd0>
    8020372a:	407c                	lw	a5,68(s0)
    8020372c:	24c1                	addiw	s1,s1,16
    8020372e:	04f4f463          	bgeu	s1,a5,80203776 <sys_unlink+0x114>
    80203732:	4741                	li	a4,16
    80203734:	86a6                	mv	a3,s1
    80203736:	1010                	addi	a2,sp,32
    80203738:	4581                	li	a1,0
    8020373a:	8522                	mv	a0,s0
    8020373c:	eb4ff0ef          	jal	80202df0 <readi>
    80203740:	47c1                	li	a5,16
    80203742:	04f51863          	bne	a0,a5,80203792 <sys_unlink+0x130>
    80203746:	02015783          	lhu	a5,32(sp)
    8020374a:	d3e5                	beqz	a5,8020372a <sys_unlink+0xc8>
    8020374c:	8522                	mv	a0,s0
    8020374e:	d26ff0ef          	jal	80202c74 <iunlockput>
    80203752:	854a                	mv	a0,s2
    80203754:	d20ff0ef          	jal	80202c74 <iunlockput>
    80203758:	692000ef          	jal	80203dea <end_op>
    8020375c:	557d                	li	a0,-1
    8020375e:	74e2                	ld	s1,56(sp)
    80203760:	7942                	ld	s2,48(sp)
    80203762:	b77d                	j	80203710 <sys_unlink+0xae>
    80203764:	04295783          	lhu	a5,66(s2)
    80203768:	854a                	mv	a0,s2
    8020376a:	37fd                	addiw	a5,a5,-1
    8020376c:	04f91123          	sh	a5,66(s2)
    80203770:	a64ff0ef          	jal	802029d4 <iupdate>
    80203774:	bfa5                	j	802036ec <sys_unlink+0x8a>
    80203776:	74e2                	ld	s1,56(sp)
    80203778:	bf89                	j	802036ca <sys_unlink+0x68>
    8020377a:	854a                	mv	a0,s2
    8020377c:	cf8ff0ef          	jal	80202c74 <iunlockput>
    80203780:	66a000ef          	jal	80203dea <end_op>
    80203784:	557d                	li	a0,-1
    80203786:	7942                	ld	s2,48(sp)
    80203788:	b761                	j	80203710 <sys_unlink+0xae>
    8020378a:	660000ef          	jal	80203dea <end_op>
    8020378e:	557d                	li	a0,-1
    80203790:	b741                	j	80203710 <sys_unlink+0xae>
    80203792:	00004517          	auipc	a0,0x4
    80203796:	ef650513          	addi	a0,a0,-266 # 80207688 <etext+0x688>
    8020379a:	ab7fc0ef          	jal	80200250 <panic>
    8020379e:	00004517          	auipc	a0,0x4
    802037a2:	ed250513          	addi	a0,a0,-302 # 80207670 <etext+0x670>
    802037a6:	fc26                	sd	s1,56(sp)
    802037a8:	aa9fc0ef          	jal	80200250 <panic>
    802037ac:	00004517          	auipc	a0,0x4
    802037b0:	ef450513          	addi	a0,a0,-268 # 802076a0 <etext+0x6a0>
    802037b4:	fc26                	sd	s1,56(sp)
    802037b6:	a9bfc0ef          	jal	80200250 <panic>

00000000802037ba <virtio_disk_intr>:
    802037ba:	100017b7          	lui	a5,0x10001
    802037be:	53b4                	lw	a3,96(a5)
    802037c0:	10001737          	lui	a4,0x10001
    802037c4:	8a8d                	andi	a3,a3,3
    802037c6:	d374                	sw	a3,100(a4)
    802037c8:	0ff0000f          	fence
    802037cc:	00010697          	auipc	a3,0x10
    802037d0:	57468693          	addi	a3,a3,1396 # 80213d40 <disk>
    802037d4:	6a9c                	ld	a5,16(a3)
    802037d6:	0206d703          	lhu	a4,32(a3)
    802037da:	0027d783          	lhu	a5,2(a5) # 10001002 <_entry-0x701feffe>
    802037de:	02f70e63          	beq	a4,a5,8020381a <virtio_disk_intr+0x60>
    802037e2:	0ff0000f          	fence
    802037e6:	0206d703          	lhu	a4,32(a3)
    802037ea:	6a90                	ld	a2,16(a3)
    802037ec:	00777793          	andi	a5,a4,7
    802037f0:	078e                	slli	a5,a5,0x3
    802037f2:	97b2                	add	a5,a5,a2
    802037f4:	43dc                	lw	a5,4(a5)
    802037f6:	0789                	addi	a5,a5,2
    802037f8:	0792                	slli	a5,a5,0x4
    802037fa:	97b6                	add	a5,a5,a3
    802037fc:	0107c583          	lbu	a1,16(a5)
    80203800:	ed91                	bnez	a1,8020381c <virtio_disk_intr+0x62>
    80203802:	678c                	ld	a1,8(a5)
    80203804:	2705                	addiw	a4,a4,1 # 10001001 <_entry-0x701fefff>
    80203806:	00265783          	lhu	a5,2(a2)
    8020380a:	1742                	slli	a4,a4,0x30
    8020380c:	0005a223          	sw	zero,4(a1)
    80203810:	9341                	srli	a4,a4,0x30
    80203812:	02e69023          	sh	a4,32(a3)
    80203816:	fce796e3          	bne	a5,a4,802037e2 <virtio_disk_intr+0x28>
    8020381a:	8082                	ret
    8020381c:	1141                	addi	sp,sp,-16
    8020381e:	00004517          	auipc	a0,0x4
    80203822:	e9250513          	addi	a0,a0,-366 # 802076b0 <etext+0x6b0>
    80203826:	e406                	sd	ra,8(sp)
    80203828:	a29fc0ef          	jal	80200250 <panic>

000000008020382c <free_desc>:
    8020382c:	1141                	addi	sp,sp,-16
    8020382e:	e406                	sd	ra,8(sp)
    80203830:	479d                	li	a5,7
    80203832:	02a7cd63          	blt	a5,a0,8020386c <free_desc+0x40>
    80203836:	00010797          	auipc	a5,0x10
    8020383a:	50a78793          	addi	a5,a5,1290 # 80213d40 <disk>
    8020383e:	00a78733          	add	a4,a5,a0
    80203842:	01874683          	lbu	a3,24(a4)
    80203846:	ea8d                	bnez	a3,80203878 <free_desc+0x4c>
    80203848:	639c                	ld	a5,0(a5)
    8020384a:	0512                	slli	a0,a0,0x4
    8020384c:	97aa                	add	a5,a5,a0
    8020384e:	0007b423          	sd	zero,8(a5)
    80203852:	0007b023          	sd	zero,0(a5)
    80203856:	4785                	li	a5,1
    80203858:	00f70c23          	sb	a5,24(a4)
    8020385c:	60a2                	ld	ra,8(sp)
    8020385e:	00010517          	auipc	a0,0x10
    80203862:	4fa50513          	addi	a0,a0,1274 # 80213d58 <disk+0x18>
    80203866:	0141                	addi	sp,sp,16
    80203868:	b98fe06f          	j	80201c00 <wakeup>
    8020386c:	00004517          	auipc	a0,0x4
    80203870:	e5c50513          	addi	a0,a0,-420 # 802076c8 <etext+0x6c8>
    80203874:	9ddfc0ef          	jal	80200250 <panic>
    80203878:	00004517          	auipc	a0,0x4
    8020387c:	e6050513          	addi	a0,a0,-416 # 802076d8 <etext+0x6d8>
    80203880:	9d1fc0ef          	jal	80200250 <panic>

0000000080203884 <virtio_disk_init>:
    80203884:	1101                	addi	sp,sp,-32
    80203886:	00004597          	auipc	a1,0x4
    8020388a:	e6258593          	addi	a1,a1,-414 # 802076e8 <etext+0x6e8>
    8020388e:	00010517          	auipc	a0,0x10
    80203892:	5da50513          	addi	a0,a0,1498 # 80213e68 <disk+0x128>
    80203896:	ec06                	sd	ra,24(sp)
    80203898:	e822                	sd	s0,16(sp)
    8020389a:	e426                	sd	s1,8(sp)
    8020389c:	9f5fc0ef          	jal	80200290 <initlock>
    802038a0:	100017b7          	lui	a5,0x10001
    802038a4:	4398                	lw	a4,0(a5)
    802038a6:	747277b7          	lui	a5,0x74727
    802038aa:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xbad968a>
    802038ae:	14f71a63          	bne	a4,a5,80203a02 <virtio_disk_init+0x17e>
    802038b2:	100017b7          	lui	a5,0x10001
    802038b6:	43d8                	lw	a4,4(a5)
    802038b8:	4609                	li	a2,2
    802038ba:	0007069b          	sext.w	a3,a4
    802038be:	14c71263          	bne	a4,a2,80203a02 <virtio_disk_init+0x17e>
    802038c2:	4798                	lw	a4,8(a5)
    802038c4:	12d71f63          	bne	a4,a3,80203a02 <virtio_disk_init+0x17e>
    802038c8:	10001737          	lui	a4,0x10001
    802038cc:	4754                	lw	a3,12(a4)
    802038ce:	554d47b7          	lui	a5,0x554d4
    802038d2:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ad2baaf>
    802038d6:	12f69663          	bne	a3,a5,80203a02 <virtio_disk_init+0x17e>
    802038da:	100017b7          	lui	a5,0x10001
    802038de:	0607a823          	sw	zero,112(a5) # 10001070 <_entry-0x701fef90>
    802038e2:	4705                	li	a4,1
    802038e4:	dbb8                	sw	a4,112(a5)
    802038e6:	470d                	li	a4,3
    802038e8:	dbb8                	sw	a4,112(a5)
    802038ea:	100016b7          	lui	a3,0x10001
    802038ee:	4a90                	lw	a2,16(a3)
    802038f0:	c7ffe5b7          	lui	a1,0xc7ffe
    802038f4:	75f58593          	addi	a1,a1,1887 # ffffffffc7ffe75f <end+0xffffffff47de141f>
    802038f8:	8e6d                	and	a2,a2,a1
    802038fa:	10001737          	lui	a4,0x10001
    802038fe:	d310                	sw	a2,32(a4)
    80203900:	462d                	li	a2,11
    80203902:	dbb0                	sw	a2,112(a5)
    80203904:	5ba4                	lw	s1,112(a5)
    80203906:	0084f793          	andi	a5,s1,8
    8020390a:	2481                	sext.w	s1,s1
    8020390c:	10078d63          	beqz	a5,80203a26 <virtio_disk_init+0x1a2>
    80203910:	100017b7          	lui	a5,0x10001
    80203914:	10001737          	lui	a4,0x10001
    80203918:	04470713          	addi	a4,a4,68 # 10001044 <_entry-0x701fefbc>
    8020391c:	0207a823          	sw	zero,48(a5) # 10001030 <_entry-0x701fefd0>
    80203920:	4318                	lw	a4,0(a4)
    80203922:	10071863          	bnez	a4,80203a32 <virtio_disk_init+0x1ae>
    80203926:	100017b7          	lui	a5,0x10001
    8020392a:	5bd8                	lw	a4,52(a5)
    8020392c:	0007069b          	sext.w	a3,a4
    80203930:	0e070563          	beqz	a4,80203a1a <virtio_disk_init+0x196>
    80203934:	479d                	li	a5,7
    80203936:	10d7f463          	bgeu	a5,a3,80203a3e <virtio_disk_init+0x1ba>
    8020393a:	00010417          	auipc	s0,0x10
    8020393e:	40640413          	addi	s0,s0,1030 # 80213d40 <disk>
    80203942:	977fc0ef          	jal	802002b8 <alloc_page>
    80203946:	e008                	sd	a0,0(s0)
    80203948:	971fc0ef          	jal	802002b8 <alloc_page>
    8020394c:	e408                	sd	a0,8(s0)
    8020394e:	96bfc0ef          	jal	802002b8 <alloc_page>
    80203952:	87aa                	mv	a5,a0
    80203954:	6008                	ld	a0,0(s0)
    80203956:	e81c                	sd	a5,16(s0)
    80203958:	c95d                	beqz	a0,80203a0e <virtio_disk_init+0x18a>
    8020395a:	6418                	ld	a4,8(s0)
    8020395c:	cb4d                	beqz	a4,80203a0e <virtio_disk_init+0x18a>
    8020395e:	cbc5                	beqz	a5,80203a0e <virtio_disk_init+0x18a>
    80203960:	6605                	lui	a2,0x1
    80203962:	4581                	li	a1,0
    80203964:	c25fc0ef          	jal	80200588 <memset>
    80203968:	6408                	ld	a0,8(s0)
    8020396a:	6605                	lui	a2,0x1
    8020396c:	4581                	li	a1,0
    8020396e:	c1bfc0ef          	jal	80200588 <memset>
    80203972:	6808                	ld	a0,16(s0)
    80203974:	6605                	lui	a2,0x1
    80203976:	4581                	li	a1,0
    80203978:	c11fc0ef          	jal	80200588 <memset>
    8020397c:	6014                	ld	a3,0(s0)
    8020397e:	6418                	ld	a4,8(s0)
    80203980:	100017b7          	lui	a5,0x10001
    80203984:	4621                	li	a2,8
    80203986:	df90                	sw	a2,56(a5)
    80203988:	10001837          	lui	a6,0x10001
    8020398c:	0006879b          	sext.w	a5,a3
    80203990:	08f82023          	sw	a5,128(a6) # 10001080 <_entry-0x701fef80>
    80203994:	10001537          	lui	a0,0x10001
    80203998:	681c                	ld	a5,16(s0)
    8020399a:	9681                	srai	a3,a3,0x20
    8020399c:	08d52223          	sw	a3,132(a0) # 10001084 <_entry-0x701fef7c>
    802039a0:	100015b7          	lui	a1,0x10001
    802039a4:	0007069b          	sext.w	a3,a4
    802039a8:	08d5a823          	sw	a3,144(a1) # 10001090 <_entry-0x701fef70>
    802039ac:	9701                	srai	a4,a4,0x20
    802039ae:	10001637          	lui	a2,0x10001
    802039b2:	08e62a23          	sw	a4,148(a2) # 10001094 <_entry-0x701fef6c>
    802039b6:	0007889b          	sext.w	a7,a5
    802039ba:	100016b7          	lui	a3,0x10001
    802039be:	0b16a023          	sw	a7,160(a3) # 100010a0 <_entry-0x701fef60>
    802039c2:	9781                	srai	a5,a5,0x20
    802039c4:	10001737          	lui	a4,0x10001
    802039c8:	0af72223          	sw	a5,164(a4) # 100010a4 <_entry-0x701fef5c>
    802039cc:	100018b7          	lui	a7,0x10001
    802039d0:	4785                	li	a5,1
    802039d2:	04f8a223          	sw	a5,68(a7) # 10001044 <_entry-0x701fefbc>
    802039d6:	00003897          	auipc	a7,0x3
    802039da:	62a8b883          	ld	a7,1578(a7) # 80207000 <etext>
    802039de:	01143c23          	sd	a7,24(s0)
    802039e2:	6442                	ld	s0,16(sp)
    802039e4:	0044e493          	ori	s1,s1,4
    802039e8:	100017b7          	lui	a5,0x10001
    802039ec:	60e2                	ld	ra,24(sp)
    802039ee:	dba4                	sw	s1,112(a5)
    802039f0:	64a2                	ld	s1,8(sp)
    802039f2:	00000597          	auipc	a1,0x0
    802039f6:	dc858593          	addi	a1,a1,-568 # 802037ba <virtio_disk_intr>
    802039fa:	4505                	li	a0,1
    802039fc:	6105                	addi	sp,sp,32
    802039fe:	cc4fd06f          	j	80200ec2 <register_interrupt>
    80203a02:	00004517          	auipc	a0,0x4
    80203a06:	cf650513          	addi	a0,a0,-778 # 802076f8 <etext+0x6f8>
    80203a0a:	847fc0ef          	jal	80200250 <panic>
    80203a0e:	00004517          	auipc	a0,0x4
    80203a12:	d8a50513          	addi	a0,a0,-630 # 80207798 <etext+0x798>
    80203a16:	83bfc0ef          	jal	80200250 <panic>
    80203a1a:	00004517          	auipc	a0,0x4
    80203a1e:	d3e50513          	addi	a0,a0,-706 # 80207758 <etext+0x758>
    80203a22:	82ffc0ef          	jal	80200250 <panic>
    80203a26:	00004517          	auipc	a0,0x4
    80203a2a:	cf250513          	addi	a0,a0,-782 # 80207718 <etext+0x718>
    80203a2e:	823fc0ef          	jal	80200250 <panic>
    80203a32:	00004517          	auipc	a0,0x4
    80203a36:	d0650513          	addi	a0,a0,-762 # 80207738 <etext+0x738>
    80203a3a:	817fc0ef          	jal	80200250 <panic>
    80203a3e:	00004517          	auipc	a0,0x4
    80203a42:	d3a50513          	addi	a0,a0,-710 # 80207778 <etext+0x778>
    80203a46:	80bfc0ef          	jal	80200250 <panic>

0000000080203a4a <virtio_disk_rw>:
    80203a4a:	455c                	lw	a5,12(a0)
    80203a4c:	7159                	addi	sp,sp,-112
    80203a4e:	e0d2                	sd	s4,64(sp)
    80203a50:	0017979b          	slliw	a5,a5,0x1
    80203a54:	f45e                	sd	s7,40(sp)
    80203a56:	8a2a                	mv	s4,a0
    80203a58:	02079b93          	slli	s7,a5,0x20
    80203a5c:	00010517          	auipc	a0,0x10
    80203a60:	40c50513          	addi	a0,a0,1036 # 80213e68 <disk+0x128>
    80203a64:	f0a2                	sd	s0,96(sp)
    80203a66:	e8ca                	sd	s2,80(sp)
    80203a68:	e4ce                	sd	s3,72(sp)
    80203a6a:	fc56                	sd	s5,56(sp)
    80203a6c:	f85a                	sd	s6,48(sp)
    80203a6e:	f062                	sd	s8,32(sp)
    80203a70:	ec66                	sd	s9,24(sp)
    80203a72:	f486                	sd	ra,104(sp)
    80203a74:	eca6                	sd	s1,88(sp)
    80203a76:	8b2e                	mv	s6,a1
    80203a78:	020bdb93          	srli	s7,s7,0x20
    80203a7c:	81dfc0ef          	jal	80200298 <acquire>
    80203a80:	00010c97          	auipc	s9,0x10
    80203a84:	2c0c8c93          	addi	s9,s9,704 # 80213d40 <disk>
    80203a88:	4421                	li	s0,8
    80203a8a:	490d                	li	s2,3
    80203a8c:	59fd                	li	s3,-1
    80203a8e:	4c09                	li	s8,2
    80203a90:	00010a97          	auipc	s5,0x10
    80203a94:	3d8a8a93          	addi	s5,s5,984 # 80213e68 <disk+0x128>
    80203a98:	860a                	mv	a2,sp
    80203a9a:	4481                	li	s1,0
    80203a9c:	00010717          	auipc	a4,0x10
    80203aa0:	2a470713          	addi	a4,a4,676 # 80213d40 <disk>
    80203aa4:	4781                	li	a5,0
    80203aa6:	01874683          	lbu	a3,24(a4)
    80203aaa:	0705                	addi	a4,a4,1
    80203aac:	e69d                	bnez	a3,80203ada <virtio_disk_rw+0x90>
    80203aae:	2785                	addiw	a5,a5,1 # 10001001 <_entry-0x701fefff>
    80203ab0:	fe879be3          	bne	a5,s0,80203aa6 <virtio_disk_rw+0x5c>
    80203ab4:	01362023          	sw	s3,0(a2)
    80203ab8:	c889                	beqz	s1,80203aca <virtio_disk_rw+0x80>
    80203aba:	4502                	lw	a0,0(sp)
    80203abc:	d71ff0ef          	jal	8020382c <free_desc>
    80203ac0:	01849563          	bne	s1,s8,80203aca <virtio_disk_rw+0x80>
    80203ac4:	4512                	lw	a0,4(sp)
    80203ac6:	d67ff0ef          	jal	8020382c <free_desc>
    80203aca:	85d6                	mv	a1,s5
    80203acc:	00010517          	auipc	a0,0x10
    80203ad0:	28c50513          	addi	a0,a0,652 # 80213d58 <disk+0x18>
    80203ad4:	fa5fd0ef          	jal	80201a78 <sleep>
    80203ad8:	b7c1                	j	80203a98 <virtio_disk_rw+0x4e>
    80203ada:	00fc8733          	add	a4,s9,a5
    80203ade:	c21c                	sw	a5,0(a2)
    80203ae0:	00070c23          	sb	zero,24(a4)
    80203ae4:	2485                	addiw	s1,s1,1
    80203ae6:	0611                	addi	a2,a2,4
    80203ae8:	fb249ae3          	bne	s1,s2,80203a9c <virtio_disk_rw+0x52>
    80203aec:	4802                	lw	a6,0(sp)
    80203aee:	000cb603          	ld	a2,0(s9)
    80203af2:	4e92                	lw	t4,4(sp)
    80203af4:	00a80693          	addi	a3,a6,10
    80203af8:	48a2                	lw	a7,8(sp)
    80203afa:	00481793          	slli	a5,a6,0x4
    80203afe:	0692                	slli	a3,a3,0x4
    80203b00:	96e6                	add	a3,a3,s9
    80203b02:	001b3713          	seqz	a4,s6
    80203b06:	0a878313          	addi	t1,a5,168
    80203b0a:	01603b33          	snez	s6,s6
    80203b0e:	0166a423          	sw	s6,8(a3)
    80203b12:	0006a623          	sw	zero,12(a3)
    80203b16:	0176b823          	sd	s7,16(a3)
    80203b1a:	00f605b3          	add	a1,a2,a5
    80203b1e:	9366                	add	t1,t1,s9
    80203b20:	0017171b          	slliw	a4,a4,0x1
    80203b24:	0065b023          	sd	t1,0(a1)
    80203b28:	4e05                	li	t3,1
    80203b2a:	01089f1b          	slliw	t5,a7,0x10
    80203b2e:	004e9513          	slli	a0,t4,0x4
    80203b32:	4341                	li	t1,16
    80203b34:	00176713          	ori	a4,a4,1
    80203b38:	0065a423          	sw	t1,8(a1)
    80203b3c:	01c59623          	sh	t3,12(a1)
    80203b40:	01d59723          	sh	t4,14(a1)
    80203b44:	9532                	add	a0,a0,a2
    80203b46:	01e76733          	or	a4,a4,t5
    80203b4a:	00280693          	addi	a3,a6,2
    80203b4e:	c558                	sw	a4,12(a0)
    80203b50:	050a0313          	addi	t1,s4,80
    80203b54:	0692                	slli	a3,a3,0x4
    80203b56:	40000713          	li	a4,1024
    80203b5a:	4585                	li	a1,1
    80203b5c:	c518                	sw	a4,8(a0)
    80203b5e:	00653023          	sd	t1,0(a0)
    80203b62:	00dc8733          	add	a4,s9,a3
    80203b66:	0892                	slli	a7,a7,0x4
    80203b68:	56fd                	li	a3,-1
    80203b6a:	1586                	slli	a1,a1,0x21
    80203b6c:	00d70823          	sb	a3,16(a4)
    80203b70:	9646                	add	a2,a2,a7
    80203b72:	0585                	addi	a1,a1,1
    80203b74:	e60c                	sd	a1,8(a2)
    80203b76:	008cb583          	ld	a1,8(s9)
    80203b7a:	03078793          	addi	a5,a5,48
    80203b7e:	97e6                	add	a5,a5,s9
    80203b80:	0025d683          	lhu	a3,2(a1)
    80203b84:	e21c                	sd	a5,0(a2)
    80203b86:	01ca2223          	sw	t3,4(s4)
    80203b8a:	0076f793          	andi	a5,a3,7
    80203b8e:	0786                	slli	a5,a5,0x1
    80203b90:	01473423          	sd	s4,8(a4)
    80203b94:	95be                	add	a1,a1,a5
    80203b96:	01059223          	sh	a6,4(a1)
    80203b9a:	0ff0000f          	fence
    80203b9e:	008cb703          	ld	a4,8(s9)
    80203ba2:	00275783          	lhu	a5,2(a4)
    80203ba6:	2785                	addiw	a5,a5,1
    80203ba8:	00f71123          	sh	a5,2(a4)
    80203bac:	0ff0000f          	fence
    80203bb0:	100017b7          	lui	a5,0x10001
    80203bb4:	4705                	li	a4,1
    80203bb6:	0407a823          	sw	zero,80(a5) # 10001050 <_entry-0x701fefb0>
    80203bba:	0ff0000f          	fence
    80203bbe:	004a2783          	lw	a5,4(s4)
    80203bc2:	fee78ce3          	beq	a5,a4,80203bba <virtio_disk_rw+0x170>
    80203bc6:	4402                	lw	s0,0(sp)
    80203bc8:	00240793          	addi	a5,s0,2
    80203bcc:	0792                	slli	a5,a5,0x4
    80203bce:	97e6                	add	a5,a5,s9
    80203bd0:	0007b423          	sd	zero,8(a5)
    80203bd4:	000cb783          	ld	a5,0(s9)
    80203bd8:	00441713          	slli	a4,s0,0x4
    80203bdc:	8522                	mv	a0,s0
    80203bde:	97ba                	add	a5,a5,a4
    80203be0:	00c7d483          	lhu	s1,12(a5)
    80203be4:	00e7d403          	lhu	s0,14(a5)
    80203be8:	c45ff0ef          	jal	8020382c <free_desc>
    80203bec:	8885                	andi	s1,s1,1
    80203bee:	f0fd                	bnez	s1,80203bd4 <virtio_disk_rw+0x18a>
    80203bf0:	7406                	ld	s0,96(sp)
    80203bf2:	70a6                	ld	ra,104(sp)
    80203bf4:	64e6                	ld	s1,88(sp)
    80203bf6:	6946                	ld	s2,80(sp)
    80203bf8:	69a6                	ld	s3,72(sp)
    80203bfa:	6a06                	ld	s4,64(sp)
    80203bfc:	7ae2                	ld	s5,56(sp)
    80203bfe:	7b42                	ld	s6,48(sp)
    80203c00:	7ba2                	ld	s7,40(sp)
    80203c02:	7c02                	ld	s8,32(sp)
    80203c04:	6ce2                	ld	s9,24(sp)
    80203c06:	00010517          	auipc	a0,0x10
    80203c0a:	26250513          	addi	a0,a0,610 # 80213e68 <disk+0x128>
    80203c0e:	6165                	addi	sp,sp,112
    80203c10:	e9afc06f          	j	802002aa <release>

0000000080203c14 <write_head>:
    80203c14:	1141                	addi	sp,sp,-16
    80203c16:	e022                	sd	s0,0(sp)
    80203c18:	00010417          	auipc	s0,0x10
    80203c1c:	26040413          	addi	s0,s0,608 # 80213e78 <log>
    80203c20:	480c                	lw	a1,16(s0)
    80203c22:	4c48                	lw	a0,28(s0)
    80203c24:	e406                	sd	ra,8(sp)
    80203c26:	d0cfe0ef          	jal	80202132 <bread>
    80203c2a:	5010                	lw	a2,32(s0)
    80203c2c:	842a                	mv	s0,a0
    80203c2e:	c930                	sw	a2,80(a0)
    80203c30:	00c05f63          	blez	a2,80203c4e <write_head+0x3a>
    80203c34:	060a                	slli	a2,a2,0x2
    80203c36:	00010717          	auipc	a4,0x10
    80203c3a:	26670713          	addi	a4,a4,614 # 80213e9c <log+0x24>
    80203c3e:	87aa                	mv	a5,a0
    80203c40:	962a                	add	a2,a2,a0
    80203c42:	4314                	lw	a3,0(a4)
    80203c44:	0791                	addi	a5,a5,4
    80203c46:	0711                	addi	a4,a4,4
    80203c48:	cbb4                	sw	a3,80(a5)
    80203c4a:	fec79ce3          	bne	a5,a2,80203c42 <write_head+0x2e>
    80203c4e:	8522                	mv	a0,s0
    80203c50:	dc6fe0ef          	jal	80202216 <bwrite>
    80203c54:	8522                	mv	a0,s0
    80203c56:	6402                	ld	s0,0(sp)
    80203c58:	60a2                	ld	ra,8(sp)
    80203c5a:	0141                	addi	sp,sp,16
    80203c5c:	de4fe06f          	j	80202240 <brelse>

0000000080203c60 <install_trans>:
    80203c60:	7139                	addi	sp,sp,-64
    80203c62:	ec4e                	sd	s3,24(sp)
    80203c64:	00010997          	auipc	s3,0x10
    80203c68:	21498993          	addi	s3,s3,532 # 80213e78 <log>
    80203c6c:	0209a783          	lw	a5,32(s3)
    80203c70:	fc06                	sd	ra,56(sp)
    80203c72:	08f05463          	blez	a5,80203cfa <install_trans+0x9a>
    80203c76:	f04a                	sd	s2,32(sp)
    80203c78:	e852                	sd	s4,16(sp)
    80203c7a:	e456                	sd	s5,8(sp)
    80203c7c:	e05a                	sd	s6,0(sp)
    80203c7e:	f822                	sd	s0,48(sp)
    80203c80:	f426                	sd	s1,40(sp)
    80203c82:	8aaa                	mv	s5,a0
    80203c84:	00010a17          	auipc	s4,0x10
    80203c88:	218a0a13          	addi	s4,s4,536 # 80213e9c <log+0x24>
    80203c8c:	4901                	li	s2,0
    80203c8e:	00004b17          	auipc	s6,0x4
    80203c92:	b22b0b13          	addi	s6,s6,-1246 # 802077b0 <etext+0x7b0>
    80203c96:	060a9663          	bnez	s5,80203d02 <install_trans+0xa2>
    80203c9a:	0109a583          	lw	a1,16(s3)
    80203c9e:	01c9a503          	lw	a0,28(s3)
    80203ca2:	012585bb          	addw	a1,a1,s2
    80203ca6:	2585                	addiw	a1,a1,1
    80203ca8:	c8afe0ef          	jal	80202132 <bread>
    80203cac:	000a2583          	lw	a1,0(s4)
    80203cb0:	84aa                	mv	s1,a0
    80203cb2:	01c9a503          	lw	a0,28(s3)
    80203cb6:	c7cfe0ef          	jal	80202132 <bread>
    80203cba:	842a                	mv	s0,a0
    80203cbc:	40000613          	li	a2,1024
    80203cc0:	05048593          	addi	a1,s1,80
    80203cc4:	05050513          	addi	a0,a0,80
    80203cc8:	8ddfc0ef          	jal	802005a4 <memmove>
    80203ccc:	8522                	mv	a0,s0
    80203cce:	d48fe0ef          	jal	80202216 <bwrite>
    80203cd2:	020a8f63          	beqz	s5,80203d10 <install_trans+0xb0>
    80203cd6:	8526                	mv	a0,s1
    80203cd8:	d68fe0ef          	jal	80202240 <brelse>
    80203cdc:	8522                	mv	a0,s0
    80203cde:	d62fe0ef          	jal	80202240 <brelse>
    80203ce2:	0209a783          	lw	a5,32(s3)
    80203ce6:	2905                	addiw	s2,s2,1
    80203ce8:	0a11                	addi	s4,s4,4
    80203cea:	faf946e3          	blt	s2,a5,80203c96 <install_trans+0x36>
    80203cee:	7442                	ld	s0,48(sp)
    80203cf0:	74a2                	ld	s1,40(sp)
    80203cf2:	7902                	ld	s2,32(sp)
    80203cf4:	6a42                	ld	s4,16(sp)
    80203cf6:	6aa2                	ld	s5,8(sp)
    80203cf8:	6b02                	ld	s6,0(sp)
    80203cfa:	70e2                	ld	ra,56(sp)
    80203cfc:	69e2                	ld	s3,24(sp)
    80203cfe:	6121                	addi	sp,sp,64
    80203d00:	8082                	ret
    80203d02:	000a2603          	lw	a2,0(s4)
    80203d06:	85ca                	mv	a1,s2
    80203d08:	855a                	mv	a0,s6
    80203d0a:	c50fc0ef          	jal	8020015a <printf>
    80203d0e:	b771                	j	80203c9a <install_trans+0x3a>
    80203d10:	8522                	mv	a0,s0
    80203d12:	dd2fe0ef          	jal	802022e4 <bunpin>
    80203d16:	b7c1                	j	80203cd6 <install_trans+0x76>

0000000080203d18 <initlog>:
    80203d18:	1101                	addi	sp,sp,-32
    80203d1a:	e822                	sd	s0,16(sp)
    80203d1c:	00010417          	auipc	s0,0x10
    80203d20:	15c40413          	addi	s0,s0,348 # 80213e78 <log>
    80203d24:	e426                	sd	s1,8(sp)
    80203d26:	e04a                	sd	s2,0(sp)
    80203d28:	84aa                	mv	s1,a0
    80203d2a:	892e                	mv	s2,a1
    80203d2c:	8522                	mv	a0,s0
    80203d2e:	00004597          	auipc	a1,0x4
    80203d32:	aa258593          	addi	a1,a1,-1374 # 802077d0 <etext+0x7d0>
    80203d36:	ec06                	sd	ra,24(sp)
    80203d38:	d58fc0ef          	jal	80200290 <initlock>
    80203d3c:	01492583          	lw	a1,20(s2)
    80203d40:	8526                	mv	a0,s1
    80203d42:	cc44                	sw	s1,28(s0)
    80203d44:	c80c                	sw	a1,16(s0)
    80203d46:	becfe0ef          	jal	80202132 <bread>
    80203d4a:	4930                	lw	a2,80(a0)
    80203d4c:	d010                	sw	a2,32(s0)
    80203d4e:	02c05063          	blez	a2,80203d6e <initlog+0x56>
    80203d52:	060a                	slli	a2,a2,0x2
    80203d54:	87aa                	mv	a5,a0
    80203d56:	00010717          	auipc	a4,0x10
    80203d5a:	14670713          	addi	a4,a4,326 # 80213e9c <log+0x24>
    80203d5e:	962a                	add	a2,a2,a0
    80203d60:	4bf4                	lw	a3,84(a5)
    80203d62:	0791                	addi	a5,a5,4
    80203d64:	0711                	addi	a4,a4,4
    80203d66:	fed72e23          	sw	a3,-4(a4)
    80203d6a:	fec79be3          	bne	a5,a2,80203d60 <initlog+0x48>
    80203d6e:	cd2fe0ef          	jal	80202240 <brelse>
    80203d72:	4505                	li	a0,1
    80203d74:	eedff0ef          	jal	80203c60 <install_trans>
    80203d78:	6442                	ld	s0,16(sp)
    80203d7a:	60e2                	ld	ra,24(sp)
    80203d7c:	64a2                	ld	s1,8(sp)
    80203d7e:	6902                	ld	s2,0(sp)
    80203d80:	00010797          	auipc	a5,0x10
    80203d84:	1007ac23          	sw	zero,280(a5) # 80213e98 <log+0x20>
    80203d88:	6105                	addi	sp,sp,32
    80203d8a:	b569                	j	80203c14 <write_head>

0000000080203d8c <begin_op>:
    80203d8c:	1101                	addi	sp,sp,-32
    80203d8e:	00010517          	auipc	a0,0x10
    80203d92:	0ea50513          	addi	a0,a0,234 # 80213e78 <log>
    80203d96:	e822                	sd	s0,16(sp)
    80203d98:	e426                	sd	s1,8(sp)
    80203d9a:	ec06                	sd	ra,24(sp)
    80203d9c:	00010417          	auipc	s0,0x10
    80203da0:	0dc40413          	addi	s0,s0,220 # 80213e78 <log>
    80203da4:	cf4fc0ef          	jal	80200298 <acquire>
    80203da8:	44f9                	li	s1,30
    80203daa:	a019                	j	80203db0 <begin_op+0x24>
    80203dac:	ccdfd0ef          	jal	80201a78 <sleep>
    80203db0:	4c1c                	lw	a5,24(s0)
    80203db2:	85a2                	mv	a1,s0
    80203db4:	00010517          	auipc	a0,0x10
    80203db8:	0c450513          	addi	a0,a0,196 # 80213e78 <log>
    80203dbc:	fbe5                	bnez	a5,80203dac <begin_op+0x20>
    80203dbe:	4858                	lw	a4,20(s0)
    80203dc0:	5014                	lw	a3,32(s0)
    80203dc2:	2705                	addiw	a4,a4,1
    80203dc4:	0027179b          	slliw	a5,a4,0x2
    80203dc8:	9fb9                	addw	a5,a5,a4
    80203dca:	0017979b          	slliw	a5,a5,0x1
    80203dce:	9fb5                	addw	a5,a5,a3
    80203dd0:	fcf4cee3          	blt	s1,a5,80203dac <begin_op+0x20>
    80203dd4:	c858                	sw	a4,20(s0)
    80203dd6:	6442                	ld	s0,16(sp)
    80203dd8:	60e2                	ld	ra,24(sp)
    80203dda:	64a2                	ld	s1,8(sp)
    80203ddc:	00010517          	auipc	a0,0x10
    80203de0:	09c50513          	addi	a0,a0,156 # 80213e78 <log>
    80203de4:	6105                	addi	sp,sp,32
    80203de6:	cc4fc06f          	j	802002aa <release>

0000000080203dea <end_op>:
    80203dea:	7179                	addi	sp,sp,-48
    80203dec:	f022                	sd	s0,32(sp)
    80203dee:	00010417          	auipc	s0,0x10
    80203df2:	08a40413          	addi	s0,s0,138 # 80213e78 <log>
    80203df6:	8522                	mv	a0,s0
    80203df8:	ec26                	sd	s1,24(sp)
    80203dfa:	f406                	sd	ra,40(sp)
    80203dfc:	c9cfc0ef          	jal	80200298 <acquire>
    80203e00:	4844                	lw	s1,20(s0)
    80203e02:	4c1c                	lw	a5,24(s0)
    80203e04:	34fd                	addiw	s1,s1,-1
    80203e06:	c844                	sw	s1,20(s0)
    80203e08:	0c079763          	bnez	a5,80203ed6 <end_op+0xec>
    80203e0c:	8522                	mv	a0,s0
    80203e0e:	e8dd                	bnez	s1,80203ec4 <end_op+0xda>
    80203e10:	4785                	li	a5,1
    80203e12:	cc1c                	sw	a5,24(s0)
    80203e14:	c96fc0ef          	jal	802002aa <release>
    80203e18:	501c                	lw	a5,32(s0)
    80203e1a:	02f04c63          	bgtz	a5,80203e52 <end_op+0x68>
    80203e1e:	00010517          	auipc	a0,0x10
    80203e22:	05a50513          	addi	a0,a0,90 # 80213e78 <log>
    80203e26:	c72fc0ef          	jal	80200298 <acquire>
    80203e2a:	00010517          	auipc	a0,0x10
    80203e2e:	04e50513          	addi	a0,a0,78 # 80213e78 <log>
    80203e32:	00010797          	auipc	a5,0x10
    80203e36:	0407af23          	sw	zero,94(a5) # 80213e90 <log+0x18>
    80203e3a:	dc7fd0ef          	jal	80201c00 <wakeup>
    80203e3e:	7402                	ld	s0,32(sp)
    80203e40:	70a2                	ld	ra,40(sp)
    80203e42:	64e2                	ld	s1,24(sp)
    80203e44:	00010517          	auipc	a0,0x10
    80203e48:	03450513          	addi	a0,a0,52 # 80213e78 <log>
    80203e4c:	6145                	addi	sp,sp,48
    80203e4e:	c5cfc06f          	j	802002aa <release>
    80203e52:	e052                	sd	s4,0(sp)
    80203e54:	e84a                	sd	s2,16(sp)
    80203e56:	e44e                	sd	s3,8(sp)
    80203e58:	00010a17          	auipc	s4,0x10
    80203e5c:	044a0a13          	addi	s4,s4,68 # 80213e9c <log+0x24>
    80203e60:	480c                	lw	a1,16(s0)
    80203e62:	4c48                	lw	a0,28(s0)
    80203e64:	0a11                	addi	s4,s4,4
    80203e66:	9da5                	addw	a1,a1,s1
    80203e68:	2585                	addiw	a1,a1,1
    80203e6a:	ac8fe0ef          	jal	80202132 <bread>
    80203e6e:	892a                	mv	s2,a0
    80203e70:	ffca2583          	lw	a1,-4(s4)
    80203e74:	4c48                	lw	a0,28(s0)
    80203e76:	2485                	addiw	s1,s1,1
    80203e78:	abafe0ef          	jal	80202132 <bread>
    80203e7c:	05050593          	addi	a1,a0,80
    80203e80:	40000613          	li	a2,1024
    80203e84:	89aa                	mv	s3,a0
    80203e86:	05090513          	addi	a0,s2,80
    80203e8a:	f1afc0ef          	jal	802005a4 <memmove>
    80203e8e:	854a                	mv	a0,s2
    80203e90:	b86fe0ef          	jal	80202216 <bwrite>
    80203e94:	854e                	mv	a0,s3
    80203e96:	baafe0ef          	jal	80202240 <brelse>
    80203e9a:	854a                	mv	a0,s2
    80203e9c:	ba4fe0ef          	jal	80202240 <brelse>
    80203ea0:	501c                	lw	a5,32(s0)
    80203ea2:	faf4cfe3          	blt	s1,a5,80203e60 <end_op+0x76>
    80203ea6:	d6fff0ef          	jal	80203c14 <write_head>
    80203eaa:	4501                	li	a0,0
    80203eac:	db5ff0ef          	jal	80203c60 <install_trans>
    80203eb0:	00010797          	auipc	a5,0x10
    80203eb4:	fe07a423          	sw	zero,-24(a5) # 80213e98 <log+0x20>
    80203eb8:	d5dff0ef          	jal	80203c14 <write_head>
    80203ebc:	6942                	ld	s2,16(sp)
    80203ebe:	69a2                	ld	s3,8(sp)
    80203ec0:	6a02                	ld	s4,0(sp)
    80203ec2:	bfb1                	j	80203e1e <end_op+0x34>
    80203ec4:	d3dfd0ef          	jal	80201c00 <wakeup>
    80203ec8:	8522                	mv	a0,s0
    80203eca:	7402                	ld	s0,32(sp)
    80203ecc:	70a2                	ld	ra,40(sp)
    80203ece:	64e2                	ld	s1,24(sp)
    80203ed0:	6145                	addi	sp,sp,48
    80203ed2:	bd8fc06f          	j	802002aa <release>
    80203ed6:	00004517          	auipc	a0,0x4
    80203eda:	90250513          	addi	a0,a0,-1790 # 802077d8 <etext+0x7d8>
    80203ede:	e84a                	sd	s2,16(sp)
    80203ee0:	e44e                	sd	s3,8(sp)
    80203ee2:	e052                	sd	s4,0(sp)
    80203ee4:	b6cfc0ef          	jal	80200250 <panic>

0000000080203ee8 <log_write>:
    80203ee8:	1101                	addi	sp,sp,-32
    80203eea:	e822                	sd	s0,16(sp)
    80203eec:	00010417          	auipc	s0,0x10
    80203ef0:	f8c40413          	addi	s0,s0,-116 # 80213e78 <log>
    80203ef4:	e426                	sd	s1,8(sp)
    80203ef6:	84aa                	mv	s1,a0
    80203ef8:	8522                	mv	a0,s0
    80203efa:	ec06                	sd	ra,24(sp)
    80203efc:	b9cfc0ef          	jal	80200298 <acquire>
    80203f00:	5010                	lw	a2,32(s0)
    80203f02:	47f5                	li	a5,29
    80203f04:	08c7c163          	blt	a5,a2,80203f86 <log_write+0x9e>
    80203f08:	485c                	lw	a5,20(s0)
    80203f0a:	06f05863          	blez	a5,80203f7a <log_write+0x92>
    80203f0e:	44cc                	lw	a1,12(s1)
    80203f10:	00010717          	auipc	a4,0x10
    80203f14:	f8c70713          	addi	a4,a4,-116 # 80213e9c <log+0x24>
    80203f18:	4781                	li	a5,0
    80203f1a:	00c04763          	bgtz	a2,80203f28 <log_write+0x40>
    80203f1e:	a801                	j	80203f2e <log_write+0x46>
    80203f20:	2785                	addiw	a5,a5,1
    80203f22:	0711                	addi	a4,a4,4
    80203f24:	02f60663          	beq	a2,a5,80203f50 <log_write+0x68>
    80203f28:	4314                	lw	a3,0(a4)
    80203f2a:	feb69be3          	bne	a3,a1,80203f20 <log_write+0x38>
    80203f2e:	00878713          	addi	a4,a5,8
    80203f32:	070a                	slli	a4,a4,0x2
    80203f34:	9722                	add	a4,a4,s0
    80203f36:	c34c                	sw	a1,4(a4)
    80203f38:	02f60163          	beq	a2,a5,80203f5a <log_write+0x72>
    80203f3c:	6442                	ld	s0,16(sp)
    80203f3e:	60e2                	ld	ra,24(sp)
    80203f40:	64a2                	ld	s1,8(sp)
    80203f42:	00010517          	auipc	a0,0x10
    80203f46:	f3650513          	addi	a0,a0,-202 # 80213e78 <log>
    80203f4a:	6105                	addi	sp,sp,32
    80203f4c:	b5efc06f          	j	802002aa <release>
    80203f50:	00860793          	addi	a5,a2,8
    80203f54:	078a                	slli	a5,a5,0x2
    80203f56:	97a2                	add	a5,a5,s0
    80203f58:	c3cc                	sw	a1,4(a5)
    80203f5a:	8526                	mv	a0,s1
    80203f5c:	b5cfe0ef          	jal	802022b8 <bpin>
    80203f60:	501c                	lw	a5,32(s0)
    80203f62:	60e2                	ld	ra,24(sp)
    80203f64:	64a2                	ld	s1,8(sp)
    80203f66:	2785                	addiw	a5,a5,1
    80203f68:	d01c                	sw	a5,32(s0)
    80203f6a:	6442                	ld	s0,16(sp)
    80203f6c:	00010517          	auipc	a0,0x10
    80203f70:	f0c50513          	addi	a0,a0,-244 # 80213e78 <log>
    80203f74:	6105                	addi	sp,sp,32
    80203f76:	b34fc06f          	j	802002aa <release>
    80203f7a:	00004517          	auipc	a0,0x4
    80203f7e:	88650513          	addi	a0,a0,-1914 # 80207800 <etext+0x800>
    80203f82:	acefc0ef          	jal	80200250 <panic>
    80203f86:	00004517          	auipc	a0,0x4
    80203f8a:	86250513          	addi	a0,a0,-1950 # 802077e8 <etext+0x7e8>
    80203f8e:	ac2fc0ef          	jal	80200250 <panic>

0000000080203f92 <itoa>:
    80203f92:	4e81                	li	t4,0
    80203f94:	08054263          	bltz	a0,80204018 <itoa+0x86>
    80203f98:	872e                	mv	a4,a1
    80203f9a:	882e                	mv	a6,a1
    80203f9c:	4681                	li	a3,0
    80203f9e:	4e25                	li	t3,9
    80203fa0:	a011                	j	80203fa4 <itoa+0x12>
    80203fa2:	86be                	mv	a3,a5
    80203fa4:	02c568bb          	remw	a7,a0,a2
    80203fa8:	0ff8f793          	zext.b	a5,a7
    80203fac:	0307831b          	addiw	t1,a5,48
    80203fb0:	0577879b          	addiw	a5,a5,87
    80203fb4:	0ff7f793          	zext.b	a5,a5
    80203fb8:	011e4463          	blt	t3,a7,80203fc0 <itoa+0x2e>
    80203fbc:	0ff37793          	zext.b	a5,t1
    80203fc0:	02c5453b          	divw	a0,a0,a2
    80203fc4:	00f80023          	sb	a5,0(a6)
    80203fc8:	0016879b          	addiw	a5,a3,1
    80203fcc:	0805                	addi	a6,a6,1
    80203fce:	fca04ae3          	bgtz	a0,80203fa2 <itoa+0x10>
    80203fd2:	00f58633          	add	a2,a1,a5
    80203fd6:	020e8d63          	beqz	t4,80204010 <itoa+0x7e>
    80203fda:	2689                	addiw	a3,a3,2
    80203fdc:	02d00513          	li	a0,45
    80203fe0:	96ae                	add	a3,a3,a1
    80203fe2:	00a60023          	sb	a0,0(a2)
    80203fe6:	00068023          	sb	zero,0(a3)
    80203fea:	86be                	mv	a3,a5
    80203fec:	95b6                	add	a1,a1,a3
    80203fee:	4601                	li	a2,0
    80203ff0:	0005c803          	lbu	a6,0(a1)
    80203ff4:	00074503          	lbu	a0,0(a4)
    80203ff8:	2605                	addiw	a2,a2,1
    80203ffa:	01070023          	sb	a6,0(a4)
    80203ffe:	00a58023          	sb	a0,0(a1)
    80204002:	40c687bb          	subw	a5,a3,a2
    80204006:	0705                	addi	a4,a4,1
    80204008:	15fd                	addi	a1,a1,-1
    8020400a:	fef643e3          	blt	a2,a5,80203ff0 <itoa+0x5e>
    8020400e:	8082                	ret
    80204010:	00060023          	sb	zero,0(a2)
    80204014:	fee1                	bnez	a3,80203fec <itoa+0x5a>
    80204016:	8082                	ret
    80204018:	47a9                	li	a5,10
    8020401a:	f6f61fe3          	bne	a2,a5,80203f98 <itoa+0x6>
    8020401e:	40a0053b          	negw	a0,a0
    80204022:	4e85                	li	t4,1
    80204024:	bf95                	j	80203f98 <itoa+0x6>

0000000080204026 <vsnprintf>:
    80204026:	711d                	addi	sp,sp,-96
    80204028:	e4a6                	sd	s1,72(sp)
    8020402a:	ec86                	sd	ra,88(sp)
    8020402c:	e8a2                	sd	s0,80(sp)
    8020402e:	00064783          	lbu	a5,0(a2)
    80204032:	84aa                	mv	s1,a0
    80204034:	c3f1                	beqz	a5,802040f8 <vsnprintf+0xd2>
    80204036:	fc4e                	sd	s3,56(sp)
    80204038:	fff5899b          	addiw	s3,a1,-1
    8020403c:	0c098063          	beqz	s3,802040fc <vsnprintf+0xd6>
    80204040:	f852                	sd	s4,48(sp)
    80204042:	f05a                	sd	s6,32(sp)
    80204044:	ec5e                	sd	s7,24(sp)
    80204046:	e0ca                	sd	s2,64(sp)
    80204048:	4401                	li	s0,0
    8020404a:	02500a13          	li	s4,37
    8020404e:	06400b13          	li	s6,100
    80204052:	07300b93          	li	s7,115
    80204056:	a829                	j	80204070 <vsnprintf+0x4a>
    80204058:	00f48023          	sb	a5,0(s1)
    8020405c:	2405                	addiw	s0,s0,1
    8020405e:	0485                	addi	s1,s1,1
    80204060:	8932                	mv	s2,a2
    80204062:	00194783          	lbu	a5,1(s2)
    80204066:	00190613          	addi	a2,s2,1
    8020406a:	cf95                	beqz	a5,802040a6 <vsnprintf+0x80>
    8020406c:	03347d63          	bgeu	s0,s3,802040a6 <vsnprintf+0x80>
    80204070:	00160913          	addi	s2,a2,1
    80204074:	ff4792e3          	bne	a5,s4,80204058 <vsnprintf+0x32>
    80204078:	00164783          	lbu	a5,1(a2)
    8020407c:	05678263          	beq	a5,s6,802040c0 <vsnprintf+0x9a>
    80204080:	ff7791e3          	bne	a5,s7,80204062 <vsnprintf+0x3c>
    80204084:	6298                	ld	a4,0(a3)
    80204086:	06a1                	addi	a3,a3,8
    80204088:	00074783          	lbu	a5,0(a4)
    8020408c:	dbf9                	beqz	a5,80204062 <vsnprintf+0x3c>
    8020408e:	fd347ae3          	bgeu	s0,s3,80204062 <vsnprintf+0x3c>
    80204092:	00f48023          	sb	a5,0(s1)
    80204096:	00174783          	lbu	a5,1(a4)
    8020409a:	0485                	addi	s1,s1,1
    8020409c:	0705                	addi	a4,a4,1
    8020409e:	2405                	addiw	s0,s0,1
    802040a0:	d3e9                	beqz	a5,80204062 <vsnprintf+0x3c>
    802040a2:	ff3468e3          	bltu	s0,s3,80204092 <vsnprintf+0x6c>
    802040a6:	6906                	ld	s2,64(sp)
    802040a8:	79e2                	ld	s3,56(sp)
    802040aa:	7a42                	ld	s4,48(sp)
    802040ac:	7b02                	ld	s6,32(sp)
    802040ae:	6be2                	ld	s7,24(sp)
    802040b0:	00048023          	sb	zero,0(s1)
    802040b4:	60e6                	ld	ra,88(sp)
    802040b6:	8522                	mv	a0,s0
    802040b8:	6446                	ld	s0,80(sp)
    802040ba:	64a6                	ld	s1,72(sp)
    802040bc:	6125                	addi	sp,sp,96
    802040be:	8082                	ret
    802040c0:	4288                	lw	a0,0(a3)
    802040c2:	4629                	li	a2,10
    802040c4:	858a                	mv	a1,sp
    802040c6:	f456                	sd	s5,40(sp)
    802040c8:	00868a93          	addi	s5,a3,8
    802040cc:	ec7ff0ef          	jal	80203f92 <itoa>
    802040d0:	00014703          	lbu	a4,0(sp)
    802040d4:	cf19                	beqz	a4,802040f2 <vsnprintf+0xcc>
    802040d6:	01347e63          	bgeu	s0,s3,802040f2 <vsnprintf+0xcc>
    802040da:	878a                	mv	a5,sp
    802040dc:	a019                	j	802040e2 <vsnprintf+0xbc>
    802040de:	01347a63          	bgeu	s0,s3,802040f2 <vsnprintf+0xcc>
    802040e2:	0785                	addi	a5,a5,1
    802040e4:	00e48023          	sb	a4,0(s1)
    802040e8:	0007c703          	lbu	a4,0(a5)
    802040ec:	0485                	addi	s1,s1,1
    802040ee:	2405                	addiw	s0,s0,1
    802040f0:	f77d                	bnez	a4,802040de <vsnprintf+0xb8>
    802040f2:	86d6                	mv	a3,s5
    802040f4:	7aa2                	ld	s5,40(sp)
    802040f6:	b7b5                	j	80204062 <vsnprintf+0x3c>
    802040f8:	4401                	li	s0,0
    802040fa:	bf5d                	j	802040b0 <vsnprintf+0x8a>
    802040fc:	79e2                	ld	s3,56(sp)
    802040fe:	4401                	li	s0,0
    80204100:	bf45                	j	802040b0 <vsnprintf+0x8a>

0000000080204102 <snprintf>:
    80204102:	715d                	addi	sp,sp,-80
    80204104:	02810313          	addi	t1,sp,40
    80204108:	f436                	sd	a3,40(sp)
    8020410a:	869a                	mv	a3,t1
    8020410c:	ec06                	sd	ra,24(sp)
    8020410e:	f83a                	sd	a4,48(sp)
    80204110:	fc3e                	sd	a5,56(sp)
    80204112:	e0c2                	sd	a6,64(sp)
    80204114:	e4c6                	sd	a7,72(sp)
    80204116:	e41a                	sd	t1,8(sp)
    80204118:	f0fff0ef          	jal	80204026 <vsnprintf>
    8020411c:	60e2                	ld	ra,24(sp)
    8020411e:	6161                	addi	sp,sp,80
    80204120:	8082                	ret

0000000080204122 <sys_exit>:
    80204122:	1141                	addi	sp,sp,-16
    80204124:	85aa                	mv	a1,a0
    80204126:	00004517          	auipc	a0,0x4
    8020412a:	78253503          	ld	a0,1922(a0) # 802088a8 <current_proc>
    8020412e:	e406                	sd	ra,8(sp)
    80204130:	dd8fd0ef          	jal	80201708 <exit_process>
    80204134:	60a2                	ld	ra,8(sp)
    80204136:	4501                	li	a0,0
    80204138:	0141                	addi	sp,sp,16
    8020413a:	8082                	ret

000000008020413c <sys_getpid>:
    8020413c:	00004797          	auipc	a5,0x4
    80204140:	76c7b783          	ld	a5,1900(a5) # 802088a8 <current_proc>
    80204144:	4b88                	lw	a0,16(a5)
    80204146:	8082                	ret

0000000080204148 <sys_fork>:
    80204148:	1141                	addi	sp,sp,-16
    8020414a:	e406                	sd	ra,8(sp)
    8020414c:	b1bfd0ef          	jal	80201c66 <fork_process>
    80204150:	60a2                	ld	ra,8(sp)
    80204152:	0141                	addi	sp,sp,16
    80204154:	8082                	ret

0000000080204156 <sys_wait>:
    80204156:	1141                	addi	sp,sp,-16
    80204158:	e406                	sd	ra,8(sp)
    8020415a:	98ffd0ef          	jal	80201ae8 <wait_process>
    8020415e:	60a2                	ld	ra,8(sp)
    80204160:	0141                	addi	sp,sp,16
    80204162:	8082                	ret

0000000080204164 <fork>:
    80204164:	4885                	li	a7,1
    80204166:	00000073          	ecall
    8020416a:	8082                	ret

000000008020416c <exit>:
    8020416c:	4889                	li	a7,2
    8020416e:	00000073          	ecall
    80204172:	8082                	ret

0000000080204174 <wait>:
    80204174:	488d                	li	a7,3
    80204176:	00000073          	ecall
    8020417a:	8082                	ret

000000008020417c <getpid>:
    8020417c:	48ad                	li	a7,11
    8020417e:	00000073          	ecall
    80204182:	8082                	ret

0000000080204184 <simple_task>:
    80204184:	8082                	ret

0000000080204186 <timer_interrupt>:
    80204186:	1141                	addi	sp,sp,-16
    80204188:	00004797          	auipc	a5,0x4
    8020418c:	7187a783          	lw	a5,1816(a5) # 802088a0 <interrupt_count>
    80204190:	e406                	sd	ra,8(sp)
    80204192:	00004717          	auipc	a4,0x4
    80204196:	70e70713          	addi	a4,a4,1806 # 802088a0 <interrupt_count>
    8020419a:	2785                	addiw	a5,a5,1
    8020419c:	c31c                	sw	a5,0(a4)
    8020419e:	430c                	lw	a1,0(a4)
    802041a0:	00003517          	auipc	a0,0x3
    802041a4:	68050513          	addi	a0,a0,1664 # 80207820 <etext+0x820>
    802041a8:	fb3fb0ef          	jal	8020015a <printf>
    802041ac:	94afd0ef          	jal	802012f6 <get_time>
    802041b0:	60a2                	ld	ra,8(sp)
    802041b2:	000f47b7          	lui	a5,0xf4
    802041b6:	24078793          	addi	a5,a5,576 # f4240 <_entry-0x8010bdc0>
    802041ba:	953e                	add	a0,a0,a5
    802041bc:	0141                	addi	sp,sp,16
    802041be:	930fd06f          	j	802012ee <sbi_set_timer>

00000000802041c2 <cpu_task_high>:
    802041c2:	7139                	addi	sp,sp,-64
    802041c4:	f822                	sd	s0,48(sp)
    802041c6:	000f4437          	lui	s0,0xf4
    802041ca:	f426                	sd	s1,40(sp)
    802041cc:	f04a                	sd	s2,32(sp)
    802041ce:	ec4e                	sd	s3,24(sp)
    802041d0:	fc06                	sd	ra,56(sp)
    802041d2:	e402                	sd	zero,8(sp)
    802041d4:	4481                	li	s1,0
    802041d6:	24040413          	addi	s0,s0,576 # f4240 <_entry-0x8010bdc0>
    802041da:	00003997          	auipc	s3,0x3
    802041de:	66e98993          	addi	s3,s3,1646 # 80207848 <etext+0x848>
    802041e2:	4915                	li	s2,5
    802041e4:	4781                	li	a5,0
    802041e6:	6722                	ld	a4,8(sp)
    802041e8:	973e                	add	a4,a4,a5
    802041ea:	e43a                	sd	a4,8(sp)
    802041ec:	0785                	addi	a5,a5,1
    802041ee:	fe879ce3          	bne	a5,s0,802041e6 <cpu_task_high+0x24>
    802041f2:	85a6                	mv	a1,s1
    802041f4:	854e                	mv	a0,s3
    802041f6:	f65fb0ef          	jal	8020015a <printf>
    802041fa:	2485                	addiw	s1,s1,1
    802041fc:	84bfd0ef          	jal	80201a46 <yield>
    80204200:	ff2492e3          	bne	s1,s2,802041e4 <cpu_task_high+0x22>
    80204204:	00003517          	auipc	a0,0x3
    80204208:	65450513          	addi	a0,a0,1620 # 80207858 <etext+0x858>
    8020420c:	f4ffb0ef          	jal	8020015a <printf>
    80204210:	7442                	ld	s0,48(sp)
    80204212:	70e2                	ld	ra,56(sp)
    80204214:	74a2                	ld	s1,40(sp)
    80204216:	7902                	ld	s2,32(sp)
    80204218:	69e2                	ld	s3,24(sp)
    8020421a:	00004517          	auipc	a0,0x4
    8020421e:	68e53503          	ld	a0,1678(a0) # 802088a8 <current_proc>
    80204222:	4581                	li	a1,0
    80204224:	6121                	addi	sp,sp,64
    80204226:	ce2fd06f          	j	80201708 <exit_process>

000000008020422a <cpu_task_med>:
    8020422a:	7139                	addi	sp,sp,-64
    8020422c:	f822                	sd	s0,48(sp)
    8020422e:	0007a437          	lui	s0,0x7a
    80204232:	f426                	sd	s1,40(sp)
    80204234:	f04a                	sd	s2,32(sp)
    80204236:	ec4e                	sd	s3,24(sp)
    80204238:	fc06                	sd	ra,56(sp)
    8020423a:	e402                	sd	zero,8(sp)
    8020423c:	4481                	li	s1,0
    8020423e:	12040413          	addi	s0,s0,288 # 7a120 <_entry-0x80185ee0>
    80204242:	00003997          	auipc	s3,0x3
    80204246:	62e98993          	addi	s3,s3,1582 # 80207870 <etext+0x870>
    8020424a:	4915                	li	s2,5
    8020424c:	4781                	li	a5,0
    8020424e:	6722                	ld	a4,8(sp)
    80204250:	973e                	add	a4,a4,a5
    80204252:	e43a                	sd	a4,8(sp)
    80204254:	0785                	addi	a5,a5,1
    80204256:	fe879ce3          	bne	a5,s0,8020424e <cpu_task_med+0x24>
    8020425a:	85a6                	mv	a1,s1
    8020425c:	854e                	mv	a0,s3
    8020425e:	efdfb0ef          	jal	8020015a <printf>
    80204262:	2485                	addiw	s1,s1,1
    80204264:	fe2fd0ef          	jal	80201a46 <yield>
    80204268:	ff2492e3          	bne	s1,s2,8020424c <cpu_task_med+0x22>
    8020426c:	00003517          	auipc	a0,0x3
    80204270:	61450513          	addi	a0,a0,1556 # 80207880 <etext+0x880>
    80204274:	ee7fb0ef          	jal	8020015a <printf>
    80204278:	7442                	ld	s0,48(sp)
    8020427a:	70e2                	ld	ra,56(sp)
    8020427c:	74a2                	ld	s1,40(sp)
    8020427e:	7902                	ld	s2,32(sp)
    80204280:	69e2                	ld	s3,24(sp)
    80204282:	00004517          	auipc	a0,0x4
    80204286:	62653503          	ld	a0,1574(a0) # 802088a8 <current_proc>
    8020428a:	4581                	li	a1,0
    8020428c:	6121                	addi	sp,sp,64
    8020428e:	c7afd06f          	j	80201708 <exit_process>

0000000080204292 <cpu_task_low>:
    80204292:	7139                	addi	sp,sp,-64
    80204294:	f822                	sd	s0,48(sp)
    80204296:	6461                	lui	s0,0x18
    80204298:	f426                	sd	s1,40(sp)
    8020429a:	f04a                	sd	s2,32(sp)
    8020429c:	ec4e                	sd	s3,24(sp)
    8020429e:	fc06                	sd	ra,56(sp)
    802042a0:	e402                	sd	zero,8(sp)
    802042a2:	4481                	li	s1,0
    802042a4:	6a040413          	addi	s0,s0,1696 # 186a0 <_entry-0x801e7960>
    802042a8:	00003997          	auipc	s3,0x3
    802042ac:	5f098993          	addi	s3,s3,1520 # 80207898 <etext+0x898>
    802042b0:	4915                	li	s2,5
    802042b2:	4781                	li	a5,0
    802042b4:	6722                	ld	a4,8(sp)
    802042b6:	973e                	add	a4,a4,a5
    802042b8:	e43a                	sd	a4,8(sp)
    802042ba:	0785                	addi	a5,a5,1
    802042bc:	fe879ce3          	bne	a5,s0,802042b4 <cpu_task_low+0x22>
    802042c0:	85a6                	mv	a1,s1
    802042c2:	854e                	mv	a0,s3
    802042c4:	e97fb0ef          	jal	8020015a <printf>
    802042c8:	2485                	addiw	s1,s1,1
    802042ca:	f7cfd0ef          	jal	80201a46 <yield>
    802042ce:	ff2492e3          	bne	s1,s2,802042b2 <cpu_task_low+0x20>
    802042d2:	00003517          	auipc	a0,0x3
    802042d6:	5d650513          	addi	a0,a0,1494 # 802078a8 <etext+0x8a8>
    802042da:	e81fb0ef          	jal	8020015a <printf>
    802042de:	7442                	ld	s0,48(sp)
    802042e0:	70e2                	ld	ra,56(sp)
    802042e2:	74a2                	ld	s1,40(sp)
    802042e4:	7902                	ld	s2,32(sp)
    802042e6:	69e2                	ld	s3,24(sp)
    802042e8:	00004517          	auipc	a0,0x4
    802042ec:	5c053503          	ld	a0,1472(a0) # 802088a8 <current_proc>
    802042f0:	4581                	li	a1,0
    802042f2:	6121                	addi	sp,sp,64
    802042f4:	c14fd06f          	j	80201708 <exit_process>

00000000802042f8 <concurrent_file_access_task>:
    802042f8:	7171                	addi	sp,sp,-176
    802042fa:	e54e                	sd	s3,136(sp)
    802042fc:	00004997          	auipc	s3,0x4
    80204300:	5ac98993          	addi	s3,s3,1452 # 802088a8 <current_proc>
    80204304:	0009b783          	ld	a5,0(s3)
    80204308:	ed26                	sd	s1,152(sp)
    8020430a:	02000593          	li	a1,32
    8020430e:	4b84                	lw	s1,16(a5)
    80204310:	00003617          	auipc	a2,0x3
    80204314:	5b060613          	addi	a2,a2,1456 # 802078c0 <etext+0x8c0>
    80204318:	1008                	addi	a0,sp,32
    8020431a:	86a6                	mv	a3,s1
    8020431c:	f506                	sd	ra,168(sp)
    8020431e:	de5ff0ef          	jal	80204102 <snprintf>
    80204322:	20200593          	li	a1,514
    80204326:	1008                	addi	a0,sp,32
    80204328:	9beff0ef          	jal	802034e6 <sys_open>
    8020432c:	0e054c63          	bltz	a0,80204424 <concurrent_file_access_task+0x12c>
    80204330:	1010                	addi	a2,sp,32
    80204332:	85a6                	mv	a1,s1
    80204334:	f122                	sd	s0,160(sp)
    80204336:	842a                	mv	s0,a0
    80204338:	00003517          	auipc	a0,0x3
    8020433c:	5c050513          	addi	a0,a0,1472 # 802078f8 <etext+0x8f8>
    80204340:	e94a                	sd	s2,144(sp)
    80204342:	e19fb0ef          	jal	8020015a <printf>
    80204346:	00003797          	auipc	a5,0x3
    8020434a:	6ea78793          	addi	a5,a5,1770 # 80207a30 <etext+0xa30>
    8020434e:	6394                	ld	a3,0(a5)
    80204350:	6798                	ld	a4,8(a5)
    80204352:	6b9c                	ld	a5,16(a5)
    80204354:	0028                	addi	a0,sp,8
    80204356:	e436                	sd	a3,8(sp)
    80204358:	e83a                	sd	a4,16(sp)
    8020435a:	ec3e                	sd	a5,24(sp)
    8020435c:	af0fc0ef          	jal	8020064c <strlen>
    80204360:	862a                	mv	a2,a0
    80204362:	002c                	addi	a1,sp,8
    80204364:	8522                	mv	a0,s0
    80204366:	adcff0ef          	jal	80203642 <sys_write>
    8020436a:	892a                	mv	s2,a0
    8020436c:	0028                	addi	a0,sp,8
    8020436e:	adefc0ef          	jal	8020064c <strlen>
    80204372:	862a                	mv	a2,a0
    80204374:	03250463          	beq	a0,s2,8020439c <concurrent_file_access_task+0xa4>
    80204378:	1010                	addi	a2,sp,32
    8020437a:	85a6                	mv	a1,s1
    8020437c:	00003517          	auipc	a0,0x3
    80204380:	59c50513          	addi	a0,a0,1436 # 80207918 <etext+0x918>
    80204384:	dd7fb0ef          	jal	8020015a <printf>
    80204388:	8522                	mv	a0,s0
    8020438a:	a6aff0ef          	jal	802035f4 <sys_close>
    8020438e:	740a                	ld	s0,160(sp)
    80204390:	694a                	ld	s2,144(sp)
    80204392:	70aa                	ld	ra,168(sp)
    80204394:	64ea                	ld	s1,152(sp)
    80204396:	69aa                	ld	s3,136(sp)
    80204398:	614d                	addi	sp,sp,176
    8020439a:	8082                	ret
    8020439c:	1014                	addi	a3,sp,32
    8020439e:	85a6                	mv	a1,s1
    802043a0:	00003517          	auipc	a0,0x3
    802043a4:	5a050513          	addi	a0,a0,1440 # 80207940 <etext+0x940>
    802043a8:	db3fb0ef          	jal	8020015a <printf>
    802043ac:	8522                	mv	a0,s0
    802043ae:	a46ff0ef          	jal	802035f4 <sys_close>
    802043b2:	e94fd0ef          	jal	80201a46 <yield>
    802043b6:	4581                	li	a1,0
    802043b8:	1008                	addi	a0,sp,32
    802043ba:	92cff0ef          	jal	802034e6 <sys_open>
    802043be:	842a                	mv	s0,a0
    802043c0:	08054d63          	bltz	a0,8020445a <concurrent_file_access_task+0x162>
    802043c4:	03f00613          	li	a2,63
    802043c8:	008c                	addi	a1,sp,64
    802043ca:	a58ff0ef          	jal	80203622 <sys_read>
    802043ce:	862a                	mv	a2,a0
    802043d0:	06054763          	bltz	a0,8020443e <concurrent_file_access_task+0x146>
    802043d4:	08050793          	addi	a5,a0,128
    802043d8:	978a                	add	a5,a5,sp
    802043da:	85a6                	mv	a1,s1
    802043dc:	1014                	addi	a3,sp,32
    802043de:	00003517          	auipc	a0,0x3
    802043e2:	5e250513          	addi	a0,a0,1506 # 802079c0 <etext+0x9c0>
    802043e6:	fc078023          	sb	zero,-64(a5)
    802043ea:	d71fb0ef          	jal	8020015a <printf>
    802043ee:	8522                	mv	a0,s0
    802043f0:	a04ff0ef          	jal	802035f4 <sys_close>
    802043f4:	1008                	addi	a0,sp,32
    802043f6:	a6cff0ef          	jal	80203662 <sys_unlink>
    802043fa:	1010                	addi	a2,sp,32
    802043fc:	85a6                	mv	a1,s1
    802043fe:	e539                	bnez	a0,8020444c <concurrent_file_access_task+0x154>
    80204400:	00003517          	auipc	a0,0x3
    80204404:	5e850513          	addi	a0,a0,1512 # 802079e8 <etext+0x9e8>
    80204408:	d53fb0ef          	jal	8020015a <printf>
    8020440c:	0009b503          	ld	a0,0(s3)
    80204410:	4581                	li	a1,0
    80204412:	af6fd0ef          	jal	80201708 <exit_process>
    80204416:	70aa                	ld	ra,168(sp)
    80204418:	740a                	ld	s0,160(sp)
    8020441a:	694a                	ld	s2,144(sp)
    8020441c:	64ea                	ld	s1,152(sp)
    8020441e:	69aa                	ld	s3,136(sp)
    80204420:	614d                	addi	sp,sp,176
    80204422:	8082                	ret
    80204424:	1010                	addi	a2,sp,32
    80204426:	85a6                	mv	a1,s1
    80204428:	00003517          	auipc	a0,0x3
    8020442c:	4a850513          	addi	a0,a0,1192 # 802078d0 <etext+0x8d0>
    80204430:	d2bfb0ef          	jal	8020015a <printf>
    80204434:	70aa                	ld	ra,168(sp)
    80204436:	64ea                	ld	s1,152(sp)
    80204438:	69aa                	ld	s3,136(sp)
    8020443a:	614d                	addi	sp,sp,176
    8020443c:	8082                	ret
    8020443e:	1010                	addi	a2,sp,32
    80204440:	85a6                	mv	a1,s1
    80204442:	00003517          	auipc	a0,0x3
    80204446:	54e50513          	addi	a0,a0,1358 # 80207990 <etext+0x990>
    8020444a:	bf2d                	j	80204384 <concurrent_file_access_task+0x8c>
    8020444c:	00003517          	auipc	a0,0x3
    80204450:	5bc50513          	addi	a0,a0,1468 # 80207a08 <etext+0xa08>
    80204454:	d07fb0ef          	jal	8020015a <printf>
    80204458:	bf55                	j	8020440c <concurrent_file_access_task+0x114>
    8020445a:	1010                	addi	a2,sp,32
    8020445c:	85a6                	mv	a1,s1
    8020445e:	00003517          	auipc	a0,0x3
    80204462:	50a50513          	addi	a0,a0,1290 # 80207968 <etext+0x968>
    80204466:	cf5fb0ef          	jal	8020015a <printf>
    8020446a:	740a                	ld	s0,160(sp)
    8020446c:	694a                	ld	s2,144(sp)
    8020446e:	b715                	j	80204392 <concurrent_file_access_task+0x9a>

0000000080204470 <test_printf_basic>:
    80204470:	1141                	addi	sp,sp,-16
    80204472:	02a00593          	li	a1,42
    80204476:	00003517          	auipc	a0,0x3
    8020447a:	5d250513          	addi	a0,a0,1490 # 80207a48 <etext+0xa48>
    8020447e:	e406                	sd	ra,8(sp)
    80204480:	cdbfb0ef          	jal	8020015a <printf>
    80204484:	f8500593          	li	a1,-123
    80204488:	00003517          	auipc	a0,0x3
    8020448c:	5d850513          	addi	a0,a0,1496 # 80207a60 <etext+0xa60>
    80204490:	ccbfb0ef          	jal	8020015a <printf>
    80204494:	4581                	li	a1,0
    80204496:	00003517          	auipc	a0,0x3
    8020449a:	5e250513          	addi	a0,a0,1506 # 80207a78 <etext+0xa78>
    8020449e:	cbdfb0ef          	jal	8020015a <printf>
    802044a2:	6585                	lui	a1,0x1
    802044a4:	abc58593          	addi	a1,a1,-1348 # abc <_entry-0x801ff544>
    802044a8:	00003517          	auipc	a0,0x3
    802044ac:	5e850513          	addi	a0,a0,1512 # 80207a90 <etext+0xa90>
    802044b0:	cabfb0ef          	jal	8020015a <printf>
    802044b4:	00003597          	auipc	a1,0x3
    802044b8:	5f458593          	addi	a1,a1,1524 # 80207aa8 <etext+0xaa8>
    802044bc:	00003517          	auipc	a0,0x3
    802044c0:	5f450513          	addi	a0,a0,1524 # 80207ab0 <etext+0xab0>
    802044c4:	c97fb0ef          	jal	8020015a <printf>
    802044c8:	05800593          	li	a1,88
    802044cc:	00003517          	auipc	a0,0x3
    802044d0:	5fc50513          	addi	a0,a0,1532 # 80207ac8 <etext+0xac8>
    802044d4:	c87fb0ef          	jal	8020015a <printf>
    802044d8:	60a2                	ld	ra,8(sp)
    802044da:	00003517          	auipc	a0,0x3
    802044de:	60650513          	addi	a0,a0,1542 # 80207ae0 <etext+0xae0>
    802044e2:	0141                	addi	sp,sp,16
    802044e4:	c77fb06f          	j	8020015a <printf>

00000000802044e8 <test_printf_edge_cases>:
    802044e8:	800005b7          	lui	a1,0x80000
    802044ec:	1141                	addi	sp,sp,-16
    802044ee:	fff5c593          	not	a1,a1
    802044f2:	00003517          	auipc	a0,0x3
    802044f6:	60650513          	addi	a0,a0,1542 # 80207af8 <etext+0xaf8>
    802044fa:	e406                	sd	ra,8(sp)
    802044fc:	c5ffb0ef          	jal	8020015a <printf>
    80204500:	800005b7          	lui	a1,0x80000
    80204504:	00003517          	auipc	a0,0x3
    80204508:	60450513          	addi	a0,a0,1540 # 80207b08 <etext+0xb08>
    8020450c:	c4ffb0ef          	jal	8020015a <printf>
    80204510:	4581                	li	a1,0
    80204512:	00003517          	auipc	a0,0x3
    80204516:	60650513          	addi	a0,a0,1542 # 80207b18 <etext+0xb18>
    8020451a:	c41fb0ef          	jal	8020015a <printf>
    8020451e:	60a2                	ld	ra,8(sp)
    80204520:	00004597          	auipc	a1,0x4
    80204524:	93058593          	addi	a1,a1,-1744 # 80207e50 <etext+0xe50>
    80204528:	00003517          	auipc	a0,0x3
    8020452c:	60850513          	addi	a0,a0,1544 # 80207b30 <etext+0xb30>
    80204530:	0141                	addi	sp,sp,16
    80204532:	c29fb06f          	j	8020015a <printf>

0000000080204536 <test_physical_memory>:
    80204536:	1101                	addi	sp,sp,-32
    80204538:	e822                	sd	s0,16(sp)
    8020453a:	ec06                	sd	ra,24(sp)
    8020453c:	e426                	sd	s1,8(sp)
    8020453e:	d7bfb0ef          	jal	802002b8 <alloc_page>
    80204542:	842a                	mv	s0,a0
    80204544:	d75fb0ef          	jal	802002b8 <alloc_page>
    80204548:	06a40e63          	beq	s0,a0,802045c4 <test_physical_memory+0x8e>
    8020454c:	03441793          	slli	a5,s0,0x34
    80204550:	c395                	beqz	a5,80204574 <test_physical_memory+0x3e>
    80204552:	02400693          	li	a3,36
    80204556:	00003617          	auipc	a2,0x3
    8020455a:	5f260613          	addi	a2,a2,1522 # 80207b48 <etext+0xb48>
    8020455e:	00003597          	auipc	a1,0x3
    80204562:	62a58593          	addi	a1,a1,1578 # 80207b88 <etext+0xb88>
    80204566:	00003517          	auipc	a0,0x3
    8020456a:	5fa50513          	addi	a0,a0,1530 # 80207b60 <etext+0xb60>
    8020456e:	bedfb0ef          	jal	8020015a <printf>
    80204572:	a001                	j	80204572 <test_physical_memory+0x3c>
    80204574:	84aa                	mv	s1,a0
    80204576:	00003517          	auipc	a0,0x3
    8020457a:	63a50513          	addi	a0,a0,1594 # 80207bb0 <etext+0xbb0>
    8020457e:	bddfb0ef          	jal	8020015a <printf>
    80204582:	123457b7          	lui	a5,0x12345
    80204586:	67878793          	addi	a5,a5,1656 # 12345678 <_entry-0x6deba988>
    8020458a:	c01c                	sw	a5,0(s0)
    8020458c:	00003517          	auipc	a0,0x3
    80204590:	64450513          	addi	a0,a0,1604 # 80207bd0 <etext+0xbd0>
    80204594:	bc7fb0ef          	jal	8020015a <printf>
    80204598:	8522                	mv	a0,s0
    8020459a:	e03fb0ef          	jal	8020039c <free_page>
    8020459e:	d1bfb0ef          	jal	802002b8 <alloc_page>
    802045a2:	842a                	mv	s0,a0
    802045a4:	8526                	mv	a0,s1
    802045a6:	df7fb0ef          	jal	8020039c <free_page>
    802045aa:	8522                	mv	a0,s0
    802045ac:	df1fb0ef          	jal	8020039c <free_page>
    802045b0:	6442                	ld	s0,16(sp)
    802045b2:	60e2                	ld	ra,24(sp)
    802045b4:	64a2                	ld	s1,8(sp)
    802045b6:	00003517          	auipc	a0,0x3
    802045ba:	63a50513          	addi	a0,a0,1594 # 80207bf0 <etext+0xbf0>
    802045be:	6105                	addi	sp,sp,32
    802045c0:	b9bfb06f          	j	8020015a <printf>
    802045c4:	02300693          	li	a3,35
    802045c8:	00003617          	auipc	a2,0x3
    802045cc:	58060613          	addi	a2,a2,1408 # 80207b48 <etext+0xb48>
    802045d0:	00003597          	auipc	a1,0x3
    802045d4:	58058593          	addi	a1,a1,1408 # 80207b50 <etext+0xb50>
    802045d8:	00003517          	auipc	a0,0x3
    802045dc:	58850513          	addi	a0,a0,1416 # 80207b60 <etext+0xb60>
    802045e0:	b7bfb0ef          	jal	8020015a <printf>
    802045e4:	a001                	j	802045e4 <test_physical_memory+0xae>

00000000802045e6 <test_pagetable>:
    802045e6:	1101                	addi	sp,sp,-32
    802045e8:	ec06                	sd	ra,24(sp)
    802045ea:	e822                	sd	s0,16(sp)
    802045ec:	e426                	sd	s1,8(sp)
    802045ee:	87efc0ef          	jal	8020066c <create_pagetable>
    802045f2:	842a                	mv	s0,a0
    802045f4:	cc5fb0ef          	jal	802002b8 <alloc_page>
    802045f8:	84aa                	mv	s1,a0
    802045fa:	862a                	mv	a2,a0
    802045fc:	4719                	li	a4,6
    802045fe:	6685                	lui	a3,0x1
    80204600:	010005b7          	lui	a1,0x1000
    80204604:	8522                	mv	a0,s0
    80204606:	b3afc0ef          	jal	80200940 <map_page>
    8020460a:	c115                	beqz	a0,8020462e <test_pagetable+0x48>
    8020460c:	03900693          	li	a3,57
    80204610:	00003617          	auipc	a2,0x3
    80204614:	53860613          	addi	a2,a2,1336 # 80207b48 <etext+0xb48>
    80204618:	00003597          	auipc	a1,0x3
    8020461c:	60058593          	addi	a1,a1,1536 # 80207c18 <etext+0xc18>
    80204620:	00003517          	auipc	a0,0x3
    80204624:	54050513          	addi	a0,a0,1344 # 80207b60 <etext+0xb60>
    80204628:	b33fb0ef          	jal	8020015a <printf>
    8020462c:	a001                	j	8020462c <test_pagetable+0x46>
    8020462e:	00003517          	auipc	a0,0x3
    80204632:	62250513          	addi	a0,a0,1570 # 80207c50 <etext+0xc50>
    80204636:	b25fb0ef          	jal	8020015a <printf>
    8020463a:	8522                	mv	a0,s0
    8020463c:	010005b7          	lui	a1,0x1000
    80204640:	c14fc0ef          	jal	80200a54 <walk_lookup>
    80204644:	842a                	mv	s0,a0
    80204646:	c915                	beqz	a0,8020467a <test_pagetable+0x94>
    80204648:	611c                	ld	a5,0(a0)
    8020464a:	0017f713          	andi	a4,a5,1
    8020464e:	c715                	beqz	a4,8020467a <test_pagetable+0x94>
    80204650:	83a9                	srli	a5,a5,0xa
    80204652:	07b2                	slli	a5,a5,0xc
    80204654:	04978463          	beq	a5,s1,8020469c <test_pagetable+0xb6>
    80204658:	03f00693          	li	a3,63
    8020465c:	00003617          	auipc	a2,0x3
    80204660:	4ec60613          	addi	a2,a2,1260 # 80207b48 <etext+0xb48>
    80204664:	00003597          	auipc	a1,0x3
    80204668:	62c58593          	addi	a1,a1,1580 # 80207c90 <etext+0xc90>
    8020466c:	00003517          	auipc	a0,0x3
    80204670:	4f450513          	addi	a0,a0,1268 # 80207b60 <etext+0xb60>
    80204674:	ae7fb0ef          	jal	8020015a <printf>
    80204678:	a001                	j	80204678 <test_pagetable+0x92>
    8020467a:	03e00693          	li	a3,62
    8020467e:	00003617          	auipc	a2,0x3
    80204682:	4ca60613          	addi	a2,a2,1226 # 80207b48 <etext+0xb48>
    80204686:	00003597          	auipc	a1,0x3
    8020468a:	5ea58593          	addi	a1,a1,1514 # 80207c70 <etext+0xc70>
    8020468e:	00003517          	auipc	a0,0x3
    80204692:	4d250513          	addi	a0,a0,1234 # 80207b60 <etext+0xb60>
    80204696:	ac5fb0ef          	jal	8020015a <printf>
    8020469a:	a001                	j	8020469a <test_pagetable+0xb4>
    8020469c:	00003517          	auipc	a0,0x3
    802046a0:	60c50513          	addi	a0,a0,1548 # 80207ca8 <etext+0xca8>
    802046a4:	ab7fb0ef          	jal	8020015a <printf>
    802046a8:	601c                	ld	a5,0(s0)
    802046aa:	0027f713          	andi	a4,a5,2
    802046ae:	c71d                	beqz	a4,802046dc <test_pagetable+0xf6>
    802046b0:	0047f713          	andi	a4,a5,4
    802046b4:	cf39                	beqz	a4,80204712 <test_pagetable+0x12c>
    802046b6:	8ba1                	andi	a5,a5,8
    802046b8:	c3b9                	beqz	a5,802046fe <test_pagetable+0x118>
    802046ba:	04500693          	li	a3,69
    802046be:	00003617          	auipc	a2,0x3
    802046c2:	48a60613          	addi	a2,a2,1162 # 80207b48 <etext+0xb48>
    802046c6:	00003597          	auipc	a1,0x3
    802046ca:	62a58593          	addi	a1,a1,1578 # 80207cf0 <etext+0xcf0>
    802046ce:	00003517          	auipc	a0,0x3
    802046d2:	49250513          	addi	a0,a0,1170 # 80207b60 <etext+0xb60>
    802046d6:	a85fb0ef          	jal	8020015a <printf>
    802046da:	a001                	j	802046da <test_pagetable+0xf4>
    802046dc:	04300693          	li	a3,67
    802046e0:	00003617          	auipc	a2,0x3
    802046e4:	46860613          	addi	a2,a2,1128 # 80207b48 <etext+0xb48>
    802046e8:	00003597          	auipc	a1,0x3
    802046ec:	5e858593          	addi	a1,a1,1512 # 80207cd0 <etext+0xcd0>
    802046f0:	00003517          	auipc	a0,0x3
    802046f4:	47050513          	addi	a0,a0,1136 # 80207b60 <etext+0xb60>
    802046f8:	a63fb0ef          	jal	8020015a <printf>
    802046fc:	a001                	j	802046fc <test_pagetable+0x116>
    802046fe:	6442                	ld	s0,16(sp)
    80204700:	60e2                	ld	ra,24(sp)
    80204702:	64a2                	ld	s1,8(sp)
    80204704:	00003517          	auipc	a0,0x3
    80204708:	5fc50513          	addi	a0,a0,1532 # 80207d00 <etext+0xd00>
    8020470c:	6105                	addi	sp,sp,32
    8020470e:	a4dfb06f          	j	8020015a <printf>
    80204712:	04400693          	li	a3,68
    80204716:	00003617          	auipc	a2,0x3
    8020471a:	43260613          	addi	a2,a2,1074 # 80207b48 <etext+0xb48>
    8020471e:	00003597          	auipc	a1,0x3
    80204722:	5c258593          	addi	a1,a1,1474 # 80207ce0 <etext+0xce0>
    80204726:	00003517          	auipc	a0,0x3
    8020472a:	43a50513          	addi	a0,a0,1082 # 80207b60 <etext+0xb60>
    8020472e:	a2dfb0ef          	jal	8020015a <printf>
    80204732:	a001                	j	80204732 <test_pagetable+0x14c>

0000000080204734 <test_virtual_memory>:
    80204734:	1141                	addi	sp,sp,-16
    80204736:	00003517          	auipc	a0,0x3
    8020473a:	5ea50513          	addi	a0,a0,1514 # 80207d20 <etext+0xd20>
    8020473e:	e406                	sd	ra,8(sp)
    80204740:	a1bfb0ef          	jal	8020015a <printf>
    80204744:	b50fc0ef          	jal	80200a94 <kvm_init>
    80204748:	c56fc0ef          	jal	80200b9e <kvm_inithart>
    8020474c:	00003517          	auipc	a0,0x3
    80204750:	5f450513          	addi	a0,a0,1524 # 80207d40 <etext+0xd40>
    80204754:	a07fb0ef          	jal	8020015a <printf>
    80204758:	d19ff0ef          	jal	80204470 <test_printf_basic>
    8020475c:	00003517          	auipc	a0,0x3
    80204760:	60450513          	addi	a0,a0,1540 # 80207d60 <etext+0xd60>
    80204764:	9f7fb0ef          	jal	8020015a <printf>
    80204768:	dcfff0ef          	jal	80204536 <test_physical_memory>
    8020476c:	00003517          	auipc	a0,0x3
    80204770:	61450513          	addi	a0,a0,1556 # 80207d80 <etext+0xd80>
    80204774:	9e7fb0ef          	jal	8020015a <printf>
    80204778:	00003517          	auipc	a0,0x3
    8020477c:	62850513          	addi	a0,a0,1576 # 80207da0 <etext+0xda0>
    80204780:	8b3fb0ef          	jal	80200032 <uart_puts>
    80204784:	60a2                	ld	ra,8(sp)
    80204786:	00003517          	auipc	a0,0x3
    8020478a:	62a50513          	addi	a0,a0,1578 # 80207db0 <etext+0xdb0>
    8020478e:	0141                	addi	sp,sp,16
    80204790:	9cbfb06f          	j	8020015a <printf>

0000000080204794 <test_alloc_pages>:
    80204794:	7179                	addi	sp,sp,-48
    80204796:	f406                	sd	ra,40(sp)
    80204798:	f022                	sd	s0,32(sp)
    8020479a:	ec26                	sd	s1,24(sp)
    8020479c:	e84a                	sd	s2,16(sp)
    8020479e:	e44e                	sd	s3,8(sp)
    802047a0:	b19fb0ef          	jal	802002b8 <alloc_page>
    802047a4:	84aa                	mv	s1,a0
    802047a6:	b13fb0ef          	jal	802002b8 <alloc_page>
    802047aa:	892a                	mv	s2,a0
    802047ac:	b0dfb0ef          	jal	802002b8 <alloc_page>
    802047b0:	842a                	mv	s0,a0
    802047b2:	8526                	mv	a0,s1
    802047b4:	be9fb0ef          	jal	8020039c <free_page>
    802047b8:	8522                	mv	a0,s0
    802047ba:	be3fb0ef          	jal	8020039c <free_page>
    802047be:	450d                	li	a0,3
    802047c0:	d01fb0ef          	jal	802004c0 <alloc_pages>
    802047c4:	0c050c63          	beqz	a0,8020489c <test_alloc_pages+0x108>
    802047c8:	03451793          	slli	a5,a0,0x34
    802047cc:	842a                	mv	s0,a0
    802047ce:	c395                	beqz	a5,802047f2 <test_alloc_pages+0x5e>
    802047d0:	06900693          	li	a3,105
    802047d4:	00003617          	auipc	a2,0x3
    802047d8:	37460613          	addi	a2,a2,884 # 80207b48 <etext+0xb48>
    802047dc:	00003597          	auipc	a1,0x3
    802047e0:	60458593          	addi	a1,a1,1540 # 80207de0 <etext+0xde0>
    802047e4:	00003517          	auipc	a0,0x3
    802047e8:	37c50513          	addi	a0,a0,892 # 80207b60 <etext+0xb60>
    802047ec:	96ffb0ef          	jal	8020015a <printf>
    802047f0:	a001                	j	802047f0 <test_alloc_pages+0x5c>
    802047f2:	00003517          	auipc	a0,0x3
    802047f6:	61650513          	addi	a0,a0,1558 # 80207e08 <etext+0xe08>
    802047fa:	961fb0ef          	jal	8020015a <printf>
    802047fe:	123457b7          	lui	a5,0x12345
    80204802:	67878793          	addi	a5,a5,1656 # 12345678 <_entry-0x6deba988>
    80204806:	c01c                	sw	a5,0(s0)
    80204808:	4581                	li	a1,0
    8020480a:	00003517          	auipc	a0,0x3
    8020480e:	62650513          	addi	a0,a0,1574 # 80207e30 <etext+0xe30>
    80204812:	949fb0ef          	jal	8020015a <printf>
    80204816:	4585                	li	a1,1
    80204818:	00003517          	auipc	a0,0x3
    8020481c:	64050513          	addi	a0,a0,1600 # 80207e58 <etext+0xe58>
    80204820:	93bfb0ef          	jal	8020015a <printf>
    80204824:	123457b7          	lui	a5,0x12345
    80204828:	6985                	lui	s3,0x1
    8020482a:	99a2                	add	s3,s3,s0
    8020482c:	67978793          	addi	a5,a5,1657 # 12345679 <_entry-0x6deba987>
    80204830:	00f9a023          	sw	a5,0(s3) # 1000 <_entry-0x801ff000>
    80204834:	4585                	li	a1,1
    80204836:	00003517          	auipc	a0,0x3
    8020483a:	5fa50513          	addi	a0,a0,1530 # 80207e30 <etext+0xe30>
    8020483e:	91dfb0ef          	jal	8020015a <printf>
    80204842:	4589                	li	a1,2
    80204844:	00003517          	auipc	a0,0x3
    80204848:	61450513          	addi	a0,a0,1556 # 80207e58 <etext+0xe58>
    8020484c:	90ffb0ef          	jal	8020015a <printf>
    80204850:	123457b7          	lui	a5,0x12345
    80204854:	6489                	lui	s1,0x2
    80204856:	67a78793          	addi	a5,a5,1658 # 1234567a <_entry-0x6deba986>
    8020485a:	94a2                	add	s1,s1,s0
    8020485c:	c09c                	sw	a5,0(s1)
    8020485e:	4589                	li	a1,2
    80204860:	00003517          	auipc	a0,0x3
    80204864:	5d050513          	addi	a0,a0,1488 # 80207e30 <etext+0xe30>
    80204868:	8f3fb0ef          	jal	8020015a <printf>
    8020486c:	8522                	mv	a0,s0
    8020486e:	b2ffb0ef          	jal	8020039c <free_page>
    80204872:	854e                	mv	a0,s3
    80204874:	b29fb0ef          	jal	8020039c <free_page>
    80204878:	8526                	mv	a0,s1
    8020487a:	b23fb0ef          	jal	8020039c <free_page>
    8020487e:	00003517          	auipc	a0,0x3
    80204882:	5f250513          	addi	a0,a0,1522 # 80207e70 <etext+0xe70>
    80204886:	8d5fb0ef          	jal	8020015a <printf>
    8020488a:	7402                	ld	s0,32(sp)
    8020488c:	70a2                	ld	ra,40(sp)
    8020488e:	64e2                	ld	s1,24(sp)
    80204890:	69a2                	ld	s3,8(sp)
    80204892:	854a                	mv	a0,s2
    80204894:	6942                	ld	s2,16(sp)
    80204896:	6145                	addi	sp,sp,48
    80204898:	b05fb06f          	j	8020039c <free_page>
    8020489c:	06800693          	li	a3,104
    802048a0:	00003617          	auipc	a2,0x3
    802048a4:	2a860613          	addi	a2,a2,680 # 80207b48 <etext+0xb48>
    802048a8:	00003597          	auipc	a1,0x3
    802048ac:	52858593          	addi	a1,a1,1320 # 80207dd0 <etext+0xdd0>
    802048b0:	00003517          	auipc	a0,0x3
    802048b4:	2b050513          	addi	a0,a0,688 # 80207b60 <etext+0xb60>
    802048b8:	8a3fb0ef          	jal	8020015a <printf>
    802048bc:	a001                	j	802048bc <test_alloc_pages+0x128>

00000000802048be <test_timer_interrupt>:
    802048be:	7139                	addi	sp,sp,-64
    802048c0:	00003517          	auipc	a0,0x3
    802048c4:	5d850513          	addi	a0,a0,1496 # 80207e98 <etext+0xe98>
    802048c8:	fc06                	sd	ra,56(sp)
    802048ca:	f426                	sd	s1,40(sp)
    802048cc:	e852                	sd	s4,16(sp)
    802048ce:	f822                	sd	s0,48(sp)
    802048d0:	88bfb0ef          	jal	8020015a <printf>
    802048d4:	00000597          	auipc	a1,0x0
    802048d8:	8b258593          	addi	a1,a1,-1870 # 80204186 <timer_interrupt>
    802048dc:	07f00513          	li	a0,127
    802048e0:	de2fc0ef          	jal	80200ec2 <register_interrupt>
    802048e4:	a13fc0ef          	jal	802012f6 <get_time>
    802048e8:	000f47b7          	lui	a5,0xf4
    802048ec:	24078793          	addi	a5,a5,576 # f4240 <_entry-0x8010bdc0>
    802048f0:	8a2a                	mv	s4,a0
    802048f2:	953e                	add	a0,a0,a5
    802048f4:	9fbfc0ef          	jal	802012ee <sbi_set_timer>
    802048f8:	07f00513          	li	a0,127
    802048fc:	e18fc0ef          	jal	80200f14 <enable_interrupt>
    80204900:	00004717          	auipc	a4,0x4
    80204904:	fa072703          	lw	a4,-96(a4) # 802088a0 <interrupt_count>
    80204908:	4791                	li	a5,4
    8020490a:	00004497          	auipc	s1,0x4
    8020490e:	f9648493          	addi	s1,s1,-106 # 802088a0 <interrupt_count>
    80204912:	04e7c163          	blt	a5,a4,80204954 <test_timer_interrupt+0x96>
    80204916:	00989437          	lui	s0,0x989
    8020491a:	f04a                	sd	s2,32(sp)
    8020491c:	ec4e                	sd	s3,24(sp)
    8020491e:	67f40413          	addi	s0,s0,1663 # 98967f <_entry-0x7f876981>
    80204922:	00003997          	auipc	s3,0x3
    80204926:	59698993          	addi	s3,s3,1430 # 80207eb8 <etext+0xeb8>
    8020492a:	4911                	li	s2,4
    8020492c:	408c                	lw	a1,0(s1)
    8020492e:	854e                	mv	a0,s3
    80204930:	2585                	addiw	a1,a1,1
    80204932:	829fb0ef          	jal	8020015a <printf>
    80204936:	c602                	sw	zero,12(sp)
    80204938:	47b2                	lw	a5,12(sp)
    8020493a:	00f44863          	blt	s0,a5,8020494a <test_timer_interrupt+0x8c>
    8020493e:	47b2                	lw	a5,12(sp)
    80204940:	2785                	addiw	a5,a5,1
    80204942:	c63e                	sw	a5,12(sp)
    80204944:	47b2                	lw	a5,12(sp)
    80204946:	fef45ce3          	bge	s0,a5,8020493e <test_timer_interrupt+0x80>
    8020494a:	409c                	lw	a5,0(s1)
    8020494c:	fef950e3          	bge	s2,a5,8020492c <test_timer_interrupt+0x6e>
    80204950:	7902                	ld	s2,32(sp)
    80204952:	69e2                	ld	s3,24(sp)
    80204954:	9a3fc0ef          	jal	802012f6 <get_time>
    80204958:	842a                	mv	s0,a0
    8020495a:	00003517          	auipc	a0,0x3
    8020495e:	57e50513          	addi	a0,a0,1406 # 80207ed8 <etext+0xed8>
    80204962:	ff8fb0ef          	jal	8020015a <printf>
    80204966:	85d2                	mv	a1,s4
    80204968:	00003517          	auipc	a0,0x3
    8020496c:	58850513          	addi	a0,a0,1416 # 80207ef0 <etext+0xef0>
    80204970:	feafb0ef          	jal	8020015a <printf>
    80204974:	85a2                	mv	a1,s0
    80204976:	00003517          	auipc	a0,0x3
    8020497a:	58a50513          	addi	a0,a0,1418 # 80207f00 <etext+0xf00>
    8020497e:	fdcfb0ef          	jal	8020015a <printf>
    80204982:	408c                	lw	a1,0(s1)
    80204984:	00003517          	auipc	a0,0x3
    80204988:	58c50513          	addi	a0,a0,1420 # 80207f10 <etext+0xf10>
    8020498c:	fcefb0ef          	jal	8020015a <printf>
    80204990:	07f00513          	li	a0,127
    80204994:	d56fc0ef          	jal	80200eea <unregister_interrupt>
    80204998:	7442                	ld	s0,48(sp)
    8020499a:	70e2                	ld	ra,56(sp)
    8020499c:	74a2                	ld	s1,40(sp)
    8020499e:	6a42                	ld	s4,16(sp)
    802049a0:	07f00513          	li	a0,127
    802049a4:	6121                	addi	sp,sp,64
    802049a6:	d9afc06f          	j	80200f40 <disable_interrupt>

00000000802049aa <test_exception_handling>:
    802049aa:	1141                	addi	sp,sp,-16
    802049ac:	00003517          	auipc	a0,0x3
    802049b0:	57c50513          	addi	a0,a0,1404 # 80207f28 <etext+0xf28>
    802049b4:	e406                	sd	ra,8(sp)
    802049b6:	e022                	sd	s0,0(sp)
    802049b8:	fa2fb0ef          	jal	8020015a <printf>
    802049bc:	00003517          	auipc	a0,0x3
    802049c0:	58c50513          	addi	a0,a0,1420 # 80207f48 <etext+0xf48>
    802049c4:	f96fb0ef          	jal	8020015a <printf>
    802049c8:	ffffffff          	.word	0xffffffff
    802049cc:	0001                	nop
    802049ce:	0001                	nop
    802049d0:	0001                	nop
    802049d2:	00003517          	auipc	a0,0x3
    802049d6:	59650513          	addi	a0,a0,1430 # 80207f68 <etext+0xf68>
    802049da:	547d                	li	s0,-1
    802049dc:	f7efb0ef          	jal	8020015a <printf>
    802049e0:	1402                	slli	s0,s0,0x20
    802049e2:	601c                	ld	a5,0(s0)
    802049e4:	0001                	nop
    802049e6:	0001                	nop
    802049e8:	0001                	nop
    802049ea:	00003517          	auipc	a0,0x3
    802049ee:	59650513          	addi	a0,a0,1430 # 80207f80 <etext+0xf80>
    802049f2:	f68fb0ef          	jal	8020015a <printf>
    802049f6:	06600793          	li	a5,102
    802049fa:	e01c                	sd	a5,0(s0)
    802049fc:	0001                	nop
    802049fe:	0001                	nop
    80204a00:	0001                	nop
    80204a02:	6402                	ld	s0,0(sp)
    80204a04:	60a2                	ld	ra,8(sp)
    80204a06:	00003517          	auipc	a0,0x3
    80204a0a:	59250513          	addi	a0,a0,1426 # 80207f98 <etext+0xf98>
    80204a0e:	0141                	addi	sp,sp,16
    80204a10:	f4afb06f          	j	8020015a <printf>

0000000080204a14 <pt_init>:
    80204a14:	1141                	addi	sp,sp,-16
    80204a16:	e406                	sd	ra,8(sp)
    80204a18:	a3dfb0ef          	jal	80200454 <pmm_init>
    80204a1c:	878fc0ef          	jal	80200a94 <kvm_init>
    80204a20:	60a2                	ld	ra,8(sp)
    80204a22:	0141                	addi	sp,sp,16
    80204a24:	97afc06f          	j	80200b9e <kvm_inithart>

0000000080204a28 <test_process_creation>:
    80204a28:	1101                	addi	sp,sp,-32
    80204a2a:	00003517          	auipc	a0,0x3
    80204a2e:	58e50513          	addi	a0,a0,1422 # 80207fb8 <etext+0xfb8>
    80204a32:	ec06                	sd	ra,24(sp)
    80204a34:	e822                	sd	s0,16(sp)
    80204a36:	e426                	sd	s1,8(sp)
    80204a38:	f22fb0ef          	jal	8020015a <printf>
    80204a3c:	fffff517          	auipc	a0,0xfffff
    80204a40:	74850513          	addi	a0,a0,1864 # 80204184 <simple_task>
    80204a44:	c95fc0ef          	jal	802016d8 <create_process>
    80204a48:	4405                	li	s0,1
    80204a4a:	fffff497          	auipc	s1,0xfffff
    80204a4e:	73a48493          	addi	s1,s1,1850 # 80204184 <simple_task>
    80204a52:	00a04463          	bgtz	a0,80204a5a <test_process_creation+0x32>
    80204a56:	a83d                	j	80204a94 <test_process_creation+0x6c>
    80204a58:	2405                	addiw	s0,s0,1
    80204a5a:	8526                	mv	a0,s1
    80204a5c:	c7dfc0ef          	jal	802016d8 <create_process>
    80204a60:	fea04ce3          	bgtz	a0,80204a58 <test_process_creation+0x30>
    80204a64:	85a2                	mv	a1,s0
    80204a66:	00003517          	auipc	a0,0x3
    80204a6a:	57a50513          	addi	a0,a0,1402 # 80207fe0 <etext+0xfe0>
    80204a6e:	eecfb0ef          	jal	8020015a <printf>
    80204a72:	4481                	li	s1,0
    80204a74:	4501                	li	a0,0
    80204a76:	2485                	addiw	s1,s1,1
    80204a78:	870fd0ef          	jal	80201ae8 <wait_process>
    80204a7c:	fe941ce3          	bne	s0,s1,80204a74 <test_process_creation+0x4c>
    80204a80:	6442                	ld	s0,16(sp)
    80204a82:	60e2                	ld	ra,24(sp)
    80204a84:	64a2                	ld	s1,8(sp)
    80204a86:	00003517          	auipc	a0,0x3
    80204a8a:	57250513          	addi	a0,a0,1394 # 80207ff8 <etext+0xff8>
    80204a8e:	6105                	addi	sp,sp,32
    80204a90:	ecafb06f          	j	8020015a <printf>
    80204a94:	0ed00693          	li	a3,237
    80204a98:	00003617          	auipc	a2,0x3
    80204a9c:	0b060613          	addi	a2,a2,176 # 80207b48 <etext+0xb48>
    80204aa0:	00003597          	auipc	a1,0x3
    80204aa4:	53858593          	addi	a1,a1,1336 # 80207fd8 <etext+0xfd8>
    80204aa8:	00003517          	auipc	a0,0x3
    80204aac:	0b850513          	addi	a0,a0,184 # 80207b60 <etext+0xb60>
    80204ab0:	eaafb0ef          	jal	8020015a <printf>
    80204ab4:	a001                	j	80204ab4 <test_process_creation+0x8c>

0000000080204ab6 <test_scheduler>:
    80204ab6:	1101                	addi	sp,sp,-32
    80204ab8:	00003517          	auipc	a0,0x3
    80204abc:	56850513          	addi	a0,a0,1384 # 80208020 <etext+0x1020>
    80204ac0:	ec06                	sd	ra,24(sp)
    80204ac2:	e822                	sd	s0,16(sp)
    80204ac4:	e426                	sd	s1,8(sp)
    80204ac6:	e04a                	sd	s2,0(sp)
    80204ac8:	e92fb0ef          	jal	8020015a <printf>
    80204acc:	fffff517          	auipc	a0,0xfffff
    80204ad0:	6f650513          	addi	a0,a0,1782 # 802041c2 <cpu_task_high>
    80204ad4:	c05fc0ef          	jal	802016d8 <create_process>
    80204ad8:	842a                	mv	s0,a0
    80204ada:	fffff517          	auipc	a0,0xfffff
    80204ade:	75050513          	addi	a0,a0,1872 # 8020422a <cpu_task_med>
    80204ae2:	bf7fc0ef          	jal	802016d8 <create_process>
    80204ae6:	84aa                	mv	s1,a0
    80204ae8:	fffff517          	auipc	a0,0xfffff
    80204aec:	7aa50513          	addi	a0,a0,1962 # 80204292 <cpu_task_low>
    80204af0:	be9fc0ef          	jal	802016d8 <create_process>
    80204af4:	892a                	mv	s2,a0
    80204af6:	06805163          	blez	s0,80204b58 <test_scheduler+0xa2>
    80204afa:	04905f63          	blez	s1,80204b58 <test_scheduler+0xa2>
    80204afe:	04a05d63          	blez	a0,80204b58 <test_scheduler+0xa2>
    80204b02:	86aa                	mv	a3,a0
    80204b04:	8626                	mv	a2,s1
    80204b06:	85a2                	mv	a1,s0
    80204b08:	00003517          	auipc	a0,0x3
    80204b0c:	55850513          	addi	a0,a0,1368 # 80208060 <etext+0x1060>
    80204b10:	e4afb0ef          	jal	8020015a <printf>
    80204b14:	8522                	mv	a0,s0
    80204b16:	03200593          	li	a1,50
    80204b1a:	ce7fc0ef          	jal	80201800 <set_proc_priority>
    80204b1e:	8526                	mv	a0,s1
    80204b20:	03100593          	li	a1,49
    80204b24:	cddfc0ef          	jal	80201800 <set_proc_priority>
    80204b28:	03000593          	li	a1,48
    80204b2c:	854a                	mv	a0,s2
    80204b2e:	cd3fc0ef          	jal	80201800 <set_proc_priority>
    80204b32:	00003517          	auipc	a0,0x3
    80204b36:	56650513          	addi	a0,a0,1382 # 80208098 <etext+0x1098>
    80204b3a:	e20fb0ef          	jal	8020015a <printf>
    80204b3e:	d39fc0ef          	jal	80201876 <scheduler_priority>
    80204b42:	6442                	ld	s0,16(sp)
    80204b44:	60e2                	ld	ra,24(sp)
    80204b46:	64a2                	ld	s1,8(sp)
    80204b48:	6902                	ld	s2,0(sp)
    80204b4a:	00003517          	auipc	a0,0x3
    80204b4e:	56650513          	addi	a0,a0,1382 # 802080b0 <etext+0x10b0>
    80204b52:	6105                	addi	sp,sp,32
    80204b54:	e06fb06f          	j	8020015a <printf>
    80204b58:	85a2                	mv	a1,s0
    80204b5a:	6442                	ld	s0,16(sp)
    80204b5c:	60e2                	ld	ra,24(sp)
    80204b5e:	86ca                	mv	a3,s2
    80204b60:	8626                	mv	a2,s1
    80204b62:	6902                	ld	s2,0(sp)
    80204b64:	64a2                	ld	s1,8(sp)
    80204b66:	00003517          	auipc	a0,0x3
    80204b6a:	4d250513          	addi	a0,a0,1234 # 80208038 <etext+0x1038>
    80204b6e:	6105                	addi	sp,sp,32
    80204b70:	deafb06f          	j	8020015a <printf>

0000000080204b74 <test_synchronization>:
    80204b74:	1141                	addi	sp,sp,-16
    80204b76:	00003517          	auipc	a0,0x3
    80204b7a:	55a50513          	addi	a0,a0,1370 # 802080d0 <etext+0x10d0>
    80204b7e:	e406                	sd	ra,8(sp)
    80204b80:	e022                	sd	s0,0(sp)
    80204b82:	dd8fb0ef          	jal	8020015a <printf>
    80204b86:	ba6fd0ef          	jal	80201f2c <shared_buffer_init>
    80204b8a:	ffffd517          	auipc	a0,0xffffd
    80204b8e:	3d450513          	addi	a0,a0,980 # 80201f5e <producer_task>
    80204b92:	b47fc0ef          	jal	802016d8 <create_process>
    80204b96:	842a                	mv	s0,a0
    80204b98:	ffffd517          	auipc	a0,0xffffd
    80204b9c:	47650513          	addi	a0,a0,1142 # 8020200e <consumer_task>
    80204ba0:	b39fc0ef          	jal	802016d8 <create_process>
    80204ba4:	862a                	mv	a2,a0
    80204ba6:	00805f63          	blez	s0,80204bc4 <test_synchronization+0x50>
    80204baa:	00a05d63          	blez	a0,80204bc4 <test_synchronization+0x50>
    80204bae:	da1fc0ef          	jal	8020194e <scheduler_rotate>
    80204bb2:	6402                	ld	s0,0(sp)
    80204bb4:	60a2                	ld	ra,8(sp)
    80204bb6:	00003517          	auipc	a0,0x3
    80204bba:	55a50513          	addi	a0,a0,1370 # 80208110 <etext+0x1110>
    80204bbe:	0141                	addi	sp,sp,16
    80204bc0:	d9afb06f          	j	8020015a <printf>
    80204bc4:	85a2                	mv	a1,s0
    80204bc6:	6402                	ld	s0,0(sp)
    80204bc8:	60a2                	ld	ra,8(sp)
    80204bca:	00003517          	auipc	a0,0x3
    80204bce:	52650513          	addi	a0,a0,1318 # 802080f0 <etext+0x10f0>
    80204bd2:	0141                	addi	sp,sp,16
    80204bd4:	d86fb06f          	j	8020015a <printf>

0000000080204bd8 <test_basic_syscalls>:
    80204bd8:	1101                	addi	sp,sp,-32
    80204bda:	00003517          	auipc	a0,0x3
    80204bde:	55650513          	addi	a0,a0,1366 # 80208130 <etext+0x1130>
    80204be2:	ec06                	sd	ra,24(sp)
    80204be4:	d76fb0ef          	jal	8020015a <printf>
    80204be8:	d94ff0ef          	jal	8020417c <getpid>
    80204bec:	85aa                	mv	a1,a0
    80204bee:	00003517          	auipc	a0,0x3
    80204bf2:	56250513          	addi	a0,a0,1378 # 80208150 <etext+0x1150>
    80204bf6:	d64fb0ef          	jal	8020015a <printf>
    80204bfa:	d6aff0ef          	jal	80204164 <fork>
    80204bfe:	cd0d                	beqz	a0,80204c38 <test_basic_syscalls+0x60>
    80204c00:	02a05463          	blez	a0,80204c28 <test_basic_syscalls+0x50>
    80204c04:	0068                	addi	a0,sp,12
    80204c06:	d6eff0ef          	jal	80204174 <wait>
    80204c0a:	00003517          	auipc	a0,0x3
    80204c0e:	57e50513          	addi	a0,a0,1406 # 80208188 <etext+0x1188>
    80204c12:	d48fb0ef          	jal	8020015a <printf>
    80204c16:	00003517          	auipc	a0,0x3
    80204c1a:	58a50513          	addi	a0,a0,1418 # 802081a0 <etext+0x11a0>
    80204c1e:	d3cfb0ef          	jal	8020015a <printf>
    80204c22:	60e2                	ld	ra,24(sp)
    80204c24:	6105                	addi	sp,sp,32
    80204c26:	8082                	ret
    80204c28:	60e2                	ld	ra,24(sp)
    80204c2a:	00003517          	auipc	a0,0x3
    80204c2e:	59650513          	addi	a0,a0,1430 # 802081c0 <etext+0x11c0>
    80204c32:	6105                	addi	sp,sp,32
    80204c34:	d26fb06f          	j	8020015a <printf>
    80204c38:	d44ff0ef          	jal	8020417c <getpid>
    80204c3c:	85aa                	mv	a1,a0
    80204c3e:	00003517          	auipc	a0,0x3
    80204c42:	52a50513          	addi	a0,a0,1322 # 80208168 <etext+0x1168>
    80204c46:	d14fb0ef          	jal	8020015a <printf>
    80204c4a:	02a00513          	li	a0,42
    80204c4e:	d1eff0ef          	jal	8020416c <exit>

0000000080204c52 <test_parameter_passing>:
    80204c52:	7179                	addi	sp,sp,-48
    80204c54:	00003517          	auipc	a0,0x3
    80204c58:	57c50513          	addi	a0,a0,1404 # 802081d0 <etext+0x11d0>
    80204c5c:	f406                	sd	ra,40(sp)
    80204c5e:	f022                	sd	s0,32(sp)
    80204c60:	ec26                	sd	s1,24(sp)
    80204c62:	cf8fb0ef          	jal	8020015a <printf>
    80204c66:	20200593          	li	a1,514
    80204c6a:	00003517          	auipc	a0,0x3
    80204c6e:	58650513          	addi	a0,a0,1414 # 802081f0 <etext+0x11f0>
    80204c72:	875fe0ef          	jal	802034e6 <sys_open>
    80204c76:	00003797          	auipc	a5,0x3
    80204c7a:	5da78793          	addi	a5,a5,1498 # 80208250 <etext+0x1250>
    80204c7e:	6394                	ld	a3,0(a5)
    80204c80:	4798                	lw	a4,8(a5)
    80204c82:	00c7d783          	lhu	a5,12(a5)
    80204c86:	e036                	sd	a3,0(sp)
    80204c88:	c43a                	sw	a4,8(sp)
    80204c8a:	00f11623          	sh	a5,12(sp)
    80204c8e:	842a                	mv	s0,a0
    80204c90:	02054463          	bltz	a0,80204cb8 <test_parameter_passing+0x66>
    80204c94:	850a                	mv	a0,sp
    80204c96:	9b7fb0ef          	jal	8020064c <strlen>
    80204c9a:	862a                	mv	a2,a0
    80204c9c:	858a                	mv	a1,sp
    80204c9e:	8522                	mv	a0,s0
    80204ca0:	9a3fe0ef          	jal	80203642 <sys_write>
    80204ca4:	85aa                	mv	a1,a0
    80204ca6:	00003517          	auipc	a0,0x3
    80204caa:	55250513          	addi	a0,a0,1362 # 802081f8 <etext+0x11f8>
    80204cae:	cacfb0ef          	jal	8020015a <printf>
    80204cb2:	8522                	mv	a0,s0
    80204cb4:	941fe0ef          	jal	802035f4 <sys_close>
    80204cb8:	858a                	mv	a1,sp
    80204cba:	4629                	li	a2,10
    80204cbc:	557d                	li	a0,-1
    80204cbe:	985fe0ef          	jal	80203642 <sys_write>
    80204cc2:	84aa                	mv	s1,a0
    80204cc4:	4629                	li	a2,10
    80204cc6:	4581                	li	a1,0
    80204cc8:	8522                	mv	a0,s0
    80204cca:	979fe0ef          	jal	80203642 <sys_write>
    80204cce:	87aa                	mv	a5,a0
    80204cd0:	858a                	mv	a1,sp
    80204cd2:	567d                	li	a2,-1
    80204cd4:	8522                	mv	a0,s0
    80204cd6:	843e                	mv	s0,a5
    80204cd8:	96bfe0ef          	jal	80203642 <sys_write>
    80204cdc:	86aa                	mv	a3,a0
    80204cde:	8622                	mv	a2,s0
    80204ce0:	85a6                	mv	a1,s1
    80204ce2:	00003517          	auipc	a0,0x3
    80204ce6:	52650513          	addi	a0,a0,1318 # 80208208 <etext+0x1208>
    80204cea:	c70fb0ef          	jal	8020015a <printf>
    80204cee:	00003517          	auipc	a0,0x3
    80204cf2:	50250513          	addi	a0,a0,1282 # 802081f0 <etext+0x11f0>
    80204cf6:	96dfe0ef          	jal	80203662 <sys_unlink>
    80204cfa:	00003517          	auipc	a0,0x3
    80204cfe:	53650513          	addi	a0,a0,1334 # 80208230 <etext+0x1230>
    80204d02:	c58fb0ef          	jal	8020015a <printf>
    80204d06:	70a2                	ld	ra,40(sp)
    80204d08:	7402                	ld	s0,32(sp)
    80204d0a:	64e2                	ld	s1,24(sp)
    80204d0c:	6145                	addi	sp,sp,48
    80204d0e:	8082                	ret

0000000080204d10 <test_security>:
    80204d10:	1101                	addi	sp,sp,-32
    80204d12:	00003517          	auipc	a0,0x3
    80204d16:	54e50513          	addi	a0,a0,1358 # 80208260 <etext+0x1260>
    80204d1a:	ec06                	sd	ra,24(sp)
    80204d1c:	e822                	sd	s0,16(sp)
    80204d1e:	c3cfb0ef          	jal	8020015a <printf>
    80204d22:	4629                	li	a2,10
    80204d24:	010005b7          	lui	a1,0x1000
    80204d28:	4505                	li	a0,1
    80204d2a:	919fe0ef          	jal	80203642 <sys_write>
    80204d2e:	85aa                	mv	a1,a0
    80204d30:	00003517          	auipc	a0,0x3
    80204d34:	54850513          	addi	a0,a0,1352 # 80208278 <etext+0x1278>
    80204d38:	c22fb0ef          	jal	8020015a <printf>
    80204d3c:	3e800613          	li	a2,1000
    80204d40:	002c                	addi	a1,sp,8
    80204d42:	4501                	li	a0,0
    80204d44:	8dffe0ef          	jal	80203622 <sys_read>
    80204d48:	85aa                	mv	a1,a0
    80204d4a:	00003517          	auipc	a0,0x3
    80204d4e:	55650513          	addi	a0,a0,1366 # 802082a0 <etext+0x12a0>
    80204d52:	c08fb0ef          	jal	8020015a <printf>
    80204d56:	20200593          	li	a1,514
    80204d5a:	00003517          	auipc	a0,0x3
    80204d5e:	56e50513          	addi	a0,a0,1390 # 802082c8 <etext+0x12c8>
    80204d62:	f84fe0ef          	jal	802034e6 <sys_open>
    80204d66:	842a                	mv	s0,a0
    80204d68:	0a054263          	bltz	a0,80204e0c <test_security+0xfc>
    80204d6c:	4605                	li	a2,1
    80204d6e:	00003597          	auipc	a1,0x3
    80204d72:	56a58593          	addi	a1,a1,1386 # 802082d8 <etext+0x12d8>
    80204d76:	8cdfe0ef          	jal	80203642 <sys_write>
    80204d7a:	8522                	mv	a0,s0
    80204d7c:	879fe0ef          	jal	802035f4 <sys_close>
    80204d80:	4581                	li	a1,0
    80204d82:	00003517          	auipc	a0,0x3
    80204d86:	54650513          	addi	a0,a0,1350 # 802082c8 <etext+0x12c8>
    80204d8a:	f5cfe0ef          	jal	802034e6 <sys_open>
    80204d8e:	842a                	mv	s0,a0
    80204d90:	08054f63          	bltz	a0,80204e2e <test_security+0x11e>
    80204d94:	4605                	li	a2,1
    80204d96:	00003597          	auipc	a1,0x3
    80204d9a:	56a58593          	addi	a1,a1,1386 # 80208300 <etext+0x1300>
    80204d9e:	8a5fe0ef          	jal	80203642 <sys_write>
    80204da2:	85aa                	mv	a1,a0
    80204da4:	00003517          	auipc	a0,0x3
    80204da8:	56450513          	addi	a0,a0,1380 # 80208308 <etext+0x1308>
    80204dac:	baefb0ef          	jal	8020015a <printf>
    80204db0:	8522                	mv	a0,s0
    80204db2:	843fe0ef          	jal	802035f4 <sys_close>
    80204db6:	4589                	li	a1,2
    80204db8:	00003517          	auipc	a0,0x3
    80204dbc:	51050513          	addi	a0,a0,1296 # 802082c8 <etext+0x12c8>
    80204dc0:	f26fe0ef          	jal	802034e6 <sys_open>
    80204dc4:	842a                	mv	s0,a0
    80204dc6:	08054563          	bltz	a0,80204e50 <test_security+0x140>
    80204dca:	4605                	li	a2,1
    80204dcc:	00003597          	auipc	a1,0x3
    80204dd0:	58458593          	addi	a1,a1,1412 # 80208350 <etext+0x1350>
    80204dd4:	86ffe0ef          	jal	80203642 <sys_write>
    80204dd8:	85aa                	mv	a1,a0
    80204dda:	00003517          	auipc	a0,0x3
    80204dde:	57e50513          	addi	a0,a0,1406 # 80208358 <etext+0x1358>
    80204de2:	b78fb0ef          	jal	8020015a <printf>
    80204de6:	8522                	mv	a0,s0
    80204de8:	80dfe0ef          	jal	802035f4 <sys_close>
    80204dec:	00003517          	auipc	a0,0x3
    80204df0:	4dc50513          	addi	a0,a0,1244 # 802082c8 <etext+0x12c8>
    80204df4:	86ffe0ef          	jal	80203662 <sys_unlink>
    80204df8:	00003517          	auipc	a0,0x3
    80204dfc:	5a850513          	addi	a0,a0,1448 # 802083a0 <etext+0x13a0>
    80204e00:	b5afb0ef          	jal	8020015a <printf>
    80204e04:	60e2                	ld	ra,24(sp)
    80204e06:	6442                	ld	s0,16(sp)
    80204e08:	6105                	addi	sp,sp,32
    80204e0a:	8082                	ret
    80204e0c:	85aa                	mv	a1,a0
    80204e0e:	00003517          	auipc	a0,0x3
    80204e12:	4d250513          	addi	a0,a0,1234 # 802082e0 <etext+0x12e0>
    80204e16:	b44fb0ef          	jal	8020015a <printf>
    80204e1a:	4581                	li	a1,0
    80204e1c:	00003517          	auipc	a0,0x3
    80204e20:	4ac50513          	addi	a0,a0,1196 # 802082c8 <etext+0x12c8>
    80204e24:	ec2fe0ef          	jal	802034e6 <sys_open>
    80204e28:	842a                	mv	s0,a0
    80204e2a:	f60555e3          	bgez	a0,80204d94 <test_security+0x84>
    80204e2e:	85aa                	mv	a1,a0
    80204e30:	00003517          	auipc	a0,0x3
    80204e34:	4f850513          	addi	a0,a0,1272 # 80208328 <etext+0x1328>
    80204e38:	b22fb0ef          	jal	8020015a <printf>
    80204e3c:	4589                	li	a1,2
    80204e3e:	00003517          	auipc	a0,0x3
    80204e42:	48a50513          	addi	a0,a0,1162 # 802082c8 <etext+0x12c8>
    80204e46:	ea0fe0ef          	jal	802034e6 <sys_open>
    80204e4a:	842a                	mv	s0,a0
    80204e4c:	f6055fe3          	bgez	a0,80204dca <test_security+0xba>
    80204e50:	85aa                	mv	a1,a0
    80204e52:	00003517          	auipc	a0,0x3
    80204e56:	52650513          	addi	a0,a0,1318 # 80208378 <etext+0x1378>
    80204e5a:	b00fb0ef          	jal	8020015a <printf>
    80204e5e:	b779                	j	80204dec <test_security+0xdc>

0000000080204e60 <test_syscall_performance>:
    80204e60:	1101                	addi	sp,sp,-32
    80204e62:	e822                	sd	s0,16(sp)
    80204e64:	e426                	sd	s1,8(sp)
    80204e66:	ec06                	sd	ra,24(sp)
    80204e68:	6409                	lui	s0,0x2
    80204e6a:	c8cfc0ef          	jal	802012f6 <get_time>
    80204e6e:	84aa                	mv	s1,a0
    80204e70:	71040413          	addi	s0,s0,1808 # 2710 <_entry-0x801fd8f0>
    80204e74:	347d                	addiw	s0,s0,-1
    80204e76:	ac6ff0ef          	jal	8020413c <sys_getpid>
    80204e7a:	fc6d                	bnez	s0,80204e74 <test_syscall_performance+0x14>
    80204e7c:	c7afc0ef          	jal	802012f6 <get_time>
    80204e80:	6442                	ld	s0,16(sp)
    80204e82:	60e2                	ld	ra,24(sp)
    80204e84:	409505b3          	sub	a1,a0,s1
    80204e88:	64a2                	ld	s1,8(sp)
    80204e8a:	00003517          	auipc	a0,0x3
    80204e8e:	53650513          	addi	a0,a0,1334 # 802083c0 <etext+0x13c0>
    80204e92:	6105                	addi	sp,sp,32
    80204e94:	ac6fb06f          	j	8020015a <printf>

0000000080204e98 <test_filesystem_integrity>:
    80204e98:	7119                	addi	sp,sp,-128
    80204e9a:	00003517          	auipc	a0,0x3
    80204e9e:	54e50513          	addi	a0,a0,1358 # 802083e8 <etext+0x13e8>
    80204ea2:	fc86                	sd	ra,120(sp)
    80204ea4:	f8a2                	sd	s0,112(sp)
    80204ea6:	f4a6                	sd	s1,104(sp)
    80204ea8:	ab2fb0ef          	jal	8020015a <printf>
    80204eac:	20200593          	li	a1,514
    80204eb0:	00003517          	auipc	a0,0x3
    80204eb4:	55850513          	addi	a0,a0,1368 # 80208408 <etext+0x1408>
    80204eb8:	e2efe0ef          	jal	802034e6 <sys_open>
    80204ebc:	0c054863          	bltz	a0,80204f8c <test_filesystem_integrity+0xf4>
    80204ec0:	00003797          	auipc	a5,0x3
    80204ec4:	60078793          	addi	a5,a5,1536 # 802084c0 <etext+0x14c0>
    80204ec8:	6794                	ld	a3,8(a5)
    80204eca:	0107d703          	lhu	a4,16(a5)
    80204ece:	6390                	ld	a2,0(a5)
    80204ed0:	0127c783          	lbu	a5,18(a5)
    80204ed4:	842a                	mv	s0,a0
    80204ed6:	0028                	addi	a0,sp,8
    80204ed8:	e836                	sd	a3,16(sp)
    80204eda:	00e11c23          	sh	a4,24(sp)
    80204ede:	00f10d23          	sb	a5,26(sp)
    80204ee2:	e432                	sd	a2,8(sp)
    80204ee4:	f68fb0ef          	jal	8020064c <strlen>
    80204ee8:	862a                	mv	a2,a0
    80204eea:	002c                	addi	a1,sp,8
    80204eec:	8522                	mv	a0,s0
    80204eee:	f54fe0ef          	jal	80203642 <sys_write>
    80204ef2:	84aa                	mv	s1,a0
    80204ef4:	85aa                	mv	a1,a0
    80204ef6:	00003517          	auipc	a0,0x3
    80204efa:	52a50513          	addi	a0,a0,1322 # 80208420 <etext+0x1420>
    80204efe:	a5cfb0ef          	jal	8020015a <printf>
    80204f02:	0028                	addi	a0,sp,8
    80204f04:	f48fb0ef          	jal	8020064c <strlen>
    80204f08:	02950363          	beq	a0,s1,80204f2e <test_filesystem_integrity+0x96>
    80204f0c:	1df00693          	li	a3,479
    80204f10:	00003617          	auipc	a2,0x3
    80204f14:	c3860613          	addi	a2,a2,-968 # 80207b48 <etext+0xb48>
    80204f18:	00003597          	auipc	a1,0x3
    80204f1c:	51858593          	addi	a1,a1,1304 # 80208430 <etext+0x1430>
    80204f20:	00003517          	auipc	a0,0x3
    80204f24:	c4050513          	addi	a0,a0,-960 # 80207b60 <etext+0xb60>
    80204f28:	a32fb0ef          	jal	8020015a <printf>
    80204f2c:	a001                	j	80204f2c <test_filesystem_integrity+0x94>
    80204f2e:	8522                	mv	a0,s0
    80204f30:	ec4fe0ef          	jal	802035f4 <sys_close>
    80204f34:	4581                	li	a1,0
    80204f36:	00003517          	auipc	a0,0x3
    80204f3a:	4d250513          	addi	a0,a0,1234 # 80208408 <etext+0x1408>
    80204f3e:	da8fe0ef          	jal	802034e6 <sys_open>
    80204f42:	842a                	mv	s0,a0
    80204f44:	06054563          	bltz	a0,80204fae <test_filesystem_integrity+0x116>
    80204f48:	04000613          	li	a2,64
    80204f4c:	100c                	addi	a1,sp,32
    80204f4e:	ed4fe0ef          	jal	80203622 <sys_read>
    80204f52:	06050793          	addi	a5,a0,96
    80204f56:	978a                	add	a5,a5,sp
    80204f58:	0005061b          	sext.w	a2,a0
    80204f5c:	100c                	addi	a1,sp,32
    80204f5e:	0028                	addi	a0,sp,8
    80204f60:	fc078023          	sb	zero,-64(a5)
    80204f64:	e8cfb0ef          	jal	802005f0 <strncmp>
    80204f68:	c525                	beqz	a0,80204fd0 <test_filesystem_integrity+0x138>
    80204f6a:	1e800693          	li	a3,488
    80204f6e:	00003617          	auipc	a2,0x3
    80204f72:	bda60613          	addi	a2,a2,-1062 # 80207b48 <etext+0xb48>
    80204f76:	00003597          	auipc	a1,0x3
    80204f7a:	4d258593          	addi	a1,a1,1234 # 80208448 <etext+0x1448>
    80204f7e:	00003517          	auipc	a0,0x3
    80204f82:	be250513          	addi	a0,a0,-1054 # 80207b60 <etext+0xb60>
    80204f86:	9d4fb0ef          	jal	8020015a <printf>
    80204f8a:	a001                	j	80204f8a <test_filesystem_integrity+0xf2>
    80204f8c:	1d900693          	li	a3,473
    80204f90:	00003617          	auipc	a2,0x3
    80204f94:	bb860613          	addi	a2,a2,-1096 # 80207b48 <etext+0xb48>
    80204f98:	00003597          	auipc	a1,0x3
    80204f9c:	48058593          	addi	a1,a1,1152 # 80208418 <etext+0x1418>
    80204fa0:	00003517          	auipc	a0,0x3
    80204fa4:	bc050513          	addi	a0,a0,-1088 # 80207b60 <etext+0xb60>
    80204fa8:	9b2fb0ef          	jal	8020015a <printf>
    80204fac:	a001                	j	80204fac <test_filesystem_integrity+0x114>
    80204fae:	1e400693          	li	a3,484
    80204fb2:	00003617          	auipc	a2,0x3
    80204fb6:	b9660613          	addi	a2,a2,-1130 # 80207b48 <etext+0xb48>
    80204fba:	00003597          	auipc	a1,0x3
    80204fbe:	45e58593          	addi	a1,a1,1118 # 80208418 <etext+0x1418>
    80204fc2:	00003517          	auipc	a0,0x3
    80204fc6:	b9e50513          	addi	a0,a0,-1122 # 80207b60 <etext+0xb60>
    80204fca:	990fb0ef          	jal	8020015a <printf>
    80204fce:	a001                	j	80204fce <test_filesystem_integrity+0x136>
    80204fd0:	8522                	mv	a0,s0
    80204fd2:	e22fe0ef          	jal	802035f4 <sys_close>
    80204fd6:	00003517          	auipc	a0,0x3
    80204fda:	43250513          	addi	a0,a0,1074 # 80208408 <etext+0x1408>
    80204fde:	e84fe0ef          	jal	80203662 <sys_unlink>
    80204fe2:	c115                	beqz	a0,80205006 <test_filesystem_integrity+0x16e>
    80204fe4:	1ec00693          	li	a3,492
    80204fe8:	00003617          	auipc	a2,0x3
    80204fec:	b6060613          	addi	a2,a2,-1184 # 80207b48 <etext+0xb48>
    80204ff0:	00003597          	auipc	a1,0x3
    80204ff4:	48858593          	addi	a1,a1,1160 # 80208478 <etext+0x1478>
    80204ff8:	00003517          	auipc	a0,0x3
    80204ffc:	b6850513          	addi	a0,a0,-1176 # 80207b60 <etext+0xb60>
    80205000:	95afb0ef          	jal	8020015a <printf>
    80205004:	a001                	j	80205004 <test_filesystem_integrity+0x16c>
    80205006:	00003517          	auipc	a0,0x3
    8020500a:	49250513          	addi	a0,a0,1170 # 80208498 <etext+0x1498>
    8020500e:	94cfb0ef          	jal	8020015a <printf>
    80205012:	70e6                	ld	ra,120(sp)
    80205014:	7446                	ld	s0,112(sp)
    80205016:	74a6                	ld	s1,104(sp)
    80205018:	6109                	addi	sp,sp,128
    8020501a:	8082                	ret

000000008020501c <test_concurrent_file_access>:
    8020501c:	7179                	addi	sp,sp,-48
    8020501e:	00003517          	auipc	a0,0x3
    80205022:	4ba50513          	addi	a0,a0,1210 # 802084d8 <etext+0x14d8>
    80205026:	f022                	sd	s0,32(sp)
    80205028:	ec26                	sd	s1,24(sp)
    8020502a:	e84a                	sd	s2,16(sp)
    8020502c:	e44e                	sd	s3,8(sp)
    8020502e:	f406                	sd	ra,40(sp)
    80205030:	4401                	li	s0,0
    80205032:	928fb0ef          	jal	8020015a <printf>
    80205036:	fffff917          	auipc	s2,0xfffff
    8020503a:	2c290913          	addi	s2,s2,706 # 802042f8 <concurrent_file_access_task>
    8020503e:	00003997          	auipc	s3,0x3
    80205042:	4ba98993          	addi	s3,s3,1210 # 802084f8 <etext+0x14f8>
    80205046:	4495                	li	s1,5
    80205048:	a021                	j	80205050 <test_concurrent_file_access+0x34>
    8020504a:	2405                	addiw	s0,s0,1
    8020504c:	00940e63          	beq	s0,s1,80205068 <test_concurrent_file_access+0x4c>
    80205050:	854a                	mv	a0,s2
    80205052:	e86fc0ef          	jal	802016d8 <create_process>
    80205056:	fea04ae3          	bgtz	a0,8020504a <test_concurrent_file_access+0x2e>
    8020505a:	85a2                	mv	a1,s0
    8020505c:	854e                	mv	a0,s3
    8020505e:	2405                	addiw	s0,s0,1
    80205060:	8fafb0ef          	jal	8020015a <printf>
    80205064:	fe9416e3          	bne	s0,s1,80205050 <test_concurrent_file_access+0x34>
    80205068:	8e7fc0ef          	jal	8020194e <scheduler_rotate>
    8020506c:	7402                	ld	s0,32(sp)
    8020506e:	70a2                	ld	ra,40(sp)
    80205070:	64e2                	ld	s1,24(sp)
    80205072:	6942                	ld	s2,16(sp)
    80205074:	69a2                	ld	s3,8(sp)
    80205076:	00003517          	auipc	a0,0x3
    8020507a:	4a250513          	addi	a0,a0,1186 # 80208518 <etext+0x1518>
    8020507e:	6145                	addi	sp,sp,48
    80205080:	8dafb06f          	j	8020015a <printf>

0000000080205084 <test_filesystem_performance>:
    80205084:	7159                	addi	sp,sp,-112
    80205086:	72fd                	lui	t0,0xfffff
    80205088:	f486                	sd	ra,104(sp)
    8020508a:	f0a2                	sd	s0,96(sp)
    8020508c:	e8ca                	sd	s2,80(sp)
    8020508e:	e4ce                	sd	s3,72(sp)
    80205090:	e0d2                	sd	s4,64(sp)
    80205092:	fc56                	sd	s5,56(sp)
    80205094:	eca6                	sd	s1,88(sp)
    80205096:	00003517          	auipc	a0,0x3
    8020509a:	4aa50513          	addi	a0,a0,1194 # 80208540 <etext+0x1540>
    8020509e:	9116                	add	sp,sp,t0
    802050a0:	8bafb0ef          	jal	8020015a <printf>
    802050a4:	a52fc0ef          	jal	802012f6 <get_time>
    802050a8:	6705                	lui	a4,0x1
    802050aa:	77fd                	lui	a5,0xfffff
    802050ac:	02070713          	addi	a4,a4,32 # 1020 <_entry-0x801fefe0>
    802050b0:	973e                	add	a4,a4,a5
    802050b2:	081c                	addi	a5,sp,16
    802050b4:	97ba                	add	a5,a5,a4
    802050b6:	8aaa                	mv	s5,a0
    802050b8:	4401                	li	s0,0
    802050ba:	e43e                	sd	a5,8(sp)
    802050bc:	00003a17          	auipc	s4,0x3
    802050c0:	4a4a0a13          	addi	s4,s4,1188 # 80208560 <etext+0x1560>
    802050c4:	00003997          	auipc	s3,0x3
    802050c8:	4ac98993          	addi	s3,s3,1196 # 80208570 <etext+0x1570>
    802050cc:	3e800913          	li	s2,1000
    802050d0:	6522                	ld	a0,8(sp)
    802050d2:	86a2                	mv	a3,s0
    802050d4:	8652                	mv	a2,s4
    802050d6:	02000593          	li	a1,32
    802050da:	828ff0ef          	jal	80204102 <snprintf>
    802050de:	6522                	ld	a0,8(sp)
    802050e0:	20200593          	li	a1,514
    802050e4:	2405                	addiw	s0,s0,1
    802050e6:	c00fe0ef          	jal	802034e6 <sys_open>
    802050ea:	4611                	li	a2,4
    802050ec:	85ce                	mv	a1,s3
    802050ee:	84aa                	mv	s1,a0
    802050f0:	d52fe0ef          	jal	80203642 <sys_write>
    802050f4:	8526                	mv	a0,s1
    802050f6:	cfefe0ef          	jal	802035f4 <sys_close>
    802050fa:	fd241be3          	bne	s0,s2,802050d0 <test_filesystem_performance+0x4c>
    802050fe:	9f8fc0ef          	jal	802012f6 <get_time>
    80205102:	415505b3          	sub	a1,a0,s5
    80205106:	00003517          	auipc	a0,0x3
    8020510a:	47250513          	addi	a0,a0,1138 # 80208578 <etext+0x1578>
    8020510e:	84cfb0ef          	jal	8020015a <printf>
    80205112:	9e4fc0ef          	jal	802012f6 <get_time>
    80205116:	892a                	mv	s2,a0
    80205118:	20200593          	li	a1,514
    8020511c:	00003517          	auipc	a0,0x3
    80205120:	48450513          	addi	a0,a0,1156 # 802085a0 <etext+0x15a0>
    80205124:	bc2fe0ef          	jal	802034e6 <sys_open>
    80205128:	6705                	lui	a4,0x1
    8020512a:	77fd                	lui	a5,0xfffff
    8020512c:	02070713          	addi	a4,a4,32 # 1020 <_entry-0x801fefe0>
    80205130:	973e                	add	a4,a4,a5
    80205132:	081c                	addi	a5,sp,16
    80205134:	97ba                	add	a5,a5,a4
    80205136:	84aa                	mv	s1,a0
    80205138:	02000413          	li	s0,32
    8020513c:	e43e                	sd	a5,8(sp)
    8020513e:	65a2                	ld	a1,8(sp)
    80205140:	6605                	lui	a2,0x1
    80205142:	8526                	mv	a0,s1
    80205144:	347d                	addiw	s0,s0,-1
    80205146:	cfcfe0ef          	jal	80203642 <sys_write>
    8020514a:	f875                	bnez	s0,8020513e <test_filesystem_performance+0xba>
    8020514c:	8526                	mv	a0,s1
    8020514e:	ca6fe0ef          	jal	802035f4 <sys_close>
    80205152:	9a4fc0ef          	jal	802012f6 <get_time>
    80205156:	412505b3          	sub	a1,a0,s2
    8020515a:	00003517          	auipc	a0,0x3
    8020515e:	45650513          	addi	a0,a0,1110 # 802085b0 <etext+0x15b0>
    80205162:	ff9fa0ef          	jal	8020015a <printf>
    80205166:	77fd                	lui	a5,0xfffff
    80205168:	6705                	lui	a4,0x1
    8020516a:	1781                	addi	a5,a5,-32 # ffffffffffffefe0 <end+0xffffffff7fde1ca0>
    8020516c:	02070713          	addi	a4,a4,32 # 1020 <_entry-0x801fefe0>
    80205170:	973e                	add	a4,a4,a5
    80205172:	081c                	addi	a5,sp,16
    80205174:	97ba                	add	a5,a5,a4
    80205176:	e43e                	sd	a5,8(sp)
    80205178:	00003917          	auipc	s2,0x3
    8020517c:	3e890913          	addi	s2,s2,1000 # 80208560 <etext+0x1560>
    80205180:	3e800493          	li	s1,1000
    80205184:	6522                	ld	a0,8(sp)
    80205186:	86a2                	mv	a3,s0
    80205188:	864a                	mv	a2,s2
    8020518a:	02000593          	li	a1,32
    8020518e:	f75fe0ef          	jal	80204102 <snprintf>
    80205192:	6522                	ld	a0,8(sp)
    80205194:	2405                	addiw	s0,s0,1
    80205196:	cccfe0ef          	jal	80203662 <sys_unlink>
    8020519a:	fe9415e3          	bne	s0,s1,80205184 <test_filesystem_performance+0x100>
    8020519e:	00003517          	auipc	a0,0x3
    802051a2:	40250513          	addi	a0,a0,1026 # 802085a0 <etext+0x15a0>
    802051a6:	cbcfe0ef          	jal	80203662 <sys_unlink>
    802051aa:	00003517          	auipc	a0,0x3
    802051ae:	42e50513          	addi	a0,a0,1070 # 802085d8 <etext+0x15d8>
    802051b2:	fa9fa0ef          	jal	8020015a <printf>
    802051b6:	6285                	lui	t0,0x1
    802051b8:	9116                	add	sp,sp,t0
    802051ba:	70a6                	ld	ra,104(sp)
    802051bc:	7406                	ld	s0,96(sp)
    802051be:	64e6                	ld	s1,88(sp)
    802051c0:	6946                	ld	s2,80(sp)
    802051c2:	69a6                	ld	s3,72(sp)
    802051c4:	6a06                	ld	s4,64(sp)
    802051c6:	7ae2                	ld	s5,56(sp)
    802051c8:	6165                	addi	sp,sp,112
    802051ca:	8082                	ret

00000000802051cc <test_crash_recovery>:
    802051cc:	7179                	addi	sp,sp,-48
    802051ce:	00003517          	auipc	a0,0x3
    802051d2:	43250513          	addi	a0,a0,1074 # 80208600 <etext+0x1600>
    802051d6:	f406                	sd	ra,40(sp)
    802051d8:	f022                	sd	s0,32(sp)
    802051da:	ec26                	sd	s1,24(sp)
    802051dc:	e84a                	sd	s2,16(sp)
    802051de:	f7dfa0ef          	jal	8020015a <printf>
    802051e2:	60200593          	li	a1,1538
    802051e6:	00003517          	auipc	a0,0x3
    802051ea:	44250513          	addi	a0,a0,1090 # 80208628 <etext+0x1628>
    802051ee:	c402                	sw	zero,8(sp)
    802051f0:	af6fe0ef          	jal	802034e6 <sys_open>
    802051f4:	4605                	li	a2,1
    802051f6:	00003597          	auipc	a1,0x3
    802051fa:	0e258593          	addi	a1,a1,226 # 802082d8 <etext+0x12d8>
    802051fe:	842a                	mv	s0,a0
    80205200:	c42fe0ef          	jal	80203642 <sys_write>
    80205204:	8522                	mv	a0,s0
    80205206:	beefe0ef          	jal	802035f4 <sys_close>
    8020520a:	906fd0ef          	jal	80202310 <bcache_reset>
    8020520e:	0000f597          	auipc	a1,0xf
    80205212:	d1258593          	addi	a1,a1,-750 # 80213f20 <sb>
    80205216:	4505                	li	a0,1
    80205218:	e88fd0ef          	jal	802028a0 <readsb>
    8020521c:	0000f597          	auipc	a1,0xf
    80205220:	d0458593          	addi	a1,a1,-764 # 80213f20 <sb>
    80205224:	4505                	li	a0,1
    80205226:	af3fe0ef          	jal	80203d18 <initlog>
    8020522a:	4581                	li	a1,0
    8020522c:	00003517          	auipc	a0,0x3
    80205230:	3fc50513          	addi	a0,a0,1020 # 80208628 <etext+0x1628>
    80205234:	ab2fe0ef          	jal	802034e6 <sys_open>
    80205238:	4605                	li	a2,1
    8020523a:	002c                	addi	a1,sp,8
    8020523c:	842a                	mv	s0,a0
    8020523e:	be4fe0ef          	jal	80203622 <sys_read>
    80205242:	8522                	mv	a0,s0
    80205244:	bb0fe0ef          	jal	802035f4 <sys_close>
    80205248:	00814583          	lbu	a1,8(sp)
    8020524c:	00003517          	auipc	a0,0x3
    80205250:	3e450513          	addi	a0,a0,996 # 80208630 <etext+0x1630>
    80205254:	00003917          	auipc	s2,0x3
    80205258:	65490913          	addi	s2,s2,1620 # 802088a8 <current_proc>
    8020525c:	efffa0ef          	jal	8020015a <printf>
    80205260:	4589                	li	a1,2
    80205262:	00003517          	auipc	a0,0x3
    80205266:	3c650513          	addi	a0,a0,966 # 80208628 <etext+0x1628>
    8020526a:	a7cfe0ef          	jal	802034e6 <sys_open>
    8020526e:	4605                	li	a2,1
    80205270:	00003597          	auipc	a1,0x3
    80205274:	09058593          	addi	a1,a1,144 # 80208300 <etext+0x1300>
    80205278:	842a                	mv	s0,a0
    8020527a:	bc8fe0ef          	jal	80203642 <sys_write>
    8020527e:	8522                	mv	a0,s0
    80205280:	b74fe0ef          	jal	802035f4 <sys_close>
    80205284:	b09fe0ef          	jal	80203d8c <begin_op>
    80205288:	4589                	li	a1,2
    8020528a:	00003517          	auipc	a0,0x3
    8020528e:	39e50513          	addi	a0,a0,926 # 80208628 <etext+0x1628>
    80205292:	a54fe0ef          	jal	802034e6 <sys_open>
    80205296:	00093783          	ld	a5,0(s2)
    8020529a:	01450713          	addi	a4,a0,20
    8020529e:	070e                	slli	a4,a4,0x3
    802052a0:	97ba                	add	a5,a5,a4
    802052a2:	6384                	ld	s1,0(a5)
    802052a4:	842a                	mv	s0,a0
    802052a6:	6c88                	ld	a0,24(s1)
    802052a8:	fd4fd0ef          	jal	80202a7c <ilock>
    802052ac:	6c88                	ld	a0,24(s1)
    802052ae:	4705                	li	a4,1
    802052b0:	4681                	li	a3,0
    802052b2:	00003617          	auipc	a2,0x3
    802052b6:	09e60613          	addi	a2,a2,158 # 80208350 <etext+0x1350>
    802052ba:	4581                	li	a1,0
    802052bc:	c43fd0ef          	jal	80202efe <writei>
    802052c0:	6c88                	ld	a0,24(s1)
    802052c2:	869fd0ef          	jal	80202b2a <iunlock>
    802052c6:	00044e63          	bltz	s0,802052e2 <test_crash_recovery+0x116>
    802052ca:	00093783          	ld	a5,0(s2)
    802052ce:	040e                	slli	s0,s0,0x3
    802052d0:	97a2                	add	a5,a5,s0
    802052d2:	73d8                	ld	a4,160(a5)
    802052d4:	c719                	beqz	a4,802052e2 <test_crash_recovery+0x116>
    802052d6:	4354                	lw	a3,4(a4)
    802052d8:	0a07b023          	sd	zero,160(a5)
    802052dc:	fff6879b          	addiw	a5,a3,-1 # fff <_entry-0x801ff001>
    802052e0:	c35c                	sw	a5,4(a4)
    802052e2:	82efd0ef          	jal	80202310 <bcache_reset>
    802052e6:	0000f597          	auipc	a1,0xf
    802052ea:	c3a58593          	addi	a1,a1,-966 # 80213f20 <sb>
    802052ee:	4505                	li	a0,1
    802052f0:	db0fd0ef          	jal	802028a0 <readsb>
    802052f4:	0000f597          	auipc	a1,0xf
    802052f8:	c2c58593          	addi	a1,a1,-980 # 80213f20 <sb>
    802052fc:	4505                	li	a0,1
    802052fe:	a1bfe0ef          	jal	80203d18 <initlog>
    80205302:	4611                	li	a2,4
    80205304:	4581                	li	a1,0
    80205306:	0028                	addi	a0,sp,8
    80205308:	a80fb0ef          	jal	80200588 <memset>
    8020530c:	4581                	li	a1,0
    8020530e:	00003517          	auipc	a0,0x3
    80205312:	31a50513          	addi	a0,a0,794 # 80208628 <etext+0x1628>
    80205316:	9d0fe0ef          	jal	802034e6 <sys_open>
    8020531a:	4605                	li	a2,1
    8020531c:	002c                	addi	a1,sp,8
    8020531e:	842a                	mv	s0,a0
    80205320:	b02fe0ef          	jal	80203622 <sys_read>
    80205324:	8522                	mv	a0,s0
    80205326:	acefe0ef          	jal	802035f4 <sys_close>
    8020532a:	00814583          	lbu	a1,8(sp)
    8020532e:	00003517          	auipc	a0,0x3
    80205332:	32250513          	addi	a0,a0,802 # 80208650 <etext+0x1650>
    80205336:	e25fa0ef          	jal	8020015a <printf>
    8020533a:	00003517          	auipc	a0,0x3
    8020533e:	2ee50513          	addi	a0,a0,750 # 80208628 <etext+0x1628>
    80205342:	b20fe0ef          	jal	80203662 <sys_unlink>
    80205346:	00003517          	auipc	a0,0x3
    8020534a:	34250513          	addi	a0,a0,834 # 80208688 <etext+0x1688>
    8020534e:	e0dfa0ef          	jal	8020015a <printf>
    80205352:	70a2                	ld	ra,40(sp)
    80205354:	7402                	ld	s0,32(sp)
    80205356:	64e2                	ld	s1,24(sp)
    80205358:	6942                	ld	s2,16(sp)
    8020535a:	6145                	addi	sp,sp,48
    8020535c:	8082                	ret

000000008020535e <test_scheduler_1>:
    8020535e:	1101                	addi	sp,sp,-32
    80205360:	00003517          	auipc	a0,0x3
    80205364:	34850513          	addi	a0,a0,840 # 802086a8 <etext+0x16a8>
    80205368:	ec06                	sd	ra,24(sp)
    8020536a:	e822                	sd	s0,16(sp)
    8020536c:	e426                	sd	s1,8(sp)
    8020536e:	dedfa0ef          	jal	8020015a <printf>
    80205372:	fffff517          	auipc	a0,0xfffff
    80205376:	e5050513          	addi	a0,a0,-432 # 802041c2 <cpu_task_high>
    8020537a:	b5efc0ef          	jal	802016d8 <create_process>
    8020537e:	842a                	mv	s0,a0
    80205380:	fffff517          	auipc	a0,0xfffff
    80205384:	eaa50513          	addi	a0,a0,-342 # 8020422a <cpu_task_med>
    80205388:	b50fc0ef          	jal	802016d8 <create_process>
    8020538c:	84aa                	mv	s1,a0
    8020538e:	04805063          	blez	s0,802053ce <test_scheduler_1+0x70>
    80205392:	02a05e63          	blez	a0,802053ce <test_scheduler_1+0x70>
    80205396:	8522                	mv	a0,s0
    80205398:	03200593          	li	a1,50
    8020539c:	c64fc0ef          	jal	80201800 <set_proc_priority>
    802053a0:	45a9                	li	a1,10
    802053a2:	8526                	mv	a0,s1
    802053a4:	c5cfc0ef          	jal	80201800 <set_proc_priority>
    802053a8:	00003517          	auipc	a0,0x3
    802053ac:	31850513          	addi	a0,a0,792 # 802086c0 <etext+0x16c0>
    802053b0:	dabfa0ef          	jal	8020015a <printf>
    802053b4:	4501                	li	a0,0
    802053b6:	9a1fc0ef          	jal	80201d56 <scheduler_priority_extend>
    802053ba:	6442                	ld	s0,16(sp)
    802053bc:	60e2                	ld	ra,24(sp)
    802053be:	64a2                	ld	s1,8(sp)
    802053c0:	00003517          	auipc	a0,0x3
    802053c4:	33050513          	addi	a0,a0,816 # 802086f0 <etext+0x16f0>
    802053c8:	6105                	addi	sp,sp,32
    802053ca:	d91fa06f          	j	8020015a <printf>
    802053ce:	85a2                	mv	a1,s0
    802053d0:	6442                	ld	s0,16(sp)
    802053d2:	60e2                	ld	ra,24(sp)
    802053d4:	8626                	mv	a2,s1
    802053d6:	64a2                	ld	s1,8(sp)
    802053d8:	00003517          	auipc	a0,0x3
    802053dc:	d1850513          	addi	a0,a0,-744 # 802080f0 <etext+0x10f0>
    802053e0:	6105                	addi	sp,sp,32
    802053e2:	d79fa06f          	j	8020015a <printf>

00000000802053e6 <test_scheduler_2>:
    802053e6:	1101                	addi	sp,sp,-32
    802053e8:	00003517          	auipc	a0,0x3
    802053ec:	32850513          	addi	a0,a0,808 # 80208710 <etext+0x1710>
    802053f0:	ec06                	sd	ra,24(sp)
    802053f2:	e822                	sd	s0,16(sp)
    802053f4:	e426                	sd	s1,8(sp)
    802053f6:	d65fa0ef          	jal	8020015a <printf>
    802053fa:	fffff517          	auipc	a0,0xfffff
    802053fe:	dc850513          	addi	a0,a0,-568 # 802041c2 <cpu_task_high>
    80205402:	ad6fc0ef          	jal	802016d8 <create_process>
    80205406:	842a                	mv	s0,a0
    80205408:	fffff517          	auipc	a0,0xfffff
    8020540c:	e2250513          	addi	a0,a0,-478 # 8020422a <cpu_task_med>
    80205410:	ac8fc0ef          	jal	802016d8 <create_process>
    80205414:	84aa                	mv	s1,a0
    80205416:	04805163          	blez	s0,80205458 <test_scheduler_2+0x72>
    8020541a:	02a05f63          	blez	a0,80205458 <test_scheduler_2+0x72>
    8020541e:	8522                	mv	a0,s0
    80205420:	03200593          	li	a1,50
    80205424:	bdcfc0ef          	jal	80201800 <set_proc_priority>
    80205428:	03200593          	li	a1,50
    8020542c:	8526                	mv	a0,s1
    8020542e:	bd2fc0ef          	jal	80201800 <set_proc_priority>
    80205432:	00003517          	auipc	a0,0x3
    80205436:	2f650513          	addi	a0,a0,758 # 80208728 <etext+0x1728>
    8020543a:	d21fa0ef          	jal	8020015a <printf>
    8020543e:	4501                	li	a0,0
    80205440:	917fc0ef          	jal	80201d56 <scheduler_priority_extend>
    80205444:	6442                	ld	s0,16(sp)
    80205446:	60e2                	ld	ra,24(sp)
    80205448:	64a2                	ld	s1,8(sp)
    8020544a:	00003517          	auipc	a0,0x3
    8020544e:	30e50513          	addi	a0,a0,782 # 80208758 <etext+0x1758>
    80205452:	6105                	addi	sp,sp,32
    80205454:	d07fa06f          	j	8020015a <printf>
    80205458:	85a2                	mv	a1,s0
    8020545a:	6442                	ld	s0,16(sp)
    8020545c:	60e2                	ld	ra,24(sp)
    8020545e:	8626                	mv	a2,s1
    80205460:	64a2                	ld	s1,8(sp)
    80205462:	00003517          	auipc	a0,0x3
    80205466:	c8e50513          	addi	a0,a0,-882 # 802080f0 <etext+0x10f0>
    8020546a:	6105                	addi	sp,sp,32
    8020546c:	ceffa06f          	j	8020015a <printf>

0000000080205470 <test_scheduler_3>:
    80205470:	1101                	addi	sp,sp,-32
    80205472:	00003517          	auipc	a0,0x3
    80205476:	30650513          	addi	a0,a0,774 # 80208778 <etext+0x1778>
    8020547a:	ec06                	sd	ra,24(sp)
    8020547c:	e822                	sd	s0,16(sp)
    8020547e:	e426                	sd	s1,8(sp)
    80205480:	cdbfa0ef          	jal	8020015a <printf>
    80205484:	fffff517          	auipc	a0,0xfffff
    80205488:	d3e50513          	addi	a0,a0,-706 # 802041c2 <cpu_task_high>
    8020548c:	a4cfc0ef          	jal	802016d8 <create_process>
    80205490:	842a                	mv	s0,a0
    80205492:	fffff517          	auipc	a0,0xfffff
    80205496:	d9850513          	addi	a0,a0,-616 # 8020422a <cpu_task_med>
    8020549a:	a3efc0ef          	jal	802016d8 <create_process>
    8020549e:	84aa                	mv	s1,a0
    802054a0:	04805163          	blez	s0,802054e2 <test_scheduler_3+0x72>
    802054a4:	02a05f63          	blez	a0,802054e2 <test_scheduler_3+0x72>
    802054a8:	8522                	mv	a0,s0
    802054aa:	03200593          	li	a1,50
    802054ae:	b52fc0ef          	jal	80201800 <set_proc_priority>
    802054b2:	03100593          	li	a1,49
    802054b6:	8526                	mv	a0,s1
    802054b8:	b48fc0ef          	jal	80201800 <set_proc_priority>
    802054bc:	00003517          	auipc	a0,0x3
    802054c0:	2d450513          	addi	a0,a0,724 # 80208790 <etext+0x1790>
    802054c4:	c97fa0ef          	jal	8020015a <printf>
    802054c8:	4505                	li	a0,1
    802054ca:	88dfc0ef          	jal	80201d56 <scheduler_priority_extend>
    802054ce:	6442                	ld	s0,16(sp)
    802054d0:	60e2                	ld	ra,24(sp)
    802054d2:	64a2                	ld	s1,8(sp)
    802054d4:	00003517          	auipc	a0,0x3
    802054d8:	2ec50513          	addi	a0,a0,748 # 802087c0 <etext+0x17c0>
    802054dc:	6105                	addi	sp,sp,32
    802054de:	c7dfa06f          	j	8020015a <printf>
    802054e2:	85a2                	mv	a1,s0
    802054e4:	6442                	ld	s0,16(sp)
    802054e6:	60e2                	ld	ra,24(sp)
    802054e8:	8626                	mv	a2,s1
    802054ea:	64a2                	ld	s1,8(sp)
    802054ec:	00003517          	auipc	a0,0x3
    802054f0:	c0450513          	addi	a0,a0,-1020 # 802080f0 <etext+0x10f0>
    802054f4:	6105                	addi	sp,sp,32
    802054f6:	c65fa06f          	j	8020015a <printf>

00000000802054fa <main>:
    802054fa:	1141                	addi	sp,sp,-16
    802054fc:	e406                	sd	ra,8(sp)
    802054fe:	d16ff0ef          	jal	80204a14 <pt_init>
    80205502:	f0dfb0ef          	jal	8020140e <proc_init>
    80205506:	8e2fc0ef          	jal	802015e8 <alloc_process>
    8020550a:	00003717          	auipc	a4,0x3
    8020550e:	38a73f23          	sd	a0,926(a4) # 802088a8 <current_proc>
    80205512:	d99fa0ef          	jal	802002aa <release>
    80205516:	80ffb0ef          	jal	80200d24 <trap_init>
    8020551a:	bb4fd0ef          	jal	802028ce <iinit>
    8020551e:	b8ffc0ef          	jal	802020ac <binit>
    80205522:	e2ffc0ef          	jal	80202350 <fileinit>
    80205526:	b5efe0ef          	jal	80203884 <virtio_disk_init>
    8020552a:	4505                	li	a0,1
    8020552c:	865fd0ef          	jal	80202d90 <fsinit>
    80205530:	60a2                	ld	ra,8(sp)
    80205532:	0141                	addi	sp,sp,16
    80205534:	ea4ff06f          	j	80204bd8 <test_basic_syscalls>
	...

0000000080206000 <_trampoline>:
    80206000:	14051073          	csrw	sscratch,a0
    80206004:	02000537          	lui	a0,0x2000
    80206008:	357d                	addiw	a0,a0,-1 # 1ffffff <_entry-0x7e200001>
    8020600a:	0536                	slli	a0,a0,0xd
    8020600c:	02153423          	sd	ra,40(a0)
    80206010:	02253823          	sd	sp,48(a0)
    80206014:	02353c23          	sd	gp,56(a0)
    80206018:	04453023          	sd	tp,64(a0)
    8020601c:	04553423          	sd	t0,72(a0)
    80206020:	04653823          	sd	t1,80(a0)
    80206024:	04753c23          	sd	t2,88(a0)
    80206028:	f120                	sd	s0,96(a0)
    8020602a:	f524                	sd	s1,104(a0)
    8020602c:	fd2c                	sd	a1,120(a0)
    8020602e:	e150                	sd	a2,128(a0)
    80206030:	e554                	sd	a3,136(a0)
    80206032:	e958                	sd	a4,144(a0)
    80206034:	ed5c                	sd	a5,152(a0)
    80206036:	0b053023          	sd	a6,160(a0)
    8020603a:	0b153423          	sd	a7,168(a0)
    8020603e:	0b253823          	sd	s2,176(a0)
    80206042:	0b353c23          	sd	s3,184(a0)
    80206046:	0d453023          	sd	s4,192(a0)
    8020604a:	0d553423          	sd	s5,200(a0)
    8020604e:	0d653823          	sd	s6,208(a0)
    80206052:	0d753c23          	sd	s7,216(a0)
    80206056:	0f853023          	sd	s8,224(a0)
    8020605a:	0f953423          	sd	s9,232(a0)
    8020605e:	0fa53823          	sd	s10,240(a0)
    80206062:	0fb53c23          	sd	s11,248(a0)
    80206066:	11c53023          	sd	t3,256(a0)
    8020606a:	11d53423          	sd	t4,264(a0)
    8020606e:	11e53823          	sd	t5,272(a0)
    80206072:	11f53c23          	sd	t6,280(a0)
    80206076:	140022f3          	csrr	t0,sscratch
    8020607a:	06553823          	sd	t0,112(a0)
    8020607e:	00853103          	ld	sp,8(a0)
    80206082:	02053203          	ld	tp,32(a0)
    80206086:	01053283          	ld	t0,16(a0)
    8020608a:	00053303          	ld	t1,0(a0)
    8020608e:	12000073          	sfence.vma
    80206092:	18031073          	csrw	satp,t1
    80206096:	12000073          	sfence.vma
    8020609a:	9282                	jalr	t0

000000008020609c <userret>:
    8020609c:	12000073          	sfence.vma
    802060a0:	18051073          	csrw	satp,a0
    802060a4:	12000073          	sfence.vma
    802060a8:	02000537          	lui	a0,0x2000
    802060ac:	357d                	addiw	a0,a0,-1 # 1ffffff <_entry-0x7e200001>
    802060ae:	0536                	slli	a0,a0,0xd
    802060b0:	02853083          	ld	ra,40(a0)
    802060b4:	03053103          	ld	sp,48(a0)
    802060b8:	03853183          	ld	gp,56(a0)
    802060bc:	04053203          	ld	tp,64(a0)
    802060c0:	04853283          	ld	t0,72(a0)
    802060c4:	05053303          	ld	t1,80(a0)
    802060c8:	05853383          	ld	t2,88(a0)
    802060cc:	7120                	ld	s0,96(a0)
    802060ce:	7524                	ld	s1,104(a0)
    802060d0:	7d2c                	ld	a1,120(a0)
    802060d2:	6150                	ld	a2,128(a0)
    802060d4:	6554                	ld	a3,136(a0)
    802060d6:	6958                	ld	a4,144(a0)
    802060d8:	6d5c                	ld	a5,152(a0)
    802060da:	0a053803          	ld	a6,160(a0)
    802060de:	0a853883          	ld	a7,168(a0)
    802060e2:	0b053903          	ld	s2,176(a0)
    802060e6:	0b853983          	ld	s3,184(a0)
    802060ea:	0c053a03          	ld	s4,192(a0)
    802060ee:	0c853a83          	ld	s5,200(a0)
    802060f2:	0d053b03          	ld	s6,208(a0)
    802060f6:	0d853b83          	ld	s7,216(a0)
    802060fa:	0e053c03          	ld	s8,224(a0)
    802060fe:	0e853c83          	ld	s9,232(a0)
    80206102:	0f053d03          	ld	s10,240(a0)
    80206106:	0f853d83          	ld	s11,248(a0)
    8020610a:	10053e03          	ld	t3,256(a0)
    8020610e:	10853e83          	ld	t4,264(a0)
    80206112:	11053f03          	ld	t5,272(a0)
    80206116:	11853f83          	ld	t6,280(a0)
    8020611a:	7928                	ld	a0,112(a0)
    8020611c:	10200073          	sret
	...
